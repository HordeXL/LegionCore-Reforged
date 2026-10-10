/*
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

#ifndef IDLE_CHAT_H
#define IDLE_CHAT_H

#include "Define.h"
#include "ObjectGuid.h"
#include <unordered_map>
#include <vector>

class Creature;

// Spawns of table creature_idle_chat that stand together and chat: they take turns with the talk
// emotes, pause, nod or laugh, whatever their AI. The first spawn of a group leads the conversation;
// a creature passing by (waypoints) joins in while it stops there.
struct IdleChatGroup
{
    std::vector<uint64> Others;
    uint32 LaughMin = 0;                                                // ms, a laugh shared by all of them; 0 = none
    uint32 LaughMax = 0;
    uint8 Style = 0;                                                    // IdleChatStyle
};

enum IdleChatStyle : uint8
{
    IDLE_CHAT_STYLE_CALM   = 0,
    IDLE_CHAT_STYLE_LIVELY = 1,                                         // points then laughs, the others laugh along or applaud
    IDLE_CHAT_STYLE_CLOWN  = 2,                                         // does the chicken, the others burst out laughing
};

class TC_GAME_API IdleChatMgr
{
public:
    static IdleChatMgr* instance();

    void Load();
    // the other spawns of the group led by this one, null when it leads none
    IdleChatGroup const* GetLedGroup(uint64 spawnId) const;

private:
    std::unordered_map<uint64, IdleChatGroup> _groups;                 // by leading spawn
};

#define sIdleChatMgr IdleChatMgr::instance()

class TC_GAME_API IdleChat
{
public:
    explicit IdleChat(IdleChatGroup const& group);

    void Update(Creature* me, uint32 diff);

private:
    Creature* Find(Creature* me, std::size_t index);
    void Face(Creature* creature, Creature* target);
    void FaceBack(std::vector<Creature*> const& creatures);

    std::vector<uint64> _spawnIds;
    std::vector<ObjectGuid> _guids;
    std::vector<ObjectGuid> _turned;                                    // turned to the speaker, to face home again
    uint32 _laughMin;
    uint32 _laughMax;
    uint32 _laughTimer = 0;
    uint8 _style;
    uint32 _gag = 0;                                                    // the speaker's joke (point, chicken): the laughs follow
    uint32 _timer;
    std::size_t _speaker = 0;                                           // 0 = the leader, n = _spawnIds[n - 1]
    uint8 _linesLeft = 0;
    uint32 _lastEmote = 0;
    bool _together = false;
    bool _greeting = false;
};

#endif
