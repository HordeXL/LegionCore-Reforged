/*
 * Copyright (C) 2008-2015 TrinityCore <http://www.trinitycore.org/>
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

#ifndef ReferAFriendPackets_h__
#define ReferAFriendPackets_h__

#include "Packet.h"
#include "ObjectGuid.h"
#include <string>

namespace WorldPackets
{
    namespace ReferAFriend
    {
        class AcceptLevelGrant final : public ClientPacket
        {
        public:
            AcceptLevelGrant(WorldPacket&& packet) : ClientPacket(CMSG_ACCEPT_LEVEL_GRANT, std::move(packet)) { }

            void Read() override;

            ObjectGuid Granter;
        };

        class GrantLevel final : public ClientPacket
        {
        public:
            GrantLevel(WorldPacket&& packet) : ClientPacket(CMSG_GRANT_LEVEL, std::move(packet)) { }

            void Read() override;

            ObjectGuid Target;
        };

        class ProposeLevelGrant final : public ServerPacket
        {
        public:
            ProposeLevelGrant() : ServerPacket(SMSG_PROPOSE_LEVEL_GRANT, 16) { }

            WorldPacket const* Write() override;

            ObjectGuid Sender;
        };

        class ReferAFriendFailure final : public ServerPacket
        {
        public:
            ReferAFriendFailure() : ServerPacket(SMSG_REFER_A_FRIEND_FAILURE, 1 + 4) { }

            WorldPacket const* Write() override;

            std::string Str;
            int32 Reason = 0;
        };

        class RecruitAFriendResponse final : public ServerPacket
        {
        public:
            RecruitAFriendResponse() : ServerPacket(SMSG_RECRUIT_A_FRIEND_RESPONSE, 4) { }

            WorldPacket const* Write() override;

            int32 Result = 0;
        };

        // The client asks the server when the social panel opens: without a positive answer,
        // the Recruit-a-Friend UI stays inert.
        class CheckRafEmailEnabled final : public ClientPacket
        {
        public:
            CheckRafEmailEnabled(WorldPacket&& packet) : ClientPacket(CMSG_CHECK_RAF_EMAIL_ENABLED, std::move(packet)) { }

            void Read() override { }
        };

        class RafEmailEnabledResponse final : public ServerPacket
        {
        public:
            RafEmailEnabledResponse() : ServerPacket(SMSG_RAF_EMAIL_ENABLED_RESPONSE, 1) { }

            WorldPacket const* Write() override;

            bool Enabled = false;
        };

        // Layout taken from real packets sent by the 7.3.5 client:
        // name length on 7 bits, address on 9, note on 10, then the three
        // strings back to back.
        class RecruitAFriend final : public ClientPacket
        {
        public:
            RecruitAFriend(WorldPacket&& packet) : ClientPacket(CMSG_RECRUIT_A_FRIEND, std::move(packet)) { }

            void Read() override;

            std::string Name;       // recruiter's character
            std::string Email;      // address typed in
            std::string Note;       // free-form message
        };
    }
}

#endif // ReferAFriendPackets_h__
