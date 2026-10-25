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

void AddSC_wod_talador()
{
    RegisterCreatureAI(npc_talador_camp_salute);
}
