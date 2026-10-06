#pragma once

#include "LFGList.h"

namespace WorldPackets
{
    namespace LfgList
    {
        struct ListRequest;
    }
}

class WorldPacket;
class WorldSession;
struct LFGListOutbox;

// Handlers run in their map's thread and Update in the world thread: listings and applications never leave the
// manager. Every public method works under m_lock and gives copies; packets, group joins and disbands are collected
// under the lock and carried out once it is released (see LFGListOutbox in the .cpp).
// Lock order: m_lock, then Group::m_lock through Group's read accessors only. Never call in here with a Group lock held.
class TC_GAME_API LFGListMgr
{
public:
    static LFGListMgr* instance();

    LFGListMgr();

    bool Insert(LFGListEntry* lfgEntry, Player* requester);
    bool IsEligibleForQueue(Player* player) const;
    bool IsGroupQueued(Group const* group) const;
    bool Remove(ObjectGuid::LowType lowGuid, Player* requester = nullptr, bool disband = true);
    void PlayerAddedToGroup(Player* player, Group* group);
    void PlayerRemoveFromGroup(Player* player, Group* group);
    std::vector<LFGListEntrySnapshot> GetFilteredList(uint32 activityCategory, uint32 activitySubCategory, std::string filterString, Player* player);
    void OnPlayerApplyForGroup(Player* player, WorldPackets::LFG::RideTicket const* applicationTicket, uint32 activityID, std::string comment, uint8 role);
    void RespondToInvite(Player* player, uint32 applicationId, bool accept);
    void CancelApplication(Player* player, uint32 applicationId, uint32 applicationTime);
    void DeclineApplicant(ObjectGuid::LowType groupLowGuid, uint32 applicationId);
    void InviteApplicant(ObjectGuid::LowType groupLowGuid, uint32 applicationId, uint8 role);
    void UpdateEntry(Player* leader, ObjectGuid::LowType groupLowGuid, WorldPackets::LfgList::ListRequest const& request);
    void Update(uint32 const diff);
    void RemovePlayerDueToLogout(uint32 guidLow);
    void OnPlayerLogin(Player* player);
    void RemoveAllApplicationsByPlayer(uint32 playerGUID, bool notify = false);
    void SendSocialQueueUpdateNotify(ObjectGuid::LowType groupLowGuid);
    bool IsActivityPvP(GroupFinderActivityEntry const* activity) const;
    float GetPlayerItemLevelForActivity(GroupFinderActivityEntry const* activity, Player* player) const;
    uint8 GetApplicationCountByPlayer(ObjectGuid::LowType guidLow) const;

    // Debug command only: the returned pointer may be stale, it is only compared again under the lock.
    LFGListEntry* GetEntrybyGuidLow(ObjectGuid::LowType lowGuid);
    void SendLFGListStatusUpdate(LFGListEntry* lfgEntry, WorldSession* worldSession = nullptr, bool listed = true, LFGListStatus debugStatus = LFGListStatus::None);

private:
    // all of these expect m_lock to be held
    bool _Remove(ObjectGuid::LowType lowGuid, Player* requester, bool disband, LFGListOutbox& outbox);
    void _ChangeApplicantStatus(LFGListEntry* listEntry, uint32 applicationId, LFGListApplicationStatus status, bool notify, LFGListOutbox& outbox, bool autoInvite = true);
    void _AutoInviteApplicantsIfPossible(LFGListEntry* entry, LFGListOutbox& outbox);
    LFGListStatus _CanQueueFor(LFGListEntry* entry, Player* requestingPlayer, bool apply = true);
    uint8 _GetMemeberCountInGroupIncludingInvite(LFGListEntry* entry);
    uint8 _CountEntryApplicationsWithStatus(LFGListEntry* entry, LFGListApplicationStatus status);
    LFGListEntry* _GetEntry(ObjectGuid::LowType lowGuid);

    bool CanInsert(LFGListEntry const* lfgEntry, Player* requester, bool sendError = false) const;
    void SendLfgListJoinResult(LFGListEntry const* entry, LFGListStatus status, Player* player) const;

    // without m_lock
    static void Flush(LFGListOutbox& outbox);

    std::map<ObjectGuid::LowType, LFGListEntry*> _lfgListQueue;
    mutable std::recursive_mutex m_lock;
};

#define sLFGListMgr LFGListMgr::instance()
