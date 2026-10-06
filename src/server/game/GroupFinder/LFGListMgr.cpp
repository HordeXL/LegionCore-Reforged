#include "Object.h"
#include "LFGListMgr.h"
#include "GroupMgr.h"
#include "Group.h"
#include "Player.h"
#include "LFGPackets.h"
#include "ObjectMgr.h"
#include "ObjectAccessor.h"
#include "LfgListPackets.h"
#include "SocialMgr.h"
#include "SocialPackets.h"
#include "WorldSession.h"
#include "LFG.h"

// Work decided under LFGListMgr::m_lock and done by Flush once it is released: the receivers are GUIDs looked up
// again then, and the packets are complete copies.
struct LFGListOutbox
{
    struct Packet
    {
        std::vector<ObjectGuid> Receivers;
        WorldPacket Data;
    };

    struct ApplyResult
    {
        LFGListEntrySnapshot Entry;
        ObjectGuid Applicant;
        uint32 ApplicationID = 0;
        uint32 ApplicationTime = 0;
        uint32 Timeout = 0;
        uint8 RoleMask = 0;
        LFGListApplicationStatus ApplicationStatus = LFGListApplicationStatus::None;
    };

    struct SocialNotify
    {
        std::vector<ObjectGuid> Members;
        ObjectGuid Friend;
        WorldPacket Data;
    };

    std::vector<Packet> Packets;
    std::vector<ApplyResult> ApplyResults;
    std::vector<SocialNotify> SocialNotifies;
    std::vector<ObjectGuid> Disbands;
};

namespace
{
    std::vector<ObjectGuid> GetMemberGuids(Group const* group)
    {
        std::vector<ObjectGuid> guids;
        if (!group)
            return guids;

        for (auto const& member : group->GetMemberSlots())
            if (member.Guid.IsPlayer())
                guids.push_back(member.Guid);

        return guids;
    }

    uint8 GetRoleIndex(uint8 roles)
    {
        return roles >= 2 ? std::log2(roles) - 1 : roles;
    }

    WorldPackets::LFG::RideTicket MakeApplicationTicket(ObjectGuid const& groupGuid, uint32 creationTime)
    {
        WorldPackets::LFG::RideTicket ticket;
        ticket.RequesterGuid = groupGuid;
        ticket.Id = groupGuid.GetGUIDLow();
        ticket.Type = WorldPackets::LFG::RideType::LfgListApplication;
        ticket.Time = creationTime;
        return ticket;
    }

    WorldPackets::LFG::RideTicket MakeApplicantTicket(ObjectGuid::LowType playerLowGuid, uint32 applicationId, uint32 applicationTime)
    {
        WorldPackets::LFG::RideTicket ticket;
        ticket.RequesterGuid = ObjectGuid::Create<HighGuid::Player>(playerLowGuid);
        ticket.Id = applicationId;
        ticket.Type = WorldPackets::LFG::RideType::LfgListApplicant;
        ticket.Time = applicationTime;
        return ticket;
    }

    // m_lock held
    LFGListEntrySnapshot MakeSnapshot(LFGListEntry const* entry)
    {
        LFGListEntrySnapshot snapshot;
        if (Group const* group = entry->ApplicationGroup)
        {
            snapshot.GroupGuid = group->GetGUID();
            snapshot.LeaderGuid = group->GetLeaderGUID();
            for (auto const& member : group->GetMemberSlots())
                snapshot.Members.emplace_back(member.Class, GetRoleIndex(member.Roles));
        }

        snapshot.ActivityID = entry->GroupFinderActivityData ? entry->GroupFinderActivityData->ID : 0;
        snapshot.CreationTime = entry->CreationTime;
        snapshot.HonorLevel = entry->HonorLevel;
        snapshot.QuestID = entry->QuestID;
        snapshot.ItemLevel = entry->ItemLevel;
        snapshot.GroupName = entry->GroupName;
        snapshot.Comment = entry->Comment;
        snapshot.VoiceChat = entry->VoiceChat;
        snapshot.AutoAccept = entry->AutoAccept;
        snapshot.PrivateGroup = entry->PrivateGroup;
        return snapshot;
    }

    // m_lock held
    WorldPacket BuildStatusUpdate(LFGListEntry const* lfgEntry, bool listed, LFGListStatus debugStatus = LFGListStatus::None)
    {
        WorldPackets::LfgList::LfgListUpdateStatus status;
        if (Group const* group = lfgEntry->ApplicationGroup)
            status.ApplicationTicket = MakeApplicationTicket(group->GetGUID(), lfgEntry->CreationTime);

        status.ExpirationTime = lfgEntry->Timeout;
        status.Status = AsUnderlyingType(debugStatus != LFGListStatus::None ? debugStatus : LFGListStatus::Joined);
        status.Listed = listed;

        status.Request.ActivityID = lfgEntry->GroupFinderActivityData->ID;
        status.Request.ItemLevel = lfgEntry->ItemLevel;
        status.Request.HonorLevel = lfgEntry->HonorLevel;
        status.Request.GroupName = lfgEntry->GroupName;
        status.Request.Comment = lfgEntry->Comment;
        status.Request.VoiceChat = lfgEntry->VoiceChat;
        status.Request.AutoAccept = lfgEntry->AutoAccept;
        status.Request.QuestID = lfgEntry->QuestID;

        return WorldPacket(*status.Write());
    }

    // m_lock held; the applicant is read through the accessor's own lock
    WorldPacket BuildApplicantUpdate(LFGListEntry const* lfgEntry, LFGListEntry::LFGListApplicationEntry const& application)
    {
        WorldPackets::LfgList::LfgListApplicationUpdate update;
        update.ApplicationTicket = MakeApplicationTicket(lfgEntry->ApplicationGroup->GetGUID(), lfgEntry->CreationTime);
        update.UnkInt = 6;

        WorldPackets::LfgList::ApplicantInfo info;
        info.ApplicantTicket = MakeApplicantTicket(application.PlayerLowGuid, application.ID, application.ApplicationTime);
        info.ApplicantPartyLeader = ObjectGuid::Create<HighGuid::Player>(application.PlayerLowGuid);
        info.ApplicationStatus = AsUnderlyingType(application.ApplicationStatus);
        info.Comment = application.Comment;
        info.Listed = application.Listed;

        if (application.Listed)
        {
            if (Player* player = application.GetPlayer())
            {
                WorldPackets::LfgList::ApplicantMember member;
                member.PlayerGUID = player->GetGUID();
                member.VirtualRealmAddress = GetVirtualRealmAddress();
                member.Level = player->getLevel();
                member.HonorLevel = player->GetHonorLevel();
                member.ItemLevel = sLFGListMgr->GetPlayerItemLevelForActivity(lfgEntry->GroupFinderActivityData, player);
                member.PossibleRoleMask = application.RoleMask;
                member.SelectedRoleMask = 0;
                info.Member.emplace_back(member);
            }
        }

        update.Applicants.emplace_back(info);
        return WorldPacket(*update.Write());
    }

    WorldPacket BuildGroupInviteResponse(ObjectGuid const& groupGuid, uint32 creationTime, LFGListEntry::LFGListApplicationEntry const& applicant)
    {
        WorldPackets::LfgList::LfgListGroupInviteResponce responce;
        responce.ApplicantTicket = MakeApplicantTicket(applicant.PlayerLowGuid, applicant.ID, applicant.ApplicationTime);
        responce.ApplicationTicket = MakeApplicationTicket(groupGuid, creationTime);
        responce.InviteExpireTimer = LFG_LIST_INVITE_TO_GROUP_TIMEOUT;
        responce.Status = AsUnderlyingType(applicant.Status);
        responce.Role = applicant.RoleMask;
        responce.ApplicationStatus = AsUnderlyingType(applicant.ApplicationStatus);
        return WorldPacket(*responce.Write());
    }

    // m_lock held
    LFGListOutbox::SocialNotify BuildSocialNotify(LFGListEntry const* lfgEntry, ObjectGuid const& friendGuid)
    {
        Group const* group = lfgEntry->ApplicationGroup;

        WorldPackets::Social::SocialQueueUpdateNotify notify;
        notify.QueueID = 1;
        notify.UnkBit = false;
        notify.FriendGuid = friendGuid;
        if (group)
        {
            notify.ApplicationGuid = group->GetGUID();
            notify.ApplicationLeaderGuid = group->GetLeaderGUID();
        }

        WorldPackets::Social::SocialQueueUpdateData updateData;
        updateData.Type = 1;
        updateData.UnkBit = true;
        notify.SocialQueueUpdates.emplace_back(updateData);

        return { GetMemberGuids(group), friendGuid, WorldPacket(*notify.Write()) };
    }

    // m_lock released: the friend lists are read under SocialMgr's own lock
    void FillSearchResult(WorldPackets::LfgList::ListSearchResult& result, LFGListEntrySnapshot const& entry, Player* viewer)
    {
        result.ApplicationTicket = MakeApplicationTicket(entry.GroupGuid, entry.CreationTime);
        result.UnkGuid1 = entry.LeaderGuid;
        result.UnkGuid2 = entry.LeaderGuid;
        result.UnkGuid3 = entry.LeaderGuid;
        result.UnkGuid4 = entry.LeaderGuid;
        result.BNetFriendsGuids = sSocialMgr->GetBNetFriendsGuids(entry.ActivityID);
        result.NumCharFriendsGuids = sSocialMgr->GetCharFriendsGuids(viewer, entry.ActivityID);
        result.NumGuildMateGuids = sSocialMgr->GetGuildMateGuids(entry.ActivityID);
        result.VirtualRealmAddress = GetVirtualRealmAddress();
        result.CompletedEncounters = 0;
        result.Age = entry.CreationTime;
        result.ResultID = 3;
        result.ApplicationStatus = AsUnderlyingType(LFGListApplicationStatus::None);

        for (auto const& member : entry.Members)
            result.Members.emplace_back(member.first, member.second);

        result.JoinRequest.ActivityID = entry.ActivityID;
        result.JoinRequest.ItemLevel = entry.ItemLevel;
        result.JoinRequest.HonorLevel = entry.HonorLevel;
        result.JoinRequest.GroupName = entry.GroupName;
        result.JoinRequest.Comment = entry.Comment;
        result.JoinRequest.VoiceChat = entry.VoiceChat;
        result.JoinRequest.AutoAccept = entry.AutoAccept;
        result.JoinRequest.QuestID = entry.QuestID;
    }

    // Update runs in the world thread: the disband goes to the remaining member's own thread when he is online
    void DisbandIfAlone(ObjectGuid const& groupGuid)
    {
        Group* group = sGroupMgr->GetGroupByGUID(groupGuid);
        if (!group)
            return;

        std::function<void()> disband = [groupGuid]() -> void
        {
            if (Group* lonelyGroup = sGroupMgr->GetGroupByGUID(groupGuid))
                if (lonelyGroup->GetMembersCount() < 2 && !sLFGListMgr->IsGroupQueued(lonelyGroup))
                    lonelyGroup->Disband();
        };

        if (!ObjectAccessor::PostToPlayer(group->GetLeaderGUID(), [disband](Player*) -> void { disband(); }, 0, ObjectAccessor::PlayerScope::InWorld))
            disband();
    }
}

LFGListMgr* LFGListMgr::instance()
{
    static LFGListMgr instance;
    return &instance;
}

LFGListMgr::LFGListMgr()
{
}

void LFGListMgr::Flush(LFGListOutbox& outbox)
{
    // receivers stand on any map: plain sends under the accessor lock, the rest in their own threads
    for (auto const& packet : outbox.Packets)
        for (ObjectGuid const& guid : packet.Receivers)
            ObjectAccessor::SendToPlayer(guid, &packet.Data);

    for (auto const& result : outbox.ApplyResults)
    {
        // the friend part of the search result reads the applicant
        ObjectAccessor::PostToPlayer(result.Applicant, [result](Player* player) -> void
        {
            WorldPackets::LfgList::LfgListApplyToGroupResponce responce;
            responce.ApplicantTicket = MakeApplicantTicket(result.Applicant.GetCounter(), result.ApplicationID, result.ApplicationTime);
            responce.InviteExpireTimer = result.Timeout;
            responce.Status = AsUnderlyingType(LFGListStatus::Joined);
            responce.Role = result.RoleMask;
            responce.ApplicationStatus = AsUnderlyingType(result.ApplicationStatus);
            responce.ApplicationTicket = MakeApplicationTicket(result.Entry.GroupGuid, result.Entry.CreationTime);
            FillSearchResult(responce.SearchResult, result.Entry, player);
            player->SendDirectMessage(responce.Write());
        }, 0, ObjectAccessor::PlayerScope::InWorld);
    }

    for (auto const& notify : outbox.SocialNotifies)
    {
        for (ObjectGuid const& guid : notify.Members)
            ObjectAccessor::SendToPlayer(guid, &notify.Data);

        // the friend listers are filtered on the friend's team and visibility
        ObjectAccessor::PostToPlayer(notify.Friend, [data = notify.Data](Player* friendPlayer) -> void
        {
            sSocialMgr->BroadcastToFriendListers(friendPlayer, &data);
        }, 0, ObjectAccessor::PlayerScope::InWorld);
    }

    for (ObjectGuid const& groupGuid : outbox.Disbands)
        DisbandIfAlone(groupGuid);
}

/// Stupid error messages: Todo: Find more appropriate
bool LFGListMgr::CanInsert(LFGListEntry const* lfgEntry, Player* requester, bool sendError /* = false */) const
{
    if (!lfgEntry->GroupFinderActivityData)
    {
        if (sendError)
            SendLfgListJoinResult(lfgEntry, LFGListStatus::LFG_LIST_STATUS_ERR_LFG_LIST_NO_LFG_LIST_OBJECT, requester);

        return false;
    }

    if (!IsEligibleForQueue(requester) || lfgEntry->ApplicationGroup)
    {
        if (sendError)
            SendLfgListJoinResult(lfgEntry, LFGListStatus::LFG_LIST_STATUS_ERR_ALREADY_USING_LFG_LIST_LIST, requester);

        return false;
    }

    if (GetPlayerItemLevelForActivity(lfgEntry->GroupFinderActivityData, requester) < lfgEntry->ItemLevel)
    {
        if (sendError)
            SendLfgListJoinResult(lfgEntry, LFGListStatus::LFG_LIST_STATUS_ERR_LFG_LIST_INVALID_SLOT, requester);

        return false;
    }

    if (Group* group = requester->GetGroup())
    {
        if (group->isLFGGroup() || group->isBGGroup() || group->isBFGroup())
        {
            if (sendError)
                SendLfgListJoinResult(lfgEntry, LFGListStatus::LFG_LIST_STATUS_ERR_ALREADY_USING_LFG_LIST_LIST, requester);

            return false;
        }

        if ((!group->isRaidGroup() || !group->IsAssistant(requester->GetGUID())) && !group->IsLeader(requester->GetGUID()))
        {
            if (sendError)
                SendLfgListJoinResult(lfgEntry, LFGListStatus::LFG_LIST_STATUS_ERR_LFG_LIST_NO_LFG_LIST_OBJECT, requester);

            return false;
        }
    }

    return true;
}

bool LFGListMgr::Insert(LFGListEntry* lfgEntry, Player* requester)
{
    if (!CanInsert(lfgEntry, requester, true))
        return false;

    auto group = requester->GetGroup();
    if (group && group->isBGGroup())
        group = requester->GetOriginalGroup();

    if (!group)
    {
        group = new Group;
        if (!group->AddLeaderInvite(requester))
        {
            SendLfgListJoinResult(lfgEntry, LFGListStatus::LFG_LIST_STATUS_ERR_LFG_LIST_NO_LFG_LIST_OBJECT, requester);
            delete group;
            return false;
        }

        // AddMember does not take the leader out of m_invitees; a stale entry is written to after logout
        group->RemoveInvite(requester);
        group->Create(requester, 4);
        sGroupMgr->AddGroup(group);
    }

    LFGListOutbox outbox;
    {
        std::lock_guard<std::recursive_mutex> guard(m_lock);
        // checked again under the lock: the leader and an assistant may list the group from two maps at once.
        // A disbanding group has already left the list (Disband calls Remove) and must not come back to it.
        if (_lfgListQueue.find(group->GetGUIDLow()) != _lfgListQueue.end() || group->IsDisbanding())
            return false;

        lfgEntry->ApplicationGroup = group;
        _lfgListQueue[group->GetGUIDLow()] = lfgEntry;
        outbox.Packets.push_back({ GetMemberGuids(group), BuildStatusUpdate(lfgEntry, true) });
        outbox.SocialNotifies.push_back(BuildSocialNotify(lfgEntry, requester->GetGUID()));
    }

    Flush(outbox);
    return true;
}

bool LFGListMgr::IsEligibleForQueue(Player* requester) const
{
    if (!requester)
        return false;

    auto group = requester->GetGroup();
    if (group && group->isBGGroup())
        group = requester->GetOriginalGroup();

    return !IsGroupQueued(group);
}

bool LFGListMgr::IsGroupQueued(Group const* group) const
{
    if (!group)
        return false;

    std::lock_guard<std::recursive_mutex> guard(m_lock);
    return _lfgListQueue.find(group->GetGUIDLow()) != _lfgListQueue.end();
}

LFGListEntry* LFGListMgr::_GetEntry(ObjectGuid::LowType lowGuid)
{
    return Trinity::Containers::MapGetValuePtr(_lfgListQueue, lowGuid);
}

LFGListEntry* LFGListMgr::GetEntrybyGuidLow(ObjectGuid::LowType lowGuid)
{
    std::lock_guard<std::recursive_mutex> guard(m_lock);
    return _GetEntry(lowGuid);
}

void LFGListMgr::SendLFGListStatusUpdate(LFGListEntry* lfgEntry, WorldSession* worldSession /* = nullptr */, bool listed /* = true */, LFGListStatus debugStatus /*= LFGListStatus::None*/)
{
    if (!lfgEntry)
        return;

    LFGListOutbox outbox;
    {
        std::lock_guard<std::recursive_mutex> guard(m_lock);
        // the pointer is only dereferenced once found among the listings
        auto itr = std::find_if(_lfgListQueue.begin(), _lfgListQueue.end(), [lfgEntry](auto const& queued)
        {
            return queued.second == lfgEntry;
        });

        if (itr == _lfgListQueue.end())
            return;

        std::vector<ObjectGuid> receivers;
        if (worldSession)
        {
            if (Player* player = worldSession->GetPlayer())
                receivers.push_back(player->GetGUID());
        }
        else
            receivers = GetMemberGuids(lfgEntry->ApplicationGroup);

        outbox.Packets.push_back({ std::move(receivers), BuildStatusUpdate(lfgEntry, listed, debugStatus) });
    }

    Flush(outbox);
}

bool LFGListMgr::_Remove(ObjectGuid::LowType lowGuid, Player* requester, bool disband, LFGListOutbox& outbox)
{
    auto itr = _lfgListQueue.find(lowGuid);
    if (itr == _lfgListQueue.end())
        return false;

    LFGListEntry* entry = itr->second;
    Group* group = entry->ApplicationGroup;
    if (!group)
        return false;

    if (requester && ((!group->isRaidGroup() || !group->IsAssistant(requester->GetGUID())) && !group->IsLeader(requester->GetGUID())))
        return false;

    std::vector<uint32> applicationIds;
    for (auto const& application : entry->ApplicationsContainer)
        applicationIds.push_back(application.first);

    for (uint32 applicationId : applicationIds)
        _ChangeApplicantStatus(entry, applicationId, LFGListApplicationStatus::Cancelled, true, outbox, false);

    outbox.Packets.push_back({ GetMemberGuids(group), BuildStatusUpdate(entry, false) });

    _lfgListQueue.erase(itr);
    delete entry;

    if (disband && group->GetMembersCount() < 2)
        outbox.Disbands.push_back(group->GetGUID());

    return true;
}

bool LFGListMgr::Remove(ObjectGuid::LowType lowGuid, Player* requester /* = nullptr */, bool disband /* = true */)
{
    LFGListOutbox outbox;
    bool removed;
    {
        std::lock_guard<std::recursive_mutex> guard(m_lock);
        removed = _Remove(lowGuid, requester, disband, outbox);
    }

    Flush(outbox);
    return removed;
}

void LFGListMgr::PlayerAddedToGroup(Player* /*player*/, Group* group)
{
    LFGListOutbox outbox;
    {
        std::lock_guard<std::recursive_mutex> guard(m_lock);
        LFGListEntry* entry = _GetEntry(group->GetGUIDLow());
        if (!entry)
            return;

        outbox.Packets.push_back({ GetMemberGuids(group), BuildStatusUpdate(entry, true) });
    }

    Flush(outbox);
}

void LFGListMgr::PlayerRemoveFromGroup(Player* /*player*/, Group* group)
{
    LFGListOutbox outbox;
    {
        std::lock_guard<std::recursive_mutex> guard(m_lock);
        LFGListEntry* entry = _GetEntry(group->GetGUIDLow());
        if (!entry)
            return;

        outbox.Packets.push_back({ GetMemberGuids(group), BuildStatusUpdate(entry, false) });
    }

    Flush(outbox);
}

std::vector<LFGListEntrySnapshot> LFGListMgr::GetFilteredList(uint32 activityCategory, uint32 /*activitySubCategory*/, std::string filterString, Player* player)
{
    std::vector<LFGListEntrySnapshot> lfgFiltered;
    std::transform(filterString.begin(), filterString.end(), filterString.begin(), toupper);

    std::lock_guard<std::recursive_mutex> guard(m_lock);
    for (auto& itr : _lfgListQueue)
    {
        auto listEntry = itr.second;
        if (!listEntry->ApplicationGroup || listEntry->GroupFinderActivityData->GroupFinderCategoryID != activityCategory)
            continue;

        if (filterString.length() && listEntry->GroupName.length())
        {
            auto upperName = listEntry->GroupName;
            std::transform(upperName.begin(), upperName.end(), upperName.begin(), toupper);

            if (upperName.find(filterString) == std::string::npos)
                continue;
        }

        if (_CanQueueFor(listEntry, player, false) != LFGListStatus::None)
            continue;

        lfgFiltered.push_back(MakeSnapshot(listEntry));
    }

    return lfgFiltered;
}

void LFGListMgr::OnPlayerApplyForGroup(Player* player, WorldPackets::LFG::RideTicket const* applicationTicket, uint32 activityID, std::string comment, uint8 role)
{
    if (!sGroupFinderActivityStore.LookupEntry(activityID))
        return;

    role &= lfg::PLAYER_ROLE_TANK | lfg::PLAYER_ROLE_HEALER | lfg::PLAYER_ROLE_DAMAGE;
    if (!role)
        return;

    LFGListOutbox outbox;
    {
        std::lock_guard<std::recursive_mutex> guard(m_lock);
        auto entry = _GetEntry(applicationTicket->Id);
        if (!entry || !entry->ApplicationGroup)
            return;

        if (entry->GetApplicantByPlayerGUID(player->GetGUIDLow()) || GetApplicationCountByPlayer(player->GetGUIDLow()) >= LFG_LIST_MAX_APPLICATIONS)
            return;

        LFGListEntry::LFGListApplicationEntry application(player->GetGUIDLow(), entry);
        application.RoleMask = role;
        application.Comment = comment;

        auto applicationEntry = &entry->ApplicationsContainer.insert(std::make_pair(application.ID, application)).first->second;
        applicationEntry->Status = _CanQueueFor(entry, player);

        LFGListApplicationStatus status = LFGListApplicationStatus::Applied;
        if (applicationEntry->Status != LFGListStatus::None)
            status = LFGListApplicationStatus::Failed;
        // the 5th member is handled clientside -- OnAccept = function(self, applicantID) ConvertToRaid(); C_LFGList.InviteApplicant(applicantID) end,
        else if (entry->AutoAccept && (entry->ApplicationGroup->isRaidGroup() || _GetMemeberCountInGroupIncludingInvite(entry) != 5))
            status = LFGListApplicationStatus::Invited;

        _ChangeApplicantStatus(entry, application.ID, status, true, outbox);
    }

    Flush(outbox);
}

void LFGListMgr::RespondToInvite(Player* player, uint32 applicationId, bool accept)
{
    LFGListOutbox outbox;
    ObjectGuid groupGuid;
    uint32 creationTime = 0;
    std::unique_ptr<LFGListEntry::LFGListApplicationEntry> accepted;
    bool join = false;
    {
        std::lock_guard<std::recursive_mutex> guard(m_lock);
        LFGListEntry* entry = nullptr;
        LFGListEntry::LFGListApplicationEntry* application = nullptr;
        for (auto& queued : _lfgListQueue)
        {
            if ((application = queued.second->GetApplicant(applicationId)))
            {
                entry = queued.second;
                break;
            }
        }

        if (!application || !entry->ApplicationGroup || application->PlayerLowGuid != player->GetGUIDLow() || application->ApplicationStatus != LFGListApplicationStatus::Invited)
            return;

        if (!accept)
            _ChangeApplicantStatus(entry, applicationId, LFGListApplicationStatus::InviteDeclined, true, outbox);
        else
        {
            Group* group = entry->ApplicationGroup;
            Group* currentGroup = player->GetGroup();
            if (currentGroup && (currentGroup->isBGGroup() || currentGroup->isBFGroup()))
                currentGroup = player->GetOriginalGroup();

            join = !currentGroup && !group->IsFull() && _CanQueueFor(entry, player) == LFGListStatus::None;
            groupGuid = group->GetGUID();
            creationTime = entry->CreationTime;

            // the application leaves the list now; the join itself (Group::AddMember) is done below, without m_lock
            application->Listed = false;
            application->ApplicationStatus = join ? LFGListApplicationStatus::InviteAccepted : LFGListApplicationStatus::Failed;
            accepted = std::make_unique<LFGListEntry::LFGListApplicationEntry>(*application);
            accepted->m_Owner = nullptr;

            if (!join)
            {
                outbox.Packets.push_back({ { player->GetGUID() }, BuildGroupInviteResponse(groupGuid, creationTime, *accepted) });
                outbox.Packets.push_back({ GetMemberGuids(group), BuildApplicantUpdate(entry, *accepted) });
            }

            entry->ApplicationsContainer.erase(applicationId);

            if (!join)
                _AutoInviteApplicantsIfPossible(entry, outbox);
        }
    }

    Flush(outbox);

    if (!join)
        return;

    // the group is looked up again: it may have been disbanded meanwhile
    bool joined = false;
    if (Group* group = sGroupMgr->GetGroupByGUID(groupGuid))
    {
        if (!group->IsFull() && group->AddMember(player))
        {
            group->SetLfgRoles(player->GetGUID(), accepted->RoleMask);
            joined = true;
        }
    }

    if (!joined)
        accepted->ApplicationStatus = LFGListApplicationStatus::Failed;

    LFGListOutbox after;
    after.Packets.push_back({ { player->GetGUID() }, BuildGroupInviteResponse(groupGuid, creationTime, *accepted) });
    {
        std::lock_guard<std::recursive_mutex> guard(m_lock);
        if (LFGListEntry* entry = _GetEntry(groupGuid.GetGUIDLow()))
        {
            after.Packets.push_back({ GetMemberGuids(entry->ApplicationGroup), BuildApplicantUpdate(entry, *accepted) });
            if (joined)
                after.SocialNotifies.push_back(BuildSocialNotify(entry, player->GetGUID()));

            _AutoInviteApplicantsIfPossible(entry, after);
        }
    }

    Flush(after);
}

void LFGListMgr::CancelApplication(Player* player, uint32 applicationId, uint32 applicationTime)
{
    LFGListOutbox outbox;
    {
        std::lock_guard<std::recursive_mutex> guard(m_lock);
        for (auto& queued : _lfgListQueue)
        {
            auto application = queued.second->GetApplicant(applicationId);
            if (!application || application->ApplicationTime != applicationTime)
                continue;

            if (application->PlayerLowGuid == player->GetGUIDLow())
                _ChangeApplicantStatus(queued.second, applicationId, LFGListApplicationStatus::Cancelled, true, outbox);
            break;
        }
    }

    Flush(outbox);
}

void LFGListMgr::DeclineApplicant(ObjectGuid::LowType groupLowGuid, uint32 applicationId)
{
    LFGListOutbox outbox;
    {
        std::lock_guard<std::recursive_mutex> guard(m_lock);
        LFGListEntry* entry = _GetEntry(groupLowGuid);
        if (!entry)
            return;

        auto applicant = entry->GetApplicant(applicationId);
        if (!applicant || (applicant->ApplicationStatus != LFGListApplicationStatus::Applied && applicant->ApplicationStatus != LFGListApplicationStatus::Invited))
            return;

        _ChangeApplicantStatus(entry, applicationId, LFGListApplicationStatus::Declined, true, outbox);
    }

    Flush(outbox);
}

void LFGListMgr::InviteApplicant(ObjectGuid::LowType groupLowGuid, uint32 applicationId, uint8 role)
{
    LFGListOutbox outbox;
    {
        std::lock_guard<std::recursive_mutex> guard(m_lock);
        LFGListEntry* entry = _GetEntry(groupLowGuid);
        if (!entry)
            return;

        auto applicant = entry->GetApplicant(applicationId);
        if (!applicant || applicant->ApplicationStatus != LFGListApplicationStatus::Applied)
            return;

        // the leader picks among the roles the applicant offered
        if (uint8 pickedRole = role & applicant->RoleMask)
            applicant->RoleMask = pickedRole;

        _ChangeApplicantStatus(entry, applicationId, LFGListApplicationStatus::Invited, true, outbox);
    }

    Flush(outbox);
}

void LFGListMgr::UpdateEntry(Player* leader, ObjectGuid::LowType groupLowGuid, WorldPackets::LfgList::ListRequest const& request)
{
    LFGListOutbox outbox;
    {
        std::lock_guard<std::recursive_mutex> guard(m_lock);
        LFGListEntry* entry = _GetEntry(groupLowGuid);
        if (!entry || !entry->ApplicationGroup || !entry->ApplicationGroup->IsLeader(leader->GetGUID()))
            return;

        entry->AutoAccept = request.AutoAccept;
        entry->GroupName = request.GroupName;
        entry->Comment = request.Comment;
        entry->VoiceChat = request.VoiceChat;
        entry->HonorLevel = request.HonorLevel;
        if (request.QuestID.has_value())
            entry->QuestID = *request.QuestID;

        if (request.ItemLevel < GetPlayerItemLevelForActivity(entry->GroupFinderActivityData, leader))
            entry->ItemLevel = request.ItemLevel;
        entry->PrivateGroup = request.PrivateGroup;

        _AutoInviteApplicantsIfPossible(entry, outbox);
        outbox.Packets.push_back({ GetMemberGuids(entry->ApplicationGroup), BuildStatusUpdate(entry, true) });
    }

    Flush(outbox);
}

void LFGListMgr::_ChangeApplicantStatus(LFGListEntry* listEntry, uint32 applicationId, LFGListApplicationStatus status, bool notify, LFGListOutbox& outbox, bool autoInvite /*= true*/)
{
    auto application = listEntry->GetApplicant(applicationId);
    if (!application || application->ApplicationStatus == status)
        return;

    bool remove = false;
    Player* player = application->GetPlayer();

    application->ApplicationStatus = status;

    switch (status)
    {
        case LFGListApplicationStatus::Invited:
            // the count already includes this application
            if (!listEntry->ApplicationGroup->isRaidGroup() && _GetMemeberCountInGroupIncludingInvite(listEntry) > 5 || player && _CanQueueFor(listEntry, player) != LFGListStatus::None)
                break;
        case LFGListApplicationStatus::Applied:
            application->ResetTimeout();
            listEntry->ResetTimeout();
            outbox.Packets.push_back({ GetMemberGuids(listEntry->ApplicationGroup), BuildStatusUpdate(listEntry, true) });

            if (notify && player)
            {
                LFGListOutbox::ApplyResult result;
                result.Entry = MakeSnapshot(listEntry);
                result.Applicant = player->GetGUID();
                result.ApplicationID = application->ID;
                result.ApplicationTime = application->ApplicationTime;
                result.Timeout = application->Timeout;
                result.RoleMask = application->RoleMask;
                result.ApplicationStatus = application->ApplicationStatus;
                outbox.ApplyResults.push_back(std::move(result));
            }
            break;
        case LFGListApplicationStatus::InviteDeclined:
        case LFGListApplicationStatus::Declined:
        case LFGListApplicationStatus::Cancelled:
        case LFGListApplicationStatus::Timeout:
        case LFGListApplicationStatus::Failed:
        case LFGListApplicationStatus::DeclinedFull:
        case LFGListApplicationStatus::DeclinedDelisted:
            application->Listed = false;
            remove = true;
            if (notify && player)
                outbox.Packets.push_back({ { player->GetGUID() }, BuildGroupInviteResponse(listEntry->ApplicationGroup->GetGUID(), listEntry->CreationTime, *application) });
            break;
        default: // InviteAccepted: RespondToInvite, which must join the group without the lock
            break;
    }

    outbox.Packets.push_back({ GetMemberGuids(listEntry->ApplicationGroup), BuildApplicantUpdate(listEntry, *application) });

    if (remove)
        listEntry->ApplicationsContainer.erase(applicationId);

    if (autoInvite)
        _AutoInviteApplicantsIfPossible(listEntry, outbox);
}

void LFGListMgr::RemoveAllApplicationsByPlayer(uint32 playerGUID, bool notify /* = false */)
{
    LFGListOutbox outbox;
    {
        std::lock_guard<std::recursive_mutex> guard(m_lock);

        // applications are keyed by their own ID, not by the applicant's GUID; collected first, each handled once
        for (auto& queued : _lfgListQueue)
        {
            std::vector<uint32> ids;
            for (auto const& application : queued.second->ApplicationsContainer)
                if (application.second.PlayerLowGuid == playerGUID)
                    ids.push_back(application.first);

            for (uint32 id : ids)
                _ChangeApplicantStatus(queued.second, id, LFGListApplicationStatus::DeclinedDelisted, notify, outbox);
        }
    }

    Flush(outbox);
}

uint8 LFGListMgr::GetApplicationCountByPlayer(ObjectGuid::LowType guidLow) const
{
    std::lock_guard<std::recursive_mutex> guard(m_lock);

    uint8 counter = 0;
    for (auto& group : _lfgListQueue)
        for (auto& applicant : group.second->ApplicationsContainer)
            if (applicant.second.PlayerLowGuid == guidLow)
                ++counter;

    return counter;
}

void LFGListMgr::Update(uint32 const diff)
{
    LFGListOutbox outbox;
    {
        std::lock_guard<std::recursive_mutex> guard(m_lock);

        std::vector<ObjectGuid::LowType> expiredEntries;
        for (auto itr = _lfgListQueue.begin(); itr != _lfgListQueue.end();)
        {
            if (!itr->second) // Prevent crash
            {
                itr = _lfgListQueue.erase(itr);
                continue;
            }

            LFGListEntry* entry = itr->second;
            std::vector<uint32> expiredApplications;
            for (auto& application : entry->ApplicationsContainer)
                if (!application.second.Update(diff))
                    expiredApplications.push_back(application.first);

            for (uint32 applicationId : expiredApplications)
                _ChangeApplicantStatus(entry, applicationId, LFGListApplicationStatus::Timeout, true, outbox);

            if (!entry->Update(diff))
                expiredEntries.push_back(itr->first);

            ++itr;
        }

        for (ObjectGuid::LowType lowGuid : expiredEntries)
            _Remove(lowGuid, nullptr, true, outbox);
    }

    Flush(outbox);
}

void LFGListMgr::RemovePlayerDueToLogout(uint32 guidLow) ///< This is wrong, but cba to do it other way for now
{
    RemoveAllApplicationsByPlayer(guidLow);
}

void LFGListMgr::OnPlayerLogin(Player* player)
{
    Group* group = player->GetGroup();
    if (!group)
        return;

    LFGListOutbox outbox;
    {
        std::lock_guard<std::recursive_mutex> guard(m_lock);
        LFGListEntry* entry = _GetEntry(group->GetGUIDLow());
        if (!entry)
            return;

        outbox.Packets.push_back({ { player->GetGUID() }, BuildStatusUpdate(entry, true) });
    }

    Flush(outbox);
}

void LFGListMgr::SendSocialQueueUpdateNotify(ObjectGuid::LowType groupLowGuid)
{
    LFGListOutbox outbox;
    {
        std::lock_guard<std::recursive_mutex> guard(m_lock);
        LFGListEntry* entry = _GetEntry(groupLowGuid);
        if (!entry || !entry->ApplicationGroup)
            return;

        outbox.SocialNotifies.push_back(BuildSocialNotify(entry, entry->ApplicationGroup->GetLeaderGUID()));
    }

    // as before: nothing is sent while the leader is offline
    if (!ObjectAccessor::IsPlayerOnline(outbox.SocialNotifies.front().Friend))
        return;

    Flush(outbox);
}

LFGListStatus LFGListMgr::_CanQueueFor(LFGListEntry* entry, Player* requestingPlayer, bool apply /* = true */)
{
    if (!requestingPlayer)
        return LFGListStatus::None;

    auto group = entry->ApplicationGroup;
    auto activity = entry->GroupFinderActivityData;
    auto iLvl = GetPlayerItemLevelForActivity(activity, requestingPlayer);

    if (requestingPlayer->GetTeam() != group->GetTeam())
        return LFGListStatus::LFG_LIST_STATUS_ERR_LFG_LIST_INVALID_SLOT;   ///< Shouldnt be a problem, because its only for filters

    if ((activity->MinGearLevelSuggestion && iLvl < activity->MinGearLevelSuggestion) || iLvl < entry->ItemLevel)
        return LFGListStatus::LFG_LIST_STATUS_ERR_LFG_LIST_INVALID_SLOT;   ///< Same as above, filtered out

    if ((activity->MaxPlayers && static_cast<int32>(group->GetMembersCount()) >= activity->MaxPlayers) || group->GetMembersCount() >= 40)
        return LFGListStatus::LFG_LIST_STATUS_ERR_LFG_LIST_TOO_MANY_MEMBERS;

    if (requestingPlayer->getLevel() < activity->MinLevel || (activity->MaxLevelSuggestion && requestingPlayer->getLevel() > activity->MaxLevelSuggestion))
        return LFGListStatus::LFG_LIST_STATUS_ERR_LFG_LIST_INVALID_SLOT;   ///< Filtered out

    if (apply)
        return LFGListStatus::None;

    if (GetApplicationCountByPlayer(requestingPlayer->GetGUIDLow()) >= LFG_LIST_MAX_APPLICATIONS)
        return LFGListStatus::LFG_LIST_STATUS_ERR_LFG_LIST_REASON_TOO_MANY_LFG_LIST;

    return LFGListStatus::None;
}

bool LFGListMgr::IsActivityPvP(GroupFinderActivityEntry const* activity) const
{
    if (!activity)
        return false;

    switch (activity->GroupFinderCategoryID)
    {
        case LFG_LIST_ACTIVITY_CATEGORY_ARENA:
        case LFG_LIST_ACTIVITY_CATEGORY_ARENA_SKIRMISH:
        case LFG_LIST_ACTIVITY_CATEGORY_BATTLEGROUNDS:
        case LFG_LIST_ACTIVITY_CATEGORY_RATED_BATTLEGROUNDS:
        case LFG_LIST_ACTIVITY_CATEGORY_OUTDOOR_PVP:
            return true;
        default:
            return activity->ID == 17;    ///< Custom PvP
    }
}

float LFGListMgr::GetPlayerItemLevelForActivity(GroupFinderActivityEntry const* activity, Player* player) const
{
    if (player == nullptr)
        return 0.0f;

    return player->GetFloatValue(PLAYER_FIELD_AVG_ITEM_LEVEL + (IsActivityPvP(activity) ? PlayerAvgItemLevelOffsets::PvPAvgItemLevel : PlayerAvgItemLevelOffsets::NonPvPAvgItemLevel));
}

uint8 LFGListMgr::_GetMemeberCountInGroupIncludingInvite(LFGListEntry* entry)
{
    return _CountEntryApplicationsWithStatus(entry, LFGListApplicationStatus::Invited) + entry->ApplicationGroup->GetMembersCount();
}

uint8 LFGListMgr::_CountEntryApplicationsWithStatus(LFGListEntry* entry, LFGListApplicationStatus status)
{
    return static_cast<uint8>(std::count_if(entry->ApplicationsContainer.begin(), entry->ApplicationsContainer.end(), [&](auto const& itr)
    {
        return itr.second.ApplicationStatus == status;
    }));
}

void LFGListMgr::_AutoInviteApplicantsIfPossible(LFGListEntry* entry, LFGListOutbox& outbox)
{
    if (!entry->AutoAccept)
        return;

    if (!entry->ApplicationGroup->isRaidGroup() && _GetMemeberCountInGroupIncludingInvite(entry) >= 5)
        return;

    // collected first: each status change may erase applications
    std::vector<uint32> ids;
    for (auto const& applicant : entry->ApplicationsContainer)
        if (_CanQueueFor(entry, applicant.second.GetPlayer()) == LFGListStatus::None)
            ids.push_back(applicant.first);

    for (uint32 id : ids)
        _ChangeApplicantStatus(entry, id, LFGListApplicationStatus::Invited, true, outbox);
}

void LFGListMgr::SendLfgListJoinResult(LFGListEntry const* entry, LFGListStatus status, Player* player) const
{
    auto group = entry->ApplicationGroup;
    if (!group)
        return;

    WorldPackets::LfgList::LfgListJoinResult result;
    result.ApplicationTicket = MakeApplicationTicket(group->GetGUID(), entry->CreationTime);
    result.Status = AsUnderlyingType(status);
    result.Result = 0;

    player->SendDirectMessage(result.Write());
}
