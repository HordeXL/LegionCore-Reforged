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

#ifndef _INSTANCESAVEMGR_H
#define _INSTANCESAVEMGR_H

#include "DBCEnums.h"
#include "GameTime.h"
#include "ObjectDefines.h"
#include <safe_ptr.h>
#include <atomic>
#include <list>
#include <mutex>
#include <string>
#include <vector>

struct InstanceTemplate;
struct MapEntry;
class Player;
class Group;

/*
    Holds the information necessary for creating a new map for an existing instance
    Is referenced in three cases:
    - player-instance binds for solo players (not in group)
    - player-instance binds for permanent heroic/raid saves
    - group-instance binds (both solo and permanent) cache the player binds for the group leader
*/
class InstanceSave
{
    friend class InstanceSaveManager;
    public:
        /* Created either when:
           - any new instance is being generated
           - the first time a player bound to InstanceId logs in
           - when a group bound to the instance is loaded */
        InstanceSave(uint16 MapId, uint32 InstanceId, Difficulty difficulty, uint32 completedEncounter, std::string data, time_t resetTime, bool canReset);

        /* Unloaded when m_playerList and m_groupList become empty
           or when the instance is reset */
        ~InstanceSave();

        uint8 GetPlayerCount() const { return m_playerList.size(); }
        uint8 GetGroupCount() const { return m_groupList.size(); }

        /* A map corresponding to the InstanceId/MapId does not always exist.
        InstanceSave objects may be created on player logon but the maps are
        created and loaded only when a player actually enters the instance. */
        uint32 GetInstanceId() const { return m_instanceid; }
        uint32 GetMapId() const { return m_mapid; }

        /* When the instance is being reset (permanently deleted) */
        void DeleteFromDB();

        /* for normal instances this corresponds to max(creature respawn time) + X hours
           for raid/heroic instances this caches the global respawn time for the map */
        InstanceTemplate const* GetTemplate();
        MapEntry const* GetMapEntry();

        /* online players bound to the instance (perm/solo)
           does not include the members of the group unless they have permanent saves */
        void AddPlayer(Player* player);

        bool RemovePlayer(Player* player);
        /* all groups bound to the instance */
        void AddGroup(Group* group);
        bool RemoveGroup(Group* group);

        /* instances cannot be reset (except at the global reset time)
           if there are players permanently bound to it
           this is cached for the case when those players are offline */
        bool CanReset() const { return m_canReset; }
        bool CanBeSave() const { return m_canBeSave; }
        void SetCanReset(bool canReset) { m_canReset = canReset; }
        uint32 GetCompletedEncounterMask() const { return m_completedEncounter; }
        void SetCompletedEncountersMask(uint32 _mask) { m_completedEncounter = _mask; }

        // written by the instance map thread, read by every thread that writes a bind row
        void SetData(std::string _data) { std::lock_guard<std::mutex> guard(_dataLock); m_data = std::move(_data); }
        std::string GetData() const { std::lock_guard<std::mutex> guard(_dataLock); return m_data; }

        void SetResetTime(time_t _time) { m_resetTime = _time; }
        time_t GetResetTime() const { return m_resetTime; }

        void SetPerm(bool _perm) { m_perm = _perm; }
        bool GetPerm() const { return m_perm; }

        void SetExtended(bool extended) { m_extended = extended; }
        bool GetExtended() const { return m_extended; }

        bool SaveIsOld() const { time_t resetTime = m_resetTime; return resetTime && resetTime <= GameTime::GetGameTime(); }

        /* rewrites the character_instance / group_instance rows of everything bound to this save */
        void SaveBindsToDB();

        /* currently it is possible to omit this information from this structure
           but that would depend on a lot of things that can easily change in future */
        Difficulty GetDifficultyID() const { return m_difficulty; }

        typedef std::list<Player*> PlayerListType;
        typedef std::list<Group*> GroupListType;
        PlayerListType m_playerList;
        GroupListType m_groupList;

    private:
        /* removed is set when this call claimed the save for deletion: the caller must then hand it to
           InstanceSaveManager::QueueForDelete (never delete it directly) */
        bool UnloadIfEmpty(bool& removed);
        /* set once the save is out of the manager: it is then freed as soon as nothing lists it */
        void SetToDelete(bool toDelete);

        /* the only reason the instSave-object links are kept is because
           the object-instSave links need to be broken at reset time
           TODO: maybe it's enough to just store the number of players/groups */
        uint32 m_instanceid;
        uint32 m_mapid;
        Difficulty m_difficulty;
        std::atomic<bool> m_canReset;
        std::atomic<bool> m_toDelete;
        bool m_canBeSave;
        std::atomic<bool> m_perm;
        std::atomic<bool> m_extended;
        std::atomic<uint32> m_completedEncounter;
        std::string m_data;
        std::atomic<time_t> m_resetTime;
        // guarded by both list locks: only one thread may queue the save for deletion
        bool m_deleteQueued;

        mutable std::mutex _dataLock;
        sf::contention_free_shared_mutex< > _playerListLock;
        sf::contention_free_shared_mutex< > _groupListLock;
};

class TC_GAME_API InstanceSaveManager
{
    friend class InstanceSave;

        InstanceSaveManager();;
        ~InstanceSaveManager();

    public:
        typedef std::map<uint32 /*InstanceId*/, InstanceSave*> InstanceSaveHashMap;

        static InstanceSaveManager* instance();

        /* resetTime is a global propery of each (raid/heroic) map
           all instances of that map reset at the same time */
        struct InstResetEvent
        {
            Difficulty difficulty:8;
            uint16 mapid;
            uint32 instanceId;
            uint8 type;

            InstResetEvent();
            InstResetEvent(uint8 t, uint32 _mapid, Difficulty d, uint32 _instanceid);
            bool operator ==(const InstResetEvent& e) const;
        };
        typedef std::multimap<time_t /*resetTime*/, InstResetEvent> ResetTimeQueue;

        void LoadInstances();

        void ScheduleReset(bool add, time_t time, InstResetEvent event);

        void Update();

        InstanceSave* AddInstanceSave(uint32 mapId, uint32 instanceId, Difficulty difficulty, uint32 completedEncounter, std::string data, time_t resetTime, bool canReset, bool load = false);
        /* erases the save from the manager only if it is still the one registered under its id */
        bool RemoveInstanceSave(InstanceSave* save);
        void UnloadInstanceSave(uint32 InstanceId);
        static void DeleteInstanceFromDB(uint32 instanceid);

        /* Saves are freed one minute after they leave the manager (QueueForDelete), so a pointer returned here
           stays valid for the short time a map thread uses it. Keep it no longer than the current call. */
        InstanceSave* GetInstanceSave(uint32 InstanceId);

        /* statistics */
        uint32 GetNumInstanceSaves() { return m_instanceSaveById.size(); }
        uint32 GetNumBoundPlayersTotal();
        uint32 GetNumBoundGroupsTotal();
        void ResetOrWarnAll(uint32 mapid, Difficulty difficulty, CharacterDatabaseTransaction& trans);

        void UnloadAll();

    private:
        void _ResetInstance(uint32 mapid, uint32 instanceId);
        void _ResetSave(uint32 instanceId);
        void QueueForDelete(InstanceSave* save);
        void _DeleteQueuedSaves(bool all);

        std::atomic<bool> lock_instLists;
        InstanceSaveHashMap m_instanceSaveById;
        std::vector<std::pair<time_t, InstanceSave*>> _deleteQueue;
        std::mutex _deleteQueueLock;
        ResetTimeQueue m_resetTimeQueue;
        sf::contention_free_shared_mutex< > _resetTimeLock;
        sf::contention_free_shared_mutex< > _instanceSaveLock;
};

#define sInstanceSaveMgr InstanceSaveManager::instance()
#endif
