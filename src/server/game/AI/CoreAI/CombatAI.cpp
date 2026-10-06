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

#include "CombatAI.h"
#include "CreatureTextMgr.h"
#include "SpellMgr.h"
#include "SpellInfo.h"
#include "Vehicle.h"
#include "ObjectAccessor.h"
#include "Spell.h"
#include "Group.h"

int AggressorAI::Permissible(const Creature* creature)
{
    // have some hostile factions, it will be selected by IsHostileTo check at MoveInLineOfSight
    if (!creature->isCivilian() && !creature->IsNeutralToAll())
        return PERMIT_BASE_PROACTIVE;

    return PERMIT_BASE_NO;
}

void AggressorAI::InitializeAI()
{
	// What is the reason for this code?? It makes mob get stuck in place if they have creature spells with a range and is not blizzlike
    /*for (auto& spell : *me->CreatureSpells)
    {
        if (SpellInfo const* sInfo = sSpellMgr->GetSpellInfo(spell.second.SpellID))
            if (sInfo->GetMaxRange(false) >= 30.0f && sInfo->GetMaxRange(false) > me->GetAttackDist() && (sInfo->AttributesCu[0] & SPELL_ATTR0_CU_DIRECT_DAMAGE) && !sInfo->IsTargetingAreaCast())
                if (!sInfo->IsPositive())
                    me->SetAttackDist(sInfo->GetMaxRange(false));
    }*/

    CreatureTexts = sCreatureTextMgr->GetTextGroup(me->GetEntry(), TEXT_GROUP_TIMER);
    CreatureCombatTexts = sCreatureTextMgr->GetTextGroup(me->GetEntry(), TEXT_GROUP_COMBAT_TIMER);

    // don't let all NPCs run the attack type check at the same time, it can cause client crashes
    if (me->m_actionData[CREATURE_ACTION_TYPE_ATTACK] && !me->m_actionData[CREATURE_ACTION_TYPE_ATTACK]->empty())
        m_checkTimer = urand(0, 10000);

    CreatureAI::InitializeAI();
    DoActionAI(0, CREATURE_ACTION_TYPE_SUMMON);
}

void AggressorAI::Reset()
{
    events.Reset();
    spellCasts.Reset();
    textCombatEvents.Reset();

    auto mapDifficulty = me->GetMap()->GetDifficultyID();
    for (auto& spell : *me->CreatureSpells)
        if (spell.CanUseInDifficulty(mapDifficulty))
            if (AISpellInfo[spell.SpellID].condition == AICOND_EVADE)
                if (AISpellInfo[spell.SpellID].target == AITARGET_SELF)
                    me->CastSpell(me, spell.SpellID, false);
}

void AggressorAI::UpdateAI(uint32 diff)
{
    if (!me->IsInWorld() || me->isDead() || me->m_cleanupDone)
        return;

    if (!me->isInCombat())
    {
        for (auto& event : textEvents)
        {
            event.second.Update(diff);
            if (uint32 eventId = event.second.ExecuteEvent())
            {
                Player* textTarget = ObjectAccessor::GetPlayer(*me, event.first);
                if (!textTarget)
                {
                    event.second.ScheduleEvent(eventId, 500);
                    continue;
                }
                auto* text = &(*CreatureTexts)[eventId - 1];
                if (me->GetDistance(textTarget) > sCreatureTextMgr->GetRangeForChatType(text->type))
                {
                    event.second.ScheduleEvent(eventId, 500);
                    continue;
                }
                sCreatureTextMgr->SendText(me, text, event.first);
                uint32 nextEventId = eventId + 1;
                if (eventId < CreatureTexts->size()) // use eventId is true, not replace it!!!
                {
                    auto* nextText = &(*CreatureTexts)[eventId]; // use eventId is true, not replace it!!!
                    event.second.ScheduleEvent(nextEventId, nextText->MinTimer);
                }
            }
        }
    }

    if (!UpdateVictim())
    {
        DoActionAI(diff, CREATURE_ACTION_TYPE_ATTACK);
        return;
    }

    events.Update(diff);
    spellCasts.Update(diff);

    if (me->isInCombat())
        textCombatEvents.Update(diff);

    if (me->getVictim() && me->getVictim()->HasCrowdControlAura(me))
    {
        me->InterruptNonMeleeSpells(false);
        return;
    }

    if (IsInControl() || me->HasUnitState(UNIT_STATE_CASTING))
        return;

    while (uint32 eventId = events.ExecuteEvent())
    {
        switch (eventId)
        {
        case EVENT_1:
            if (me->HealthBelowPct(15) && !me->HasSearchedAssistance())
            {
                events.ScheduleEvent(eventId, 30000);
                me->DoFleeToGetAssistance();
                return;
            }
            else
                events.ScheduleEvent(eventId, 500);
            break;
        }
    }

    if (me->isInCombat())
    {
        if (uint32 eventId = textCombatEvents.ExecuteEvent())
        {
            auto* text = &(*CreatureCombatTexts)[eventId - 1];
            sCreatureTextMgr->SendText(me, text);
            uint32 nextEventId = eventId + 1;
            if (eventId < CreatureCombatTexts->size()) // use eventId is true, not replace it!!!
            {
                auto* nextText = &(*CreatureCombatTexts)[eventId]; // use eventId is true, not replace it!!!
                textCombatEvents.ScheduleEvent(nextEventId, nextText->MinTimer);
            }
        }
    }

    if (uint32 spellId = spellCasts.ExecuteEvent())
    {
        bool isCasted = false;
        if (SpellInfo const* sInfo = sSpellMgr->GetSpellInfo(spellId))
        {
            if (sInfo->CanAutoCast(me, me->getVictim()))
            {
                if (CreatureSpell const* spellData = me->GetCreatureSpell(spellId))
                    if (spellData->Text)
                        sCreatureTextMgr->SendText(me, spellData->Text, me->getVictim() ? me->getVictim()->GetGUID() : ObjectGuid::Empty);
                DoCast(spellId);
                isCasted = true;
            }
        }

        if (isCasted)
            spellCasts.ScheduleEvent(spellId, urand(AISpellInfo[spellId].cooldown, 2 * AISpellInfo[spellId].cooldown));
        else
            spellCasts.ScheduleEvent(spellId, 500);
    }
    else
        DoMeleeAttackIfReady();
}

void AggressorAI::DoActionAI(uint32 diff, CreatureActionType type)
{
    if (type == CREATURE_ACTION_TYPE_SUMMON)
    {
        if (me->m_actionData[CREATURE_ACTION_TYPE_SUMMON] && !me->m_actionData[CREATURE_ACTION_TYPE_SUMMON]->empty())
        {
            for (auto itr : *me->m_actionData[CREATURE_ACTION_TYPE_SUMMON])
                if (itr.spellId)
                    me->CastSpell(me, itr.spellId, false);
            // else { Summon Pet; }
        }
        return;
    }

    if (m_checkTimer <= diff)
    {
        if (me->HasUnitState(UNIT_STATE_CASTING) || !me->IsAlive())
        {
            m_checkTimer = 10000;
            return;
        }

        //Test code, searching target, info get from sniff
        if (me->m_actionData[CREATURE_ACTION_TYPE_ATTACK] && !me->m_actionData[CREATURE_ACTION_TYPE_ATTACK]->empty())
        {
            for (auto itr : *me->m_actionData[CREATURE_ACTION_TYPE_ATTACK])
            {
                if (Creature* target = me->FindNearestCreature(itr.target, 10.0f))
                    AttackStart(target);
            }
        }
        else if (me->m_actionData[CREATURE_ACTION_TYPE_CAST] && !me->m_actionData[CREATURE_ACTION_TYPE_CAST]->empty())
        {
            for (auto itr : *me->m_actionData[CREATURE_ACTION_TYPE_CAST])
            {
                if (!itr.type)
                {
                    if (Creature* target = me->FindNearestCreature(itr.target, 11.0f))
                        if (target->IsAlive())
                            me->CastSpell(target, itr.spellId, false);
                }
                else
                {
                    if (GameObject* target = me->FindNearestGameObject(itr.target, 11.0f))
                        me->CastSpell(target, itr.spellId, false);
                }
            }
        }
        m_checkTimer = 5000;
    }
    else
        m_checkTimer -= diff;
}

void AggressorAI::JustDied(Unit* killer)
{
    if (!me->IsInWorld() || me->m_cleanupDone)
        return;

    if (me->isElite() || roll_chance_i(25)) // Prevent spamm text
        TalkAuto(TEXT_GROUP_DIE, killer->GetGUID());

    auto mapDifficulty = me->GetMap()->GetDifficultyID();
    for (auto& spell : *me->CreatureSpells)
        if (spell.CanUseInDifficulty(mapDifficulty))
            if (AISpellInfo[spell.SpellID].condition == AICOND_DIE)
                if (SpellInfo const* sInfo = sSpellMgr->GetSpellInfo(spell.SpellID))
                    if (sInfo->CanAutoCast(me, killer))
                        me->CastSpell(killer, spell.SpellID, true);
}

void AggressorAI::EnterCombat(Unit* who)
{
    if (me->isElite() || roll_chance_i(25)) // Prevent spamm text
        TalkAuto(TEXT_GROUP_COMBAT, who->GetGUID());
    if (CreatureCombatTexts)
    {
        textCombatEvents.Reset();
        auto const& text = CreatureCombatTexts->begin();
        textCombatEvents.ScheduleEvent(EVENT_1, text->MinTimer);
    }
    me->CastStop();
    auto mapDifficulty = me->GetMap()->GetDifficultyID();
    for (auto& spell : *me->CreatureSpells)
    {
        if (!spell.CanUseInDifficulty(mapDifficulty))
            continue;

        if (AISpellInfo[spell.SpellID].condition == AICOND_AGGRO)
        {
            if (SpellInfo const* sInfo = sSpellMgr->GetSpellInfo(spell.SpellID))
                if (sInfo->CanAutoCast(me, who))
                    me->CastSpell(who, spell.SpellID, false);
        }
        else if (AISpellInfo[spell.SpellID].condition == AICOND_COMBAT)
            spellCasts.ScheduleEvent(spell.SpellID, urand(AISpellInfo[spell.SpellID].cooldown, 2 * AISpellInfo[spell.SpellID].cooldown));
    }
    if (me->m_CanCallAssistance)
        events.ScheduleEvent(EVENT_1, 500);
}

void AggressorAI::MoveInLineOfSight(Unit* who)
{
    if (!who)
        return;

    CreatureAI::MoveInLineOfSight(who);
}

void AggressorAI::AddClientVisibility(ObjectGuid guid)
{
    return;
}

void AggressorAI::RemoveClientVisibility(ObjectGuid guid)
{
    return;
}

// some day we will delete these useless things
int CombatAI::Permissible(const Creature* /*creature*/)
{
    return PERMIT_BASE_NO;
}

int ArcherAI::Permissible(const Creature* /*creature*/)
{
    return PERMIT_BASE_NO;
}

int TurretAI::Permissible(const Creature* /*creature*/)
{
    return PERMIT_BASE_NO;
}

int VehicleAI::Permissible(const Creature* /*creature*/)
{
    return PERMIT_BASE_NO;
}

void CombatAI::InitializeAI()
{
    for (auto templateSpell : me->m_templateSpells)
        if (templateSpell && sSpellMgr->GetSpellInfo(templateSpell))
            spells.push_back(templateSpell);

    CreatureAI::InitializeAI();
}

void CombatAI::Reset()
{
    events.Reset();
}

void CombatAI::JustDied(Unit* killer)
{
    for (auto& spell : spells)
        if (AISpellInfo[spell].condition == AICOND_DIE)
            me->CastSpell(killer, spell, true);
}

void CombatAI::EnterCombat(Unit* who)
{
    for (auto& spell : spells)
    {
        if (AISpellInfo[spell].condition == AICOND_AGGRO)
            me->CastSpell(who, spell, false);
        else if (AISpellInfo[spell].condition == AICOND_COMBAT)
            events.ScheduleEvent(spell, urand(AISpellInfo[spell].cooldown, 2 * AISpellInfo[spell].cooldown));
    }
}

void CombatAI::UpdateAI(uint32 diff)
{
    if (!UpdateVictim())
        return;

    events.Update(diff);

    if (me->getVictim() && me->getVictim()->HasCrowdControlAura(me))
    {
        me->InterruptNonMeleeSpells(false);
        return;
    }

    if (me->HasUnitState(UNIT_STATE_CASTING))
        return;

    if (uint32 spellId = events.ExecuteEvent())
    {
        DoCast(spellId);
        events.ScheduleEvent(spellId, urand(AISpellInfo[spellId].cooldown, 2 * AISpellInfo[spellId].cooldown));
    }
    else
        DoMeleeAttackIfReady();
}

/////////////////
//CasterAI
/////////////////

void CasterAI::InitializeAI()
{
    CombatAI::InitializeAI();

    m_attackDist = MAGIC_RANGE;
    for (auto& spell : spells)
        if (AISpellInfo[spell].condition == AICOND_COMBAT && m_attackDist > GetAISpellInfo(spell)->maxRange)
            m_attackDist = GetAISpellInfo(spell)->maxRange;
    if (m_attackDist < MAGIC_RANGE)
        m_attackDist = MAGIC_RANGE;
}

void CasterAI::EnterCombat(Unit* who)
{
    if (spells.empty())
        return;

    uint32 spell = urand(0, spells.size() - 1);
    uint32 count = 0;
    for (auto itr = spells.begin(); itr != spells.end(); ++itr, ++count)
    {
        if (AISpellInfo[*itr].condition == AICOND_AGGRO)
            me->CastSpell(who, *itr, false);
        else if (AISpellInfo[*itr].condition == AICOND_COMBAT)
        {
            uint32 cooldown = GetAISpellInfo(*itr)->realCooldown;
            if (count == spell)
            {
                DoCast(spells[spell]);
                cooldown += me->GetCurrentSpellCastTime(*itr);
            }
            events.ScheduleEvent(*itr, cooldown);
        }
    }
}

void CasterAI::UpdateAI(uint32 diff)
{
    // UpdateVictim also returns true for a passive creature with a threat list but no victim
    if (!UpdateVictim() || !me->getVictim())
        return;

    events.Update(diff);

    if (me->getVictim()->HasCrowdControlAura(me))
    {
        me->InterruptNonMeleeSpells(false);
        return;
    }

    if (me->HasUnitState(UNIT_STATE_CASTING))
        return;

    if (!events.Empty())
        if (!me->IsWithinLOSInMap(me->getVictim()))
            if (MotionMaster* mMaster = me->GetMotionMaster())
            {
                mMaster->MoveChase(me->getVictim(), 0.001f);
                return;
            }

    if (uint32 spellId = events.ExecuteEvent())
    {
        DoCast(spellId);
        uint32 casttime = me->GetCurrentSpellCastTime(spellId);
        events.ScheduleEvent(spellId, (casttime ? casttime : 500) + GetAISpellInfo(spellId)->realCooldown);
    }
}

//////////////
//ArcherAI
//////////////

ArcherAI::ArcherAI(Creature* c) : CreatureAI(c)
{
    if (!me->m_templateSpells[0])
        TC_LOG_ERROR("misc", "ArcherAI set for creature (entry = %u) with spell1=0. AI will do nothing", me->GetEntry());

    SpellInfo const* spellInfo = sSpellMgr->GetSpellInfo(me->m_templateSpells[0]);
    m_minRange = spellInfo ? spellInfo->GetMinRange(false) : 0;

    if (!m_minRange)
        m_minRange = MELEE_RANGE;
    me->m_CombatDistance = spellInfo ? spellInfo->GetMaxRange(false, me) : 0;
    me->m_SightDistance = me->m_CombatDistance;
}

void ArcherAI::AttackStart(Unit* who)
{
    if (!who)
        return;

    if (me->IsWithinCombatRange(who, m_minRange))
    {
        if (me->Attack(who, true) && !who->IsFlying())
            me->GetMotionMaster()->MoveChase(who);
    }
    else
    {
        if (me->Attack(who, false) && !who->IsFlying())
            me->GetMotionMaster()->MoveChase(who, me->m_CombatDistance);
    }

    if (who->IsFlying())
        me->GetMotionMaster()->MoveIdle();
}

void ArcherAI::UpdateAI(uint32 /*diff*/)
{
    if (!UpdateVictim())
        return;

    if (!me->IsWithinCombatRange(me->getVictim(), m_minRange))
        DoSpellAttackIfReady(me->m_templateSpells[0]);
    else
        DoMeleeAttackIfReady();
}

//////////////
//TurretAI
//////////////

TurretAI::TurretAI(Creature* c) : CreatureAI(c)
{
    if (!me->m_templateSpells[0])
        TC_LOG_ERROR("misc", "TurretAI set for creature (entry = %u) with spell1=0. AI will do nothing", me->GetEntry());

    SpellInfo const* spellInfo = sSpellMgr->GetSpellInfo(me->m_templateSpells[0]);
    m_minRange = spellInfo ? spellInfo->GetMinRange(false) : 0;
    me->m_CombatDistance = spellInfo ? spellInfo->GetMaxRange(false, me) : 0;
    me->m_SightDistance = me->m_CombatDistance;
}

bool TurretAI::CanAIAttack(const Unit* who) const
{
    if (!who || !me->IsWithinCombatRange(who, me->m_CombatDistance) || (m_minRange && me->IsWithinCombatRange(who, m_minRange)))
        return false;
    return true;
}

void TurretAI::AttackStart(Unit* who)
{
    if (who)
        me->Attack(who, false);
}

void TurretAI::UpdateAI(uint32 /*diff*/)
{
    if (!UpdateVictim())
        return;

    DoSpellAttackIfReady(me->m_templateSpells[0]);
}

//////////////
//VehicleAI
//////////////

VehicleAI::VehicleAI(Creature* c) : CreatureAI(c), m_IsVehicleInUse(false), m_ConditionsTimer(VEHICLE_CONDITION_CHECK_TIME)
{
    LoadConditions();
    m_DoDismiss = false;
    m_DismissTimer = VEHICLE_DISMISS_TIME;
}

//NOTE: VehicleAI::UpdateAI runs even while the vehicle is mounted
void VehicleAI::UpdateAI(uint32 diff)
{
    CheckConditions(diff);

    if (m_DoDismiss)
    {
        if (m_DismissTimer < diff)
        {
            m_DoDismiss = false;
            me->SetVisible(false);
            me->DespawnOrUnsummon();
        }
        else m_DismissTimer -= diff;
    }
}

void VehicleAI::Reset()
{
    if (!me->IsVisible())
        me->SetVisible(true);
}

void VehicleAI::OnCharmed(bool apply)
{
    if (m_IsVehicleInUse && !apply && !conditions.empty())//was used and has conditions
    {
        m_DoDismiss = true;//needs reset
        me->RemoveFlag(UNIT_FIELD_NPC_FLAGS, UNIT_NPC_FLAG_PLAYER_VEHICLE);
        me->RemoveFlag(UNIT_FIELD_NPC_FLAGS, UNIT_NPC_FLAG_SPELLCLICK);
    }
    else if (apply)
        m_DoDismiss = false;//in use again
    m_DismissTimer = VEHICLE_DISMISS_TIME;//reset timer
    m_IsVehicleInUse = apply;
}

void VehicleAI::LoadConditions()
{
    conditions = sConditionMgr->GetConditionsForNotGroupedEntry(CONDITION_SOURCE_TYPE_CREATURE_TEMPLATE_VEHICLE, me->GetEntry());
    if (!conditions.empty())
        TC_LOG_DEBUG("condition", "VehicleAI::LoadConditions: loaded %u conditions", uint32(conditions.size()));
}

void VehicleAI::CheckConditions(const uint32 diff)
{
    if (m_ConditionsTimer < diff)
    {
        if (!conditions.empty())
        {
            if (Vehicle* vehicleKit = me->GetVehicleKit())
                for (auto& Seat : vehicleKit->Seats)
                    if (Unit* passenger = ObjectAccessor::GetUnit(*me, Seat.second.Passenger.Guid))
                    {
                        if (Player* player = passenger->ToPlayer())
                        {
                            if (!sConditionMgr->IsObjectMeetToConditions(player, me, conditions))
                            {
                                player->ExitVehicle();
                                return;//check other pessanger in next tick
                            }
                        }
                    }
        }
        m_ConditionsTimer = VEHICLE_CONDITION_CHECK_TIME;
    }
    else m_ConditionsTimer -= diff;
}

int AnyPetAI::Permissible(const Creature* creature)
{
    // have some hostile factions, it will be selected by IsHostileTo check at MoveInLineOfSight
    if (!creature->isCivilian() && !creature->IsNeutralToAll())
        return PERMIT_BASE_PROACTIVE;

    return PERMIT_BASE_NO;
}

// Caster guardians (pet_stats.type: Doomguard, Darkglare) fight from the range of their longest offensive
// spell. Since the pet rework only real pets learn their spells, so a guardian kept melee range, ran into its
// target and cast nothing.
static bool SetGuardianCastRange(Creature* me)
{
    if (!me->GetCasterPet() || me->GetAttackDist() > MELEE_RANGE)
        return false;

    float range = 0.0f;
    for (uint32 spellId : me->m_templateSpells)
        if (SpellInfo const* spellInfo = sSpellMgr->GetSpellInfo(spellId))
            if (!spellInfo->IsPassive() && !spellInfo->IsPositive())
                range = std::max(range, spellInfo->GetMaxRange(false));

    if (range <= MELEE_RANGE)
        return false;

    me->SetAttackDist(range);
    return true;
}

static void CastGuardianSpells(Creature* me)
{
    Unit* victim = me->getVictim();
    if (!victim || me->HasUnitState(UNIT_STATE_CASTING) || me->HasFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_STUNNED))
        return;

    for (uint32 spellId : me->m_templateSpells)
    {
        SpellInfo const* spellInfo = sSpellMgr->GetSpellInfo(spellId);
        if (!spellInfo || spellInfo->IsPassive() || spellInfo->IsPositive() || me->HasCreatureSpellCooldown(spellId))
            continue;

        if (!me->IsWithinDistInMap(victim, spellInfo->GetMaxRange(false)) || !me->IsWithinLOSInMap(victim))
            continue;

        me->CastSpell(victim, spellInfo, false);
        me->AddCreatureSpellCooldown(spellId);
        break;
    }
}

void AnyPetAI::InitializeAI()
{
    CreatureAI::InitializeAI();
    SetGuardianCastRange(me);

    if (PetStats const* pStats = sObjectMgr->GetPetStats(me->GetEntry()))
    {
        if (pStats->state)
            me->SetReactState(ReactStates(pStats->state));
    }
    if (me->GetReactState() == REACT_AGGRESSIVE)
    {
        if (Unit* victim = me->GetTargetUnit())
        {
            if (!me->IsFriendlyTo(victim))
            {
                Unit* owner = me->GetCharmerOrOwner();
                if (owner && !owner->isInCombat())
                    owner->SetInCombatWith(victim);

                if (me->GetCasterPet())
                    AttackStartCaster(victim, me->GetAttackDist() - 0.5f);
                else
                    AttackStart(victim);
            }
        }
    }

    // Update speed as needed to prevent dropping too far behind and despawning
    me->UpdateSpeed(MOVE_RUN, true);
    me->UpdateSpeed(MOVE_WALK, true);
    me->UpdateSpeed(MOVE_FLIGHT, true);
}

void AnyPetAI::UpdateAI(uint32 /*diff*/)
{
    if (!me->IsAlive())
        return;

    if (SetGuardianCastRange(me) && me->getVictim())
        me->GetMotionMaster()->MoveChase(me->getVictim(), me->GetAttackDist() - 0.5f);

    Unit* owner = me->GetCharmerOrOwner();
    Unit* target = me->getAttackerForHelper();
    Unit* targetOwner = nullptr;

    if (!me->HasReactState(REACT_PASSIVE))
    {
        // The unit it was summoned on comes first; the owner's fight only while he is in combat, since
        // getAttackerForHelper falls back on the last unit he swung at, kept long after the fight ended
        if (Unit* summonTarget = me->GetTargetUnit())
            if (summonTarget->IsAlive() && me->IsValidAttackTarget(summonTarget))
                targetOwner = summonTarget;

        if (!targetOwner && owner && owner->isInCombat())
            targetOwner = owner->getAttackerForHelper();

        if (targetOwner != nullptr && targetOwner != target)
        {
            if (me->GetCasterPet())
                AttackStartCaster(targetOwner, me->GetAttackDist() - 0.5f);
            else
                AttackStart(targetOwner);

            // TC_LOG_DEBUG("misc", "AnyPetAI::UpdateAI AttackStart X %f Y %f", me->m_positionX, me->m_positionY);
        }
        else if (me->getVictim() && !me->HasFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_STUNNED))
        {
            // is only necessary to stop casting, the pet must not exit combat
            if (me->getVictim()->HasCrowdControlAura(me))
            {
                me->InterruptNonMeleeSpells(false);
                return;
            }

            if (owner && !owner->isInCombat())
                owner->SetInCombatWith(me->getVictim());

            if (!me->GetCasterPet())
                DoMeleeAttackIfReady();
        }
        else if (owner && !me->HasUnitState(UNIT_STATE_FOLLOW))
        {
            me->GetMotionMaster()->MoveFollow(owner, me->GetFollowDistance(), me->GetFollowAngle());
            // TC_LOG_DEBUG("misc", "AnyPetAI::UpdateAI PET_FOLLOW_DIST");
        }
    }

    if (me->GetCasterPet())
        CastGuardianSpells(me);
    else
        DoMeleeAttackIfReady();
}

void AnyPetAI::MovementInform(uint32 moveType, uint32 data)
{
    //TC_LOG_DEBUG("misc", "AnyPetAI::MovementInform Pet %u moveType %i data %i", me->GetEntry(), moveType, data);
    // Receives notification when pet reaches stay or follow owner
    switch (moveType)
    {
    case POINT_MOTION_TYPE:
    {
        me->GetMotionMaster()->Clear();
        me->GetMotionMaster()->MoveIdle();
        if (me->getVictim() && me->isInCombat())
            me->GetMotionMaster()->MoveChase(me->getVictim(), me->GetAttackDist() - 0.5f);
        if (me->GetCharmerOrOwner() && (!me->getVictim() || !me->isInCombat()))
            me->GetMotionMaster()->MoveFollow(me->GetCharmerOrOwner(), me->GetFollowDistance(), me->GetFollowAngle());
        break;
    }
    default:
        break;
    }
}

int BattlePetAI::Permissible(const Creature* creature)
{
    return PERMIT_BASE_NO;
}

void BattlePetAI::InitializeAI()
{
}

void BattlePetAI::UpdateAI(uint32 diff)
{
    if (!me->IsInWorld() || !me->IsAlive())
        return;

    Unit* owner = me->GetCharmerOrOwner();
    if (owner && !me->HasUnitState(UNIT_STATE_FOLLOW))
        me->GetMotionMaster()->MoveFollow(owner, me->GetFollowDistance(), me->GetFollowAngle());
}

void BattlePetAI::MovementInform(uint32 moveType, uint32 data)
{
    switch (moveType)
    {
    case POINT_MOTION_TYPE:
    {
        me->GetMotionMaster()->Clear();
        me->GetMotionMaster()->MoveIdle();
        if (me->GetCharmerOrOwner())
            me->GetMotionMaster()->MoveFollow(me->GetCharmerOrOwner(), me->GetFollowDistance(), me->GetFollowAngle());
        break;
    }
    default:
        break;
    }
}
