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

#include "IdleChat.h"
#include "Creature.h"
#include "DatabaseEnv.h"
#include "Log.h"
#include "ObjectAccessor.h"
#include "ObjectMgr.h"
#include "Random.h"
#include "Timer.h"
#include <algorithm>
#include <list>
#include <map>

IdleChatMgr* IdleChatMgr::instance()
{
    static IdleChatMgr instance;
    return &instance;
}

void IdleChatMgr::Load()
{
    uint32 oldMSTime = getMSTime();
    _groups.clear();

    std::map<uint32, IdleChatGroup> groups;
    if (QueryResult result = WorldDatabase.Query("SELECT guid, group_id, laugh_min, laugh_max, style FROM creature_idle_chat ORDER BY guid"))
    {
        do
        {
            Field* fields = result->Fetch();
            uint64 spawnId = fields[0].GetUInt64();
            if (!sObjectMgr->GetCreatureData(spawnId))
            {
                TC_LOG_ERROR("sql.sql", "Table `creature_idle_chat` has a creature (GUID: " UI64FMTD ") that does not exist, skipped.", spawnId);
                continue;
            }
            IdleChatGroup& group = groups[fields[1].GetUInt32()];
            group.Others.push_back(spawnId);
            // seconds in the table; any row of the group may carry them
            if (uint32 laughMax = fields[3].GetUInt32() * IN_MILLISECONDS)
            {
                group.LaughMin = std::min(fields[2].GetUInt32() * IN_MILLISECONDS, laughMax);
                group.LaughMax = laughMax;
            }
            group.Style = std::max(group.Style, fields[4].GetUInt8());
        } while (result->NextRow());
    }

    for (auto& group : groups)
    {
        if (group.second.Others.size() < 2)
        {
            TC_LOG_ERROR("sql.sql", "Table `creature_idle_chat` has a group (%u) with a single creature, skipped.", group.first);
            continue;
        }
        uint64 leader = group.second.Others.front();
        group.second.Others.erase(group.second.Others.begin());
        _groups[leader] = group.second;
    }

    TC_LOG_INFO("server.loading", ">> Loaded %u groups of chatting creatures in %u ms", uint32(_groups.size()), GetMSTimeDiffToNow(oldMSTime));
}

IdleChatGroup const* IdleChatMgr::GetLedGroup(uint64 spawnId) const
{
    auto itr = _groups.find(spawnId);
    return itr != _groups.end() ? &itr->second : nullptr;
}

IdleChat::IdleChat(IdleChatGroup const& group) : _spawnIds(group.Others), _guids(group.Others.size()),
    _laughMin(group.LaughMin), _laughMax(group.LaughMax), _style(group.Style), _timer(urand(2000, 15000))
{
}

void IdleChat::Face(Creature* creature, Creature* target)
{
    if (creature->HasInArc(float(M_PI) / 4, target))
        return;
    creature->SetFacingToObject(target);
    if (std::find(_turned.begin(), _turned.end(), creature->GetGUID()) == _turned.end())
        _turned.push_back(creature->GetGUID());
}

// the conversation is over: the ones that turned to talk face their own way again (one walking off goes its way)
void IdleChat::FaceBack(std::vector<Creature*> const& creatures)
{
    for (Creature* creature : creatures)
        if (std::find(_turned.begin(), _turned.end(), creature->GetGUID()) != _turned.end())
            if (creature->IsAlive() && !creature->isInCombat() && !creature->isMoving() && !creature->IsInEvadeMode())
                creature->SetFacingTo(creature->GetHomePosition().GetOrientation());
    _turned.clear();
}

Creature* IdleChat::Find(Creature* me, std::size_t index)
{
    if (!_guids[index].IsEmpty())
        if (Creature* creature = ObjectAccessor::GetCreature(*me, _guids[index]))
            return creature;

    // spawned again, or not loaded yet: by its spawn, among the creatures standing around
    _guids[index].Clear();
    CreatureData const* data = sObjectMgr->GetCreatureData(_spawnIds[index]);
    if (!data)
        return nullptr;
    std::list<Creature*> creatures;
    me->GetCreatureListWithEntryInGrid(creatures, data->id, 30.0f);
    for (Creature* creature : creatures)
    {
        if (creature->GetDBTableGUIDLow() == _spawnIds[index])
        {
            _guids[index] = creature->GetGUID();
            return creature;
        }
    }
    return nullptr;
}

void IdleChat::Update(Creature* me, uint32 diff)
{
    if (_laughMax)
        _laughTimer = _laughTimer > diff ? _laughTimer - diff : 0;

    if (_timer > diff)
    {
        _timer -= diff;
        return;
    }

    std::vector<Creature*> speakers{ me };
    for (std::size_t i = 0; i < _spawnIds.size(); ++i)
        if (Creature* creature = Find(me, i))
            speakers.push_back(creature);

    // all of them standing there, quiet: a fight or a walk ends the conversation
    bool idle = speakers.size() == _spawnIds.size() + 1;
    for (Creature* creature : speakers)
        if (!creature->IsAlive() || creature->isInCombat() || creature->isMoving() || creature->IsInEvadeMode())
            idle = false;
    if (!idle)
    {
        if (!_turned.empty())
            FaceBack(speakers);
        _linesLeft = 0;
        _laughTimer = _laughMax ? urand(_laughMin, _laughMax) : 0;
        _together = false;
        _gag = 0;
        // checked often: a patrol may stop by for a few seconds only
        _timer = 1000;
        return;
    }

    // just met: the first words come at once
    if (!_together)
    {
        _together = true;
        _greeting = true;
        _linesLeft = 0;
        _lastEmote = 0;
    }

    // someone tells a joke now and then: the others laugh with them
    if (_laughMax && !_laughTimer)
    {
        speakers[_speaker]->HandleEmoteCommand(EMOTE_ONESHOT_LAUGH);
        for (Creature* creature : speakers)
            if (creature != speakers[_speaker])
                creature->HandleEmoteCommand(roll_chance_i(80) ? EMOTE_ONESHOT_LAUGH : EMOTE_ONESHOT_YES);
        _laughTimer = urand(_laughMin, _laughMax);
        _linesLeft = 0;
        _lastEmote = 0;
        _timer = urand(3000, 4500);
        return;
    }

    // a joke a moment ago: pointing at something, the speaker laughs about it and the others laugh along or
    // applaud; the chicken, the others burst out laughing
    if (_gag)
    {
        bool const chicken = _gag == EMOTE_ONESHOT_CHICKEN;
        _gag = 0;
        if (!chicken || roll_chance_i(40))
            speakers[_speaker]->HandleEmoteCommand(EMOTE_ONESHOT_LAUGH);
        for (Creature* creature : speakers)
            if (creature != speakers[_speaker] && roll_chance_i(chicken ? 95 : 70))
                creature->HandleEmoteCommand(chicken || roll_chance_i(60) ? EMOTE_ONESHOT_LAUGH : EMOTE_ONESHOT_APPLAUD);
        _lastEmote = EMOTE_ONESHOT_LAUGH;
        _linesLeft = 0;
        _timer = urand(2800, 4000);
        return;
    }

    if (!_linesLeft)
    {
        // the end of a turn: a listener sometimes nods, shakes the head or laughs along (or applauds, in a lively group)
        if (_lastEmote && roll_chance_i(_lastEmote == EMOTE_ONESHOT_QUESTION ? 50 : 30))
        {
            Creature* listener = speakers[(_speaker + urand(1, speakers.size() - 1)) % speakers.size()];
            uint32 reaction = _lastEmote == EMOTE_ONESHOT_LAUGH && roll_chance_i(60) ? EMOTE_ONESHOT_LAUGH
                : _style == IDLE_CHAT_STYLE_LIVELY && _lastEmote == EMOTE_ONESHOT_EXCLAMATION && roll_chance_i(50) ? EMOTE_ONESHOT_APPLAUD
                : roll_chance_i(80) ? EMOTE_ONESHOT_YES : EMOTE_ONESHOT_NO;
            listener->HandleEmoteCommand(reaction);
        }

        // usually someone else answers; now and then the same one goes on after a breath
        if (!roll_chance_i(20))
            _speaker = (_speaker + urand(1, speakers.size() - 1)) % speakers.size();
        _linesLeft = uint8(urand(1, 3));
        _lastEmote = 0;

        // the others turn to the one who speaks, who looks at one of them
        Creature* speaker = speakers[_speaker];
        for (Creature* listener : speakers)
            if (listener != speaker)
                Face(listener, speaker);
        Face(speaker, speakers[(_speaker + 1) % speakers.size()]);

        // a group with a laugh meets for a short while (a patrol stopping by): no long silence
        _timer = _greeting ? urand(300, 800) : !_laughMax && roll_chance_i(15) ? urand(20000, 45000) : urand(1500, 4500);
        _greeting = false;
        return;
    }

    uint32 roll = urand(0, 99);
    if ((_style == IDLE_CHAT_STYLE_LIVELY && roll < 18) || (_style == IDLE_CHAT_STYLE_CLOWN && roll < 10))
    {
        _gag = _style == IDLE_CHAT_STYLE_CLOWN ? EMOTE_ONESHOT_CHICKEN : EMOTE_ONESHOT_POINT;
        speakers[_speaker]->HandleEmoteCommand(_gag);
        _timer = _gag == EMOTE_ONESHOT_CHICKEN ? urand(2000, 2600) : urand(1200, 1800);
        return;
    }
    _lastEmote = roll < 65 ? EMOTE_ONESHOT_TALK : roll < 80 ? EMOTE_ONESHOT_EXCLAMATION : roll < 94 ? EMOTE_ONESHOT_QUESTION : EMOTE_ONESHOT_LAUGH;
    speakers[_speaker]->HandleEmoteCommand(_lastEmote);
    --_linesLeft;
    _timer = urand(2600, 3800);
}
