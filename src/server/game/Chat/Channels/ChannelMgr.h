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
#ifndef __TRINITY_CHANNELMGR_H
#define __TRINITY_CHANNELMGR_H

#include <map>
#include <memory>
#include <mutex>
#include <shared_mutex>

#include "Common.h"
#include "Channel.h"

#include "World.h"

#define MAX_CHANNEL_NAME_STR 31
#define MAX_CHANNEL_PASS_STR 31

class TC_GAME_API ChannelMgr
{
    public:
        explicit ChannelMgr(uint32 teamId) : team(teamId) { }
        ChannelMgr(ChannelMgr const&) = delete;
        ChannelMgr& operator=(ChannelMgr const&) = delete;

        uint32 const team;
        typedef std::map<std::wstring, std::unique_ptr<Channel>> ChannelMap;

        // The returned channel is never freed while the server runs, so the pointer stays valid in every thread
        Channel* GetJoinChannel(std::string name, uint32 channel_id);
        Channel* GetChannel(std::string const& name, Player* player, bool notify = true);
        // Nothing to free any more: an empty custom channel is reset when it is joined again
        void LeftChannel(std::string const& /*name*/) { }

    private:
        std::shared_mutex _lock;                            // channels
        std::mutex _createLock;                             // one creator at a time: the constructor runs a synchronous query
        ChannelMap channels;
        static void SendNotOnChannelNotify(Player const* player, std::string const& name);
};

TC_GAME_API ChannelMgr* channelMgr(uint32 team);

#endif
