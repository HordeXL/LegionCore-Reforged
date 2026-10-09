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

#include "ChannelMgr.h"
#include "ChannelPackets.h"
#include "World.h"

ChannelMgr* channelMgr(uint32 team)
{
    static ChannelMgr allianceChannelMgr(ALLIANCE);
    static ChannelMgr hordeChannelMgr(HORDE);
    if (sWorld->getBoolConfig(CONFIG_ALLOW_TWO_SIDE_INTERACTION_CHANNEL))
        return &allianceChannelMgr;        // cross-faction

    if (team == ALLIANCE)
        return &allianceChannelMgr;

    if (team == HORDE)
        return &hordeChannelMgr;

    return nullptr;
}

Channel* ChannelMgr::GetJoinChannel(std::string name, uint32 channel_id)
{
    std::wstring wname;
    if (!Utf8toWStr(name, wname))
        return nullptr;

    wstrToLower(wname);

    {
        std::shared_lock<std::shared_mutex> guard(_lock);
        ChannelMap::const_iterator i = channels.find(wname);
        if (i != channels.end())
            return i->second.get();
    }

    // built outside _lock: a saved custom channel loads its state with a synchronous query
    std::lock_guard<std::mutex> createGuard(_createLock);
    {
        std::shared_lock<std::shared_mutex> guard(_lock);
        ChannelMap::const_iterator i = channels.find(wname);
        if (i != channels.end())
            return i->second.get();
    }

    std::unique_ptr<Channel> created = std::make_unique<Channel>(name, channel_id, team);
    Channel* channel = created.get();

    std::unique_lock<std::shared_mutex> guard(_lock);
    channels.emplace(wname, std::move(created));
    return channel;
}

Channel* ChannelMgr::GetChannel(std::string const& name, Player* player, bool notify /*= true*/)
{
    std::wstring wname;
    if (!Utf8toWStr(name, wname))
        return nullptr;

    wstrToLower(wname);

    {
        std::shared_lock<std::shared_mutex> guard(_lock);
        ChannelMap::const_iterator i = channels.find(wname);
        if (i != channels.end())
            return i->second.get();
    }

    if (notify && player)
        SendNotOnChannelNotify(player, name);

    return nullptr;
}

void ChannelMgr::SendNotOnChannelNotify(Player const* player, std::string const& name)
{
    WorldPackets::Channel::ChannelNotify notify;
    notify.Type = CHAT_NOT_MEMBER_NOTICE;
    notify._Channel = name;
    player->SendDirectMessage(notify.Write());
}
