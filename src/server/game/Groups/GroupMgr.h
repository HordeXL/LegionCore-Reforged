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

#ifndef _GROUPMGR_H
#define _GROUPMGR_H

#include "Group.h"

#include <atomic>
#include <mutex>
#include <vector>

class TC_GAME_API GroupMgr
{
private:
    GroupMgr();
    ~GroupMgr();

public:
    static GroupMgr* instance();

    typedef std::map<ObjectGuid::LowType, Group*> GroupContainer;
    typedef std::vector<Group*>      GroupDbContainer;

    void Update(uint32 diff);

    Group* GetGroupByGUID(ObjectGuid const& guid) const;

    uint32 GenerateNewGroupDbStoreId(Group* group);
    void   RegisterGroupDbStoreId(uint32 storageId, Group* group);
    void   FreeGroupDbStoreId(Group* group);
    void   SetNextGroupDbStoreId(uint32 storageId) { std::lock_guard<std::mutex> lock(_groupDbStoreLock); NextGroupDbStoreId = storageId; };
    Group* GetGroupByDbStoreId(uint32 storageId) const;
    void   SetGroupDbStoreSize(uint32 newSize) { std::lock_guard<std::mutex> lock(_groupDbStoreLock); GroupDbStore.resize(newSize); }

    void   LoadGroups();
    ObjectGuid::LowType GenerateGroupId();
    void   AddGroup(Group* group);
    void   RemoveGroup(Group* group);
    // Disbanded (or dropped pending) groups are freed here, by the world thread, a few seconds later: a Group* looked
    // up by another thread stays valid for the call that looked it up. Queuing twice is ignored.
    void   QueueForDelete(Group* group);

    void AddDelayedEvent(uint64 timeOffset, std::function<void()>&& function)
    {
        m_Functions.AddDelayedEvent(timeOffset, std::move(function));
    }

protected:
    void   _RegisterGroupDbStoreId(uint32 storageId, Group* group);
    void   _DeleteQueuedGroups(bool all);

    // Groups are created and disbanded from every map thread.
    std::atomic<ObjectGuid::LowType> NextGroupId;
    uint32           NextGroupDbStoreId;
    GroupContainer   GroupStore;
    GroupDbContainer GroupDbStore;
    mutable std::mutex _groupStoreLock;
    mutable std::mutex _groupDbStoreLock;
    // leaf, like the two above
    std::vector<std::pair<time_t, Group*>> _deleteQueue;
    std::mutex _deleteQueueLock;
    FunctionProcessor m_Functions;
};

#define sGroupMgr GroupMgr::instance()

#endif
