/*
 * Copyright (C) 2008-2012 TrinityCore <http://www.trinitycore.org/>
 * Copyright (C) 2005-2009 MaNGOS <http://getmangos.com/>
 *
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the
 * Free Software Foundation; either version 2 of the License, or (at your
 * option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
 * more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program. If not, see <http://www.gnu.org/licenses/>.
 */

#include "Common.h"
#include "Player.h"
#include "GridNotifiers.h"
#include "Log.h"
#include "CellImpl.h"
#include "Map.h"
#include "MapManager.h"
#include "MapInstanced.h"
#include "InstanceSaveMgr.h"
#include <utility>
#include "Timer.h"
#include "GridNotifiersImpl.h"
#include "Config.h"
#include "ObjectMgr.h"
#include "World.h"
#include "Group.h"
#include "GroupMgr.h"
#include "InstanceScript.h"
#include "ScenarioMgr.h"
#include <algorithm>

InstanceSaveManager::InstanceSaveManager(): lock_instLists(false)
{
}

InstanceSaveManager::~InstanceSaveManager()
{
    // it is undefined whether this or objectmgr will be unloaded first
    // so we must be prepared for both cases
    lock_instLists = true;
    for (auto & itr : m_instanceSaveById)
    {
        InstanceSave* save = itr.second;

        for (InstanceSave::PlayerListType::iterator itr2 = save->m_playerList.begin(), next = itr2; itr2 != save->m_playerList.end(); itr2 = next)
        {
            ++next;
            (*itr2)->UnbindInstance(save->GetMapId(), save->GetDifficultyID(), true);
        }
        save->m_playerList.clear();

        for (InstanceSave::GroupListType::iterator itr2 = save->m_groupList.begin(), next = itr2; itr2 != save->m_groupList.end(); itr2 = next)
        {
            ++next;
            (*itr2)->UnbindInstance(save->GetMapId(), save->GetDifficultyID(), true);
        }
        save->m_groupList.clear();
        delete save;
    }

    _DeleteQueuedSaves(true);
}

InstanceSaveManager* InstanceSaveManager::instance()
{
    static InstanceSaveManager instance;
    return &instance;
}

void InstanceSaveManager::UnloadAll()
{
    // it is undefined whether this or objectmgr will be unloaded first
    // so we must be prepared for both cases
    lock_instLists = true;
    for (auto & itr : m_instanceSaveById)
    {
        InstanceSave* save = itr.second;

        for (InstanceSave::PlayerListType::iterator itr2 = save->m_playerList.begin(), next = itr2; itr2 != save->m_playerList.end(); itr2 = next)
        {
            ++next;
            (*itr2)->UnbindInstance(save->GetMapId(), save->GetDifficultyID(), true);
        }
        save->m_playerList.clear();

        for (InstanceSave::GroupListType::iterator itr2 = save->m_groupList.begin(), next = itr2; itr2 != save->m_groupList.end(); itr2 = next)
        {
            ++next;
            (*itr2)->UnbindInstance(save->GetMapId(), save->GetDifficultyID(), true);
        }
        save->m_groupList.clear();
        delete save;
    }
    _instanceSaveLock.lock();
    m_instanceSaveById.clear();
    _instanceSaveLock.unlock();

    _DeleteQueuedSaves(true);
}

/*
- adding instance into manager
- called from InstanceMap::Add, _LoadBoundInstances, LoadGroups
*/
InstanceSave* InstanceSaveManager::AddInstanceSave(uint32 mapId, uint32 instanceId, Difficulty difficulty, uint32 completedEncounter, std::string data, time_t resetTime, bool canReset, bool load)
{
    if (InstanceSave* old_save = GetInstanceSave(instanceId))
        return old_save;

    const MapEntry* entry = sMapStore.LookupEntry(mapId);
    if (!entry)
    {
        TC_LOG_ERROR("misc", "InstanceSaveManager::AddInstanceSave: wrong mapid = %d, instanceid = %d!", mapId, instanceId);
        return nullptr;
    }

    if (instanceId == 0)
    {
        TC_LOG_ERROR("misc", "InstanceSaveManager::AddInstanceSave: mapid = %d, wrong instanceid = %d!", mapId, instanceId);
        return nullptr;
    }

    DifficultyEntry const* difficultyEntry = sDifficultyStore.LookupEntry(difficulty);
    if (!difficultyEntry || difficultyEntry->InstanceType != entry->InstanceType)
    {
        TC_LOG_ERROR("misc", "InstanceSaveManager::AddInstanceSave: mapid = %d, instanceid = %d, wrong dificalty %u!", mapId, instanceId, difficulty);
        return nullptr;
    }

    TC_LOG_DEBUG("maps", "InstanceSaveManager::AddInstanceSave: mapid = %d, instanceid = %d", mapId, instanceId);

    if (!resetTime)
        if (MapDifficultyEntry const* mapDiff = sDB2Manager.GetMapDifficultyData(mapId, difficulty))
            resetTime = sWorld->getInstanceResetTime(mapDiff->GetRaidDuration());

    InstanceSave* save = new InstanceSave(mapId, instanceId, difficulty, completedEncounter, std::move(data), resetTime, canReset);
    {
        std::lock_guard<sf::contention_free_shared_mutex< >> guard(_instanceSaveLock);
        auto inserted = m_instanceSaveById.emplace(instanceId, save);
        if (!inserted.second)
        {
            // another map thread created it since the lookup above
            delete save;
            return inserted.first->second;
        }
    }

    // initialize reset time
    // for normal instances if no creatures are killed the instance will reset in two hours
    // scheduled outside _instanceSaveLock: Update() takes _resetTimeLock before it
    if (entry->InstanceType != MAP_RAID && difficulty <= DIFFICULTY_NORMAL)
    {
        time_t _resetTime = GameTime::GetGameTime() + 2 * HOUR;
        // normally this will be removed soon after in InstanceMap::Add, prevent error
        ScheduleReset(true, _resetTime, InstResetEvent(0, mapId, difficulty, instanceId));
    }

    return save;
}

InstanceSave* InstanceSaveManager::GetInstanceSave(uint32 InstanceId)
{
    std::shared_lock<sf::contention_free_shared_mutex< >> guard(_instanceSaveLock);
    return Trinity::Containers::MapGetValuePtr(m_instanceSaveById, InstanceId);
}

void InstanceSaveManager::DeleteInstanceFromDB(uint32 instanceid)
{
    CharacterDatabasePreparedStatement* stmt = CharacterDatabase.GetPreparedStatement(CHAR_DEL_GROUP_INSTANCE_BY_INSTANCE);
    stmt->setUInt32(0, instanceid);
    CharacterDatabase.DirectExecute(stmt);

    stmt = CharacterDatabase.GetPreparedStatement(CHAR_DEL_CHAR_INSTANCE_BY_INSTANCE);
    stmt->setUInt32(0, instanceid);
    CharacterDatabase.DirectExecute(stmt);
    // Respawn times should be deleted only when the map gets unloaded
}

bool InstanceSaveManager::RemoveInstanceSave(InstanceSave* save)
{
    std::lock_guard<sf::contention_free_shared_mutex< >> guard(_instanceSaveLock);
    InstanceSaveHashMap::iterator itr = m_instanceSaveById.find(save->GetInstanceId());
    // a reset may have taken this save out and a map thread registered a new one under the same id
    if (itr == m_instanceSaveById.end() || itr->second != save)
        return false;

    itr->second->SetToDelete(true);
    m_instanceSaveById.erase(itr);
    return true;
}

void InstanceSaveManager::UnloadInstanceSave(uint32 InstanceId)
{
    if (InstanceSave* save = GetInstanceSave(InstanceId))
    {
        bool removed = false;
        save->UnloadIfEmpty(removed);
        if (removed)
            QueueForDelete(save);
    }
}

void InstanceSaveManager::QueueForDelete(InstanceSave* save)
{
    // map threads may still hold the pointer they got from GetInstanceSave a moment ago
    std::lock_guard<std::mutex> guard(_deleteQueueLock);
    _deleteQueue.emplace_back(GameTime::GetGameTime() + MINUTE, save);
}

void InstanceSaveManager::_DeleteQueuedSaves(bool all)
{
    time_t now = GameTime::GetGameTime();
    std::vector<InstanceSave*> expired;
    {
        std::lock_guard<std::mutex> guard(_deleteQueueLock);
        auto firstExpired = std::partition(_deleteQueue.begin(), _deleteQueue.end(), [now, all](std::pair<time_t, InstanceSave*> const& queued)
        {
            return !all && queued.first > now;
        });
        for (auto itr = firstExpired; itr != _deleteQueue.end(); ++itr)
            expired.push_back(itr->second);
        _deleteQueue.erase(firstExpired, _deleteQueue.end());
    }

    for (InstanceSave* save : expired)
    {
        bool inUse;
        {
            std::lock_guard<sf::contention_free_shared_mutex< >> playerGuard(save->_playerListLock);
            std::lock_guard<sf::contention_free_shared_mutex< >> groupGuard(save->_groupListLock);
            inUse = !save->m_playerList.empty() || !save->m_groupList.empty();
            // bound again through a stale pointer: UnloadIfEmpty queues it again once its lists are empty
            if (inUse)
                save->m_deleteQueued = false;
        }

        if (inUse)
        {
            TC_LOG_ERROR("maps", "InstanceSaveManager: save of instance %u (map %u) was bound again after its removal, kept", save->GetInstanceId(), save->GetMapId());
            continue;
        }

        delete save;
    }
}

InstanceSave::InstanceSave(uint16 MapId, uint32 InstanceId, Difficulty difficulty, uint32 completedEncounter, std::string data, time_t resetTime, bool canReset)
: m_instanceid(InstanceId), m_mapid(MapId), m_difficulty(difficulty), m_canReset(canReset), m_toDelete(false),
m_perm(false), m_extended(false), m_completedEncounter(completedEncounter), m_data(std::move(data)), m_resetTime(resetTime), m_deleteQueued(false)
{
    m_canBeSave = difficulty != DIFFICULTY_LFR && difficulty != DIFFICULTY_HC_SCENARIO && difficulty != DIFFICULTY_N_SCENARIO && difficulty != DIFFICULTY_LFR_RAID;
}

InstanceSave::~InstanceSave()
{
    // the players and groups must be unbound before deleting the save
    ASSERT(m_playerList.empty() && m_groupList.empty());
}

// to cache or not to cache, that is the question
InstanceTemplate const* InstanceSave::GetTemplate()
{
    return sObjectMgr->GetInstanceTemplate(m_mapid);
}

MapEntry const* InstanceSave::GetMapEntry()
{
    return sMapStore.LookupEntry(m_mapid);
}

void InstanceSave::AddPlayer(Player* player)
{
    _playerListLock.lock();
    m_playerList.push_back(player);
    _playerListLock.unlock();
}

bool InstanceSave::RemovePlayer(Player* player)
{
    bool removed = false;
    _playerListLock.lock();
    m_playerList.remove(player);
    _playerListLock.unlock();

    // called without the list lock, like RemoveGroup: UnloadIfEmpty asks MapInstanced (its m_lock) before re-taking
    // the list locks, and CreateInstance may hold that m_lock while a script saves the binds under the list locks
    bool isStillValid = UnloadIfEmpty(removed);

    // freed later, after releasing the lock
    if (removed)
        sInstanceSaveMgr->QueueForDelete(this);

    return isStillValid;
}

void InstanceSave::AddGroup(Group* group)
{
    _groupListLock.lock();
    m_groupList.push_back(group);
    _groupListLock.unlock();
}

bool InstanceSave::RemoveGroup(Group* group)
{
    _groupListLock.lock();
    m_groupList.remove(group);
    _groupListLock.unlock();

    // UnloadIfEmpty takes _playerListLock before _groupListLock, so it is called without the group lock held
    bool removed = false;
    bool isStillValid = UnloadIfEmpty(removed);
    if (removed)
        sInstanceSaveMgr->QueueForDelete(this);

    return isStillValid;
}

void InstanceSave::DeleteFromDB()
{
    InstanceSaveManager::DeleteInstanceFromDB(GetInstanceId());
}

void InstanceSave::SaveBindsToDB()
{
    MapEntry const* entry = GetMapEntry();
    if (!entry || entry->IsGarrison() || entry->CanCreatedZone())
        return;

    // ids only: a player or group is freed by its own thread right after it leaves these lists
    std::vector<uint32> groupIds;
    {
        std::lock_guard<sf::contention_free_shared_mutex< >> guard(_groupListLock);
        for (Group* group : m_groupList)
            groupIds.push_back(group->GetDbStoreId());
    }

    std::vector<ObjectGuid::LowType> playerIds;
    {
        std::lock_guard<sf::contention_free_shared_mutex< >> guard(_playerListLock);
        for (Player* player : m_playerList)
            playerIds.push_back(player->GetGUIDLow());
    }

    // same rows as Group::UpdateInstance and Player::UpdateInstance
    std::string data = GetData();
    for (uint32 groupId : groupIds)
    {
        CharacterDatabasePreparedStatement* stmt = CharacterDatabase.GetPreparedStatement(CHAR_REP_GROUP_INSTANCE);
        stmt->setUInt64(0, groupId);
        stmt->setUInt32(1, GetInstanceId());
        stmt->setUInt16(2, GetMapId());
        stmt->setUInt8(3, GetDifficultyID());
        stmt->setBool(4, GetPerm());
        stmt->setUInt32(5, GetCompletedEncounterMask());
        stmt->setString(6, data);
        stmt->setUInt32(7, GetResetTime());
        CharacterDatabase.Execute(stmt);
    }

    for (ObjectGuid::LowType playerId : playerIds)
    {
        CharacterDatabasePreparedStatement* stmt = CharacterDatabase.GetPreparedStatement(CHAR_REP_CHAR_INSTANCE);
        stmt->setUInt64(0, playerId);
        stmt->setUInt32(1, GetInstanceId());
        stmt->setUInt16(2, GetMapId());
        stmt->setUInt8(3, GetDifficultyID());
        stmt->setBool(4, GetPerm());
        stmt->setUInt32(5, GetCompletedEncounterMask());
        stmt->setString(6, data);
        stmt->setUInt32(7, GetResetTime());
        stmt->setBool(8, GetExtended());
        CharacterDatabase.Execute(stmt);
    }
}

/* true if the instance save is still valid */
bool InstanceSave::UnloadIfEmpty(bool& removed)
{
    removed = false;

    // don't remove the save if there are still players inside the map; a save a reset already took out of the
    // manager is unreachable from that map, it goes as soon as nothing lists it. The map belongs to another thread:
    // asked under its parent's lock (MapInstanced::m_lock takes no save lock, so this nesting is safe)
    if (!m_toDelete)
        if (sMapMgr->InstanceHavePlayers(GetMapId(), GetInstanceId()))
            return true;

    // The emptiness test and the removal from the manager happen under the same list locks, so no AddPlayer/AddGroup
    // from another thread can slip in between them (lock order: players, groups, then the manager's save lock)
    std::lock_guard<sf::contention_free_shared_mutex< >> playerGuard(_playerListLock);
    std::lock_guard<sf::contention_free_shared_mutex< >> groupGuard(_groupListLock);
    if (!m_playerList.empty() || !m_groupList.empty())
        return true;

    // only one caller may queue the save for deletion, two map threads (or a map thread and a reset) can get here together
    if (m_deleteQueued)
        return false;

    if (m_toDelete)
        removed = true;
    else if (!sInstanceSaveMgr->lock_instLists)
        removed = sInstanceSaveMgr->RemoveInstanceSave(this);

    if (removed)
        m_deleteQueued = true;

    return false;
}

void InstanceSave::SetToDelete(bool toDelete)
{
    m_toDelete = toDelete;
}

InstanceSaveManager::InstResetEvent::InstResetEvent(): difficulty(DIFFICULTY_NORMAL), mapid(0), instanceId(0), type(0)
{
}

InstanceSaveManager::InstResetEvent::InstResetEvent(uint8 t, uint32 _mapid, Difficulty d, uint32 _instanceid): difficulty(d), mapid(_mapid), instanceId(_instanceid), type(t)
{
}

bool InstanceSaveManager::InstResetEvent::operator==(const InstResetEvent& e) const
{
    return e.instanceId == instanceId;
}

void InstanceSaveManager::LoadInstances()
{
    uint32 oldMSTime = getMSTime();

    // Delete invalid character_instance and group_instance references
    CharacterDatabase.DirectExecute("DELETE ci.* FROM character_instance AS ci LEFT JOIN characters AS c ON ci.guid = c.guid WHERE c.guid IS NULL");
    CharacterDatabase.DirectExecute("DELETE gi.* FROM group_instance     AS gi LEFT JOIN `groups`     AS g ON gi.guid = g.guid WHERE g.guid IS NULL");

    // Delete invalid instance references
    // CharacterDatabase.DirectExecute("DELETE i.* FROM instance AS i LEFT JOIN character_instance AS ci ON i.id = ci.instance LEFT JOIN group_instance AS gi ON i.id = gi.instance WHERE ci.guid IS NULL AND gi.guid IS NULL");

    // Delete invalid references to instance
    CharacterDatabase.DirectExecute("DELETE FROM creature_respawn WHERE instanceId > 0 AND instanceId NOT IN (SELECT instance FROM character_instance)");
    CharacterDatabase.DirectExecute("DELETE FROM gameobject_respawn WHERE instanceId > 0 AND instanceId NOT IN (SELECT instance FROM character_instance)");
    // CharacterDatabase.DirectExecute("DELETE tmp.* FROM character_instance AS tmp LEFT JOIN instance ON tmp.instance = instance.id WHERE tmp.instance > 0 AND instance.id IS NULL");
    // CharacterDatabase.DirectExecute("DELETE tmp.* FROM group_instance     AS tmp LEFT JOIN instance ON tmp.instance = instance.id WHERE tmp.instance > 0 AND instance.id IS NULL");

    // Clean invalid references to instance
    CharacterDatabase.DirectExecute("UPDATE corpse SET instanceId = 0 WHERE instanceId > 0 AND instanceId NOT IN (SELECT instance FROM character_instance)");
    CharacterDatabase.DirectExecute("UPDATE characters AS tmp LEFT JOIN character_instance ON tmp.instance_id = character_instance.instance SET tmp.instance_id = 0 WHERE tmp.instance_id > 0 AND character_instance.instance IS NULL");

    // Initialize instance id storage (Needs to be done after the trash has been clean out)
    sMapMgr->InitInstanceIds();

    TC_LOG_INFO("server.loading", ">> Loaded instances in %u ms", GetMSTimeDiffToNow(oldMSTime));

}

void InstanceSaveManager::ScheduleReset(bool add, time_t time, InstResetEvent event)
{
    std::lock_guard<sf::contention_free_shared_mutex< >> guard(_resetTimeLock);
    if (!add)
    {
        // find the event in the queue and remove it
        ResetTimeQueue::iterator itr;
        std::pair<ResetTimeQueue::iterator, ResetTimeQueue::iterator> range = m_resetTimeQueue.equal_range(time);
        for (itr = range.first; itr != range.second; ++itr)
        {
            if (itr->second == event)
            {
                m_resetTimeQueue.erase(itr);
                return;
            }
        }

        // in case the reset time changed (should happen very rarely), we search the whole queue
        if (itr == range.second)
        {
            for (itr = m_resetTimeQueue.begin(); itr != m_resetTimeQueue.end(); ++itr)
            {
                if (itr->second == event)
                {
                    m_resetTimeQueue.erase(itr);
                    return;
                }
            }

            if (itr == m_resetTimeQueue.end())
                TC_LOG_ERROR("misc", "InstanceSaveManager::ScheduleReset: cannot cancel the reset, the event(%d, %d, %d) was not found!", event.type, event.mapid, event.instanceId);
        }
    }
    else
        m_resetTimeQueue.insert(std::make_pair(time, event));
}

void InstanceSaveManager::Update()
{
    time_t now = GameTime::GetGameTime();

    for (;;)
    {
        // _resetTimeLock is released before the reset, which reaches the maps and the groups
        InstResetEvent event;
        {
            std::lock_guard<sf::contention_free_shared_mutex< >> guard(_resetTimeLock);
            if (m_resetTimeQueue.empty() || m_resetTimeQueue.begin()->first >= now)
                break;

            event = m_resetTimeQueue.begin()->second;
            m_resetTimeQueue.erase(m_resetTimeQueue.begin());
        }

        // for individual normal instances, max creature respawn + X hours
        if (event.type == 0)
            _ResetInstance(event.mapid, event.instanceId);
    }

    _DeleteQueuedSaves(false);
}

/*
    Runs in the world thread while the bound players and groups live in map threads. The save is taken out of the
    manager first, so no lookup reaches it any more; it stays allocated while a player or group still lists it and is
    queued for deletion by whoever empties its lists (UnloadIfEmpty).
*/
void InstanceSaveManager::_ResetSave(uint32 instanceId)
{
    InstanceSave* save;
    {
        std::lock_guard<sf::contention_free_shared_mutex< >> guard(_instanceSaveLock);
        InstanceSaveHashMap::iterator itr = m_instanceSaveById.find(instanceId);
        if (itr == m_instanceSaveById.end())
            return;

        save = itr->second;
        save->SetToDelete(true);
        m_instanceSaveById.erase(itr);
    }

    uint32 mapId = save->GetMapId();
    Difficulty difficulty = save->GetDifficultyID();

    // Each player unbinds himself in his own thread. The list lock is held only to queue the calls: a listed player
    // cannot be freed meanwhile (his logout removes him under this lock) and AddDelayedEvent only takes its queue mutex.
    {
        std::lock_guard<sf::contention_free_shared_mutex< >> guard(save->_playerListLock);
        for (Player* player : save->m_playerList)
        {
            player->AddDelayedEvent(0, [player, save, mapId, difficulty, instanceId]() -> void
            {
                // the bind may already point to another instance; the save is alive while this player still lists it
                Player::BoundInstancesMap& binds = player->GetBoundInstances(difficulty);
                auto itr = binds.find(mapId);
                if (itr != binds.end() && itr->second.save == save && save->GetInstanceId() == instanceId)
                    player->UnbindInstance(mapId, difficulty, true);
            });
        }
    }

    // Groups have no thread of their own (every member's map thread changes their binds under m_bound_lock), so
    // they are unbound here. Looked up by guid, without the list lock: Group::UnbindInstance takes m_bound_lock
    // then this save's group lock, the opposite order would deadlock with Group::BindToInstance.
    std::vector<ObjectGuid> groupGuids;
    {
        std::lock_guard<sf::contention_free_shared_mutex< >> guard(save->_groupListLock);
        for (Group* group : save->m_groupList)
            groupGuids.push_back(group->GetGUID());
    }

    for (ObjectGuid const& groupGuid : groupGuids)
    {
        // a disbanding group is already out of GroupMgr and leaves the list itself (Group::Disband); a group found
        // here stays allocated for this call (GroupMgr frees disbanded groups after a grace delay)
        Group* group = sGroupMgr->GetGroupByGUID(groupGuid);
        if (!group)
            continue;

        // unbinds only if the group's bind still points to this save, checked under its own bind lock
        group->UnbindInstance(save, true);
    }

    // nothing bound to it any more (or it never was): free it now, otherwise the last unbind does
    bool removed = false;
    save->UnloadIfEmpty(removed);
    if (removed)
        QueueForDelete(save);
}

void InstanceSaveManager::_ResetInstance(uint32 mapid, uint32 instanceId)
{
    // TC_LOG_DEBUG("server.loading", "InstanceSaveMgr::_ResetInstance mapid %u, instanceId %u", mapid, instanceId);

    Map* map = sMapMgr->CreateBaseMap(mapid);
    if (!map->Instanceable())
        return;

    _ResetSave(instanceId);

    DeleteInstanceFromDB(instanceId);                       // even if save not loaded

    // a loaded map resets and clears its respawn times itself, in its own thread (a live garrison is left alone,
    // as before the lookup covered garrisons)
    if (map->IsGarrison() || !static_cast<MapInstanced*>(map)->RequestInstanceReset(instanceId, INSTANCE_RESET_RESPAWN_DELAY))
        Map::DeleteRespawnTimesInDB(mapid, instanceId);
}

void InstanceSaveManager::ResetOrWarnAll(uint32 mapid, Difficulty difficulty, CharacterDatabaseTransaction& trans)
{
    // global reset for all instances of the given map
    MapEntry const* mapEntry = sMapStore.LookupEntry(mapid);
    if (!mapEntry || !mapEntry->Instanceable() || difficulty == DIFFICULTY_LFR || difficulty == DIFFICULTY_HC_SCENARIO || difficulty == DIFFICULTY_N_SCENARIO || difficulty == DIFFICULTY_LFR_RAID)
        return;

    uint32 resetTime = 0;
    if (MapDifficultyEntry const* mapDiff = sDB2Manager.GetMapDifficultyData(mapid, difficulty))
        resetTime = sWorld->getInstanceResetTime(mapDiff->GetRaidDuration());

    // map threads add and remove saves meanwhile: collect the ids under the lock, _ResetSave takes it again to erase
    std::vector<uint32> instanceIds;
    {
        std::shared_lock<sf::contention_free_shared_mutex< >> guard(_instanceSaveLock);
        for (auto const& itr : m_instanceSaveById)
            if (itr.second && itr.second->GetMapId() == mapid && itr.second->GetDifficultyID() == difficulty)
                instanceIds.push_back(itr.first);
    }

    // remove all binds to instances of the given map
    for (uint32 instanceId : instanceIds)
    {
        // the save is only touched under the lock: once out of the map it may be queued for deletion
        bool reset = false;
        {
            std::shared_lock<sf::contention_free_shared_mutex< >> guard(_instanceSaveLock);
            InstanceSaveHashMap::iterator itr = m_instanceSaveById.find(instanceId);
            if (itr == m_instanceSaveById.end())
                continue;

            if (itr->second->GetExtended())
            {
                // same values as CHAR_UPD_CHAR_INSTANCE_EXTENDED below, or online players keep the old reset time
                itr->second->SetExtended(false);
                itr->second->SetResetTime(resetTime);
            }
            else if ((itr->second->GetResetTime() + MONTH) <= GameTime::GetGameTime())
                reset = true;
        }

        if (reset)
            _ResetSave(instanceId);
    }

    // delete them from the DB, even if not loaded
    CharacterDatabasePreparedStatement* stmt = CharacterDatabase.GetPreparedStatement(CHAR_DEL_CHAR_INSTANCE_BY_MAP_DIFF);
    stmt->setUInt16(0, uint16(mapid));
    stmt->setUInt8(1, uint8(difficulty));
    stmt->setUInt32(2, GameTime::GetGameTime());
    trans->Append(stmt);

    stmt = CharacterDatabase.GetPreparedStatement(CHAR_DEL_GROUP_INSTANCE_BY_MAP_DIFF);
    stmt->setUInt16(0, uint16(mapid));
    stmt->setUInt8(1, uint8(difficulty));
    trans->Append(stmt);

    stmt = CharacterDatabase.GetPreparedStatement(CHAR_UPD_CHAR_INSTANCE_EXTENDED);
    stmt->setUInt32(0, resetTime);
    stmt->setUInt16(1, uint16(mapid));
    stmt->setUInt8(2, uint8(difficulty));
    trans->Append(stmt);

    // note: this isn't fast but it's meant to be executed very rarely
    Map* map = sMapMgr->CreateBaseMap(mapid);                // _not_ include difficulty

    // only the reset difficulty: the other difficulties of the same map keep their own lockout. Players inside get
    // the one-minute homebind timer; staying would let them kill the bosses twice. Each map applies the reset in its
    // own thread, at its next update.
    static_cast<MapInstanced*>(map)->ForEachInstancedMap([difficulty](Map* instance)
    {
        if (InstanceMap* instanceMap = instance->ToInstanceMap())
            if (instanceMap->GetDifficultyID() == difficulty)
                instanceMap->RequestReset(INSTANCE_RESET_GLOBAL);
    });

    // TODO: delete creature/gameobject respawn times even if the maps are not loaded
}

uint32 InstanceSaveManager::GetNumBoundPlayersTotal()
{
    uint32 ret = 0;
    std::shared_lock<sf::contention_free_shared_mutex< >> guard(_instanceSaveLock);
    for (auto & itr : m_instanceSaveById)
        ret += itr.second->GetPlayerCount();

    return ret;
}

uint32 InstanceSaveManager::GetNumBoundGroupsTotal()
{
    uint32 ret = 0;
    std::shared_lock<sf::contention_free_shared_mutex< >> guard(_instanceSaveLock);
    for (auto & itr : m_instanceSaveById)
        ret += itr.second->GetGroupCount();

    return ret;
}
