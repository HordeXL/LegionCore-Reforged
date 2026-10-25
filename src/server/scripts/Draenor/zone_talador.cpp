////////////////////////////////////////////
///                                      ///
///         LEGIONCORE REFORGED          ///
///    Copyright 2026 Titans-Project     ///
///         All Rights Reserved.         ///
///                                      ///
////////////////////////////////////////////

#include "ScriptMgr.h"
#include "ScriptedCreature.h"
#include "GameTime.h"

// Camp at the Auchindoun entrance: defenders, knights, soulpriests and rangers salute all together, at the same second, every 20 seconds
struct npc_talador_camp_salute : public ScriptedAI
{
    explicit npc_talador_camp_salute(Creature* creature) : ScriptedAI(creature) { }

    uint32 lastSlot = 0;

    void Reset() override
    {
        lastSlot = GameTime::GetGameTimeMS() / 20000;
    }

    void UpdateAI(uint32 /*diff*/) override
    {
        if (UpdateVictim())
        {
            DoMeleeAttackIfReady();
            return;
        }

        uint32 slot = GameTime::GetGameTimeMS() / 20000;
        if (slot == lastSlot)
            return;

        lastSlot = slot;
        me->HandleEmoteCommand(EMOTE_ONESHOT_SALUTE);
    }
};

// Laborers and peons of Fort Wrynn and Vol'jin's Pride: a short pause now and then, at a different moment for each,
// so that their hammers and picks do not all strike in time
struct npc_talador_camp_worker : public ScriptedAI
{
    explicit npc_talador_camp_worker(Creature* creature) : ScriptedAI(creature) { }

    uint32 workEmote = 0;
    uint32 pauseTimer = 0;
    uint32 resumeTimer = 0;

    void Reset() override
    {
        pauseTimer = urand(500, 8000);
        resumeTimer = 0;
    }

    void UpdateAI(uint32 diff) override
    {
        if (UpdateVictim())
        {
            DoMeleeAttackIfReady();
            return;
        }

        if (resumeTimer)
        {
            if (resumeTimer > diff)
            {
                resumeTimer -= diff;
                return;
            }
            resumeTimer = 0;
            me->SetUInt32Value(UNIT_FIELD_EMOTE_STATE, workEmote);
            pauseTimer = urand(10000, 25000);
            return;
        }

        if (pauseTimer > diff)
        {
            pauseTimer -= diff;
            return;
        }

        // only the ones put to work by their spawn; the others stand as they are
        workEmote = me->GetUInt32Value(UNIT_FIELD_EMOTE_STATE);
        if (!workEmote)
        {
            pauseTimer = 30000;
            return;
        }
        me->SetUInt32Value(UNIT_FIELD_EMOTE_STATE, 0);
        resumeTimer = urand(600, 2500);
    }
};

void AddSC_wod_talador()
{
    RegisterCreatureAI(npc_talador_camp_salute);
    RegisterCreatureAI(npc_talador_camp_worker);
}
