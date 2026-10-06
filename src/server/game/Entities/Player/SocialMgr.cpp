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

#include "SocialMgr.h"

#include "DatabaseEnv.h"
#include "Opcodes.h"
#include "WorldPacket.h"
#include "Player.h"
#include "World.h"
#include "Util.h"
#include "AccountMgr.h"
#include "SocialPackets.h"
#include "ObjectMgr.h"
#include "ObjectAccessor.h"

FriendInfo::FriendInfo(uint8 flags) : Status(FRIEND_STATUS_OFFLINE), Area(0), LfgListActivityID(0), Level(0), Class(0), Flags(flags)
{
}

FriendInfo::FriendInfo(uint8 flags, std::string const& note) : Status(FRIEND_STATUS_OFFLINE), Area(0), LfgListActivityID(0), Note(note), Level(0), Class(0), Flags(flags)
{
}

PlayerSocial::PlayerSocial()
{
    m_playerGUID.Clear();
}

PlayerSocial::~PlayerSocial()
{
    m_playerSocialMap.clear();
}

uint32 PlayerSocial::_CountWithFlag(SocialFlag flag) const
{
    uint32 counter = 0;
    for (auto const& itr : m_playerSocialMap)
        if (itr.second.Flags & flag)
            ++counter;

    return counter;
}

uint32 PlayerSocial::GetNumberOfSocialsWithFlag(SocialFlag flag)
{
    std::shared_lock<std::shared_mutex> guard(sSocialMgr->GetLock());
    return _CountWithFlag(flag);
}

bool PlayerSocial::AddToSocialList(ObjectGuid const& friendGuid, SocialFlag flag)
{
    uint8 flags = 0;
    bool inserted = false;
    {
        std::unique_lock<std::shared_mutex> guard(sSocialMgr->GetLock());
        // check client limits
        if (_CountWithFlag(flag) >= (((flag & SOCIAL_FLAG_FRIEND) != 0) ? SOCIALMGR_FRIEND_LIMIT : SOCIALMGR_IGNORE_LIMIT))
            return false;

        auto result = m_playerSocialMap.emplace(friendGuid, FriendInfo(flag));
        inserted = result.second;
        if (!inserted)
            result.first->second.Flags |= flag;
        flags = result.first->second.Flags;
    }

    if (!inserted)
    {
        CharacterDatabasePreparedStatement* stmt = CharacterDatabase.GetPreparedStatement(CHAR_UPD_ADD_CHARACTER_SOCIAL_FLAGS);

        stmt->setUInt8(0, flags);
        stmt->setUInt64(1, GetPlayerGUID().GetCounter());
        stmt->setUInt64(2, friendGuid.GetCounter());

        CharacterDatabase.Execute(stmt);
    }
    else
    {
        CharacterDatabasePreparedStatement* stmt = CharacterDatabase.GetPreparedStatement(CHAR_INS_CHARACTER_SOCIAL);

        stmt->setUInt64(0, GetPlayerGUID().GetCounter());
        stmt->setUInt64(1, friendGuid.GetCounter());
        stmt->setUInt8(2, flag);

        CharacterDatabase.Execute(stmt);
    }
    return true;
}

void PlayerSocial::RemoveFromSocialList(ObjectGuid const& friendGuid, SocialFlag flag)
{
    uint8 flags = 0;
    {
        std::unique_lock<std::shared_mutex> guard(sSocialMgr->GetLock());
        PlayerSocialMap::iterator itr = m_playerSocialMap.find(friendGuid);
        if (itr == m_playerSocialMap.end())
            return;

        itr->second.Flags &= ~flag;
        flags = itr->second.Flags;
        if (!flags)
            m_playerSocialMap.erase(itr);
    }

    if (!flags)
    {
        CharacterDatabasePreparedStatement* stmt = CharacterDatabase.GetPreparedStatement(CHAR_DEL_CHARACTER_SOCIAL);

        stmt->setUInt64(0, GetPlayerGUID().GetCounter());
        stmt->setUInt64(1, friendGuid.GetCounter());

        CharacterDatabase.Execute(stmt);
    }
    else
    {
        CharacterDatabasePreparedStatement* stmt = CharacterDatabase.GetPreparedStatement(CHAR_UPD_REM_CHARACTER_SOCIAL_FLAGS);

        stmt->setUInt8(0, flags);
        stmt->setUInt64(1, GetPlayerGUID().GetCounter());
        stmt->setUInt64(2, friendGuid.GetCounter());

        CharacterDatabase.Execute(stmt);
    }
}

void PlayerSocial::SetFriendNote(ObjectGuid const& friendGuid, std::string note)
{
    utf8truncate(note, 48);                                  // DB and client size limitation

    {
        std::unique_lock<std::shared_mutex> guard(sSocialMgr->GetLock());
        PlayerSocialMap::iterator itr = m_playerSocialMap.find(friendGuid);
        if (itr == m_playerSocialMap.end())                  // not exist
            return;

        itr->second.Note = note;
    }

    CharacterDatabasePreparedStatement* stmt = CharacterDatabase.GetPreparedStatement(CHAR_UPD_CHARACTER_SOCIAL_NOTE);

    stmt->setString(0, note);
    stmt->setUInt64(1, GetPlayerGUID().GetCounter());
    stmt->setUInt64(2, friendGuid.GetCounter());

    CharacterDatabase.Execute(stmt);
}

void PlayerSocial::SendSocialList(Player* player, uint32 flags)
{
    if (!player)
        return;

    uint32 const limit = ((flags & SOCIAL_FLAG_FRIEND) != 0) ? SOCIALMGR_FRIEND_LIMIT : SOCIALMGR_IGNORE_LIMIT;

    // Copied under the lock, completed without it: GetFriendInfo looks up and reads the other players
    std::vector<std::pair<ObjectGuid, FriendInfo>> contacts;
    {
        std::shared_lock<std::shared_mutex> guard(sSocialMgr->GetLock());
        for (auto const& v : m_playerSocialMap)
        {
            if (!(v.second.Flags & flags))
                continue;

            contacts.emplace_back(v.first, v.second);

            // client's friends list and ignore list limit
            if (contacts.size() >= limit)
                break;
        }
    }

    for (auto& contact : contacts)
        sSocialMgr->GetFriendInfo(player, contact.first, contact.second);

    {
        // Stored back: GetVisibleFriendsContaier filters this player's friends on it
        std::unique_lock<std::shared_mutex> guard(sSocialMgr->GetLock());
        for (auto const& contact : contacts)
        {
            PlayerSocialMap::iterator itr = m_playerSocialMap.find(contact.first);
            if (itr == m_playerSocialMap.end())
                continue;

            itr->second.Status = contact.second.Status;
            itr->second.Area = contact.second.Area;
            itr->second.Level = contact.second.Level;
            itr->second.Class = contact.second.Class;
        }
    }

    WorldPackets::Social::ContactList contactList;
    contactList.Flags = flags;

    for (auto const& contact : contacts)
    {
        FriendInfo const& friendInfo = contact.second;

        WorldPackets::Social::ContactInfo info;
        info.Guid = contact.first;
        info.WowAccountGuid = ObjectGuid::Create<HighGuid::WowAccount>(ObjectMgr::GetPlayerAccountIdByGUID(contact.first));
        info.VirtualRealmAddr = GetVirtualRealmAddress();
        info.NativeRealmAddr = GetVirtualRealmAddress();
        info.TypeFlags = friendInfo.Flags;
        info.Notes = friendInfo.Note;
        info.Status = friendInfo.Status;
        info.AreaID = friendInfo.Area;
        info.Level = friendInfo.Level;
        info.ClassID = friendInfo.Class;
        contactList.Contacts.emplace_back(info);
    }

    player->SendDirectMessage(contactList.Write());
}

bool PlayerSocial::_HasContact(ObjectGuid const& guid, SocialFlag flags)
{
    std::shared_lock<std::shared_mutex> guard(sSocialMgr->GetLock());
    PlayerSocialMap::const_iterator itr = m_playerSocialMap.find(guid);
    if (itr != m_playerSocialMap.end())
        return (itr->second.Flags & flags) != 0;

    return false;
}

bool PlayerSocial::HasFriend(ObjectGuid const& friendGuid)
{
    return _HasContact(friendGuid, SOCIAL_FLAG_FRIEND);
}

bool PlayerSocial::HasIgnore(ObjectGuid const& ignoreGuid)
{
    return _HasContact(ignoreGuid, SOCIAL_FLAG_IGNORED);
}

SocialMgr::SocialMgr()
{
}

SocialMgr::~SocialMgr()
{
}

SocialMgr* SocialMgr::instance()
{
    static SocialMgr instance;
    return &instance;
}

void SocialMgr::GetFriendInfo(Player* player, ObjectGuid const& friendGUID, FriendInfo &friendInfo)
{
    if (!player)
        return;

    friendInfo.Status = FRIEND_STATUS_OFFLINE;
    friendInfo.Area = 0;
    friendInfo.Level = 0;
    friendInfo.Class = 0;

    if (!ObjectAccessor::IsPlayerOnline(friendGUID))
        return;

    uint32 team = player->GetTeam();
    AccountTypes security = player->GetSession()->GetSecurity();
    uint32 const accountId = player->GetSession()->GetAccountId();
    uint32 const recruiterId = player->GetSession()->GetRecruiterId();
    bool allowTwoSideWhoList = sWorld->getBoolConfig(CONFIG_ALLOW_TWO_SIDE_WHO_LIST);
    AccountTypes gmLevelInWhoList = AccountTypes(sWorld->getIntConfig(CONFIG_GM_LEVEL_IN_WHO_LIST));

    {
        std::shared_lock<std::shared_mutex> guard(m_social_lock);
        PlayerSocialMap::iterator itr = player->GetSocial()->m_playerSocialMap.find(friendGUID);
        if (itr != player->GetSocial()->m_playerSocialMap.end())
            friendInfo.Note = itr->second.Note;
    }

    // The friend may stand on another map: read under the accessor lock
    // PLAYER see his team only and PLAYER can't see MODERATOR, GAME MASTER, ADMINISTRATOR characters
    // MODERATOR, GAME MASTER, ADMINISTRATOR can see all
    ObjectAccessor::WithPlayer(friendGUID, [&](Player* pFriend)
    {
        if (!(pFriend->GetName() && (!AccountMgr::IsPlayerAccount(security) || ((pFriend->GetTeam() == team || allowTwoSideWhoList) && (pFriend->GetSession()->GetSecurity() <= gmLevelInWhoList))) && pFriend->IsVisibleGloballyFor(player)))
            return;

        if (pFriend->isAFK())
            friendInfo.Status = FRIEND_STATUS_AFK;
        else if (pFriend->isDND())
            friendInfo.Status = FRIEND_STATUS_DND;
        else
        {
            friendInfo.Status = FRIEND_STATUS_ONLINE;

            if (pFriend->GetSession()->GetRecruiterId() == accountId || pFriend->GetSession()->GetAccountId() == recruiterId)
                friendInfo.Status = FriendStatus(uint32(friendInfo.Status) | FRIEND_STATUS_RAF);
        }

        friendInfo.Area = pFriend->GetCurrentZoneID();
        friendInfo.Level = pFriend->getLevel();
        friendInfo.Class = pFriend->getClass();
    });
}

void SocialMgr::SendFriendStatus(Player* player, FriendsResult result, ObjectGuid const& friendGuid, bool broadcast)
{
    FriendInfo fi;
    GetFriendInfo(player, friendGuid, fi);

    WorldPackets::Social::FriendStatus friendStatus;
    friendStatus.VirtualRealmAddress = GetVirtualRealmAddress();
    friendStatus.Notes = fi.Note;
    friendStatus.ClassID = fi.Class;
    friendStatus.Status = fi.Status;
    friendStatus.Guid = friendGuid;
    friendStatus.WowAccountGuid = ObjectGuid::Create<HighGuid::WowAccount>(ObjectMgr::GetPlayerAccountIdByGUID(friendGuid));
    friendStatus.Level = fi.Level;
    friendStatus.AreaID = fi.Area;
    friendStatus.FriendResult = result;

    if (broadcast)
        BroadcastToFriendListers(player, friendStatus.Write());
    else
        player->SendDirectMessage(friendStatus.Write());
}

void SocialMgr::BroadcastToFriendListers(Player* player, WorldPacket const* packet)
{
    if (!player)
        return;

    for (ObjectGuid const& friendGuid : GetVisibleFriendsContaier(player))
        ObjectAccessor::SendToPlayer(friendGuid, packet);
}

PlayerSocial* SocialMgr::LoadFromDB(PreparedQueryResult result, ObjectGuid const& guid)
{
    std::unique_lock<std::shared_mutex> guard(m_social_lock);
    PlayerSocial *social = &m_socialMap[guid];
    social->SetPlayerGUID(guid);

    if (!result)
        return social;
    do
    {
        Field* fields = result->Fetch();

        ObjectGuid friendGuid = ObjectGuid::Create<HighGuid::Player>(fields[0].GetUInt64());
        uint8 flags = fields[1].GetUInt8();

        social->m_playerSocialMap[friendGuid] = FriendInfo(flags, fields[2].GetString());
    } while (result->NextRow());

    return social;
}

GuidList SocialMgr::GetVisibleFriendsContaier(Player* player, bool online /*= false*/, uint32 lfgListActivityID /*= 0*/)
{
    GuidList data;
    if (!player)
        return data;

    auto guid = player->GetGUID();

    // Only the GUIDs are collected under the lock; lookups and checks run after it is released
    std::vector<ObjectGuid> candidates;
    {
        std::shared_lock<std::shared_mutex> guard(m_social_lock);
        for (auto const& itr : m_socialMap)
        {
            PlayerSocialMap::const_iterator itr2 = itr.second.m_playerSocialMap.find(guid);
            if (itr2 == itr.second.m_playerSocialMap.end() || !(itr2->second.Flags & SOCIAL_FLAG_FRIEND))
                continue;

            if (online && itr2->second.Status == FRIEND_STATUS_OFFLINE)
                continue;

            if (lfgListActivityID && itr2->second.LfgListActivityID != lfgListActivityID)
                continue;

            candidates.push_back(itr.first);
        }
    }

    if (candidates.empty())
        return data;

    auto team = player->GetTeam();
    auto security = player->GetSession()->GetSecurity();
    auto gmLevelInWhoList = AccountTypes(sWorld->getIntConfig(CONFIG_GM_LEVEL_IN_WHO_LIST));
    auto allowTwoSideWhoList = sWorld->getBoolConfig(CONFIG_ALLOW_TWO_SIDE_WHO_LIST);

    for (ObjectGuid const& friendGuid : candidates)
    {
        bool visible = false;
        ObjectAccessor::WithPlayer(friendGuid, [&](Player* friendPlayer)
        {
            visible = (!AccountMgr::IsPlayerAccount(friendPlayer->GetSession()->GetSecurity()) || ((friendPlayer->GetTeam() == team || allowTwoSideWhoList) && security <= gmLevelInWhoList)) && player->IsVisibleGloballyFor(friendPlayer);
        });

        if (visible)
            data.emplace_back(friendGuid);
    }

    return data;
}

GuidList SocialMgr::GetBNetFriendsGuids(uint32 /*lfgListActivityID*/)
{
    return GuidList();
}

GuidList SocialMgr::GetCharFriendsGuids(Player* player, uint32 lfgListActivityID)
{
    return GetVisibleFriendsContaier(player, true, lfgListActivityID);
}

GuidList SocialMgr::GetGuildMateGuids(uint32 lfgListActivityID)
{
    return _guildMateList;
}

bool SocialMgr::HasInFriendsList(Player * player, ObjectGuid guid)
{
    for (ObjectGuid const& friendGuid : GetVisibleFriendsContaier(player))
        if (friendGuid == guid)
            return true;

    return false;
}

bool SocialMgr::HasContact(ObjectGuid const& owner, ObjectGuid const& contact, SocialFlag flag)
{
    std::shared_lock<std::shared_mutex> guard(m_social_lock);
    auto social = m_socialMap.find(owner);
    if (social == m_socialMap.end())
        return false;

    auto itr = social->second.m_playerSocialMap.find(contact);
    return itr != social->second.m_playerSocialMap.end() && (itr->second.Flags & flag) != 0;
}

void SocialMgr::RemovePlayerSocial(ObjectGuid const& guid)
{
    std::unique_lock<std::shared_mutex> guard(m_social_lock);
    m_socialMap.erase(guid);
}
