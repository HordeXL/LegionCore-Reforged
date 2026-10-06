/*
 * Copyright (C) 2008-2012 TrinityCore <http://www.trinitycore.org/>
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

#include "GuildFinderMgr.h"
#include "GuildMgr.h"
#include "ObjectAccessor.h"
#include "World.h"
#include "GuildPackets.h"
#include "DatabaseEnv.h"

MembershipRequest::MembershipRequest(MembershipRequest const& settings) : _comment(settings.GetComment())
{
    _availability = settings.GetAvailability();
    _classRoles = settings.GetClassRoles();
    _playStyle = settings.GetPlayStyle();
    _guildId = settings.GetGuildGuid();
    _playerGUID = settings.GetPlayerGUID();
    _time = settings.GetSubmitTime();
}

MembershipRequest::MembershipRequest(ObjectGuid const& playerGUID, ObjectGuid const& guildId, uint32 availability, uint32 classRoles, uint32 playStyle, std::string& comment, time_t submitTime) : _guildId(guildId), _playerGUID(playerGUID), _time(submitTime), _comment(comment), _availability(availability), _classRoles(classRoles), _playStyle(playStyle) {}
MembershipRequest::MembershipRequest() : _time(GameTime::GetGameTime()), _availability(0), _classRoles(0), _playStyle(0) { }

time_t MembershipRequest::GetSubmitTime() const
{
    return _time;
}

time_t MembershipRequest::GetExpiryTime() const
{
    return time_t(_time + 30 * 24 * 3600);
}

std::string const& MembershipRequest::GetComment() const
{
    return _comment;
}

LFGuildPlayer::LFGuildPlayer()
{
    _guid.Clear();
    _roles = 0;
    _availability = 0;
    _playStyle = 0;
    _level = 0;
}

LFGuildPlayer::LFGuildPlayer(ObjectGuid const& guid, uint8 role, uint8 availability, uint8 playStyle, uint8 level)
{
    _guid = guid;
    _roles = role;
    _availability = availability;
    _playStyle = playStyle;
    _level = level;
}

LFGuildPlayer::LFGuildPlayer(ObjectGuid const& guid, uint8 role, uint8 availability, uint8 playStyle, uint8 level, std::string& comment) : _comment(comment)
{
    _guid = guid;
    _roles = role;
    _availability = availability;
    _playStyle = playStyle;
    _level = level;
}

LFGuildPlayer::LFGuildPlayer(LFGuildPlayer const& settings): _comment(settings.GetComment())
{
    _guid = settings.GetGUID();
    _roles = settings.GetClassRoles();
    _availability = settings.GetAvailability();
    _playStyle = settings.GetPlayStyle();
    _level = settings.GetLevel();
}

LFGuildSettings::LFGuildSettings(): LFGuildPlayer(), _team(TEAM_ALLIANCE), _listed(false)
{
}

LFGuildSettings::LFGuildSettings(bool listed, TeamId team): LFGuildPlayer(), _team(team), _listed(listed)
{
}

LFGuildSettings::LFGuildSettings(bool listed, TeamId team, ObjectGuid const& guid, uint8 role, uint8 availability, uint8 playStyle, uint8 level): LFGuildPlayer(guid, role, availability, playStyle, level), _team(team), _listed(listed)
{
}

LFGuildSettings::LFGuildSettings(bool listed, TeamId team, ObjectGuid const& guid, uint8 role, uint8 availability, uint8 playStyle, uint8 level, std::string& comment): LFGuildPlayer(guid, role, availability, playStyle, level, comment), _team(team), _listed(listed)
{
}

LFGuildSettings::LFGuildSettings(LFGuildSettings const& settings): LFGuildPlayer(settings), _team(settings.GetTeam()), _listed(settings.IsListed())
{
}

GuildFinderMgr::GuildFinderMgr() = default;

GuildFinderMgr::~GuildFinderMgr() = default;

void GuildFinderMgr::LoadFromDB()
{
    LoadGuildSettings();
    LoadMembershipRequests();
}

void GuildFinderMgr::LoadGuildSettings()
{
    TC_LOG_INFO("server.loading", "Loading guild finder guild-related settings...");
    //                                                           0                1             2                  3             4           5             6         7
    // One row per guild: the faction is the guild master's
    QueryResult result = CharacterDatabase.Query("SELECT gfgs.guildId, gfgs.availability, gfgs.classRoles, gfgs.interests, gfgs.level, gfgs.listed, gfgs.comment, c.race "
        "FROM guild_finder_guild_settings gfgs LEFT JOIN guild g ON g.guildid = gfgs.guildId LEFT JOIN characters c ON c.guid = g.leaderguid");

    if (!result)
    {
        TC_LOG_INFO("server.loading", ">> Loaded 0 guild finder guild-related settings. Table `guild_finder_guild_settings` is empty.");
        return;
    }

    uint32 count = 0;
    uint32 oldMSTime = getMSTime();
    do
    {
        Field* fields = result->Fetch();
        ObjectGuid guildId = ObjectGuid::Create<HighGuid::Guild>(fields[0].GetUInt64());
        // Settings left by a deleted guild
        if (!sGuildMgr->GetGuildById(guildId.GetCounter()))
            continue;

        uint8 availability = fields[1].GetUInt8();
        uint8 classRoles = fields[2].GetUInt8();
        uint8 playStyle = fields[3].GetUInt8();
        uint8 level = fields[4].GetUInt8();
        bool listed = (fields[5].GetUInt8() != 0);
        std::string comment = fields[6].GetString();

        TeamId guildTeam = TEAM_NEUTRAL;
        if (ChrRacesEntry const* raceEntry = sChrRacesStore.LookupEntry(fields[7].GetUInt8()))
            guildTeam = static_cast<TeamId>(raceEntry->Alliance);

        {
            std::lock_guard<std::mutex> lock(_lock);
            _guildSettings[guildId] = LFGuildSettings(listed, guildTeam, guildId, classRoles, availability, playStyle, level, comment);
        }

        ++count;
    } while (result->NextRow());

    TC_LOG_INFO("server.loading", ">> Loaded %u guild finder guild-related settings in %u ms.", count, GetMSTimeDiffToNow(oldMSTime));
}

void GuildFinderMgr::LoadMembershipRequests()
{
    TC_LOG_INFO("server.loading", "Loading guild finder membership requests...");
    //                                                      0         1           2            3           4         5         6
    QueryResult result = CharacterDatabase.Query("SELECT guildId, playerGuid, availability, classRole, interests, comment, submitTime FROM guild_finder_applicant");

    if (!result)
    {
        TC_LOG_INFO("server.loading", ">> Loaded 0 guild finder membership requests. Table `guild_finder_applicant` is empty.");
        return;
    }

    uint32 count = 0;
    uint32 oldMSTime = getMSTime();
    do
    {
        Field* fields = result->Fetch();
        ObjectGuid guildId = ObjectGuid::Create<HighGuid::Guild>(fields[0].GetUInt64());
        ObjectGuid playerId = ObjectGuid::Create<HighGuid::Player>(fields[1].GetUInt64());
        uint8 availability = fields[2].GetUInt8();
        uint8 classRoles = fields[3].GetUInt8();
        uint8 playStyle = fields[4].GetUInt8();
        std::string comment = fields[5].GetString();
        uint32 submitTime = fields[6].GetUInt32();

        MembershipRequest request(playerId, guildId, availability, classRoles, playStyle, comment, time_t(submitTime));

        {
            std::lock_guard<std::mutex> lock(_lock);
            _membershipRequests[guildId].push_back(request);
        }

        ++count;
    } while (result->NextRow());

    TC_LOG_INFO("server.loading", ">> Loaded %u guild finder membership requests in %u ms.", count, GetMSTimeDiffToNow(oldMSTime));
}

GuildFinderMgr* GuildFinderMgr::instance()
{
    static GuildFinderMgr instance;
    return &instance;
}

void GuildFinderMgr::AddMembershipRequest(ObjectGuid const& guildGuid, MembershipRequest const& request)
{
    {
        std::lock_guard<std::mutex> lock(_lock);
        _membershipRequests[guildGuid].push_back(request);
    }

    CharacterDatabaseTransaction trans = CharacterDatabase.BeginTransaction();
    CharacterDatabasePreparedStatement* stmt = CharacterDatabase.GetPreparedStatement(CHAR_REP_GUILD_FINDER_APPLICANT);
    stmt->setUInt64(0, request.GetGuildGuid().GetCounter());
    stmt->setUInt64(1, request.GetPlayerGUID().GetCounter());
    stmt->setUInt8(2, request.GetAvailability());
    stmt->setUInt8(3, request.GetClassRoles());
    stmt->setUInt8(4, request.GetPlayStyle());
    stmt->setString(5, request.GetComment());
    stmt->setUInt32(6, request.GetSubmitTime());
    trans->Append(stmt);
    CharacterDatabase.CommitTransaction(trans);

    SendMembershipRequestListUpdate(request.GetPlayerGUID());

    if (Guild* guild = sGuildMgr->GetGuildById(guildGuid.GetCounter()))
        SendApplicantListUpdate(*guild);
}

void GuildFinderMgr::RemoveAllMembershipRequestsFromPlayer(ObjectGuid const& playerId)
{
    std::vector<ObjectGuid> updatedGuilds;
    {
        std::lock_guard<std::mutex> lock(_lock);

        for (auto& itr : _membershipRequests)
        {
            auto itr2 = itr.second.begin();
            for (; itr2 != itr.second.end(); ++itr2)
                if (itr2->GetPlayerGUID() == playerId)
                    break;

            if (itr2 == itr.second.end())
                continue;

            CharacterDatabaseTransaction trans = CharacterDatabase.BeginTransaction();

            CharacterDatabasePreparedStatement* stmt = CharacterDatabase.GetPreparedStatement(CHAR_DEL_GUILD_FINDER_APPLICANT);
            stmt->setUInt64(0, itr2->GetGuildGuid().GetCounter());
            stmt->setUInt64(1, itr2->GetPlayerGUID().GetCounter());
            trans->Append(stmt);

            CharacterDatabase.CommitTransaction(trans);
            itr.second.erase(itr2);

            updatedGuilds.push_back(itr.first);
        }
    }

    // Guilds and players are reached once the finder lock is released
    for (ObjectGuid const& guildGuid : updatedGuilds)
        if (Guild* guild = sGuildMgr->GetGuildById(guildGuid.GetCounter()))
            SendApplicantListUpdate(*guild);

    if (!updatedGuilds.empty())
        SendMembershipRequestListUpdate(playerId);
}

void GuildFinderMgr::RemoveMembershipRequest(ObjectGuid const& playerId, ObjectGuid const& guildId)
{
    {
        std::lock_guard<std::mutex> lock(_lock);

        auto guildRequests = _membershipRequests.find(guildId);
        if (guildRequests == _membershipRequests.end())
            return;

        auto itr = guildRequests->second.begin();
        for (; itr != guildRequests->second.end(); ++itr)
            if (itr->GetPlayerGUID() == playerId)
                break;

        if (itr == guildRequests->second.end())
            return;

        CharacterDatabaseTransaction trans = CharacterDatabase.BeginTransaction();

        CharacterDatabasePreparedStatement* stmt = CharacterDatabase.GetPreparedStatement(CHAR_DEL_GUILD_FINDER_APPLICANT);
        stmt->setUInt64(0, itr->GetGuildGuid().GetCounter());
        stmt->setUInt64(1, itr->GetPlayerGUID().GetCounter());
        trans->Append(stmt);

        CharacterDatabase.CommitTransaction(trans);

        guildRequests->second.erase(itr);
    }

    SendMembershipRequestListUpdate(playerId);

    if (Guild* guild = sGuildMgr->GetGuildById(guildId.GetCounter()))
        SendApplicantListUpdate(*guild);
}

std::list<MembershipRequest> GuildFinderMgr::GetAllMembershipRequestsForPlayer(ObjectGuid const& playerGuid)
{
    std::lock_guard<std::mutex> lock(_lock);

    std::list<MembershipRequest> resultSet;
    for (MembershipRequestStore::const_iterator itr = _membershipRequests.begin(); itr != _membershipRequests.end(); ++itr)
    {
        auto const& guildReqs = itr->second;
        for (const auto& guildReq : guildReqs)
        {
            if (guildReq.GetPlayerGUID() == playerGuid)
            {
                resultSet.push_back(guildReq);
                break;
            }
        }
    }
    return resultSet;
}

uint8 GuildFinderMgr::CountRequestsFromPlayer(ObjectGuid const& playerId)
{
    std::lock_guard<std::mutex> lock(_lock);

    uint8 result = 0;
    for (MembershipRequestStore::const_iterator itr = _membershipRequests.begin(); itr != _membershipRequests.end(); ++itr)
    {
        for (const auto& itr2 : itr->second)
        {
            if (itr2.GetPlayerGUID() != playerId)
                continue;

            ++result;
            break;
        }
    }
    return result;
}

LFGuildStore GuildFinderMgr::GetGuildsMatchingSetting(LFGuildPlayer& settings, TeamId faction)
{
    std::lock_guard<std::mutex> lock(_lock);

    LFGuildStore resultSet;
    for (LFGuildStore::const_iterator itr = _guildSettings.begin(); itr != _guildSettings.end(); ++itr)
    {
        LFGuildSettings const& guildSettings = itr->second;

        if (!guildSettings.IsListed())
            continue;

        if (guildSettings.GetTeam() != faction)
            continue;

        if (!(guildSettings.GetAvailability() & settings.GetAvailability()))
            continue;

        if (!(guildSettings.GetClassRoles() & settings.GetClassRoles()))
            continue;

        if (!(guildSettings.GetPlayStyle() & settings.GetPlayStyle()))
            continue;

        if (!(guildSettings.GetLevel() & settings.GetLevel()))
            continue;

        resultSet.insert(std::make_pair(itr->first, guildSettings));
    }

    return resultSet;
}

bool GuildFinderMgr::HasRequest(ObjectGuid const& playerId, ObjectGuid const& guildId)
{
    std::lock_guard<std::mutex> lock(_lock);

    auto guildRequests = _membershipRequests.find(guildId);
    if (guildRequests == _membershipRequests.end())
        return false;

    for (auto const& itr : guildRequests->second)
        if (itr.GetPlayerGUID() == playerId)
            return true;

    return false;
}

void GuildFinderMgr::SetGuildSettings(ObjectGuid const& guildGuid, LFGuildSettings const& settings)
{
    {
        std::lock_guard<std::mutex> lock(_lock);
        _guildSettings[guildGuid] = settings;
    }

    CharacterDatabaseTransaction trans = CharacterDatabase.BeginTransaction();

    CharacterDatabasePreparedStatement* stmt = CharacterDatabase.GetPreparedStatement(CHAR_REP_GUILD_FINDER_GUILD_SETTINGS);
    stmt->setUInt64(0, settings.GetGUID().GetCounter());
    stmt->setUInt8(1, settings.GetAvailability());
    stmt->setUInt8(2, settings.GetClassRoles());
    stmt->setUInt8(3, settings.GetPlayStyle());
    stmt->setUInt8(4, settings.GetLevel());
    stmt->setUInt8(5, settings.IsListed());
    stmt->setString(6, settings.GetComment());
    trans->Append(stmt);

    CharacterDatabase.CommitTransaction(trans);
}

LFGuildSettings GuildFinderMgr::GetGuildSettings(ObjectGuid const& guildGuid)
{
    std::lock_guard<std::mutex> lock(_lock);
    return _guildSettings.find(guildGuid) != _guildSettings.end() ? _guildSettings[guildGuid] : LFGuildSettings();
}

void GuildFinderMgr::DeleteGuild(ObjectGuid const& guildId)
{
    CharacterDatabaseTransaction trans = CharacterDatabase.BeginTransaction();

    std::vector<ObjectGuid> applicants;
    {
        std::lock_guard<std::mutex> lock(_lock);

        auto guildRequests = _membershipRequests.find(guildId);
        if (guildRequests != _membershipRequests.end())
        {
            for (MembershipRequest const& request : guildRequests->second)
            {
                CharacterDatabasePreparedStatement* stmt = CharacterDatabase.GetPreparedStatement(CHAR_DEL_GUILD_FINDER_APPLICANT);
                stmt->setUInt64(0, guildId.GetCounter());
                stmt->setUInt64(1, request.GetPlayerGUID().GetCounter());
                trans->Append(stmt);

                applicants.push_back(request.GetPlayerGUID());
            }

            _membershipRequests.erase(guildRequests);
        }

        _guildSettings.erase(guildId);
    }

    // Also when the guild had no applicant
    CharacterDatabasePreparedStatement* stmt = CharacterDatabase.GetPreparedStatement(CHAR_DEL_GUILD_FINDER_GUILD_SETTINGS);
    stmt->setUInt64(0, guildId.GetCounter());
    trans->Append(stmt);

    CharacterDatabase.CommitTransaction(trans);

    for (ObjectGuid const& applicant : applicants)
        SendMembershipRequestListUpdate(applicant);
}

std::vector<MembershipRequest> GuildFinderMgr::GetAllMembershipRequestsForGuild(ObjectGuid const& guildGuid)
{
    std::lock_guard<std::mutex> lock(_lock);
    return _membershipRequests.find(guildGuid) != _membershipRequests.end() ? _membershipRequests[guildGuid] : std::vector<MembershipRequest>();
}

void GuildFinderMgr::SendApplicantListUpdate(Guild& guild)
{
    std::vector<MembershipRequest> recruitsList = sGuildFinderMgr->GetAllMembershipRequestsForGuild(guild.GetGUID());

    WorldPackets::Guild::LFGuildRecruits recruit;
    //recruit.UpdateTime 
    recruit.Recruits.reserve(recruitsList.size());
    for (auto const& x : recruitsList)
    {
        WorldPackets::Guild::LFGuildRecruitData data;
        data.RecruitGUID = x.GetPlayerGUID();
        data.RecruitVirtualRealm = GetVirtualRealmAddress();
        data.Comment = x.GetComment();
        data.ClassRoles = x.GetClassRoles();
        data.PlayStyle = x.GetPlayStyle();
        data.Availability = x.GetAvailability();
        data.SecondsSinceCreated = GameTime::GetGameTime() - x.GetSubmitTime();
        data.SecondsUntilExpiration = x.GetExpiryTime() - GameTime::GetGameTime();
        if (CharacterInfo const* charInfo = sWorld->GetCharacterInfo(data.RecruitGUID))
        {
            data.Name = charInfo->Name;
            data.CharacterClass = charInfo->Class;
            data.CharacterGender = charInfo->Sex;
            data.CharacterLevel = charInfo->Level;
        }
        recruit.Recruits.push_back(data);
    }

    // Write() once: a second call would serialize the list twice into the same packet
    guild.BroadcastPacketToRight(recruit.Write(), GR_RIGHT_INVITE);
}

// The applicant gets his own applications, not a guild's recruits
// Like SendApplicantListUpdate: never called with _lock held, the getters copy under it
void GuildFinderMgr::SendMembershipRequestListUpdate(Player& player)
{
    SendMembershipRequestListUpdate(player.GetGUID());
}

void GuildFinderMgr::SendMembershipRequestListUpdate(ObjectGuid const& playerGuid)
{
    if (!ObjectAccessor::IsPlayerOnline(playerGuid))
        return;

    std::list<MembershipRequest> applicatedGuilds = GetAllMembershipRequestsForPlayer(playerGuid);

    WorldPackets::Guild::LFGuildApplication application;
    application.NumRemaining = MAX_GUILD_FINDER_APPLICATIONS - CountRequestsFromPlayer(playerGuid);
    application.Applications.reserve(applicatedGuilds.size());
    for (auto const& v : applicatedGuilds)
    {
        Guild* guild = sGuildMgr->GetGuildById(v.GetGuildGuid().GetCounter());
        if (!guild)
            continue;

        LFGuildSettings guildSettings = GetGuildSettings(v.GetGuildGuid());
        WorldPackets::Guild::LFGuildApplicationData data;
        data.GuildGUID = guild->GetGUID();
        data.GuildVirtualRealm = GetVirtualRealmAddress();
        data.ClassRoles = guildSettings.GetClassRoles();
        data.PlayStyle = guildSettings.GetPlayStyle();
        data.Availability = guildSettings.GetAvailability();
        data.SecondsSinceCreated = GameTime::GetGameTime() - v.GetSubmitTime();
        data.GuildName = guild->GetName();
        data.Comment = v.GetComment();
        application.Applications.push_back(data);
    }

    ObjectAccessor::SendToPlayer(playerGuid, application.Write());
}
