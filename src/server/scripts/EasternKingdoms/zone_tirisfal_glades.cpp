#include "EventProcessor.h"
#include "ObjectAccessor.h"
#include "Player.h"
#include "ScriptMgr.h"
#include "ScriptedCreature.h"
#include "Vehicle.h"

// Quest 26800 "Recruitment" (Deathknell) is implemented in C++ on purpose.
//
// The 7.3.5 client data define spell 91938 ("Summon Darnell") with a single
// SPELL_EFFECT_APPLY_AURA / SPELL_AURA_PERIODIC_DUMMY effect and no summon effect at all
// (verified by unpacking SpellEffect.db2). The SmartAI rows in the world DB therefore can
// never summon Darnell: Saltain casts 91938 on the player, the player just receives a dummy
// aura, and nothing spawns. The DB chain also relies on Darnell existing for the corpse
// rides, so the whole quest stalls at 0/6 corpses.
//
// These scripts provide the whole chain:
//   1740  Deathguard Saltain - on reward ejects Darnell's passengers and dismisses him
//   49337 Darnell            - follows his summoner at run speed, carries corpses on his
//                              vehicle (VehicleId 1392), talks
//   49340 Scarlet Corpse     - spell click summons a riding corpse (49340), credits the
//                              objective and makes it board Darnell with spell 46598

enum Quest26800Actions
{
    ACTION_RELEASE_CORPSES  = 1, // Darnell: eject all corpse passengers
};

// 49337 Darnell
struct npc_darnel_q26800 : public ScriptedAI
{
    npc_darnel_q26800(Creature* creature) : ScriptedAI(creature)
    {
        me->SetReactState(REACT_PASSIVE);
    }

    void IsSummonedBy(Unit* summoner) override
    {
        // SmartAI defaults to walking and the escort could not keep up; always run
        me->SetWalk(false);

        if (summoner)
            me->GetMotionMaster()->MoveFollow(summoner, PET_FOLLOW_DIST, float(PET_FOLLOW_ANGLE));

        Talk(0); // "Hello again."
    }

    void DoAction(int32 const action) override
    {
        if (action != ACTION_RELEASE_CORPSES)
            return;

        if (Vehicle* kit = me->GetVehicleKit())
            for (uint8 seat = 0; seat < 8; ++seat)
                if (Unit* passenger = kit->GetPassenger(seat))
                    passenger->ExitVehicle();
    }

    void PassengerBoarded(Unit* who, int8 /*seatId*/, bool apply) override
    {
        if (!me->GetVehicleKit())
            return;

        // Despawn immediately: the rider is owned by Darnell (see OnSpellClick), and a delayed
        // despawn would fire after Darnell is destroyed on quest abandon/reward, leaving the rider
        // with a dangling summoner (heap corruption).
        if (!apply && who && who->ToCreature())
            who->ToCreature()->DespawnOrUnsummon();
    }
};

// 49340 Scarlet Corpse (world corpse, clickable)
struct npc_scarlet_corpse_q26800 : public ScriptedAI
{
    npc_scarlet_corpse_q26800(Creature* creature) : ScriptedAI(creature)
    {
        me->SetReactState(REACT_PASSIVE);
    }

    bool used = false;

    void Reset() override
    {
        used = false;
    }

    void IsSummonedBy(Unit* /*summoner*/) override
    {
        used = true;
        me->RemoveFlag(UNIT_FIELD_NPC_FLAGS, UNIT_NPC_FLAG_SPELLCLICK);
        me->RemoveAura(92230);
    }

    void OnSpellClick(Unit* who) override
    {
        if (used)
            return;

        Player* player = who->ToPlayer();
        if (!player)
            return;

        // Prefer Darnell from the player's own summon list, fall back to a nearby one
        Creature* darnel = nullptr;
        for (ObjectGuid guid : *player->GetSummonList(49337))
            if (Creature* summon = ObjectAccessor::GetCreature(*player, guid))
            {
                darnel = summon;
                break;
            }

        if (!darnel)
            darnel = me->FindNearestCreature(49337, 30.0f);

        if (!darnel)
            return; // keep the corpse clickable, do not consume the click

        // Summon the rider FROM Darnell: the rider's owner must be Darnell, never this corpse.
        // The corpse despawns right after the click; a rider owned by it would keep a dangling
        // summoner pointer and corrupt the heap when its own despawn timer fires.
        TempSummon* rider = darnel->SummonCreature(49340, me->GetPosition());
        if (!rider)
            return;

        used = true;
        player->KilledMonsterCredit(49340);
        rider->CastSpell(darnel, 46598, true); // Ride Vehicle Hardcoded -> boards Darnell
        me->DespawnOrUnsummon(100);
    }
};

// 1740 Deathguard Saltain
struct npc_deathguard_saltain : public ScriptedAI
{
    npc_deathguard_saltain(Creature* creature) : ScriptedAI(creature)
    {
        me->SetReactState(REACT_PASSIVE);
    }

    void OnQuestReward(Player* player, Quest const* quest) override
    {
        if (quest->GetQuestId() != 26800)
            return;

        GuidList guids = *player->GetSummonList(49337);
        for (ObjectGuid guid : guids)
            if (Creature* darnel = ObjectAccessor::GetCreature(*player, guid))
            {
                if (darnel->IsAIEnabled)
                    darnel->AI()->DoAction(ACTION_RELEASE_CORPSES);

                darnel->DespawnOrUnsummon(3000);
            }
    }
};

// Darnell is a manual-despawn temp summon owned by the player; (re)summon shortly after
// the quest is accepted or, on relog, whenever the quest is active but he is missing.
class DarnellSummonEvent : public BasicEvent
{
public:
    explicit DarnellSummonEvent(ObjectGuid playerGuid) : _playerGuid(playerGuid) { }

    bool Execute(uint64 /*execTime*/, uint32 /*diff*/) override
    {
        Player* player = ObjectAccessor::FindPlayer(_playerGuid);
        if (!player || !player->IsActiveQuest(26800))
            return true;

        if (!player->GetSummonList(49337)->empty())
            return true;

        if (Creature* darnell = player->SummonCreature(49337, *player, TEMPSUMMON_MANUAL_DESPAWN))
            darnell->AI()->Talk(0);

        return true;
    }

private:
    ObjectGuid _playerGuid;
};

class quest_recruitment_q26800 : public PlayerScript
{
public:
    quest_recruitment_q26800() : PlayerScript("quest_recruitment_q26800") { }

    void OnQuestAccept(Player* player, Quest const* quest) override
    {
        if (quest->GetQuestId() != 26800)
            return;

        player->m_Events.AddEvent(new DarnellSummonEvent(player->GetGUID()), player->m_Events.CalculateTime(1000));
    }

    void OnLogin(Player* player) override
    {
        if (!player->IsActiveQuest(26800))
            return;

        player->m_Events.AddEvent(new DarnellSummonEvent(player->GetGUID()), player->m_Events.CalculateTime(2000));
    }

    void OnQuestAbandon(Player* player, Quest const* quest) override
    {
        if (quest->GetQuestId() != 26800)
            return;

        // DespawnOrUnsummon() unregisters the summon from player->GetSummonList() synchronously,
        // so iterating the live list while despawning invalidates the iterators (crash).
        // Copy the guids out first, then despawn each.
        GuidList guids = *player->GetSummonList(49337);
        for (ObjectGuid guid : guids)
            if (Creature* darnell = ObjectAccessor::GetCreature(*player, guid))
                darnell->DespawnOrUnsummon();
    }
};

void AddSC_tirisfal_glades()
{
    RegisterCreatureAI(npc_darnel_q26800);
    RegisterCreatureAI(npc_scarlet_corpse_q26800);
    RegisterCreatureAI(npc_deathguard_saltain);
    new quest_recruitment_q26800();
}
