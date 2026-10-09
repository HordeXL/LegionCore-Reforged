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
 
#include <algorithm>
#include <cwctype>
#include <memory>

#include "AccountMgr.h"
#include "Channel.h"
#include "ChannelPackets.h"
#include "ChannelAppenders.h"
#include "Chat.h"
#include "ChatPackets.h"
#include "DatabaseEnv.h"
#include "ObjectAccessor.h"
#include "ObjectMgr.h"
#include "SocialMgr.h"
#include "WordFilterMgr.h"
#include "World.h"
#include "GridNotifiersImpl.h"

namespace
{
    // The player a command names, read in one short access: his Player object belongs to another map thread
    struct ChannelTarget
    {
        ObjectGuid guid;
        AccountTypes security = SEC_PLAYER;
        uint32 team = 0;
        bool gmVisible = true;
        bool ignoresAsker = false;
        std::string name;
    };

    bool ResolveTarget(std::string const& name, ChannelTarget& target, ObjectGuid const& asker = ObjectGuid::Empty)
    {
        ObjectGuid guid = ObjectAccessor::FindPlayerGuidByName(name);
        if (guid.IsEmpty())
            return false;

        bool const found = ObjectAccessor::WithPlayer(guid, [&target, &asker](Player* member)
        {
            target.security = member->GetSession()->GetSecurity();
            target.team = member->GetTeam();
            target.gmVisible = member->isGMVisible();
            target.name = member->GetName();
            if (!asker.IsEmpty())
                target.ignoresAsker = member->GetSocial()->HasIgnore(asker);
        }, ObjectAccessor::PlayerScope::InOrOutOfWorld);   // a player on a loading screen can still be named

        if (found)
            target.guid = guid;
        return found;
    }
}

Channel::Channel(std::string const& name, uint32 channel_id, uint32 Team) : _channelFlags(0), _channelId(channel_id), _channelName(name), _channelPassword(""), _announceEnabled(false), _special(false), _ownershipEnabled(true), m_Team(Team)
{
    _isSaved = false;

    if (IsWorld())
        _announceEnabled = false;

    // set special flags if built-in channel
    if (ChatChannelsEntry const* ch = sChatChannelsStore.LookupEntry(channel_id)) // check whether it's a built-in channel
    {
        _announceEnabled = false;                                 // no join/leave announces
        _ownershipEnabled = false;                                // no ownership handout

        _channelFlags |= CHANNEL_FLAG_GENERAL;                    // for all built-in channels

        if (ch->Flags & CHANNEL_DBC_FLAG_TRADE)
            _channelFlags |= CHANNEL_FLAG_TRADE;

        if (ch->Flags & CHANNEL_DBC_FLAG_CITY_ONLY2)        // for city only channels
            _channelFlags |= CHANNEL_FLAG_CITY;

        if (ch->Flags & CHANNEL_DBC_FLAG_LFG)               // for LFG channel
            _channelFlags |= CHANNEL_FLAG_LFG;
        else                                                // for all other channels
            _channelFlags |= CHANNEL_FLAG_NOT_LFG | CHANNEL_FLAG_UNK2;
    }
    else if (!stricmp(_channelName.c_str(), "world") || !stricmp(_channelName.c_str(), "all"))
    {
        _announceEnabled = false;
        _special = true;
    }
    else                                                    // it's custom channel
    {
        _channelFlags |= CHANNEL_FLAG_CUSTOM;

        // If storing custom channels in the db is enabled either load or save the channel
        if (sWorld->getBoolConfig(CONFIG_PRESERVE_CUSTOM_CHANNELS))
        {
            CharacterDatabasePreparedStatement* stmt = CharacterDatabase.GetPreparedStatement(CHAR_SEL_CHANNEL);
            stmt->setString(0, name);
            stmt->setUInt32(1, m_Team);
            PreparedQueryResult result = CharacterDatabase.Query(stmt);

            if (result) //load
            {
                Field* fields = result->Fetch();
                _announceEnabled = fields[0].GetBool();
                _ownershipEnabled = fields[1].GetBool();
                _channelPassword  = fields[2].GetString();
                const char* db_BannedList = fields[3].GetCString();

                if (db_BannedList)
                {
                    Tokenizer tokens(db_BannedList, ' ');
                    for (auto token : tokens)
                    {
                        std::string bannedGuidStr(token);
                        ObjectGuid banned_guid;
                        banned_guid.SetRawValue(uint64(strtoull(bannedGuidStr.substr(0, 16).c_str(), nullptr, 16)), uint64(strtoull(bannedGuidStr.substr(16).c_str(), nullptr, 16)));

                        if (!banned_guid.IsEmpty())
                        {
                            TC_LOG_DEBUG("chat.system", "Channel(%s) loaded _bannedStore guid: %s", name.c_str(), banned_guid.ToString().c_str());
                            _bannedStore.insert(banned_guid);
                        }
                    }
                }
            }
            else // save
            {
                stmt = CharacterDatabase.GetPreparedStatement(CHAR_INS_CHANNEL);
                stmt->setString(0, name);
                stmt->setUInt32(1, m_Team);
                CharacterDatabase.Execute(stmt);
                TC_LOG_DEBUG("chat.system", "Channel(%s) saved in database", name.c_str());
            }

            _isSaved = true;
        }
    }
}

bool Channel::PlayerInfo::HasFlag(uint8 flag) const
{
    return (flags & flag) != 0;
}

void Channel::PlayerInfo::SetFlag(uint8 flag)
{
    flags |= flag;
}

bool Channel::PlayerInfo::IsOwner() const
{
    return (flags & MEMBER_FLAG_OWNER) != 0;
}

void Channel::PlayerInfo::SetOwner(bool state)
{
    if (state)
        flags |= MEMBER_FLAG_OWNER;
    else
        flags &= ~MEMBER_FLAG_OWNER;
}

bool Channel::PlayerInfo::IsModerator() const
{
    return (flags & MEMBER_FLAG_MODERATOR) != 0;
}

void Channel::PlayerInfo::SetModerator(bool state)
{
    if (state)
        flags |= MEMBER_FLAG_MODERATOR;
    else
        flags &= ~MEMBER_FLAG_MODERATOR;
}

bool Channel::PlayerInfo::IsMuted() const
{
    return (flags & MEMBER_FLAG_MUTED) != 0;
}

void Channel::PlayerInfo::SetMuted(bool state)
{
    if (state)
        flags |= MEMBER_FLAG_MUTED;
    else
        flags &= ~MEMBER_FLAG_MUTED;
}

bool Channel::IsOn(ObjectGuid who) const
{
    std::lock_guard<std::recursive_mutex> guard(_lock);
    return _playersStore.find(who) != _playersStore.end();
}

bool Channel::IsBanned(ObjectGuid guid) const
{
    return _bannedStore.find(guid) != _bannedStore.end();
}

bool Channel::IsWorld() const
{
    std::string lowername;
    uint32 nameLength = _channelName.length();
    for (uint32 i = 0; i < nameLength; ++i)
        lowername.push_back(std::towlower(_channelName[i]));

    return lowername == "world" || lowername == "all";
}

// A channel is never freed (another thread may still hold its pointer): an empty custom one starts again as a new
// channel when it is joined, as it did when it was deleted and created anew
void Channel::ResetIfEmpty()
{
    if (IsConstant() || !_playersStore.empty())
        return;

    _ownerGuid = ObjectGuid::Empty;
    if (_isSaved)
        return;                                             // announce, ownership, password and bans are kept in the database

    _announceEnabled = false;
    _ownershipEnabled = true;
    _channelPassword.clear();
    _bannedStore.clear();
}

void Channel::UpdateChannelInDB() const
{
    if (_isSaved)
    {
        std::ostringstream banlist;
        for (auto iter : _bannedStore)
            banlist << iter << ' ';

        std::string banListStr = banlist.str();

        CharacterDatabasePreparedStatement* stmt = CharacterDatabase.GetPreparedStatement(CHAR_UPD_CHANNEL);
        stmt->setBool(0, _announceEnabled);
        stmt->setBool(1, _ownershipEnabled);
        stmt->setString(2, _channelPassword);
        stmt->setString(3, banListStr);
        stmt->setString(4, _channelName);
        stmt->setUInt32(5, m_Team);
        CharacterDatabase.Execute(stmt);

        TC_LOG_DEBUG("chat.system", "Channel(%s) updated in database", _channelName.c_str());
    }
}

void Channel::UpdateChannelUseageInDB() const
{
    CharacterDatabasePreparedStatement* stmt = CharacterDatabase.GetPreparedStatement(CHAR_UPD_CHANNEL_USAGE);
    stmt->setString(0, _channelName);
    stmt->setUInt32(1, m_Team);
    CharacterDatabase.Execute(stmt);
}

uint8 Channel::GetPlayerFlags(ObjectGuid p) const
{
    auto p_itr = _playersStore.find(p);
    if (p_itr == _playersStore.end())
        return 0;

    return p_itr->second.flags;
}

void Channel::CleanOldChannelsInDB()
{
    if (sWorld->getIntConfig(CONFIG_PRESERVE_CUSTOM_CHANNEL_DURATION) > 0)
    {
        CharacterDatabasePreparedStatement* stmt = CharacterDatabase.GetPreparedStatement(CHAR_DEL_OLD_CHANNELS);
        stmt->setUInt32(0, sWorld->getIntConfig(CONFIG_PRESERVE_CUSTOM_CHANNEL_DURATION) * DAY);
        CharacterDatabase.Execute(stmt);

        TC_LOG_DEBUG("chat.system", "Cleaned out unused custom chat channels.");
    }
}

void Channel::JoinChannel(Player* player, std::string const& pass, bool /*clientRequest*/)
{
    std::lock_guard<std::recursive_mutex> guard(_lock);
    ResetIfEmpty();

    ObjectGuid const& guid = player->GetGUID();
    if (IsOn(guid))
    {
        if (!IsConstant())
        {
            PlayerAlreadyMemberAppend appender(guid);
            ChannelNameBuilder<PlayerAlreadyMemberAppend> builder(this, appender);
            SendToOne(builder, guid);
        }
        return;
    }

    if (IsBanned(guid))
    {
        BannedAppend appender;
        ChannelNameBuilder<BannedAppend> builder(this, appender);
        SendToOne(builder, guid);
        return;
    }

    if (!_channelPassword.empty() && pass != _channelPassword)
    {
        WrongPasswordAppend appender;
        ChannelNameBuilder<WrongPasswordAppend> builder(this, appender);
        SendToOne(builder, guid);
        return;
    }

    if (HasFlag(CHANNEL_FLAG_LFG) && sWorld->getBoolConfig(CONFIG_RESTRICTED_LFG_CHANNEL) && AccountMgr::IsPlayerAccount(player->GetSession()->GetSecurity()) && player->GetGroup())
    {
        NotInLFGAppend appender;
        ChannelNameBuilder<NotInLFGAppend> builder(this, appender);
        SendToOne(builder, guid);
        return;
    }

    player->JoinedChannel(this);

    if (_announceEnabled && (!AccountMgr::IsModeratorAccount(player->GetSession()->GetSecurity()) || !sWorld->getBoolConfig(CONFIG_SILENTLY_GM_JOIN_TO_CHANNEL)))
    {
        JoinedAppend appender(guid);
        ChannelNameBuilder<JoinedAppend> builder(this, appender);
        SendToAll(builder);
    }

    PlayerInfo pinfo;
    pinfo.player = guid;
    pinfo.flags = MEMBER_FLAG_NONE;
    _playersStore[guid] = pinfo;
    PlayerInfo& playerInfo = _playersStore[guid];

    auto builder = [&](LocaleConstant /*locale*/)
    {
        auto notify = new WorldPackets::Channel::ChannelNotifyJoined();
        notify->ChannelWelcomeMsg = "";
        notify->ChatChannelID = _channelId;
        notify->InstanceID = 0;
        notify->_ChannelFlags = _channelFlags;
        notify->_Channel = _channelName;
        return notify;
    };

    SendToOne(builder, guid);

    
    if (!IsConstant()) // Custom channel handling
    {
        if (!_playersStore.empty())
            UpdateChannelUseageInDB();

        if (!_ownerGuid && _ownershipEnabled) // If the channel has no owner yet and ownership is allowed, set the new owner.
        {
            SetOwner(guid, (_playersStore.size() > 1));
            playerInfo.SetModerator(true);
        }
    }
}

void Channel::LeaveChannel(Player* player, bool send, bool clientRequest)
{
    std::lock_guard<std::recursive_mutex> guard(_lock);
    ObjectGuid const& guid = player->GetGUID();
    if (!IsOn(guid))
    {
        if (send)
        {
            NotMemberAppend appender;
            ChannelNameBuilder<NotMemberAppend> builder(this, appender);
            SendToOne(builder, guid);
        }
        return;
    }

    player->LeftChannel(this);

    if (send)
    {
        auto builder = [&](LocaleConstant locale)
        {
            auto* notify = new WorldPackets::Channel::ChannelNotifyLeft();
            notify->Channel = GetName();
            notify->ChatChannelID = 0;
            notify->Suspended = _channelId == 2 && !clientRequest;
            return notify;
        };

        SendToOne(builder, guid);
    }

    PlayerInfo& info = _playersStore[guid];
    bool changeowner = info.IsOwner();
    _playersStore.erase(guid);

    if (_announceEnabled && (!player || !AccountMgr::IsModeratorAccount(player->GetSession()->GetSecurity()) || !sWorld->getBoolConfig(CONFIG_SILENTLY_GM_JOIN_TO_CHANNEL)))
    {
        LeftAppend appender(guid);
        ChannelNameBuilder<LeftAppend> builder(this, appender);
        SendToAll(builder);
    }

    LeaveNotify(guid);

    if (!IsConstant())
    {
        UpdateChannelUseageInDB();

        // If the channel owner left and there are still playersStore inside, pick a new owner do not pick invisible gm owner unless there are only invisible gms in that channel (rare)
        if (changeowner && _ownershipEnabled && !_playersStore.empty())
        {
            ObjectGuid newowner = _playersStore.begin()->second.player;
            _playersStore[newowner].SetModerator(true);
            SetOwner(newowner);
        }
    }
}

void Channel::KickOrBan(Player const* player, std::string const& badname, bool ban)
{
    std::lock_guard<std::recursive_mutex> guard(_lock);
    ObjectGuid const& good = player->GetGUID();

    if (!IsOn(good))
    {
        NotMemberAppend appender;
        ChannelNameBuilder<NotMemberAppend> builder(this, appender);
        SendToOne(builder, good);
        return;
    }

    AccountTypes sec = player->GetSession()->GetSecurity();

    PlayerInfo& info = _playersStore[good];
    if (!info.IsModerator() && !AccountMgr::IsModeratorAccount(sec))
    {
        NotModeratorAppend appender;
        ChannelNameBuilder<NotModeratorAppend> builder(this, appender);
        SendToOne(builder, good);
        return;
    }

    ObjectGuid const victim = ObjectAccessor::FindPlayerGuidByName(badname);
    // kicking oneself erased the entry that info (above) still refers to, then wrote into it
    if (!victim || !IsOn(victim) || victim == good)
    {
        PlayerNotFoundAppend appender(badname);
        ChannelNameBuilder<PlayerNotFoundAppend> builder(this, appender);
        SendToOne(builder, good);
        return;
    }

    bool changeowner = _ownerGuid == victim;

    if (!AccountMgr::IsModeratorAccount(sec) && changeowner && good != _ownerGuid)
    {
        NotOwnerAppend appender;
        ChannelNameBuilder<NotOwnerAppend> builder(this, appender);
        SendToOne(builder, good);
        return;
    }

    if (ban && !IsBanned(victim))
    {
        _bannedStore.insert(victim);
        UpdateChannelInDB();

        if (!(AccountMgr::IsModeratorAccount(sec) && sWorld->getBoolConfig(CONFIG_SILENTLY_GM_JOIN_TO_CHANNEL)))
        {
            PlayerBannedAppend appender(good, victim);
            ChannelNameBuilder<PlayerBannedAppend> builder(this, appender);
            SendToAll(builder);
        }
    }
    else if (!(AccountMgr::IsModeratorAccount(sec) && sWorld->getBoolConfig(CONFIG_SILENTLY_GM_JOIN_TO_CHANNEL)))
    {
        PlayerKickedAppend appender(good, victim);
        ChannelNameBuilder<PlayerKickedAppend> builder(this, appender);
        SendToAll(builder);
    }

    _playersStore.erase(victim);
    // his channel list belongs to his own thread
    ObjectAccessor::PostToPlayer(victim, [this](Player* member) { member->LeftChannel(this, true); });

    if (changeowner && _ownershipEnabled && !_playersStore.empty())
    {
        info.SetModerator(true);
        SetOwner(good);
    }
}

void Channel::UnBan(Player const* player, std::string const& badname)
{
    std::lock_guard<std::recursive_mutex> guard(_lock);
    ObjectGuid const& good = player->GetGUID();

    if (!IsOn(good))
    {
        NotMemberAppend appender;
        ChannelNameBuilder<NotMemberAppend> builder(this, appender);
        SendToOne(builder, good);
        return;
    }

    PlayerInfo& info = _playersStore[good];
    if (!info.IsModerator() && !AccountMgr::IsModeratorAccount(player->GetSession()->GetSecurity()))
    {
        NotModeratorAppend appender;
        ChannelNameBuilder<NotModeratorAppend> builder(this, appender);
        SendToOne(builder, good);
        return;
    }

    ObjectGuid const victim = ObjectAccessor::FindPlayerGuidByName(badname);

    if (victim.IsEmpty() || !IsBanned(victim))
    {
        PlayerNotFoundAppend appender(badname);
        ChannelNameBuilder<PlayerNotFoundAppend> builder(this, appender);
        SendToOne(builder, good);
        return;
    }

    _bannedStore.erase(victim);

    PlayerUnbannedAppend appender(good, victim);
    ChannelNameBuilder<PlayerUnbannedAppend> builder(this, appender);
    SendToAll(builder);

    UpdateChannelInDB();
}

void Channel::Password(Player const* player, std::string const& pass)
{
    std::lock_guard<std::recursive_mutex> guard(_lock);
    ObjectGuid const& guid = player->GetGUID();
    if (!IsOn(guid))
    {
        NotMemberAppend appender;
        ChannelNameBuilder<NotMemberAppend> builder(this, appender);
        SendToOne(builder, guid);
        return;
    }

    PlayerInfo& info = _playersStore[guid];
    if (!info.IsModerator() && !AccountMgr::IsModeratorAccount(player->GetSession()->GetSecurity()))
    {
        NotModeratorAppend appender;
        ChannelNameBuilder<NotModeratorAppend> builder(this, appender);
        SendToOne(builder, guid);
        return;
    }

    _channelPassword = pass;

    PasswordChangedAppend appender(guid);
    ChannelNameBuilder<PasswordChangedAppend> builder(this, appender);
    SendToAll(builder);

    UpdateChannelInDB();
}

void Channel::SetMode(Player const* player, std::string const& p2n, bool mod, bool set)
{
    std::lock_guard<std::recursive_mutex> guard(_lock);
    ObjectGuid const& guid = player->GetGUID();
    if (!IsOn(guid))
    {
        NotMemberAppend appender;
        ChannelNameBuilder<NotMemberAppend> builder(this, appender);
        SendToOne(builder, guid);
        return;
    }

    PlayerInfo& info = _playersStore[guid];
    if (!info.IsModerator() && !AccountMgr::IsModeratorAccount(player->GetSession()->GetSecurity()))
    {
        NotModeratorAppend appender;
        ChannelNameBuilder<NotModeratorAppend> builder(this, appender);
        SendToOne(builder, guid);
        return;
    }

    if (guid == _ownerGuid && p2n == player->GetName() && mod)
        return;

    ChannelTarget target;
    bool const found = ResolveTarget(p2n, target);
    ObjectGuid const victim = target.guid;

    // allow make moderator from another team only if both is GMs at this moment this only way to show channel post for GM from another team
    if (found && (!AccountMgr::IsModeratorAccount(player->GetSession()->GetSecurity()) || !AccountMgr::IsModeratorAccount(target.security)) &&
        player->GetTeam() != target.team && !sWorld->getBoolConfig(CONFIG_ALLOW_TWO_SIDE_INTERACTION_CHANNEL))
    {
        PlayerNotFoundAppend appender(p2n);
        ChannelNameBuilder<PlayerNotFoundAppend> builder(this, appender);
        SendToOne(builder, guid);
        return;
    }

    if (_ownerGuid == victim && _ownerGuid != guid)
    {
        NotOwnerAppend appender;
        ChannelNameBuilder<NotOwnerAppend> builder(this, appender);
        SendToOne(builder, guid);
        return;
    }

    if (found)
    {
        if (mod)
            SetModerator(victim, set);
        else
            SetMute(victim, set);
    }
}

void Channel::_SetOwner(Player const* player, std::string const& newname)
{
    std::lock_guard<std::recursive_mutex> guard(_lock);
    ObjectGuid const& guid = player->GetGUID();

    if (!IsOn(guid))
    {
        NotMemberAppend appender;
        ChannelNameBuilder<NotMemberAppend> builder(this, appender);
        SendToOne(builder, guid);
        return;
    }

    if (!AccountMgr::IsModeratorAccount(player->GetSession()->GetSecurity()) && guid != _ownerGuid)
    {
        NotOwnerAppend appender;
        ChannelNameBuilder<NotOwnerAppend> builder(this, appender);
        SendToOne(builder, guid);
        return;
    }

    ChannelTarget target;
    ObjectGuid const victim = ResolveTarget(newname, target) ? target.guid : ObjectGuid::Empty;

    // the new owner must be a member: an unknown name made an empty guid owner, anyone else a member without joining
    if (!victim || !IsOn(victim) || (target.team != player->GetTeam() && !sWorld->getBoolConfig(CONFIG_ALLOW_TWO_SIDE_INTERACTION_CHANNEL)))
    {
        PlayerNotFoundAppend appender(newname);
        ChannelNameBuilder<PlayerNotFoundAppend> builder(this, appender);
        SendToOne(builder, guid);
        return;
    }

    PlayerInfo& info = _playersStore[victim];
    info.SetModerator(true);
    SetOwner(victim);
}

void Channel::SendWhoOwner(Player const* player)
{
    std::lock_guard<std::recursive_mutex> guard(_lock);
    ObjectGuid const& guid = player->GetGUID();
    if (IsOn(guid))
    {
        ChannelOwnerAppend appender(this, _ownerGuid);
        ChannelNameBuilder<ChannelOwnerAppend> builder(this, appender);
        SendToOne(builder, guid);
    }
    else
    {
        NotMemberAppend appender;
        ChannelNameBuilder<NotMemberAppend> builder(this, appender);
        SendToOne(builder, guid);
    }
}

void Channel::List(Player const* player)
{
    std::lock_guard<std::recursive_mutex> guard(_lock);
    ObjectGuid const& guid = player->GetGUID();
    if (!IsOn(guid))
    {
        NotMemberAppend appender;
        ChannelNameBuilder<NotMemberAppend> builder(this, appender);
        SendToOne(builder, guid);
        return;
    }

    WorldPackets::Channel::ChannelListResponse list;
    list._Display = true; /// always true?
    list._Channel = GetName();
    list._ChannelFlags = GetFlags();

    uint32 gmLevelInWhoList = sWorld->getIntConfig(CONFIG_GM_LEVEL_IN_WHO_LIST);

    bool const viewerIsPlayer = AccountMgr::IsPlayerAccount(player->GetSession()->GetSecurity());

    list._Members.reserve(_playersStore.size());
    for (auto const& i : _playersStore)
    {
        bool visible = false;
        ObjectAccessor::WithPlayer(i.first, [&](Player* member)
        {
            // PLAYER can't see MODERATOR, GAME MASTER, ADMINISTRATOR characters: MODERATOR, GAME MASTER, ADMINISTRATOR can see all
            visible = (!viewerIsPlayer || member->GetSession()->GetSecurity() <= AccountTypes(gmLevelInWhoList)) && member->IsVisibleGloballyFor(player);
        });

        if (visible)
            list._Members.emplace_back(i.second.player, GetVirtualRealmAddress(), i.second.flags);
    }

    player->SendDirectMessage(list.Write());
}

void Channel::Announce(Player const* player)
{
    std::lock_guard<std::recursive_mutex> guard(_lock);
    ObjectGuid const& guid = player->GetGUID();

    if (!IsOn(guid))
    {
        NotMemberAppend appender;
        ChannelNameBuilder<NotMemberAppend> builder(this, appender);
        SendToOne(builder, guid);
        return;
    }

    PlayerInfo const& playerInfo = _playersStore[guid];
    if (!playerInfo.IsModerator() && !AccountMgr::IsModeratorAccount(player->GetSession()->GetSecurity()))
    {
        NotModeratorAppend appender;
        ChannelNameBuilder<NotModeratorAppend> builder(this, appender);
        SendToOne(builder, guid);
        return;
    }

    _announceEnabled = !_announceEnabled;

    WorldPackets::Channel::ChannelNotify notify;
    if (_announceEnabled)
    {
        AnnouncementsOnAppend appender(guid);
        ChannelNameBuilder<AnnouncementsOnAppend> builder(this, appender);
        SendToAll(builder);
    }
    else
    {
        AnnouncementsOffAppend appender(guid);
        ChannelNameBuilder<AnnouncementsOffAppend> builder(this, appender);
        SendToAll(builder);
    }

    UpdateChannelInDB();
}

void Channel::Say(ObjectGuid const& guid, std::string const& what, uint32 lang, bool isSpamm)
{
    if (what.empty())
        return;

    std::lock_guard<std::recursive_mutex> guard(_lock);
    // the speaker's own packet handler runs in his thread
    Player* player = ObjectAccessor::FindPlayer(guid);
    if (player)
        lang = player->GetTeam() == HORDE ? LANG_ORCISH : LANG_COMMON;

    if (sWorld->getBoolConfig(CONFIG_ALLOW_TWO_SIDE_INTERACTION_CHANNEL))
        lang = LANG_UNIVERSAL;

    if (!IsOn(guid))
    {
        NotMemberAppend appender;
        ChannelNameBuilder<NotMemberAppend> builder(this, appender);
        SendToOne(builder, guid);
        return;
    }

    PlayerInfo const& playerInfo = _playersStore[guid];
    if (playerInfo.IsMuted())
    {
        MutedAppend appender;
        ChannelNameBuilder<MutedAppend> builder(this, appender);
        SendToOne(builder, guid);
        return;
    }

    auto builder = [&](LocaleConstant locale)
    {
        auto packet = new WorldPackets::Chat::Chat();
        if (player)
            packet->Initialize(CHAT_MSG_CHANNEL, Language(lang), player, player, what, 0, GetName());
        else
        {
            packet->Initialize(CHAT_MSG_CHANNEL, Language(lang), nullptr, nullptr, what, 0, GetName());
            packet->SenderGUID = guid;
            packet->TargetGUID = guid;
        }

        return packet;
    };

    if (isSpamm)
        SendToOne(builder, guid);
    else
        SendToAll(builder, !playerInfo.IsModerator() ? guid : ObjectGuid::Empty);
}

void Channel::Invite(Player const* player, std::string const& newname)
{
    if (sWorld->getBoolConfig(CONFIG_WORD_FILTER_ENABLE))
        if (!sWordFilterMgr->FindBadWord(newname, true).empty())
            return;

    std::lock_guard<std::recursive_mutex> guard(_lock);
    ObjectGuid const& guid = player->GetGUID();
    if (!IsOn(guid))
    {
        NotMemberAppend appender;
        ChannelNameBuilder<NotMemberAppend> builder(this, appender);
        SendToOne(builder, guid);
        return;
    }

    ChannelTarget target;
    if (!ResolveTarget(newname, target, guid) || !target.gmVisible)
    {
        PlayerNotFoundAppend appender(newname);
        ChannelNameBuilder<PlayerNotFoundAppend> builder(this, appender);
        SendToOne(builder, guid);
        return;
    }

    if (IsBanned(target.guid))
    {
        PlayerInviteBannedAppend appender(newname);
        ChannelNameBuilder<PlayerInviteBannedAppend> builder(this, appender);
        SendToOne(builder, guid);
        return;
    }

    if (target.team != player->GetTeam() && !sWorld->getBoolConfig(CONFIG_ALLOW_TWO_SIDE_INTERACTION_CHANNEL))
    {
        InviteWrongFactionAppend appender;
        ChannelNameBuilder<InviteWrongFactionAppend> builder(this, appender);
        SendToOne(builder, guid);
        return;
    }

    if (IsOn(target.guid))
    {
        PlayerAlreadyMemberAppend appender(target.guid);
        ChannelNameBuilder<PlayerAlreadyMemberAppend> builder(this, appender);
        SendToOne(builder, guid);
        return;
    }

    if (!target.ignoresAsker)
    {
        InviteAppend appender(guid);
        ChannelNameBuilder<InviteAppend> builder(this, appender);
        SendToOne(builder, target.guid);
    }

    PlayerInvitedAppend appender(target.name);
    ChannelNameBuilder<PlayerInvitedAppend> builder(this, appender);
    SendToOne(builder, guid);
}

void Channel::SetOwner(ObjectGuid const& guid, bool exclaim)
{
    std::lock_guard<std::recursive_mutex> guard(_lock);
    if (!_ownerGuid.IsEmpty())
    {
        auto itr = _playersStore.find(_ownerGuid);
        if (itr != _playersStore.end())
            itr->second.SetOwner(false);
    }

    _ownerGuid = guid;
    if (!_ownerGuid.IsEmpty())
    {
        uint8 oldFlag = GetPlayerFlags(_ownerGuid);
        auto itr = _playersStore.find(_ownerGuid);
        if (itr == _playersStore.end())
            return;

        itr->second.SetModerator(true);
        itr->second.SetOwner(true);

        ModeChangeAppend appender(_ownerGuid, oldFlag, GetPlayerFlags(_ownerGuid));
        ChannelNameBuilder<ModeChangeAppend> builder(this, appender);
        SendToAll(builder);

        if (exclaim)
        {
            OwnerChangedAppend ownerChangedAppender(_ownerGuid);
            ChannelNameBuilder<OwnerChangedAppend> ownerChangedBuilder(this, ownerChangedAppender);
            SendToAll(ownerChangedBuilder);
        }

        UpdateChannelInDB();
    }
}

void Channel::DeclineInvite(Player const* /*player*/)
{
}

void Channel::SilenceAll(Player const* /*player*/, std::string const& /*name*/)
{
}

void Channel::UnsilenceAll(Player const* /*player*/, std::string const& /*name*/)
{
}

void Channel::JoinNotify(ObjectGuid const& guid)
{
    std::lock_guard<std::recursive_mutex> guard(_lock);
    if (IsConstant())
    {
        auto builder = [&](LocaleConstant locale)
        {
            auto userlistAdd = new WorldPackets::Channel::UserlistAdd();
            userlistAdd->AddedUserGUID = guid;
            userlistAdd->_ChannelFlags = GetFlags();
            userlistAdd->UserFlags = GetPlayerFlags(guid);
            userlistAdd->ChannelID = GetChannelId();
            userlistAdd->ChannelName = GetName();
            return userlistAdd;
        };

        SendToAllButOne(builder, guid);
    }
    else
    {
        auto builder = [&](LocaleConstant locale)
        {
            auto* userlistUpdate = new WorldPackets::Channel::UserlistUpdate();
            userlistUpdate->UpdatedUserGUID = guid;
            userlistUpdate->_ChannelFlags = GetFlags();
            userlistUpdate->UserFlags = GetPlayerFlags(guid);
            userlistUpdate->ChannelID = GetChannelId();
            userlistUpdate->ChannelName = GetName();
            return userlistUpdate;
        };

        SendToAll(builder);
    }
}

void Channel::LeaveNotify(ObjectGuid const& guid)
{
    std::lock_guard<std::recursive_mutex> guard(_lock);
    auto builder = [&](LocaleConstant locale)
    {
        auto userlistRemove = new WorldPackets::Channel::UserlistRemove();
        userlistRemove->RemovedUserGUID = guid;
        userlistRemove->_ChannelFlags = GetFlags();
        userlistRemove->ChannelID = GetChannelId();
        userlistRemove->ChannelName = GetName();
        return userlistRemove;
    };

    if (IsConstant())
        SendToAllButOne(builder, guid);
    else
        SendToAll(builder);
}

void Channel::SetModerator(ObjectGuid const& guid, bool set)
{
    if (!IsOn(guid))
        return;

    PlayerInfo& playerInfo = _playersStore[guid];
    if (playerInfo.IsModerator() != set)
    {
        uint8 oldFlag = GetPlayerFlags(guid);
        playerInfo.SetModerator(set);

        ModeChangeAppend appender(guid, oldFlag, GetPlayerFlags(guid));
        ChannelNameBuilder<ModeChangeAppend> builder(this, appender);
        SendToAll(builder);
    }
}

void Channel::SetMute(ObjectGuid const& guid, bool set)
{
    if (!IsOn(guid))
        return;

    PlayerInfo& playerInfo = _playersStore[guid];
    if (playerInfo.IsMuted() != set)
    {
        uint8 oldFlag = GetPlayerFlags(guid);
        playerInfo.SetMuted(set);

        ModeChangeAppend appender(guid, oldFlag, GetPlayerFlags(guid));
        ChannelNameBuilder<ModeChangeAppend> builder(this, appender);
        SendToAll(builder);
    }
}

void Channel::AddonSay(ObjectGuid const& guid, std::string const& prefix, std::string const& what)
{
    if (what.empty())
        return;

    std::lock_guard<std::recursive_mutex> guard(_lock);
    if (!IsOn(guid))
    {
        NotMemberAppend appender;
        ChannelNameBuilder<NotMemberAppend> builder(this, appender);
        SendToOne(builder, guid);
        return;
    }

    PlayerInfo const& playerInfo = _playersStore[guid];
    if (playerInfo.IsMuted())
    {
        MutedAppend appender;
        ChannelNameBuilder<MutedAppend> builder(this, appender);
        SendToOne(builder, guid);
        return;
    }

    auto builder = [&](LocaleConstant locale)
    {
        auto packet = new WorldPackets::Chat::Chat();
        // the speaker's own packet handler runs in his thread
        if (auto player = ObjectAccessor::FindPlayer(guid))
            packet->Initialize(CHAT_MSG_CHANNEL, LANG_ADDON, player, player, what, 0, GetName(), DEFAULT_LOCALE, prefix);
        else
        {
            packet->Initialize(CHAT_MSG_CHANNEL, LANG_ADDON, nullptr, nullptr, what, 0, GetName(), DEFAULT_LOCALE, prefix);
            packet->SenderGUID = guid;
            packet->TargetGUID = guid;
        }

        return packet;
    };

    SendToAllWithAddon(builder, prefix, !_playersStore[guid].IsModerator() ? guid : ObjectGuid::Empty);
}

std::vector<ObjectGuid> Channel::GetMemberGuids() const
{
    std::lock_guard<std::recursive_mutex> guard(_lock);

    std::vector<ObjectGuid> guids;
    guids.reserve(_playersStore.size());
    for (auto const& i : _playersStore)
        guids.push_back(i.first);
    return guids;
}

template <class Builder, class Filter, class Sender>
void Channel::Deliver(std::vector<ObjectGuid> const& targets, Builder& builder, Filter&& filter, Sender&& send) const
{
    std::lock_guard<std::recursive_mutex> guard(_lock);

    std::map<LocaleConstant, std::shared_ptr<WorldPackets::Packet>> packets;
    for (ObjectGuid const& target : targets)
    {
        bool accepted = false;
        LocaleConstant locale = LOCALE_enUS;
        ObjectAccessor::WithPlayer(target, [&](Player* member)
        {
            accepted = filter(member);
            locale = member->GetSession()->GetSessionDbLocaleIndex();
        });

        if (!accepted)
            continue;

        std::shared_ptr<WorldPackets::Packet>& packet = packets[locale];
        if (!packet)
        {
            packet.reset(builder(locale));
            packet->Write();
        }

        send(target, packet);
    }
}

namespace
{
    bool AlwaysAccept(Player*) { return true; }

    void SendNow(ObjectGuid const& guid, std::shared_ptr<WorldPackets::Packet> const& packet)
    {
        ObjectAccessor::SendToPlayer(guid, packet->GetRawPacket());
    }
}

template <class Builder>
void Channel::SendToAll(Builder& builder, ObjectGuid const& guid) const
{
    Deliver(GetMemberGuids(), builder, [&guid](Player* member) { return guid.IsEmpty() || !member->GetSocial()->HasIgnore(guid); }, SendNow);
}

template <class Builder>
void Channel::SendToAllButOne(Builder& builder, ObjectGuid const& who) const
{
    std::vector<ObjectGuid> targets = GetMemberGuids();
    targets.erase(std::remove(targets.begin(), targets.end(), who), targets.end());
    Deliver(targets, builder, AlwaysAccept, SendNow);
}

template <class Builder>
void Channel::SendToOne(Builder& builder, ObjectGuid const& who) const
{
    Deliver(std::vector<ObjectGuid>{ who }, builder, AlwaysAccept, SendNow);
}

// An addon prefix list is written by the receiver's own session thread: the check runs there too
template <class Builder>
void Channel::SendToAllWithAddon(Builder& builder, std::string const& addonPrefix, ObjectGuid const& guid /*= ObjectGuid::Empty*/) const
{
    Deliver(GetMemberGuids(), builder, AlwaysAccept, [&addonPrefix, &guid](ObjectGuid const& target, std::shared_ptr<WorldPackets::Packet> const& packet)
    {
        ObjectAccessor::PostToPlayer(target, [packet, prefix = addonPrefix, ignored = guid](Player* member)
        {
            if (member->GetSession()->IsAddonRegistered(prefix) && (ignored.IsEmpty() || !member->GetSocial()->HasIgnore(ignored)))
                member->SendDirectMessage(packet->GetRawPacket());
        });
    });
}
