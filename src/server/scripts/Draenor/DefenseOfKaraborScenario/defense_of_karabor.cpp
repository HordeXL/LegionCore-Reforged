////////////////////////////////////////////
///                                      ///
///         LEGIONCORE REFORGED          ///
///    Copyright 2026 Titans-Project     ///
///         All Rights Reserved.         ///
///                                      ///
////////////////////////////////////////////

// The Defense of Karabor (quest 33256): a private scenario on map 1277, a copy of Karabor.
// Exarch Akama sends the player in; the four steps are Arnokk the Burner, the way to the harbor,
// K'ara's empowerment under waves of the Iron Horde, then Commander Vorka.

#include "ScriptMgr.h"
#include "ScriptedCreature.h"
#include "ScriptedGossip.h"
#include "InstanceScript.h"
#include "SpellScript.h"
#include "Player.h"
#include "Scenario.h"
#include "ScenarioMgr.h"
#include "TemporarySummon.h"
#include "LFGMgr.h"
#include "DatabaseEnv.h"

namespace DefenseOfKarabor
{
    enum Data
    {
        MAP_DEFENSE_OF_KARABOR      = 1277,
        SCENARIO_DEFENSE            = 449,
        LFG_DUNGEON_DEFENSE         = 818,
        QUEST_DEFENSE_OF_KARABOR    = 33256,
        NPC_SCENARIO_CREDIT         = 73772,

        NPC_AKAMA                   = 72413,
        NPC_YREL                    = 73395,
        NPC_KARA                    = 79664,
        NPC_VORKA                   = 74715,
        NPC_ARNOKK                  = 75358,
        NPC_IRON_GRUNT              = 79731,
        NPC_IRON_SHIELDBEARER       = 79732,
        NPC_IRON_BRUTE              = 79719,
        NPC_IRON_BOLTBLASTER        = 79733,

        SPELL_LAUNCH_DEFENSE        = 148425,
        SPELL_CELEBRATION_SCENE     = 173694,
        SPELL_KARAS_BENEVOLENCE     = 149699,

        EVENT_MEET_YREL             = 40077,
        EVENT_KARA_EMPOWERED        = 40209,
        EVENT_VORKA_DEFEATED        = 40049,

        STEP_ARNOKK                 = 0,
        STEP_HARBOR                 = 1,
        STEP_KARA                   = 2,
        STEP_VORKA                  = 3,

        TALK_AKAMA_LAST_FORCES      = 0,
        TALK_AKAMA_TO_THE_HARBOR    = 1,
        TALK_YREL_DEFEND_KARA       = 3,
        TALK_YREL_KARA_EMPOWERED    = 4,
        TALK_YREL_THANKS            = 6,
        TALK_YREL_LIGHT_PREVAILS    = 7,
        TALK_VORKA_LANDS            = 3,
        TALK_VORKA_WAVE             = 4,

        WAVE_COUNT                  = 6,
        WAVE_INTERVAL               = 20 * IN_MILLISECONDS,
        DEFENSE_MAX_DURATION        = 3 * MINUTE * IN_MILLISECONDS,
        EXIT_SCENE_DELAY            = 8 * IN_MILLISECONDS,
        EXIT_TELEPORT_DELAY         = 25 * IN_MILLISECONDS,
    };

    Position const EnterPosition   = { 980.3f, -2921.1f, 99.4f, 2.64f };      // beside Exarch Akama, at the temple gates
    Position const ExitPosition    = { 936.907f, -833.35f, -28.8338f, 3.95473f }; // Embaari Village, where Yrel waits
    Position const WaveSpawns[2]   = { { 492.8f, -3067.9f, 58.4f, 6.05f }, { 666.4f, -3066.2f, 58.4f, 3.14f } };
    uint32 const WaveUnits[WAVE_COUNT][3] =
    {
        { NPC_IRON_GRUNT,       NPC_IRON_GRUNT,        NPC_IRON_BOLTBLASTER },
        { NPC_IRON_GRUNT,       NPC_IRON_SHIELDBEARER, NPC_IRON_BOLTBLASTER },
        { NPC_IRON_SHIELDBEARER, NPC_IRON_GRUNT,       NPC_IRON_GRUNT       },
        { NPC_IRON_BRUTE,       NPC_IRON_GRUNT,        NPC_IRON_BOLTBLASTER },
        { NPC_IRON_SHIELDBEARER, NPC_IRON_BOLTBLASTER, NPC_IRON_BOLTBLASTER },
        { NPC_IRON_BRUTE,       NPC_IRON_SHIELDBEARER, NPC_IRON_GRUNT       },
    };

    // the player is marked for the right scenario of the map, then the map builds it with its step tracker
    void EnterScenario(Player* player)
    {
        if (!player || player->GetMapId() == MAP_DEFENSE_OF_KARABOR || player->GetQuestStatus(QUEST_DEFENSE_OF_KARABOR) != QUEST_STATUS_INCOMPLETE)
            return;

        player->SetScenarioId(SCENARIO_DEFENSE);
        if (!player->TeleportTo(MAP_DEFENSE_OF_KARABOR, EnterPosition.GetPositionX(), EnterPosition.GetPositionY(), EnterPosition.GetPositionZ(), EnterPosition.GetOrientation()))
        {
            player->SetScenarioId(0);
            TC_LOG_ERROR("scripts", "Defense of Karabor: %s could not be sent into the scenario (map %u refused)", player->GetName(), uint32(MAP_DEFENSE_OF_KARABOR));
        }
    }
}

using namespace DefenseOfKarabor;

class instance_defense_of_karabor : public InstanceMapScript
{
public:
    instance_defense_of_karabor() : InstanceMapScript("instance_defense_of_karabor", MAP_DEFENSE_OF_KARABOR) { }

    struct instance_defense_of_karabor_InstanceMapScript : public InstanceScript
    {
        instance_defense_of_karabor_InstanceMapScript(InstanceMap* map) : InstanceScript(map) { }

        ObjectGuid _akamaGUID, _yrelGUID, _karaGUID, _vorkaGUID, _arnokkGUID;
        GuidList _waveGUIDs;
        uint32 _checkTimer = IN_MILLISECONDS;
        uint32 _waveTimer = 0;
        uint32 _defenseTimer = 0;
        uint32 _exitTimer = 0;
        uint8 _wavesSent = 0;
        uint8 _lastStep = STEP_ARNOKK;
        bool _defenseStarted = false;
        bool _vorkaReleased = false;
        bool _completed = false;
        bool _sceneShown = false;
        bool _restoreChecked = false;

        void OnCreatureCreate(Creature* creature) override
        {
            InstanceScript::OnCreatureCreate(creature);

            switch (creature->GetEntry())
            {
                case NPC_AKAMA: _akamaGUID = creature->GetGUID(); break;
                case NPC_ARNOKK:
                    _arnokkGUID = creature->GetGUID();
                    creature->SetRespawnDelay(DAY);    // the courtyard stays free once he has fallen
                    break;
                case NPC_YREL:  _yrelGUID = creature->GetGUID(); break;
                case NPC_KARA:  _karaGUID = creature->GetGUID(); break;
                case NPC_VORKA:
                    _vorkaGUID = creature->GetGUID();
                    // circles the harbor out of reach until the last step
                    creature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_IMMUNE_TO_PC);
                    break;
                default:
                    break;
            }
        }

        void OnPlayerEnter(Player* player) override
        {
            InstanceScript::OnPlayerEnter(player);

            // logging back in after a server restart: the instance is new and nothing queued it, the scenario starts here
            if (!GetScenario() && player->GetQuestStatus(QUEST_DEFENSE_OF_KARABOR) == QUEST_STATUS_INCOMPLETE)
                if (Scenario* scenario = sScenarioMgr->AddScenario(instance, SCENARIO_DEFENSE))
                {
                    scenario->SetCompleteThroughBonusSteps(false);
                    scenario->SendStepUpdate(player, true);
                }

            if (Creature* akama = instance->GetCreature(_akamaGUID))
                if (Scenario* scenario = GetScenario())
                    if (scenario->GetCurrentStep() == STEP_ARNOKK)
                        akama->AI()->Talk(TALK_AKAMA_LAST_FORCES, player->GetGUID());
        }

        Scenario* GetScenario() const
        {
            Scenario* scenario = sScenarioMgr->GetScenario(instance->GetInstanceId());
            return scenario && scenario->GetMap() == instance ? scenario : nullptr;
        }

        Player* GetReferencePlayer() const
        {
            Map::PlayerList const& players = instance->GetPlayers();
            return players.isEmpty() ? nullptr : players.begin()->getSource();
        }

        void SendScenarioEvent(uint32 eventId)
        {
            Scenario* scenario = GetScenario();
            Player* reference = GetReferencePlayer();
            if (scenario && reference)
                scenario->UpdateAchievementCriteria(CRITERIA_TYPE_SCRIPT_EVENT_2, eventId, 0, 0, nullptr, reference);
        }

        void OnUnitDeath(Unit* unit) override
        {
            if (unit->GetEntry() == NPC_VORKA)
                SendScenarioEvent(EVENT_VORKA_DEFEATED);
        }

        // the step reached survives a server restart: a new instance resumes there
        void SaveStep(uint8 step)
        {
            instance->ApplyOnEveryPlayer([step](Player* player)
            {
                CharacterDatabase.PExecute("REPLACE INTO character_scenario_step (guid, scenario, step) VALUES (" UI64FMTD ", %u, %u)",
                    uint64(player->GetGUIDLow()), uint32(SCENARIO_DEFENSE), uint32(step));
            });
        }

        void RestoreStep(Scenario* scenario)
        {
            Player* player = GetReferencePlayer();
            if (!player)
                return;

            _restoreChecked = true;
            QueryResult result = CharacterDatabase.PQuery("SELECT step FROM character_scenario_step WHERE guid = " UI64FMTD " AND scenario = %u",
                uint64(player->GetGUIDLow()), uint32(SCENARIO_DEFENSE));
            if (!result)
                return;

            uint8 step = result->Fetch()[0].GetUInt8();
            if (step <= scenario->GetCurrentStep() || step > STEP_VORKA)
                return;

            scenario->SetCurrentStep(step);
            if (Creature* arnokk = instance->GetCreature(_arnokkGUID))
                if (arnokk->IsAlive())
                    arnokk->DespawnOrUnsummon(0, Seconds(DAY));
        }

        void OnStepChanged(uint8 step)
        {
            SaveStep(step);

            switch (step)
            {
                case STEP_HARBOR:
                    if (Creature* akama = instance->GetCreature(_akamaGUID))
                        akama->AI()->Talk(TALK_AKAMA_TO_THE_HARBOR);
                    break;
                case STEP_KARA:
                    StartDefense();
                    break;
                case STEP_VORKA:
                    ReleaseVorka();
                    break;
                default:
                    break;
            }
        }

        void StartDefense()
        {
            if (_defenseStarted)
                return;

            _defenseStarted = true;
            _wavesSent = 0;
            _waveTimer = 5 * IN_MILLISECONDS;
            _defenseTimer = DEFENSE_MAX_DURATION;

            if (Creature* yrel = instance->GetCreature(_yrelGUID))
                yrel->AI()->Talk(TALK_YREL_DEFEND_KARA);

            instance->ApplyOnEveryPlayer([](Player* player)
            {
                player->AddAura(SPELL_KARAS_BENEVOLENCE, player);
            });
        }

        void SendWave()
        {
            Creature* kara = instance->GetCreature(_karaGUID);
            if (!kara)
                return;

            Position const& from = WaveSpawns[_wavesSent % 2];
            for (uint8 i = 0; i < 3; ++i)
            {
                Position pos = from;
                pos.m_positionX += frand(-3.0f, 3.0f);
                pos.m_positionY += frand(-3.0f, 3.0f);
                // summoned by K'ara so the attackers share her phase
                if (TempSummon* unit = kara->SummonCreature(WaveUnits[_wavesSent][i], pos, TEMPSUMMON_CORPSE_TIMED_DESPAWN, 10 * IN_MILLISECONDS))
                {
                    _waveGUIDs.push_back(unit->GetGUID());
                    float x, y, z;
                    kara->GetNearPoint(unit, x, y, z, unit->GetObjectSize(), 6.0f, kara->GetAngle(unit));
                    unit->GetMotionMaster()->MovePoint(0, x, y, z);
                }
            }

            if (Creature* vorka = instance->GetCreature(_vorkaGUID))
                vorka->AI()->Talk(TALK_VORKA_WAVE);

            ++_wavesSent;
        }

        bool WavesAlive()
        {
            for (ObjectGuid const& guid : _waveGUIDs)
                if (Creature* unit = instance->GetCreature(guid))
                    if (unit->IsAlive())
                        return true;
            return false;
        }

        void FinishDefense()
        {
            _defenseStarted = false;
            SendScenarioEvent(EVENT_KARA_EMPOWERED);

            // the naaru's light sweeps the harbor once empowered
            for (ObjectGuid const& guid : _waveGUIDs)
                if (Creature* unit = instance->GetCreature(guid))
                    if (unit->IsAlive())
                        unit->DespawnOrUnsummon();
            _waveGUIDs.clear();

            if (Creature* yrel = instance->GetCreature(_yrelGUID))
                yrel->AI()->Talk(TALK_YREL_KARA_EMPOWERED);
        }

        void ReleaseVorka()
        {
            if (_vorkaReleased)
                return;

            Creature* vorka = instance->GetCreature(_vorkaGUID);
            Creature* kara = instance->GetCreature(_karaGUID);
            if (!vorka || !kara)
                return;

            _vorkaReleased = true;
            vorka->AI()->Talk(TALK_VORKA_LANDS);

            // lands between the naaru and the bay, then fights on foot
            float angle = kara->GetAngle(vorka);
            float x = kara->GetPositionX() + 25.0f * std::cos(angle);
            float y = kara->GetPositionY() + 25.0f * std::sin(angle);
            float z = instance->GetHeight(vorka->GetPhases(), x, y, vorka->GetPositionZ() + 10.0f);
            vorka->GetMotionMaster()->Clear();
            vorka->SetHomePosition(x, y, z, angle + float(M_PI));
            vorka->GetMotionMaster()->MoveLand(1, Position(x, y, z));
            vorka->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_IMMUNE_TO_PC);
        }

        void Complete()
        {
            _completed = true;

            instance->ApplyOnEveryPlayer([](Player* player)
            {
                CharacterDatabase.PExecute("DELETE FROM character_scenario_step WHERE guid = " UI64FMTD " AND scenario = %u",
                    uint64(player->GetGUIDLow()), uint32(SCENARIO_DEFENSE));
            });
            _exitTimer = EXIT_TELEPORT_DELAY;

            instance->ApplyOnEveryPlayer([](Player* player)
            {
                player->KilledMonsterCredit(NPC_SCENARIO_CREDIT);
                player->RemoveAurasDueToSpell(SPELL_KARAS_BENEVOLENCE);
            });

            if (Creature* yrel = instance->GetCreature(_yrelGUID))
            {
                yrel->AI()->Talk(TALK_YREL_THANKS);
                yrel->AI()->Talk(TALK_YREL_LIGHT_PREVAILS);
            }
        }

        void Update(uint32 diff) override
        {
            if (_completed)
            {
                if (_exitTimer <= diff)
                {
                    _exitTimer = 0;
                    // Raindash carries the hero back to Embaari Village
                    instance->ApplyOnEveryPlayer([](Player* player)
                    {
                        player->TeleportTo(1116, ExitPosition.GetPositionX(), ExitPosition.GetPositionY(), ExitPosition.GetPositionZ(), ExitPosition.GetOrientation());
                    });
                    return;
                }

                _exitTimer -= diff;
                if (!_sceneShown && _exitTimer <= EXIT_TELEPORT_DELAY - EXIT_SCENE_DELAY)
                {
                    _sceneShown = true;
                    instance->ApplyOnEveryPlayer([](Player* player)
                    {
                        player->CastSpell(player, SPELL_CELEBRATION_SCENE, true);
                    });
                }
                return;
            }

            if (_defenseStarted)
            {
                if (_wavesSent < WAVE_COUNT)
                {
                    if (_waveTimer <= diff)
                    {
                        SendWave();
                        _waveTimer = WAVE_INTERVAL;
                    }
                    else
                        _waveTimer -= diff;
                }

                _defenseTimer = _defenseTimer > diff ? _defenseTimer - diff : 0;
                if ((_wavesSent >= WAVE_COUNT && !WavesAlive()) || !_defenseTimer)
                    FinishDefense();
            }

            if (_checkTimer > diff)
            {
                _checkTimer -= diff;
                return;
            }
            _checkTimer = IN_MILLISECONDS;

            Scenario* scenario = GetScenario();
            if (!scenario)
                return;

            if (scenario->IsCompleted(false))
            {
                Complete();
                return;
            }

            if (!_restoreChecked)
                RestoreStep(scenario);

            uint8 step = scenario->GetCurrentStep();
            if (step != _lastStep)
            {
                _lastStep = step;
                OnStepChanged(step);
            }

            // reaching Yrel at the harbor
            if (step == STEP_HARBOR)
                if (Creature* yrel = instance->GetCreature(_yrelGUID))
                    if (yrel->SelectNearestPlayer(15.0f))
                        SendScenarioEvent(EVENT_MEET_YREL);
        }
    };

    InstanceScript* GetInstanceScript(InstanceMap* map) const override
    {
        return new instance_defense_of_karabor_InstanceMapScript(map);
    }
};

// 75358 - Arnokk the Burner: sweeps the northern courtyard with his flamethrower, spins it around himself in a fight
class npc_arnokk_the_burner : public CreatureScript
{
public:
    npc_arnokk_the_burner() : CreatureScript("npc_arnokk_the_burner") { }

    enum
    {
        SPELL_BURN              = 149378,   // cone in front of him
        SPELL_FIERY_BLAST       = 151732,   // torrent of flame, then the flame line below
        SPELL_FIERY_BLAST_LINE  = 151731,   // 6 s line of fire attached to him (areatrigger 1400)
        SPELL_SCORCHED_EARTH    = 151766,

        TALK_AGGRO              = 1,
        TALK_DEATH              = 2,
        TALK_ABILITY            = 4,

        EVENT_WALK              = 1,
        EVENT_SWEEP_START,
        EVENT_SWEEP_STEP,
        EVENT_BURN,
        EVENT_FIERY_BLAST,
        EVENT_SPIN_START,
        EVENT_SPIN_STEP,
        EVENT_SCORCHED_EARTH,

        POINT_STATION           = 1,
        FLAME_STEPS             = 24,       // over the 6 s of the flame line
    };

    // where he was seen working the courtyard
    static Position const* Stations()
    {
        static Position const stations[4] =
        {
            { 858.6f, -2858.1f, 100.6f, 0.86f },
            { 830.5f, -2875.5f, 100.5f, 3.03f },
            { 818.9f, -2904.1f, 100.6f, 4.71f },
            { 819.0f, -2874.9f, 101.0f, 3.54f },
        };
        return stations;
    }

    struct npc_arnokk_the_burnerAI : public ScriptedAI
    {
        npc_arnokk_the_burnerAI(Creature* creature) : ScriptedAI(creature) { }

        EventMap _events;
        uint8 _station = 0;
        uint8 _step = 0;
        float _facing = 0.0f;
        bool _spinning = false;

        void Reset() override
        {
            _events.Reset();
            _spinning = false;
            me->SetReactState(REACT_AGGRESSIVE);
            _events.ScheduleEvent(EVENT_WALK, urand(2, 5) * IN_MILLISECONDS);
        }

        void EnterCombat(Unit* /*who*/) override
        {
            _events.Reset();
            Talk(TALK_AGGRO);
            _events.ScheduleEvent(EVENT_BURN, urand(6, 9) * IN_MILLISECONDS);
            _events.ScheduleEvent(EVENT_FIERY_BLAST, urand(12, 15) * IN_MILLISECONDS);
            _events.ScheduleEvent(EVENT_SCORCHED_EARTH, urand(16, 20) * IN_MILLISECONDS);
        }

        void JustDied(Unit* /*killer*/) override
        {
            Talk(TALK_DEATH);
        }

        void MovementInform(uint32 type, uint32 id) override
        {
            if (type == POINT_MOTION_TYPE && id == POINT_STATION && !me->isInCombat())
                _events.ScheduleEvent(EVENT_SWEEP_START, 500);
        }

        void UpdateAI(uint32 diff) override
        {
            _events.Update(diff);

            if (!me->isInCombat())
            {
                while (uint32 eventId = _events.ExecuteEvent())
                {
                    switch (eventId)
                    {
                        case EVENT_WALK:
                        {
                            _station = (_station + 1 + urand(0, 2)) % 4;
                            Position const& pos = Stations()[_station];
                            me->GetMotionMaster()->MovePoint(POINT_STATION, pos.GetPositionX(), pos.GetPositionY(), pos.GetPositionZ());
                            break;
                        }
                        case EVENT_SWEEP_START:
                            // a slow sweep, from one side to the other
                            _facing = Stations()[_station].GetOrientation() - float(M_PI) / 3.0f + frand(-0.5f, 0.5f);
                            me->SetFacingTo(_facing);
                            me->CastSpell(me, SPELL_FIERY_BLAST_LINE, true);
                            _step = 0;
                            _events.ScheduleEvent(EVENT_SWEEP_STEP, 250);
                            break;
                        case EVENT_SWEEP_STEP:
                            _facing += (2.0f * float(M_PI) / 3.0f) / FLAME_STEPS;
                            me->SetFacingTo(_facing);
                            if (++_step < FLAME_STEPS)
                                _events.ScheduleEvent(EVENT_SWEEP_STEP, 250);
                            else
                                _events.ScheduleEvent(EVENT_WALK, urand(3, 6) * IN_MILLISECONDS);
                            break;
                        default:
                            break;
                    }
                }
                return;
            }

            // the flame line turns with him, faster than one can run
            if (_spinning)
            {
                while (uint32 eventId = _events.ExecuteEvent())
                {
                    if (eventId != EVENT_SPIN_STEP)
                    {
                        _events.ScheduleEvent(eventId, 1000);
                        continue;
                    }

                    _facing += 2.0f * float(M_PI) / FLAME_STEPS;
                    me->SetFacingTo(_facing);
                    if (++_step < FLAME_STEPS)
                        _events.ScheduleEvent(EVENT_SPIN_STEP, 250);
                    else
                    {
                        _spinning = false;
                        me->SetReactState(REACT_AGGRESSIVE);
                        if (Unit* victim = me->SelectVictim())
                            AttackStart(victim);
                    }
                }
                return;
            }

            if (!UpdateVictim())
                return;

            if (me->HasUnitState(UNIT_STATE_CASTING))
                return;

            while (uint32 eventId = _events.ExecuteEvent())
            {
                switch (eventId)
                {
                    case EVENT_BURN:
                        if (urand(0, 1))
                            Talk(TALK_ABILITY);
                        DoCastVictim(SPELL_BURN);
                        _events.ScheduleEvent(EVENT_BURN, urand(10, 14) * IN_MILLISECONDS);
                        return;
                    case EVENT_FIERY_BLAST:
                        Talk(TALK_ABILITY);
                        DoCastVictim(SPELL_FIERY_BLAST);
                        _events.ScheduleEvent(EVENT_SPIN_START, 2600);  // once the 2.5 s cast has lit the flame line
                        _events.ScheduleEvent(EVENT_FIERY_BLAST, urand(18, 22) * IN_MILLISECONDS);
                        return;
                    case EVENT_SPIN_START:
                        if (!me->HasAura(SPELL_FIERY_BLAST_LINE))   // the cast was interrupted
                            break;
                        _spinning = true;
                        _step = 0;
                        _facing = me->GetOrientation();
                        me->SetReactState(REACT_PASSIVE);
                        me->AttackStop();
                        me->GetMotionMaster()->Clear();
                        me->GetMotionMaster()->MoveIdle();
                        _events.ScheduleEvent(EVENT_SPIN_STEP, 250);
                        return;
                    case EVENT_SCORCHED_EARTH:
                        DoCast(me, SPELL_SCORCHED_EARTH);
                        _events.ScheduleEvent(EVENT_SCORCHED_EARTH, urand(15, 20) * IN_MILLISECONDS);
                        return;
                    default:
                        break;
                }
            }

            DoMeleeAttackIfReady();
        }
    };

    CreatureAI* GetAI(Creature* creature) const override
    {
        return new npc_arnokk_the_burnerAI(creature);
    }
};

// 148425 - Launch Defense of Karabor
class spell_defense_of_karabor_launch : public SpellScriptLoader
{
public:
    spell_defense_of_karabor_launch() : SpellScriptLoader("spell_defense_of_karabor_launch") { }

    class spell_defense_of_karabor_launch_SpellScript : public SpellScript
    {
        PrepareSpellScript(spell_defense_of_karabor_launch_SpellScript);

        void HandleAfterCast()
        {
            if (Unit* caster = GetCaster())
                EnterScenario(caster->ToPlayer());
        }

        void Register() override
        {
            AfterCast += SpellCastFn(spell_defense_of_karabor_launch_SpellScript::HandleAfterCast);
        }
    };

    SpellScript* GetSpellScript() const override
    {
        return new spell_defense_of_karabor_launch_SpellScript();
    }
};

// 72413 - Exarch Akama, at the temple gates: offers the scenario while the quest is in progress, again after a death or a hearthstone
class npc_karabor_exarch_akama : public CreatureScript
{
public:
    npc_karabor_exarch_akama() : CreatureScript("npc_karabor_exarch_akama") { }

    enum
    {
        GOSSIP_MENU_ENTER   = 65010,      // gossip_menu_option: "I am ready to defend Karabor."
        GOSSIP_ACTION_ENTER = GOSSIP_ACTION_INFO_DEF + 1,
    };

    bool OnGossipHello(Player* player, Creature* creature) override
    {
        if (creature->GetMapId() == MAP_DEFENSE_OF_KARABOR || player->GetQuestStatus(QUEST_DEFENSE_OF_KARABOR) != QUEST_STATUS_INCOMPLETE)
            return false;

        if (creature->isQuestGiver())
            player->PrepareQuestMenu(creature->GetGUID());
        player->ADD_GOSSIP_ITEM_DB(GOSSIP_MENU_ENTER, 0, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_ENTER);
        player->SEND_GOSSIP_MENU(player->GetGossipTextId(creature), creature->GetGUID());
        return true;
    }

    bool OnGossipSelect(Player* player, Creature* /*creature*/, uint32 /*sender*/, uint32 action) override
    {
        player->CLOSE_GOSSIP_MENU();
        // the scenario is offered like a dungeon finder proposal, which the player accepts to enter
        if (action == GOSSIP_ACTION_ENTER)
        {
            lfg::LfgDungeonSet dungeons;
            dungeons.insert(LFG_DUNGEON_DEFENSE);
            sLFGMgr->JoinLfg(player, player->GetSpecializationRoleMaskForGroup(), dungeons);
        }
        return true;
    }
};

// abandoning the quest starts the scenario over
class playerscript_defense_of_karabor : public PlayerScript
{
public:
    playerscript_defense_of_karabor() : PlayerScript("playerscript_defense_of_karabor") { }

    void OnQuestAbandon(Player* player, Quest const* quest) override
    {
        if (quest->GetQuestId() == QUEST_DEFENSE_OF_KARABOR)
            CharacterDatabase.PExecute("DELETE FROM character_scenario_step WHERE guid = " UI64FMTD " AND scenario = %u",
                uint64(player->GetGUIDLow()), uint32(SCENARIO_DEFENSE));
    }
};

void AddSC_defense_of_karabor()
{
    new instance_defense_of_karabor();
    new npc_arnokk_the_burner();
    new spell_defense_of_karabor_launch();
    new npc_karabor_exarch_akama();
    new playerscript_defense_of_karabor();
}
