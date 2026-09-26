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

#include "DisableMgr.h"
#include "Config.h"
#include "ObjectMgr.h"
#include "OutdoorPvP.h"
#include "SpellMgr.h"
#include "VMapManager2.h"
#include "DatabaseEnv.h"
#include "Group.h"
#include "QuestData.h"

namespace DisableMgr
{

namespace
{
    struct DisableData
    {
        uint8 flags;
        std::set<uint32> params[2];                             // params0, params1
    };

    // single disables here with optional data
    typedef std::map<uint32, DisableData> DisableTypeMap;
    typedef std::vector<DisableData*> DisableTypeList;
    // global disable map by source
    typedef std::map<DisableType, DisableTypeMap> DisableMap;
    typedef std::vector<DisableTypeList> DisableList;

    DisableMap m_DisableMap;
    DisableList m_DisableList;

    uint8 GetMapDisableType(Difficulty difficulty)
    {
        switch (difficulty)
        {
            case DIFFICULTY_NORMAL:
            case DIFFICULTY_10_N:
            case DIFFICULTY_25_N:
            case DIFFICULTY_40:
            case DIFFICULTY_N_SCENARIO:
            case DIFFICULTY_NORMAL_RAID:
                return MAP_DISABLE_NORMAL;
            case DIFFICULTY_HEROIC:
            case DIFFICULTY_10_HC:
            case DIFFICULTY_25_HC:
            case DIFFICULTY_HC_SCENARIO:
            case DIFFICULTY_HEROIC_RAID:
                return MAP_DISABLE_HEROIC;
            case DIFFICULTY_MYTHIC_KEYSTONE:
            case DIFFICULTY_MYTHIC_DUNGEON:
            case DIFFICULTY_MYTHIC_RAID:
                return MAP_DISABLE_MYTHIC;
            case DIFFICULTY_LFR:
            case DIFFICULTY_LFR_RAID:
                return MAP_DISABLE_LFR;
            case DIFFICULTY_TIMEWALKING:
            case DIFFICULTY_TIMEWALKING_RAID:
                return MAP_DISABLE_TIMEWALKING;
            default:
                return 0;
        }
    }

    struct RaidOpening
    {
        char const* Name;
        uint32 MapId;
        std::vector<uint32> Wings;                              // Raid Finder LFGDungeons, in order
    };

    std::vector<RaidOpening> const RaidOpenings =
    {
        { "EmeraldNightmare", 1520, { 1287, 1288, 1289 } },
        { "TrialOfValor",     1648, { 1411 } },
        { "Nighthold",        1530, { 1290, 1291, 1292, 1293 } },
        { "TombOfSargeras",   1676, { 1494, 1495, 1496, 1497 } },
        { "Antorus",          1712, { 1610, 1611, 1612, 1613 } },
    };

    DisableData& AddDisable(DisableType type, uint32 entry)
    {
        DisableData& data = m_DisableMap[type][entry];
        if (m_DisableList[type].size() <= entry)
            m_DisableList[type].resize(entry + 1);
        m_DisableList[type][entry] = &data;
        return data;
    }

    // Raid.* settings of worldserver.conf, on top of the `disables` rows: closed as soon as either closes
    uint32 LoadRaidOpenings()
    {
        uint32 count = 0;
        for (RaidOpening const& raid : RaidOpenings)
        {
            std::string const prefix = std::string("Raid.") + raid.Name + ".";

            uint8 closed = 0;
            if (!sConfigMgr->GetBoolDefault(prefix + "Normal", true))
                closed |= MAP_DISABLE_NORMAL;
            if (!sConfigMgr->GetBoolDefault(prefix + "Heroic", true))
                closed |= MAP_DISABLE_HEROIC;
            if (!sConfigMgr->GetBoolDefault(prefix + "Mythic", true))
                closed |= MAP_DISABLE_MYTHIC;

            uint32 openWings = 0;
            for (size_t i = 0; i < raid.Wings.size(); ++i)
            {
                if (sConfigMgr->GetBoolDefault(prefix + "LFR.Wing" + std::to_string(i + 1), true))
                    ++openWings;
                else if (!m_DisableMap[DISABLE_TYPE_LFG].count(raid.Wings[i]))
                {
                    AddDisable(DISABLE_TYPE_LFG, raid.Wings[i]).flags = 0;
                    ++count;
                }
            }
            if (!openWings)
                closed |= MAP_DISABLE_LFR;

            if (!closed)
                continue;

            auto itr = m_DisableMap[DISABLE_TYPE_MAP].find(raid.MapId);
            if (itr == m_DisableMap[DISABLE_TYPE_MAP].end())
            {
                AddDisable(DISABLE_TYPE_MAP, raid.MapId).flags = closed;
                ++count;
            }
            else if (itr->second.flags)                         // 0 already closes the whole map
                itr->second.flags |= closed;
        }
        return count;
    }
}

void LoadDisables()
{
    uint32 oldMSTime = getMSTime();

    m_DisableList.clear();
    // reload case
    for (auto& itr : m_DisableMap)
        itr.second.clear();

    m_DisableMap.clear();
    m_DisableList.resize(DISABLE_TYPE_MAX);

    QueryResult result = WorldDatabase.Query("SELECT sourceType, entry, flags, params_0, params_1 FROM disables");

    uint32 total_count = 0;

    if (!result)
    {
        TC_LOG_INFO("server.loading", ">> Loaded 0 disables. DB table `disables` is empty!");
        TC_LOG_INFO("server.loading", ">> Loaded %u raid closures from worldserver.conf", LoadRaidOpenings());
        return;
    }

    do
    {
        Field * fields = result->Fetch();
        auto type = DisableType(fields[0].GetUInt32());
        if (type >= DISABLE_TYPE_MAX)
        {
            TC_LOG_ERROR("sql.sql", "Invalid type %u specified in `disables` table, skipped.", type);
            continue;
        }

        uint32 entry = fields[1].GetUInt32();
        uint8 flags = fields[2].GetUInt8();
        std::string params_0 = fields[3].GetString();
        std::string params_1 = fields[4].GetString();

        // stored only once valid: a row the log reports as skipped must not act
        DisableData data;
        data.flags = flags;

        switch (type)
        {
            case DISABLE_TYPE_SPELL:
                if (!(sSpellMgr->GetSpellInfo(entry) || flags & SPELL_DISABLE_DEPRECATED_SPELL))
                {
                    TC_LOG_ERROR("sql.sql", "Spell entry %u from `disables` doesn't exist in dbc, skipped.", entry);
                    continue;
                }

                if (!flags || flags > MAX_SPELL_DISABLE_TYPE)
                {
                    TC_LOG_ERROR("sql.sql", "Disable flags for spell %u are invalid, skipped.", entry);
                    continue;
                }

                if (flags & SPELL_DISABLE_MAP)
                {
                    Tokenizer tokens(params_0, ',');
                    for (auto i = 0; i < tokens.size(); )
                        data.params[0].insert(atoi(tokens[i++]));
                }

                if (flags & SPELL_DISABLE_AREA)
                {
                    Tokenizer tokens(params_1, ',');
                    for (auto i = 0; i < tokens.size(); )
                        data.params[1].insert(atoi(tokens[i++]));
                }

                break;
            // checked later
            case DISABLE_TYPE_QUEST:
                break;
            case DISABLE_TYPE_MAP:
            {
                MapEntry const* mapEntry = sMapStore.LookupEntry(entry);
                if (!mapEntry)
                {
                    TC_LOG_ERROR("sql.sql", "Map entry %u from `disables` doesn't exist in dbc, skipped.", entry);
                    continue;
                }
                bool isFlagInvalid = false;
                switch (mapEntry->InstanceType)
                {
                    case MAP_COMMON:
                        //if (flags)
                            //isFlagInvalid = true;
                        break;
                    case MAP_INSTANCE:
                    case MAP_RAID:
                    case MAP_SCENARIO:
                        if (flags & ~MAX_MAP_DISABLE_TYPE)
                            isFlagInvalid = true;
                        break;
                    case MAP_BATTLEGROUND:
                    case MAP_ARENA:
                        TC_LOG_ERROR("sql.sql", "Battleground map %u specified to be disabled in map case, skipped.", entry);
                        continue;
                    default:
                        break;
                }
                if (isFlagInvalid)
                {
                    TC_LOG_ERROR("sql.sql", "Disable flags for map %u are invalid, skipped.", entry);
                    continue;
                }
                break;
            }
            case DISABLE_TYPE_BATTLEGROUND:
                if (!sBattlemasterListStore.LookupEntry(entry))
                {
                    TC_LOG_ERROR("sql.sql", "Battleground entry %u from `disables` doesn't exist in dbc, skipped.", entry);
                    continue;
                }
                if (flags)
                    TC_LOG_ERROR("sql.sql", "Disable flags specified for battleground %u, useless data.", entry);
                break;
            case DISABLE_TYPE_OUTDOORPVP:
                if (entry > MAX_OUTDOORPVP_TYPES)
                {
                    TC_LOG_ERROR("sql.sql", "OutdoorPvPTypes value %u from `disables` is invalid, skipped.", entry);
                    continue;
                }
                if (flags)
                    TC_LOG_ERROR("sql.sql", "Disable flags specified for outdoor PvP %u, useless data.", entry);
                break;
            case DISABLE_TYPE_CRITERIA:
                if (!sCriteriaStore.LookupEntry(entry))
                {
                    TC_LOG_ERROR("sql.sql", "Criteria entry %u from `disables` doesn't exist in dbc, skipped.", entry);
                    continue;
                }
                if (flags)
                    TC_LOG_ERROR("sql.sql", "Disable flags specified for Criteria %u, useless data.", entry);
                break;
            case DISABLE_TYPE_CRITERIA_TREE:
                if (!sCriteriaTreeStore.LookupEntry(entry))
                {
                    TC_LOG_ERROR("sql.sql", "Criteria Tree entry %u from `disables` doesn't exist in dbc, skipped.", entry);
                    continue;
                }
                if (flags)
                    TC_LOG_ERROR("sql.sql", "Disable flags specified for Criteria Tree %u, useless data.", entry);
                break;
            case DISABLE_TYPE_ACHIEVEMENT:
                if (!sAchievementStore.LookupEntry(entry))
                {
                    TC_LOG_ERROR("sql.sql", "Achievement entry %u from `disables` doesn't exist in dbc, skipped.", entry);
                    continue;
                }
                if (flags)
                    TC_LOG_ERROR("sql.sql", "Disable flags specified for Achievement %u, useless data.", entry);
                break;
            case DISABLE_TYPE_LFG:
                if (!sLfgDungeonsStore.LookupEntry(entry))
                {
                    TC_LOG_ERROR("sql.sql", "LFGDungeons entry %u from `disables` doesn't exist in dbc, skipped.", entry);
                    continue;
                }
                if (flags)
                    TC_LOG_ERROR("sql.sql", "Disable flags specified for LFGDungeons %u, useless data.", entry);
                break;
            case DISABLE_TYPE_VMAP:
            {
                MapEntry const* mapEntry = sMapStore.LookupEntry(entry);
                if (!mapEntry)
                {
                    TC_LOG_ERROR("sql.sql", "Map entry %u from `disables` doesn't exist in dbc, skipped.", entry);
                    continue;
                }
                switch (mapEntry->InstanceType)
                {
                    case MAP_COMMON:
                        if (flags & VMAP_DISABLE_AREAFLAG)
                            TC_LOG_INFO("misc", "Areaflag disabled for world map %u.", entry);
                        if (flags & VMAP_DISABLE_LIQUIDSTATUS)
                            TC_LOG_INFO("misc", "Liquid status disabled for world map %u.", entry);
                        break;
                    case MAP_INSTANCE:
                    case MAP_RAID:
                        if (flags & VMAP_DISABLE_HEIGHT)
                            TC_LOG_INFO("misc", "Height disabled for instance map %u.", entry);
                        if (flags & VMAP_DISABLE_LOS)
                            TC_LOG_INFO("misc", "LoS disabled for instance map %u.", entry);
                        break;
                    case MAP_BATTLEGROUND:
                        if (flags & VMAP_DISABLE_HEIGHT)
                            TC_LOG_INFO("misc", "Height disabled for battleground map %u.", entry);
                        if (flags & VMAP_DISABLE_LOS)
                            TC_LOG_INFO("misc", "LoS disabled for battleground map %u.", entry);
                        break;
                    case MAP_ARENA:
                        if (flags & VMAP_DISABLE_HEIGHT)
                            TC_LOG_INFO("misc", "Height disabled for arena map %u.", entry);
                        if (flags & VMAP_DISABLE_LOS)
                            TC_LOG_INFO("misc", "LoS disabled for arena map %u.", entry);
                        break;
                    default:
                        break;
                }
                break;
            }
            case DISABLE_TYPE_MMAP:
            {
                if (!sMapStore.LookupEntry(entry))
                {
                    TC_LOG_INFO("sql.sql", "Map entry %u from `disables` doesn't exist in dbc, skipped.", entry);
                    continue;
                }
                break;
            }
            default:
                break;
        }

        DisableData& stored = m_DisableMap[type][entry];
        stored = std::move(data);
        if (m_DisableList[type].size() <= entry)
            m_DisableList[type].resize(entry + 1);
        m_DisableList[type][entry] = &stored;

        ++total_count;
    }
    while (result->NextRow());

    TC_LOG_INFO("server.loading", ">> Loaded %u disables in %u ms", total_count, GetMSTimeDiffToNow(oldMSTime));
    TC_LOG_INFO("server.loading", ">> Loaded %u raid closures from worldserver.conf", LoadRaidOpenings());

}

void CheckQuestDisables()
{
    uint32 oldMSTime = getMSTime();

    uint32 count = m_DisableMap[DISABLE_TYPE_QUEST].size();
    if (!count)
    {
        TC_LOG_INFO("server.loading", ">> Checked 0 quest disables.");

        return;
    }

    // check only quests, rest already done at startup
    for (auto itr = m_DisableMap[DISABLE_TYPE_QUEST].begin(); itr != m_DisableMap[DISABLE_TYPE_QUEST].end();)
    {
        const uint32 entry = itr->first;
        if (!sQuestDataStore->GetQuestTemplate(entry))
        {
            TC_LOG_ERROR("sql.sql", "Quest entry %u from `disables` doesn't exist, skipped.", entry);
            m_DisableMap[DISABLE_TYPE_QUEST].erase(itr++);
            m_DisableList[DISABLE_TYPE_QUEST][entry] = nullptr;
            continue;
        }
        if (itr->second.flags)
            TC_LOG_ERROR("sql.sql", "Disable flags specified for quest %u, useless data.", entry);
        ++itr;
    }

    TC_LOG_INFO("server.loading", ">> Checked %u quest disables in %u ms", count, GetMSTimeDiffToNow(oldMSTime));

}

bool IsDisabledFor(DisableType type, uint32 entry, Unit const* unit /*= nullptr*/, uint8 flags)
{
    ASSERT(type < DISABLE_TYPE_MAX);
    if (m_DisableList.empty() || m_DisableList[type].empty() || m_DisableList[type].size() <= entry)
        return false;

    auto data = m_DisableList[type][entry];
    if (data == nullptr)    // not disabled
        return false;

    switch (type)
    {
        case DISABLE_TYPE_SPELL:
        {
            uint8 spellFlags = data->flags;
            if (unit)
            {
                if ((spellFlags & SPELL_DISABLE_PLAYER && unit->IsPlayer()) ||
                    (unit->IsCreature() && ((unit->ToCreature()->isPet() && spellFlags & SPELL_DISABLE_PET) || spellFlags & SPELL_DISABLE_CREATURE)))
                {
                    if (spellFlags & SPELL_DISABLE_MAP)
                    {
                        std::set<uint32> const& mapIds = data->params[0];
                        if (mapIds.find(unit->GetMapId()) != mapIds.end())
                            return true;                                        // Spell is disabled on current map

                        if (!(spellFlags & SPELL_DISABLE_AREA))
                            return false;                                       // Spell is disabled on another map, but not this one, return false

                        // Spell is disabled in an area, but not explicitly our current mapId. Continue processing.
                    }

                    if (spellFlags & SPELL_DISABLE_AREA)
                    {
                        std::set<uint32> const& areaIds = data->params[1];
                        if (areaIds.find(unit->GetAreaId()) != areaIds.end())
                            return true;                                        // Spell is disabled in this area
                        return false;                                           // Spell is disabled in another area, but not this one, return false
                    }

                    return true;                                            // Spell disabled for all maps
                }

                return false;
            }
            
            if (spellFlags & SPELL_DISABLE_DEPRECATED_SPELL)    // call not from spellcast
                return true;
            
            if (flags & SPELL_DISABLE_LOS)
                return (spellFlags & SPELL_DISABLE_LOS) != 0;
            break;
        }
        case DISABLE_TYPE_MAP:
            if (!unit)
                return false;

            if (Player const* player = unit->ToPlayer())
            {
                MapEntry const* mapEntry = sMapStore.LookupEntry(entry);
                if (mapEntry->IsDungeon())
                {
                    // already inside: in-instance teleports and logins go on after a difficulty closes
                    if (player->GetMapId() == entry)
                        return false;

                    return IsMapDisabledFor(entry, GetEnterDifficulty(player, mapEntry));
                }
                
                if (mapEntry->IsWorldMap())
                    return true;
            }
            return false;
        case DISABLE_TYPE_QUEST:
            if (!unit)
                return true;
            if (Player const* player = unit->ToPlayer())
                if (player->isGameMaster())
                    return false;
            return true;
        case DISABLE_TYPE_BATTLEGROUND:
        case DISABLE_TYPE_OUTDOORPVP:
        case DISABLE_TYPE_CRITERIA:
        case DISABLE_TYPE_MMAP:
        case DISABLE_TYPE_ACHIEVEMENT:
        case DISABLE_TYPE_CRITERIA_TREE:
        case DISABLE_TYPE_LFG:
            return true;
        case DISABLE_TYPE_VMAP:
           return (flags & data->flags) != 0;
        default:
            break;
    }

    return false;
}

bool IsVMAPDisabledFor(uint32 entry, uint8 flags)
{
    return IsDisabledFor(DISABLE_TYPE_VMAP, entry, nullptr, flags);
}

bool IsMapDisabledFor(uint32 mapId, Difficulty difficulty)
{
    if (m_DisableList.empty() || m_DisableList[DISABLE_TYPE_MAP].size() <= mapId)
        return false;

    DisableData const* data = m_DisableList[DISABLE_TYPE_MAP][mapId];
    if (!data)
        return false;

    MapEntry const* mapEntry = sMapStore.LookupEntry(mapId);
    if (!mapEntry || !mapEntry->IsDungeon() || !data->flags)
        return true;

    uint8 const type = GetMapDisableType(difficulty);
    return !type || (data->flags & type) != 0;
}

// A map row closing every difficulty: a world map, or a dungeon or raid row with flags 0
bool IsMapFullyDisabled(uint32 mapId)
{
    if (m_DisableList.empty() || m_DisableList[DISABLE_TYPE_MAP].size() <= mapId)
        return false;

    DisableData const* data = m_DisableList[DISABLE_TYPE_MAP][mapId];
    if (!data)
        return false;

    MapEntry const* mapEntry = sMapStore.LookupEntry(mapId);
    return !mapEntry || !mapEntry->IsDungeon() || !data->flags;
}

// Same choice as MapInstanced::CreateInstanceForPlayer: the group's difficulty, else the player's
Difficulty GetEnterDifficulty(Player const* player, MapEntry const* mapEntry)
{
    Group const* group = player->GetGroup();
    Difficulty difficulty = group ? group->GetDifficultyID(mapEntry) : player->GetDifficultyID(mapEntry);
    sDB2Manager.GetDownscaledMapDifficultyData(mapEntry->ID, difficulty);
    return difficulty;
}

bool IsPathfindingEnabled(uint32 mapId)
{
    return sWorld->getBoolConfig(CONFIG_ENABLE_MMAPS) && !IsDisabledFor(DISABLE_TYPE_MMAP, mapId, nullptr, MMAP_DISABLE_PATHFINDING);
}

} // Namespace
