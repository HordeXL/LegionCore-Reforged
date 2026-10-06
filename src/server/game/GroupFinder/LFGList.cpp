//#include "Object.h"
#include "LFGListMgr.h"
#include "GroupMgr.h"
//#include "LFGPackets.h"
#include "ObjectMgr.h"
#include "LfgListPackets.h"
//#include "SocialMgr.h"
#include "LFGList.h"

LFGListEntry::LFGListApplicationEntry::LFGListApplicationEntry(ObjectGuid::LowType playerGuid, LFGListEntry* owner)
{
    ID = sObjectMgr->GetGenerator<HighGuid::LFGObject>()->GenerateLow();
    ApplicationTime = GameTime::GetGameTime();
    PlayerLowGuid = playerGuid;
    Timeout = ApplicationTime + LFG_LIST_APPLY_FOR_GROUP_TIMEOUT;
    ApplicationStatus = LFGListApplicationStatus::None;
    Listed = true;
    m_Owner = owner;
    Status = LFGListStatus::None;
    RoleMask = 0;
}

Player* LFGListEntry::LFGListApplicationEntry::GetPlayer() const
{
    return sObjectMgr->GetPlayerByLowGUID(PlayerLowGuid);
};

void LFGListEntry::LFGListApplicationEntry::ResetTimeout()
{
    Timeout = GameTime::GetGameTime() + (ApplicationStatus == LFGListApplicationStatus::Invited ? LFG_LIST_INVITE_TO_GROUP_TIMEOUT : LFG_LIST_APPLY_FOR_GROUP_TIMEOUT);
}

// the status update is sent by LFGListMgr once its lock is released
void LFGListEntry::ResetTimeout()
{
    Timeout = GameTime::GetGameTime() + LFG_LIST_GROUP_TIMEOUT;
}

uint32 LFGListEntry::GetID() const
{
    return ApplicationGroup->GetGUIDLow();
}

// expired applications are handled by LFGListMgr::Update, which owns the lock and the packets
bool LFGListEntry::Update(uint32 const /*diff*/)
{
    return Timeout > GameTime::GetGameTime();
}

bool LFGListEntry::LFGListApplicationEntry::Update(uint32 const /*diff*/)
{
    return Timeout > GameTime::GetGameTime(); ///< Bye bye
}

LFGListEntry::LFGListEntry() : GroupFinderActivityData(nullptr), ApplicationGroup(nullptr), HonorLevel(0), QuestID(0), ItemLevel(0), AutoAccept(false)
{
    CreationTime = uint32(GameTime::GetGameTime());
    Timeout = CreationTime + LFG_LIST_GROUP_TIMEOUT;
}

LFGListEntry::LFGListApplicationEntry* LFGListEntry::GetApplicant(ObjectGuid::LowType id)
{
    return Trinity::Containers::MapGetValuePtr(ApplicationsContainer, id);
}

LFGListEntry::LFGListApplicationEntry * LFGListEntry::GetApplicantByPlayerGUID(ObjectGuid::LowType lowGuid)
{
    for (auto& application : ApplicationsContainer)
        if (application.second.PlayerLowGuid == lowGuid)
            return &application.second;

    return nullptr;
}
