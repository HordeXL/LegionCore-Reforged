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

#include "WorldSession.h"
#include "LFGListMgr.h"
#include "Group.h"
#include "LfgListPackets.h"
#include "SocialMgr.h"
#include "Chat.h"

void WorldSession::HandleRequestLfgListBlackList(WorldPackets::LfgList::RequestLfgListBlacklist& /*packet*/)
{
    SendPacket(WorldPackets::LfgList::LfgListUpdateBlacklist().Write()); /// Activity and Reason loop - We dont need it
}

void WorldSession::HandleLfgListSearch(WorldPackets::LfgList::LfgListSearch& packet)
{
    WorldPackets::LfgList::LfgListSearchResults results;
    if (!sGroupFinderCategoryStore.LookupEntry(packet.CategoryID))
    {
        SendPacket(results.Write());
        return;
    }

    // copies: the listings stay inside LFGListMgr, under its lock
    auto list = sLFGListMgr->GetFilteredList(packet.CategoryID, packet.SearchTerms, packet.LanguageSearchFilter, GetPlayer());
    results.AppicationsCount = list.size();

    for (auto const& lfgEntry : list)
    {
        // the leader may stand on another map: only his guild id is read, under the accessor lock
        ObjectGuid::LowType leaderGuildId = 0;
        if (!ObjectAccessor::WithPlayer(lfgEntry.LeaderGuid, [&leaderGuildId](Player* leader) { leaderGuildId = leader->GetGuildId(); }))
            continue;

        if (lfgEntry.PrivateGroup)
            if ((!sSocialMgr->HasInFriendsList(GetPlayer(), lfgEntry.LeaderGuid) ||
                !sSocialMgr->HasContact(GetPlayer()->GetGUID(), lfgEntry.LeaderGuid, SOCIAL_FLAG_FRIEND)) &&
                (GetPlayer()->GetGuildId() == 0 ||GetPlayer()->GetGuildId() != leaderGuildId))
                continue;

        auto activityID = lfgEntry.ActivityID;

        WorldPackets::LfgList::ListSearchResult result;
        result.ApplicationTicket.RequesterGuid = lfgEntry.GroupGuid;
        result.ApplicationTicket.Id = lfgEntry.GroupGuid.GetGUIDLow();
        result.ApplicationTicket.Type = WorldPackets::LFG::RideType::LfgListApplication;
        result.ApplicationTicket.Time = lfgEntry.CreationTime;
        result.UnkGuid1 = lfgEntry.LeaderGuid;
        result.UnkGuid2 = lfgEntry.LeaderGuid;
        result.UnkGuid3 = lfgEntry.LeaderGuid;
        result.UnkGuid4 = lfgEntry.LeaderGuid;
        result.BNetFriendsGuids = sSocialMgr->GetBNetFriendsGuids(activityID);
        result.NumCharFriendsGuids = sSocialMgr->GetCharFriendsGuids(GetPlayer(), activityID);
        result.NumGuildMateGuids = sSocialMgr->GetGuildMateGuids(activityID);
        result.VirtualRealmAddress = GetVirtualRealmAddress();
        result.CompletedEncounters = 0;
        result.Age = lfgEntry.CreationTime;
        result.ResultID = 3;
        result.ApplicationStatus = AsUnderlyingType(LFGListApplicationStatus::None);

        for (auto const& member : lfgEntry.Members)
            result.Members.emplace_back(member.first, member.second);

        result.JoinRequest.ActivityID = activityID;
        result.JoinRequest.ItemLevel = lfgEntry.ItemLevel;
        result.JoinRequest.HonorLevel = lfgEntry.HonorLevel;
        result.JoinRequest.GroupName = lfgEntry.GroupName;
        result.JoinRequest.Comment = lfgEntry.Comment;
        result.JoinRequest.VoiceChat = lfgEntry.VoiceChat;
        result.JoinRequest.AutoAccept = lfgEntry.AutoAccept;
        result.JoinRequest.QuestID = lfgEntry.QuestID;

        results.SearchResults.emplace_back(result);
    }

    SendPacket(results.Write());
}

void WorldSession::HandleLfgListJoin(WorldPackets::LfgList::LfgListJoin& packet)
{
    auto list = new LFGListEntry;
    list->GroupFinderActivityData = sGroupFinderActivityStore.LookupEntry(packet.Request.ActivityID);
    list->ItemLevel = packet.Request.ItemLevel;
    list->AutoAccept = packet.Request.AutoAccept;
    list->GroupName = packet.Request.GroupName;
    list->Comment = packet.Request.Comment;
    list->VoiceChat = packet.Request.VoiceChat;
    list->HonorLevel = packet.Request.HonorLevel;
    if (packet.Request.QuestID.has_value())
        list->QuestID = *packet.Request.QuestID;
    list->ApplicationGroup = nullptr;
    list->PrivateGroup = packet.Request.PrivateGroup;
    if (!sLFGListMgr->Insert(list, GetPlayer()))
        delete list;
}

// The group the player may manage in the group finder: only its leader or an assistant handle the listing.
static ObjectGuid::LowType GetManagedLfgListGroup(Player* player, bool leaderOnly = false)
{
    Group* group = player->GetGroup();
    if (group && (group->isBGGroup() || group->isBFGroup()))
        group = player->GetOriginalGroup();

    if (!group || (!group->IsLeader(player->GetGUID()) && (leaderOnly || !group->IsAssistant(player->GetGUID()))))
        return 0;

    return group->GetGUIDLow();
}

void WorldSession::HandleLfgListLeave(WorldPackets::LfgList::LfgListLeave& packet)
{
    ObjectGuid::LowType groupLowGuid = GetManagedLfgListGroup(GetPlayer(), true);
    if (!groupLowGuid || groupLowGuid != packet.ApplicationTicket.Id)
        return;

    sLFGListMgr->Remove(groupLowGuid, GetPlayer());
}

void WorldSession::HandleLfgListInviteResponse(WorldPackets::LfgList::LfgListInviteResponse& packet)
{
    sLFGListMgr->RespondToInvite(GetPlayer(), packet.ApplicantTicket.Id, packet.Accept);
}

void WorldSession::HandleLfgListGetStatus(WorldPackets::LfgList::LfgListGetStatus& /*packet*/)
{
}

void WorldSession::HandleLfgListApplyToGroup(WorldPackets::LfgList::LfgListApplyToGroup& packet)
{
    if (GetPlayer()->GetGroup()) // hack, i don't know, how do it, because we need rolechek and result of rolecheck input there
        ChatHandler(GetPlayer()).PSendSysMessage("You can't join it while you in group!");
    else
        sLFGListMgr->OnPlayerApplyForGroup(GetPlayer(), &packet.application.ApplicationTicket, packet.application.ActivityID, packet.application.Comment, packet.application.Role);
}

void WorldSession::HandleLfgListCancelApplication(WorldPackets::LfgList::LfgListCancelApplication& packet)
{
    sLFGListMgr->CancelApplication(GetPlayer(), packet.ApplicantTicket.Id, packet.ApplicantTicket.Time);
}

void WorldSession::HandleLfgListDeclineApplicant(WorldPackets::LfgList::LfgListDeclineApplicant& packet)
{
    if (ObjectGuid::LowType groupLowGuid = GetManagedLfgListGroup(_player))
        sLFGListMgr->DeclineApplicant(groupLowGuid, packet.ApplicationTicket.Id);
}

void WorldSession::HandleLfgListInviteApplicant(WorldPackets::LfgList::LfgListInviteApplicant& packet)
{
    if (packet.Applicant.empty())
        return;

    if (ObjectGuid::LowType groupLowGuid = GetManagedLfgListGroup(_player))
        sLFGListMgr->InviteApplicant(groupLowGuid, packet.ApplicationTicket.Id, packet.Applicant.front().Role);
}

void WorldSession::HandleLfgListUpdateRequest(WorldPackets::LfgList::LfgListUpdateRequest& packet)
{
    sLFGListMgr->UpdateEntry(_player, packet.Ticket.Id, packet.UpdateRequest);
}
