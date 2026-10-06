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
#include "GuildPackets.h"
#include "Util.h"

void WorldSession::HandleLFGuildAddRecruit(WorldPackets::Guild::LFGuildAddRecruit& packet)
{
    Player* player = GetPlayer();
    if (player->GetGuildId())
        return;

    if (sGuildFinderMgr->GetAllMembershipRequestsForPlayer(player->GetGUID()).size() >= MAX_GUILD_FINDER_APPLICATIONS)
        return;

    if (!packet.GuildGUID.IsGuild())
        return;

    if (!sGuildMgr->GetGuildByGuid(packet.GuildGUID))
        return;

    LFGuildSettings settings = sGuildFinderMgr->GetGuildSettings(packet.GuildGUID);
    if (!settings.IsListed() || settings.GetTeam() != player->GetTeamId())
        return;

    if (sGuildFinderMgr->HasRequest(player->GetGUID(), packet.GuildGUID))
        return;

    if (!(packet.ClassRoles & GUILDFINDER_ALL_ROLES) || packet.ClassRoles > GUILDFINDER_ALL_ROLES)
        return;

    if (!(packet.Availability & ALL_WEEK) || packet.Availability > ALL_WEEK)
        return;

    if (!(packet.PlayStyle & ALL_PLAY_STYLES) || packet.PlayStyle > ALL_PLAY_STYLES)
        return;

    utf8truncate(packet.Comment, MAX_GUILD_FINDER_COMMENT_LEN);

    sGuildFinderMgr->AddMembershipRequest(packet.GuildGUID, MembershipRequest(player->GetGUID(), packet.GuildGUID, packet.Availability, packet.ClassRoles, packet.PlayStyle, packet.Comment, GameTime::GetGameTime()));
}

void WorldSession::HandleLFGuildBrowse(WorldPackets::Guild::LFGuildBrowse& packet)
{    
    if (!(packet.ClassRoles & GUILDFINDER_ALL_ROLES) || packet.ClassRoles > GUILDFINDER_ALL_ROLES)
        return;

    if (!(packet.Availability & ALL_WEEK) || packet.Availability > ALL_WEEK)
        return;

    if (!(packet.PlayStyle & ALL_PLAY_STYLES) || packet.PlayStyle > ALL_PLAY_STYLES)
        return;

    if (packet.CharacterLevel > sWorld->getIntConfig(CONFIG_MAX_PLAYER_LEVEL) || packet.CharacterLevel < 1)
        return;

    Player* player = GetPlayer();

    LFGuildPlayer settings(player->GetGUID(), packet.ClassRoles, packet.Availability, packet.PlayStyle, ANY_FINDER_LEVEL);
    LFGuildStore guildList = sGuildFinderMgr->GetGuildsMatchingSetting(settings, player->GetTeamId());

    if (guildList.empty())
    {
        player->SendDirectMessage(WorldPackets::Guild::LFGuildBrowseResponse().Write());
        return;
    }

    WorldPackets::Guild::LFGuildBrowseResponse browse;
    browse.Browses.reserve(guildList.size());
    for (auto const& x : guildList)
    {
        Guild* guild = sGuildMgr->GetGuildById(x.first.GetCounter());
        if (!guild)
            continue;

        WorldPackets::Guild::LFGuildBrowseData data;
        data.GuildGUID = guild->GetGUID();
        data.GuildVirtualRealm = GetVirtualRealmAddress();
        data.GuildMembers = guild->GetMembersCount();
        data.GuildAchievementPoints = guild->GetAchievementMgr().GetAchievementPoints();
        data.PlayStyle = x.second.GetPlayStyle();
        data.Availability = x.second.GetAvailability();
        data.ClassRoles = x.second.GetClassRoles();
        data.LevelRange = guild->GetLevel();
        EmblemInfo const emblem = guild->GetEmblemInfo();   // one consistent copy, taken under the guild lock
        data.EmblemStyle = emblem.GetStyle();
        data.EmblemColor = emblem.GetColor();
        data.BorderStyle = emblem.GetBorderStyle();
        data.BorderColor = emblem.GetBorderColor();
        data.Background = emblem.GetBackgroundColor();
        data.GuildName = guild->GetName();
        data.Comment = x.second.GetComment();
        data.Cached = 0;
        data.MembershipRequested = sGuildFinderMgr->HasRequest(player->GetGUID(), guild->GetGUID());
        browse.Browses.push_back(data);
    }

    player->SendDirectMessage(browse.Write());
}

void WorldSession::HandleLFGuildDeclineRecruit(WorldPackets::Guild::LFGuildDeclineRecruit& packet)
{
    if (!packet.RecruitGUID.IsPlayer())
        return;

    // Same right as the one needed to accept a recruit: inviting him
    Guild* guild = sGuildMgr->GetGuildById(GetPlayer()->GetGuildId());
    if (!guild || !guild->HasRankRight(GetPlayer(), GR_RIGHT_INVITE))
        return;

    sGuildFinderMgr->RemoveMembershipRequest(packet.RecruitGUID, guild->GetGUID());
}

void WorldSession::HandleLFGuildGetApplications(WorldPackets::Guild::LFGuildGetApplications& /*packet*/)
{
    sGuildFinderMgr->SendMembershipRequestListUpdate(*GetPlayer());
}

void WorldSession::HandleLFGuildGetRecruits(WorldPackets::Guild::LFGuildGetRecruits& /*packet*/)
{
    Player* player = GetPlayer();
    Guild* guild = sGuildMgr->GetGuildById(player->GetGuildId());
    if (!guild || !guild->HasRankRight(player, GR_RIGHT_INVITE))
        return;

    std::vector<MembershipRequest> recruitsList = sGuildFinderMgr->GetAllMembershipRequestsForGuild(ObjectGuid::Create<HighGuid::Guild>(player->GetGuildId()));
    
    WorldPackets::Guild::LFGuildRecruits recruits;
    recruits.Recruits.reserve(recruitsList.size());
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
        recruits.Recruits.push_back(data);
    }

    player->SendDirectMessage(recruits.Write());
}

void WorldSession::HandleLFGuildGetGuildPost(WorldPackets::Guild::LFGuildGetGuildPost& /*packet*/)
{
    Player* player = GetPlayer();
    if (!player->GetGuildId())
        return;

    Guild* guild = sGuildMgr->GetGuildById(player->GetGuildId());
    bool isGuildMaster = guild && guild->GetLeaderGUID() == player->GetGUID();

    WorldPackets::Guild::LFGuildPost post;
    if (isGuildMaster)
    {
        LFGuildSettings settings = sGuildFinderMgr->GetGuildSettings(ObjectGuid::Create<HighGuid::Guild>(player->GetGuildId()));

        post.Post.emplace();
        post.Post->PlayStyle = settings.GetPlayStyle();
        post.Post->Availability = settings.GetAvailability();
        post.Post->ClassRoles = settings.GetClassRoles();
        post.Post->LevelRange = settings.GetLevel();
        post.Post->SecondsRemaining = 0;
        post.Post->Comment = settings.GetComment();
        post.Post->Active = settings.IsListed();
    }

    player->SendDirectMessage(post.Write());
}

void WorldSession::HandleLFGuildRemoveRecruit(WorldPackets::Guild::LFGuildRemoveRecruit& packet)
{
    if (packet.GuildGUID.IsGuild())
        sGuildFinderMgr->RemoveMembershipRequest(GetPlayer()->GetGUID(), packet.GuildGUID);
}

void WorldSession::HandleLFGuildSetGuildPost(WorldPackets::Guild::LFGuildSetGuildPost& packet)
{
    // Level sent is zero if untouched, force to any (from interface). Idk why
    if (!packet.LevelRange)
        packet.LevelRange = ANY_FINDER_LEVEL;

    if (!(packet.ClassRoles & GUILDFINDER_ALL_ROLES) || packet.ClassRoles > GUILDFINDER_ALL_ROLES)
        return;

    if (!(packet.Availability & ALL_WEEK) || packet.Availability > ALL_WEEK)
        return;

    if (!(packet.PlayStyle & ALL_PLAY_STYLES) || packet.PlayStyle > ALL_PLAY_STYLES)
        return;

    if (!(packet.LevelRange & ALL_GUILDFINDER_LEVELS) || packet.LevelRange > ALL_GUILDFINDER_LEVELS)
        return;

    Player* player = GetPlayer();
    if (!player->GetGuildId()) // Player must be in guild
        return;

    auto const& guild = sGuildMgr->GetGuildById(player->GetGuildId());
    if (!guild)
        return;

    if (guild->GetLeaderGUID() != player->GetGUID())
        return;

    utf8truncate(packet.Comment, MAX_GUILD_FINDER_COMMENT_LEN);

    sGuildFinderMgr->SetGuildSettings(guild->GetGUID(), LFGuildSettings(packet.Active, player->GetTeamId(), guild->GetGUID(), packet.ClassRoles, packet.Availability, packet.PlayStyle, packet.LevelRange, packet.Comment));
}
