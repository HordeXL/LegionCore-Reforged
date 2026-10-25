////////////////////////////////////////////
///                                      ///
///         LEGIONCORE REFORGED          ///
///    Copyright 2026 Titans-Project     ///
///         All Rights Reserved.         ///
///                                      ///
////////////////////////////////////////////

// The Battle for Shattrath (quests 34099 and 33731): a private scenario on map 1207, a copy of Shattrath
// taken by the Iron Horde. The player walks through the Arch of Sha'tar; Thaelin's Iron Star rolls down to
// the harbor, Khadgar clears the docks, the hero sinks the battleship's crew and faces Blackhand on his flagship.

#include "ScriptMgr.h"
#include "ScriptedCreature.h"
#include "ScriptedGossip.h"
#include "InstanceScript.h"
#include "ObjectAccessor.h"
#include "Player.h"
#include "Scenario.h"
#include "ScenarioMgr.h"
#include "TemporarySummon.h"
#include "Vehicle.h"
#include "MoveSpline.h"
#include "MoveSplineInit.h"
#include "DatabaseEnv.h"

namespace BattleForShattrath
{
    enum Data
    {
        MAP_TALADOR                 = 1116,
        MAP_SHATTRATH_SCENARIO      = 1207,
        SCENARIO_SHATTRATH          = 331,
        QUEST_BATTLE_ALLIANCE       = 34099,
        QUEST_BATTLE_HORDE          = 33731,
        MOVIE_BATTLE_FOR_SHATTRATH  = 188,

        NPC_KHADGAR_TALADOR         = 75805,
        NPC_GAZLOWE                 = 77191,
        NPC_THAELIN                 = 77192,
        NPC_DUROTAN                 = 77193,
        NPC_DRAKA                   = 77194,
        NPC_KHADGAR                 = 77195,
        NPC_MARAAD                  = 77196,
        NPC_YREL                    = 77197,
        NPC_SHATTRATH_DEFENDER      = 77199,
        NPC_GROMKAR_VANGUARD        = 77202,
        NPC_GROMKAR_GRIMSHOT        = 77203,
        NPC_GROMKAR_SHADOWBLADE     = 77204,
        NPC_BURNING_BLADEMASTER     = 77205,
        NPC_GROMKAR_DEADEYE         = 77207,
        NPC_BLACKHAND               = 77256,
        NPC_ORGRIM                  = 77257,
        NPC_MACHINIST_BRANDT        = 80962,
        NPC_BLACKROCK_BOMB          = 84206,
        NPC_GROMKAR_GRENADIER       = 84630,
        NPC_IRON_STAR_RIDE          = 86671,
        NPC_IRON_STAR_SHELTER       = 86712,
        NPC_IRON_BRUTE              = 83492,
        NPC_DOCKS_BLADEMASTER       = 83636,
        NPC_DOCKS_VANGUARD          = 83637,
        NPC_DOCKS_GRIMSHOT          = 83638,
        NPC_DOCKS_SHADOWBLADE       = 83639,
        NPC_WAVE_GRIMSHOT           = 83805,
        NPC_WAVE_VANGUARD           = 83806,
        NPC_WAVE_BLADEMASTER        = 83807,
        NPC_FIREBLADE_INVOKER       = 83811,
        NPC_WAVE_SHADOWBLADE        = 84359,
        NPC_BOMB_PICKUP             = 84092,
        NPC_BIG_CANNON              = 84229,
        GO_SHIP_TURRET              = 2601301,  // Iron Horde Turret, the twin guns on top of each ship (its firing is the model's Custom1)
        NPC_AIR_DEFENSE_CRYSTAL     = 84752,
        SPELL_CRYSTAL_LASER         = 169459,   // the crystal lasers an incoming shell down, as in Talador
        NPC_TURRET_MUZZLE           = 900131,   // invisible mark on each turret the shells leave from
        GO_PORTAL_TO_TALADOR        = 231620,

        SPELL_TIME_STOP             = 167264,   // Khadgar's 90 second spell: the Iron Horde is left hanging in the air
        SPELL_ARCANE_BLAST_VISUAL   = 63660,
        SPELL_DECK_FIRE             = 156191,   // Cosmetic - Large Fire 6FX
        SPELL_STRUCTURE_EXPLOSION   = 188744,
        SPELL_FIRE_EXPLOSION        = 120682,   // Horde Intro Cannonfire HITS: a shell bursting, with its blast
        SPELL_SHELL_IN_FLIGHT       = 86527,    // the shell on its way, as with Talador's air defense crystals
        NPC_INVISIBLE_STALKER       = 32780,
        SPELL_SHOULDER_CHARGE       = 157843,
        SPELL_HIDE_PIERCING_SHOT    = 157013,
        SPELL_STORMSTRIKE           = 160769,
        SPELL_WHIRLWIND             = 166782,
        SPELL_RIFLE_SHOT            = 159085,
        SPELL_LAVA_BURST            = 162074,
        SPELL_MORTAR_SHOT           = 159107,
        SPELL_BLACKROCK_GRENADES    = 160703,   // a bomb in hand: the action bar offers to throw it
        SPELL_BLACKROCK_GRENADE     = 161060,

        EVENT_TALK_TO_THAELIN       = 42809,
        EVENT_ENTER_IRON_STAR       = 42033,
        EVENT_REACH_HARBOR          = 42032,
        EVENT_TALK_TO_KHADGAR       = 42109,
        EVENT_PROTECT_KHADGAR       = 41623,
        EVENT_CONFRONT_BLACKHAND    = 41842,
        EVENT_TELEPORT_BATTLESHIP   = 40692,
        EVENT_BRANDT_DEFEATED       = 39193,
        EVENT_TELEPORT_FLAGSHIP     = 42038,
        EVENT_SURVIVE_BLACKHAND     = 40688,

        STEP_PREPARATIONS           = 0,
        STEP_IRON_STAR              = 1,
        STEP_BATTLE_IS_JOINED       = 2,
        STEP_IRON_HARBOR            = 3,
        STEP_THE_WEAPON             = 4,
        STEP_BLACKHAND              = 5,

        DATA_TALKED_TO_THAELIN      = 1,
        DATA_ENTERED_IRON_STAR      = 2,
        DATA_RIDE_ARRIVED           = 3,
        DATA_TALKED_TO_KHADGAR      = 4,
        DATA_TELEPORT_BATTLESHIP    = 5,
        DATA_TELEPORT_FLAGSHIP      = 6,
        DATA_BLACKHAND_DONE         = 7,
        DATA_CONFRONTED             = 8,
        DATA_STAR_RIDER             = 9,
        DISPLAY_IRON_STAR           = 56345,
        NPC_SHELL_IMPACT            = 900130,   // invisible mark the turrets' shells fly to, seen from afar

        CHANNEL_DURATION            = 90 * IN_MILLISECONDS,
        WAVE_INTERVAL               = 15 * IN_MILLISECONDS,
        EXIT_PORTAL_DELAY           = 8 * IN_MILLISECONDS,
    };

    // creature_text groups
    enum Talks
    {
        SAY_KHADGAR_TALADOR_ACCEPT  = 0,
        SAY_KHADGAR_CLEAR_THE_WAY   = 0,
        SAY_KHADGAR_FINISHED        = 1,
        SAY_KHADGAR_SPEAK_WITH_ME   = 2,
        SAY_KHADGAR_HELP_BLACKHAND  = 3,
        SAY_MARAAD_FOR_SHATTRATH    = 0,
        SAY_MARAAD_NO_MERCY         = 1,
        SAY_MARAAD_FORWARD          = 2,
        SAY_YREL_STEEL_YOURSELVES   = 0,
        SAY_YREL_CANNOT_HOLD        = 1,
        SAY_YREL_HAVE_HOPE          = 2,
        SAY_YREL_HOLD_OFF_BLACKHAND = 3,
        SAY_DUROTAN_DO_NOT_WAVER    = 0,
        SAY_DUROTAN_MORE_TIME       = 1,
        SAY_DUROTAN_SURVIVORS       = 2,
        SAY_DUROTAN_BROTHER         = 3,
        SAY_DRAKA_GUARD_UP          = 0,
        SAY_DRAKA_OF_COURSE         = 1,
        SAY_ORGRIM_INNOCENTS        = 0,
        SAY_ORGRIM_YOU_MUST_STOP    = 1,
        SAY_BLACKHAND_INNOCENT      = 0,
        SAY_BLACKHAND_DRAENOR_BURN  = 1,
        SAY_BLACKHAND_ALL_YOU_HAVE  = 2,
        SAY_BLACKHAND_WEAK          = 3,
        SAY_BLACKHAND_PLAY_WITH_FIRE = 4,
        EMOTE_BLACKHAND_MARKED      = 5,
        SAY_BRANDT_NUISANCE         = 0,
        SAY_BRANDT_END_THIS         = 1,
        SAY_BRANDT_TAKE_YOU_OUT     = 2,
    };

    enum Gossips
    {
        GOSSIP_MENU_THAELIN         = 17094,    // "Thanks. I'll meet them at the docks."
        GOSSIP_MENU_ENTER           = 65011,    // Talador, Khadgar: "Let us retake Shattrath."
        GOSSIP_MENU_BEGIN_SPELL     = 65012,    // "Begin your spell. I'll protect you!"
        GOSSIP_MENU_BATTLESHIP      = 65013,    // "I am ready to teleport to the ship."
        GOSSIP_MENU_FLAGSHIP        = 65014,    // "Then let's hurry!"
        TEXT_KHADGAR_HARBOR         = 24547,
        TEXT_KHADGAR_BATTLESHIP     = 24506,
        TEXT_KHADGAR_FLAGSHIP       = 920101,
        GOSSIP_ACTION_SCENARIO      = GOSSIP_ACTION_INFO_DEF + 1,
    };

    // the instance's scripted sequences
    enum Events
    {
        EVENT_CHANNEL_LINE_1        = 1,
        EVENT_CHANNEL_LINE_2,
        EVENT_CHANNEL_LINE_3,
        EVENT_CHANNEL_LINE_4,
        EVENT_CHANNEL_LINE_5,
        EVENT_CHANNEL_LINE_6,
        EVENT_CHANNEL_LINE_7,
        EVENT_AFTER_CHANNEL_1,
        EVENT_AFTER_CHANNEL_2,
        EVENT_AFTER_CHANNEL_3,
        EVENT_CONFRONT_1,
        EVENT_CONFRONT_2,
        EVENT_CONFRONT_3,
        EVENT_CONFRONT_4,
        EVENT_CONFRONT_5,
        EVENT_CONFRONT_6,
        EVENT_CONFRONT_KILL,
        EVENT_FLAGSHIP_1,
        EVENT_FLAGSHIP_2,
        EVENT_FLAGSHIP_3,
        EVENT_FLAGSHIP_4,
        EVENT_FLAGSHIP_5,
        EVENT_FLAGSHIP_6,
        EVENT_EXIT_PORTAL,
    };

    Position const ArchOfShatar         = { 3031.70f, 2831.60f, 67.00f };
    Position const EnterPosition        = { 3026.00f, 2826.00f, 67.02f, 0.901f };
    Position const BlackhandFight       = { 3670.50f, 3057.99f, 17.87f, 3.775f };
    Position const PlayerFlagship       = { 3696.30f, 3076.92f, 18.07f, 3.775f };   // far enough for the hero to walk up to Blackhand
    Position const YrelFlagship        = { 3665.01f, 3060.40f, 17.87f, 5.869f };
    Position const DurotanFlagship     = { 3665.66f, 3054.44f, 17.87f, 0.633f };
    Position const MaraadFlagship      = { 3671.16f, 3052.03f, 17.87f, 1.680f };
    // the deck of the flagship set ablaze by Blackhand's blast, from bow to stern
    G3D::Vector3 const FlagshipFires[] =
    {
        { 3651.86f, 3053.26f, 18.04f }, { 3660.06f, 3043.41f, 18.59f }, { 3659.89f, 3071.34f, 18.04f }, { 3662.54f, 3059.61f, 18.04f },
        { 3672.99f, 3073.07f, 18.24f }, { 3674.04f, 3044.01f, 18.15f }, { 3675.96f, 3056.03f, 17.81f }, { 3674.49f, 3085.89f, 18.24f },
        { 3687.32f, 3062.30f, 17.81f }, { 3690.31f, 3074.09f, 18.24f }, { 3690.78f, 3095.94f, 18.28f }, { 3695.62f, 3049.43f, 18.41f },
        { 3698.46f, 3061.40f, 18.10f }, { 3702.76f, 3074.46f, 17.88f }, { 3701.28f, 3089.98f, 17.88f }, { 3702.96f, 3107.67f, 18.68f },
        { 3713.03f, 3074.25f, 18.31f }, { 3714.76f, 3085.86f, 18.31f }, { 3713.11f, 3098.33f, 18.08f }, { 3713.76f, 3110.01f, 18.08f },
        { 3723.94f, 3119.20f, 18.35f }, { 3729.39f, 3079.09f, 18.31f }, { 3731.37f, 3106.54f, 18.08f }, { 3734.01f, 3094.73f, 17.67f },
        { 3734.66f, 3125.97f, 18.47f }, { 3743.65f, 3133.07f, 18.54f }, { 3747.76f, 3085.44f, 18.25f }, { 3746.37f, 3097.67f, 17.67f },
    };
    // after the film, at the foot of the flagship: Maraad and Orgrim lie side by side, Durotan kneels before them, Khadgar stands behind
    Position const EndMaraad            = { 3608.00f, 3051.00f, 1.95f, 3.385f };
    Position const EndOrgrim            = { 3608.50f, 3054.60f, 1.95f, 3.385f };
    Position const EndDurotan           = { 3605.00f, 3052.80f, 1.95f, 0.243f };
    Position const EndKhadgar           = { 3600.00f, 3052.50f, 1.95f, 0.243f };
    Position const EndPlayer            = { 3597.50f, 3047.50f, 1.96f, 0.600f };
    Position const StairsTop            = { 3446.00f, 3128.00f, 20.24f };   // where the defenders withdraw...
    Position const StairsFoot           = { 3496.00f, 3128.00f, 1.95f };    // ...by the stairs and nothing else
    Position const BrandtLanding        = { 3918.00f, 2952.00f, 18.70f };   // from his cannon down onto the deck
    Position const PlayerBattleship     = { 3912.00f, 2858.00f, 19.05f, 1.253f };
    Position const KhadgarBattleship    = { 3917.37f, 2941.37f, 18.70f, 5.015f };   // where he appears once B'randt has fallen
    // the waves run in from three piers, each soldier of a wave on its own lane, kept at quay level and clear of the wreckage;
    // they stop short of Khadgar and leave the heroes to come to them
    G3D::Vector3 const WaveLane00[] =
    {
        { 3590.09f, 3203.00f, 1.95f }, { 3573.09f, 3203.50f, 1.95f }, { 3554.35f, 3203.51f, 1.95f }, { 3551.03f, 3188.46f, 1.95f },
        { 3549.95f, 3177.19f, 1.95f }, { 3536.52f, 3175.62f, 1.95f }, { 3533.02f, 3168.23f, 1.95f }, { 3531.01f, 3162.35f, 1.95f },
        { 3529.87f, 3156.47f, 1.95f }, { 3529.21f, 3150.39f, 1.95f }, { 3528.60f, 3144.40f, 1.95f }, { 3528.12f, 3139.07f, 1.95f },
        { 3525.46f, 3134.83f, 1.95f },
    };
    G3D::Vector3 const WaveLane01[] =
    {
        { 3590.00f, 3200.00f, 1.95f }, { 3573.00f, 3200.50f, 1.95f }, { 3556.00f, 3201.00f, 1.95f }, { 3554.00f, 3188.00f, 1.95f },
        { 3552.00f, 3175.00f, 1.95f }, { 3537.82f, 3172.92f, 1.95f }, { 3535.86f, 3167.25f, 1.95f }, { 3533.91f, 3161.57f, 1.95f },
        { 3532.84f, 3156.03f, 1.95f }, { 3532.19f, 3150.07f, 1.95f }, { 3531.58f, 3144.10f, 1.95f }, { 3530.97f, 3138.13f, 1.95f },
        { 3528.02f, 3133.27f, 1.95f },
    };
    G3D::Vector3 const WaveLane02[] =
    {
        { 3589.91f, 3197.00f, 1.95f }, { 3572.91f, 3197.50f, 1.95f }, { 3557.65f, 3198.49f, 1.95f }, { 3556.97f, 3187.54f, 1.95f },
        { 3554.05f, 3172.81f, 1.95f }, { 3539.12f, 3170.22f, 1.95f }, { 3538.70f, 3166.27f, 1.95f }, { 3536.81f, 3160.79f, 1.95f },
        { 3535.81f, 3155.59f, 1.95f }, { 3535.17f, 3149.75f, 1.95f }, { 3534.56f, 3143.80f, 1.95f }, { 3533.82f, 3137.19f, 1.95f },
        { 3530.58f, 3131.71f, 1.95f },
    };
    G3D::Vector3 const WaveLane10[] =
    {
        { 3614.10f, 3062.86f, 1.95f }, { 3608.30f, 3061.03f, 1.95f }, { 3602.78f, 3058.90f, 1.95f }, { 3597.92f, 3056.95f, 1.95f },
        { 3592.92f, 3056.96f, 1.95f }, { 3589.72f, 3057.46f, 1.95f }, { 3590.04f, 3061.84f, 1.95f }, { 3588.79f, 3067.89f, 1.95f },
        { 3588.57f, 3074.96f, 1.95f }, { 3582.47f, 3079.31f, 1.95f }, { 3575.79f, 3079.97f, 1.95f }, { 3569.82f, 3080.49f, 1.95f },
        { 3564.67f, 3080.86f, 1.95f }, { 3560.70f, 3084.06f, 1.95f }, { 3555.99f, 3087.15f, 1.95f }, { 3552.88f, 3091.32f, 1.95f },
        { 3546.62f, 3093.48f, 1.95f }, { 3542.14f, 3095.58f, 1.95f }, { 3539.41f, 3099.32f, 1.95f }, { 3538.26f, 3104.58f, 1.95f },
        { 3536.76f, 3110.92f, 1.95f }, { 3533.26f, 3116.30f, 1.95f }, { 3528.78f, 3120.71f, 1.95f },
    };
    G3D::Vector3 const WaveLane11[] =
    {
        { 3615.00f, 3060.00f, 1.95f }, { 3609.29f, 3058.20f, 1.95f }, { 3603.86f, 3056.10f, 1.95f }, { 3598.46f, 3054.00f, 1.95f },
        { 3592.46f, 3054.00f, 1.95f }, { 3587.26f, 3055.74f, 1.95f }, { 3587.04f, 3061.73f, 1.95f }, { 3586.82f, 3067.72f, 1.95f },
        { 3586.01f, 3073.40f, 1.95f }, { 3581.50f, 3076.47f, 1.95f }, { 3575.53f, 3076.98f, 1.95f }, { 3569.55f, 3077.50f, 1.95f },
        { 3563.58f, 3078.06f, 1.95f }, { 3558.95f, 3081.62f, 1.95f }, { 3553.95f, 3084.95f, 1.95f }, { 3551.19f, 3088.84f, 1.95f },
        { 3545.49f, 3090.70f, 1.95f }, { 3540.22f, 3093.28f, 1.95f }, { 3536.68f, 3098.07f, 1.95f }, { 3535.34f, 3103.91f, 1.95f },
        { 3533.99f, 3109.76f, 1.95f }, { 3530.95f, 3114.38f, 1.95f }, { 3526.68f, 3118.57f, 1.95f },
    };
    G3D::Vector3 const WaveLane12[] =
    {
        { 3615.90f, 3057.14f, 1.95f }, { 3610.28f, 3055.37f, 1.95f }, { 3604.94f, 3053.30f, 1.95f }, { 3599.00f, 3051.05f, 1.95f },
        { 3592.00f, 3051.04f, 1.95f }, { 3584.80f, 3054.02f, 1.95f }, { 3584.04f, 3061.62f, 1.95f }, { 3583.83f, 3067.46f, 1.95f },
        { 3583.45f, 3071.84f, 1.95f }, { 3580.53f, 3073.63f, 1.95f }, { 3575.27f, 3073.99f, 1.95f }, { 3569.28f, 3074.51f, 1.95f },
        { 3562.49f, 3075.26f, 1.95f }, { 3557.20f, 3079.18f, 1.95f }, { 3551.91f, 3082.75f, 1.95f }, { 3549.50f, 3086.36f, 1.95f },
        { 3544.36f, 3087.92f, 1.95f }, { 3539.58f, 3092.52f, 1.95f }, { 3534.88f, 3097.24f, 1.95f }, { 3532.42f, 3103.24f, 1.95f },
        { 3531.22f, 3108.60f, 1.95f }, { 3528.64f, 3112.46f, 1.95f }, { 3524.58f, 3116.43f, 1.95f },
    };
    G3D::Vector3 const WaveLane20[] =
    {
        { 3640.22f, 3212.99f, 1.95f }, { 3634.24f, 3213.43f, 1.95f }, { 3628.36f, 3213.87f, 1.95f }, { 3622.26f, 3214.74f, 1.95f },
        { 3615.96f, 3214.38f, 1.95f }, { 3609.98f, 3214.03f, 1.95f }, { 3604.07f, 3213.73f, 1.95f }, { 3598.13f, 3213.66f, 1.95f },
        { 3592.13f, 3213.59f, 1.95f }, { 3585.83f, 3213.51f, 1.95f }, { 3579.81f, 3212.23f, 1.95f }, { 3573.95f, 3211.07f, 1.95f },
        { 3568.06f, 3209.90f, 1.95f }, { 3562.10f, 3207.67f, 1.95f }, { 3556.53f, 3204.73f, 1.95f }, { 3549.38f, 3201.09f, 1.95f },
        { 3549.10f, 3187.53f, 1.95f }, { 3549.98f, 3177.22f, 1.95f }, { 3537.62f, 3178.06f, 1.95f }, { 3533.82f, 3170.54f, 1.95f },
        { 3531.87f, 3164.87f, 1.95f }, { 3529.81f, 3158.81f, 1.95f }, { 3529.45f, 3152.75f, 1.95f }, { 3528.85f, 3146.84f, 1.95f },
        { 3528.27f, 3141.10f, 1.95f }, { 3527.16f, 3136.51f, 1.95f }, { 3523.39f, 3132.88f, 1.95f },
    };
    G3D::Vector3 const WaveLane21[] =
    {
        { 3640.00f, 3210.00f, 1.95f }, { 3634.02f, 3210.44f, 1.95f }, { 3628.03f, 3210.89f, 1.95f }, { 3622.13f, 3211.74f, 1.95f },
        { 3616.14f, 3211.39f, 1.95f }, { 3610.15f, 3211.03f, 1.95f }, { 3604.16f, 3210.73f, 1.95f }, { 3598.16f, 3210.66f, 1.95f },
        { 3592.16f, 3210.59f, 1.95f }, { 3586.16f, 3210.53f, 1.95f }, { 3580.42f, 3209.29f, 1.95f }, { 3574.53f, 3208.13f, 1.95f },
        { 3568.64f, 3206.96f, 1.95f }, { 3562.76f, 3205.80f, 1.95f }, { 3557.47f, 3202.99f, 1.95f }, { 3552.21f, 3200.11f, 1.95f },
        { 3552.10f, 3187.50f, 1.95f }, { 3552.00f, 3175.00f, 1.95f }, { 3538.62f, 3175.23f, 1.95f }, { 3536.66f, 3169.56f, 1.95f },
        { 3534.71f, 3163.89f, 1.95f }, { 3532.75f, 3158.22f, 1.95f }, { 3532.44f, 3152.51f, 1.95f }, { 3531.83f, 3146.54f, 1.95f },
        { 3531.22f, 3140.57f, 1.95f }, { 3529.75f, 3135.00f, 1.95f }, { 3525.51f, 3130.76f, 1.95f },
    };
    G3D::Vector3 const WaveLane22[] =
    {
        { 3639.78f, 3207.01f, 1.95f }, { 3633.80f, 3207.45f, 1.95f }, { 3627.70f, 3207.91f, 1.95f }, { 3622.00f, 3208.74f, 1.95f },
        { 3616.32f, 3208.40f, 1.95f }, { 3610.32f, 3208.03f, 1.95f }, { 3604.25f, 3207.73f, 1.95f }, { 3598.19f, 3207.66f, 1.95f },
        { 3592.19f, 3207.59f, 1.95f }, { 3586.49f, 3207.55f, 1.95f }, { 3581.03f, 3206.35f, 1.95f }, { 3575.11f, 3205.19f, 1.95f },
        { 3569.22f, 3204.02f, 1.95f }, { 3563.76f, 3202.97f, 1.95f }, { 3558.89f, 3200.35f, 1.95f }, { 3555.04f, 3199.13f, 1.95f },
        { 3555.10f, 3187.47f, 1.95f }, { 3554.02f, 3172.78f, 1.95f }, { 3539.62f, 3172.40f, 1.95f }, { 3539.50f, 3168.58f, 1.95f },
        { 3537.55f, 3162.91f, 1.95f }, { 3535.69f, 3157.63f, 1.95f }, { 3535.43f, 3152.27f, 1.95f }, { 3534.81f, 3146.24f, 1.95f },
        { 3534.17f, 3140.04f, 1.95f }, { 3532.34f, 3133.49f, 1.95f }, { 3527.63f, 3128.64f, 1.95f },
    };
    struct WaveLane { G3D::Vector3 const* Points; size_t Size; };
    WaveLane const WaveLanes[3][3] =
    {
        { { WaveLane00, std::extent<decltype(WaveLane00)>::value }, { WaveLane01, std::extent<decltype(WaveLane01)>::value }, { WaveLane02, std::extent<decltype(WaveLane02)>::value } },
        { { WaveLane10, std::extent<decltype(WaveLane10)>::value }, { WaveLane11, std::extent<decltype(WaveLane11)>::value }, { WaveLane12, std::extent<decltype(WaveLane12)>::value } },
        { { WaveLane20, std::extent<decltype(WaveLane20)>::value }, { WaveLane21, std::extent<decltype(WaveLane21)>::value }, { WaveLane22, std::extent<decltype(WaveLane22)>::value } },
    };
    Position const AllianceExit         = { 3590.36f, 1676.60f, 173.27f, 3.14f };   // Fort Wrynn, beside Yrel
    Position const HordeExit            = { 3252.60f, 1577.10f, 162.30f, 0.00f };   // Vol'jin's Pride, beside Durotan
    // Blackhand's own forces: the heroes' faction is only at war with theirs
    uint32 const WaveUnits[5]           = { NPC_WAVE_GRIMSHOT, NPC_WAVE_VANGUARD, NPC_WAVE_BLADEMASTER, NPC_FIREBLADE_INVOKER, NPC_WAVE_SHADOWBLADE };
    uint32 const IronHordeUnits[]       = { NPC_GROMKAR_VANGUARD, NPC_GROMKAR_GRIMSHOT, NPC_GROMKAR_SHADOWBLADE, NPC_BURNING_BLADEMASTER, NPC_GROMKAR_DEADEYE,
                                            NPC_IRON_BRUTE, NPC_DOCKS_BLADEMASTER, NPC_DOCKS_VANGUARD, NPC_DOCKS_GRIMSHOT, NPC_DOCKS_SHADOWBLADE,
                                            NPC_WAVE_GRIMSHOT, NPC_WAVE_VANGUARD, NPC_WAVE_BLADEMASTER, NPC_FIREBLADE_INVOKER, NPC_WAVE_SHADOWBLADE, NPC_GROMKAR_GRENADIER };

    // the heroes wait at the top of the harbor stairs, then hold its foot while Khadgar casts (Khadgar, Yrel, Durotan, Draka, Maraad)
    Position const HarborSpots[5]       =
    {
        { 3507.00f, 3128.00f, 1.80f, 0.0f }, { 3514.00f, 3124.00f, 1.95f, 0.0f }, { 3513.00f, 3137.00f, 1.95f, 0.0f },
        { 3509.00f, 3134.00f, 1.95f, 0.0f }, { 3521.00f, 3121.00f, 1.95f, 0.0f },   // Draka clear of the wrecked wagon, Yrel and Maraad of the war wagon
    };
    // where the shells land, away from the crystal: spots picked in game
    G3D::Vector3 const ShellTargets[] =
    {
        { 3430.43f, 3209.66f, 9.20f }, { 3570.38f, 3160.51f, 5.50f }, { 3516.24f, 2975.66f, 2.44f }, { 3447.87f, 3017.78f, 18.30f },
        { 3271.32f, 3224.90f, 22.46f },
    };
    float const SHELL_GROUND_SCALE      = 0.7f;    // the bursts on the ground are a third smaller
    float const CRYSTAL_SHIELD_RANGE    = 37.0f;   // the crystal brings shells down this far out, as in Talador
    float const SHELL_SPEED             = 85.0f;   // missile speed of the shell (120682)
    Position const ShipTops[3]          = { { 3937.71f, 2856.09f }, { 3766.70f, 3126.80f }, { 3821.82f, 3241.20f } };
    float const TIME_STOP_REACH         = 150.0f;
    float const KHADGAR_LEVITATION      = 4.0f;
    uint32 const POINT_WITHDRAW_FOOT    = 101;
    uint32 const POINT_STAIRS_FOOT      = 103;
    uint32 const POINT_WITHDRAW_TOP     = 102;
    float const KHADGAR_RUN_RATE        = 1.4f;
    uint32 const HERO_SCRATCH           = 5000;   // Blackhand and the heroes only scratch each other   // the spell's own reach is the whole map: the battleships must stay out of it

    // the Iron Star's way down the avenue to the top of the harbor stairs: straight ahead first, then kept to the middle,
    // clear of the walls at the height of the star
    G3D::Vector3 const IronStarPath[] =
    {
        { 3034.25f, 2837.86f, 67.16f }, { 3034.62f, 2842.85f, 67.10f }, { 3034.99f, 2847.84f, 67.09f }, { 3035.37f, 2852.83f, 67.09f },
        { 3035.74f, 2857.81f, 65.34f }, { 3036.11f, 2862.80f, 62.90f }, { 3036.48f, 2867.79f, 60.46f }, { 3036.86f, 2872.78f, 58.08f },
        { 3037.23f, 2877.77f, 55.56f }, { 3037.60f, 2882.76f, 53.44f }, { 3037.97f, 2887.74f, 50.92f }, { 3038.35f, 2892.73f, 48.90f },
        { 3038.72f, 2897.72f, 47.82f }, { 3039.09f, 2902.71f, 47.82f }, { 3040.81f, 2915.06f, 47.82f }, { 3044.21f, 2921.56f, 47.82f },
        { 3049.33f, 2929.55f, 47.82f }, { 3053.64f, 2938.01f, 47.82f }, { 3056.48f, 2947.41f, 47.82f }, { 3057.33f, 2957.12f, 47.82f },
        { 3055.17f, 2966.76f, 47.82f }, { 3053.09f, 2976.45f, 47.82f }, { 3051.68f, 2985.80f, 47.82f }, { 3046.05f, 2993.81f, 47.82f },
        { 3044.06f, 3003.79f, 47.82f }, { 3041.26f, 3013.19f, 47.82f }, { 3038.94f, 3022.72f, 47.82f }, { 3035.81f, 3032.15f, 47.82f },
        { 3030.81f, 3041.34f, 47.82f }, { 3027.27f, 3051.23f, 48.00f }, { 3027.90f, 3061.37f, 47.95f }, { 3029.63f, 3071.04f, 45.25f },
        { 3028.51f, 3080.93f, 40.79f }, { 3030.03f, 3089.90f, 36.45f }, { 3031.80f, 3096.50f, 33.50f }, { 3036.00f, 3102.50f, 33.50f },
        { 3044.00f, 3105.80f, 33.50f }, { 3053.00f, 3106.00f, 33.50f }, { 3066.04f, 3106.49f, 33.50f }, { 3075.95f, 3108.65f, 33.88f },
        { 3085.88f, 3108.31f, 33.82f }, { 3095.70f, 3106.93f, 32.23f }, { 3105.17f, 3106.39f, 27.73f }, { 3114.37f, 3106.10f, 23.49f },
        { 3123.74f, 3105.89f, 20.15f }, { 3133.09f, 3107.30f, 20.15f }, { 3141.15f, 3112.48f, 20.15f }, { 3149.44f, 3117.90f, 20.15f },
        { 3158.20f, 3122.31f, 20.15f }, { 3167.57f, 3125.16f, 20.15f }, { 3176.97f, 3127.91f, 20.15f }, { 3185.33f, 3132.83f, 20.15f },
        { 3192.74f, 3139.45f, 20.15f }, { 3200.49f, 3145.20f, 20.15f }, { 3209.55f, 3147.69f, 20.15f }, { 3219.41f, 3147.49f, 20.15f },
        { 3229.38f, 3146.91f, 20.15f }, { 3239.38f, 3146.76f, 20.15f }, { 3249.38f, 3146.75f, 20.15f }, { 3259.38f, 3146.75f, 20.15f },
        { 3269.38f, 3146.78f, 20.15f }, { 3279.36f, 3147.08f, 20.15f }, { 3289.32f, 3147.78f, 20.15f }, { 3299.25f, 3148.81f, 20.15f },
        { 3309.14f, 3150.15f, 20.15f }, { 3319.03f, 3150.89f, 20.15f }, { 3328.93f, 3150.15f, 20.15f }, { 3336.32f, 3148.95f, 20.15f },
        { 3348.70f, 3147.24f, 20.15f }, { 3358.69f, 3146.76f, 20.15f }, { 3368.52f, 3145.34f, 20.15f }, { 3377.01f, 3140.19f, 20.15f },
        { 3384.10f, 3133.15f, 20.15f }, { 3392.19f, 3127.36f, 20.15f }, { 3401.90f, 3125.29f, 20.15f }, { 3411.78f, 3123.98f, 20.15f },
        { 3421.63f, 3122.38f, 20.15f },
    };
    size_t const IronStarPathSize = std::extent<decltype(IronStarPath)>::value;
    // the parapet on the left of the stairs top, where the empty star crashes after curving away
    G3D::Vector3 const IronStarArc[] = { { 3421.63f, 3122.38f, 20.15f }, { 3431.00f, 3126.00f, 20.20f }, { 3438.00f, 3133.00f, 20.30f }, { 3443.00f, 3143.80f, 20.76f } };
    Position const IronStarCrash        = { 3443.00f, 3143.80f, 20.76f };

    // each hero's own way from the harbor to the pier where the flagship ran aground: quay level, straight lines,
    // ending in a row facing the ship (Yrel, Durotan, Maraad, Khadgar)
    G3D::Vector3 const HeroPath0[] = { { 3513.00f, 3119.00f, 1.95f }, { 3533.25f, 3113.00f, 1.95f }, { 3594.75f, 3050.50f, 1.95f }, { 3603.48f, 3049.06f, 1.95f } };
    G3D::Vector3 const HeroPath1[] = { { 3513.00f, 3137.00f, 1.95f }, { 3509.25f, 3136.00f, 1.95f }, { 3589.25f, 3054.00f, 1.96f }, { 3601.56f, 3056.82f, 1.95f } };
    G3D::Vector3 const HeroPath2[] = { { 3519.00f, 3113.00f, 1.95f }, { 3505.75f, 3098.00f, 1.95f }, { 3527.00f, 3073.25f, 1.95f }, { 3587.00f, 3072.00f, 1.95f }, { 3589.25f, 3054.00f, 1.96f }, { 3604.44f, 3045.18f, 1.97f } };
    G3D::Vector3 const HeroPath3[] = { { 3507.00f, 3128.00f, 1.80f }, { 3589.25f, 3054.00f, 1.96f }, { 3602.52f, 3052.94f, 1.95f } };
    struct HeroWay { G3D::Vector3 const* Points; size_t Size; Position End; };
    HeroWay const HeroWays[4] =
    {
        { HeroPath0, std::extent<decltype(HeroPath0)>::value, { 3603.48f, 3049.06f, 1.95f, 0.243f } },
        { HeroPath1, std::extent<decltype(HeroPath1)>::value, { 3601.56f, 3056.82f, 1.95f, 0.243f } },
        { HeroPath2, std::extent<decltype(HeroPath2)>::value, { 3604.44f, 3045.18f, 1.97f, 0.243f } },
        { HeroPath3, std::extent<decltype(HeroPath3)>::value, { 3602.52f, 3052.94f, 1.95f, 0.243f } },
    };
    uint32 const SPELL_TELEPORT_VISUAL = 41232;   // Teleport Visual Only

    bool HasBattleQuest(Player* player)
    {
        return player->GetQuestStatus(QUEST_BATTLE_ALLIANCE) == QUEST_STATUS_INCOMPLETE || player->GetQuestStatus(QUEST_BATTLE_HORDE) == QUEST_STATUS_INCOMPLETE;
    }

    // the player is marked for the scenario of the map, then the map builds it with its step tracker
    void EnterScenario(Player* player)
    {
        if (!player || player->GetMapId() == MAP_SHATTRATH_SCENARIO || !HasBattleQuest(player))
            return;

        player->SetScenarioId(SCENARIO_SHATTRATH);
        if (!player->TeleportTo(MAP_SHATTRATH_SCENARIO, EnterPosition.GetPositionX(), EnterPosition.GetPositionY(), EnterPosition.GetPositionZ(), EnterPosition.GetOrientation()))
        {
            player->SetScenarioId(0);
            TC_LOG_ERROR("scripts", "Battle for Shattrath: %s could not be sent into the scenario (map %u refused)", player->GetName(), uint32(MAP_SHATTRATH_SCENARIO));
        }
    }

    Scenario* GetScenario(Map* map)
    {
        Scenario* scenario = map ? sScenarioMgr->GetScenario(map->GetInstanceId()) : nullptr;
        return scenario && scenario->GetMap() == map ? scenario : nullptr;
    }

    uint8 GetStep(WorldObject* object)
    {
        Scenario* scenario = GetScenario(object->GetMap());
        return scenario ? scenario->GetCurrentStep() : STEP_PREPARATIONS;
    }

    bool IsWave(uint32 entry)
    {
        return std::find(std::begin(WaveUnits), std::end(WaveUnits), entry) != std::end(WaveUnits);
    }

    bool IsIronHorde(uint32 entry)
    {
        return std::find(std::begin(IronHordeUnits), std::end(IronHordeUnits), entry) != std::end(IronHordeUnits);
    }

    // Blackhand's forces and the defenders of the docks leave each other be: the waves are the heroes' fight
    bool KeepApart(Unit* me, Unit* who)
    {
        if (!who)
            return false;
        return (IsWave(me->GetEntry()) && who->GetEntry() == NPC_SHATTRATH_DEFENDER)
            || (me->GetEntry() == NPC_SHATTRATH_DEFENDER && IsWave(who->GetEntry()));
    }

    // creatures of an instance never give up a chase on their own: led too far, they break off and go home
    bool Leashed(Creature* me)
    {
        bool wave = IsWave(me->GetEntry());
        Position const& anchor = wave ? HarborSpots[0] : me->GetHomePosition();
        if (me->GetExactDist2d(&anchor) > (wave ? 70.0f : 40.0f))
            return true;
        // out of their reach: far away, or high above them
        if (Unit* victim = me->getVictim())
            if (me->GetExactDist2d(victim) > 50.0f || victim->GetPositionZ() - me->GetPositionZ() > 15.0f)
                return true;
        return false;
    }

    // held by Khadgar's spell: out of the fight for good
    bool IsFrozen(Unit* unit)
    {
        return unit->HasFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
    }

    // creatures of this core do not pick fights with each other on their own: the battle in the streets is sought out
    Creature* FindFoe(Creature* me, float range)
    {
        std::list<Creature*> foes;
        // Blackhand's own forces come for the heroes and nobody else; the defenders keep to the fight of the docks
        if (IsWave(me->GetEntry()))
        {
            for (uint32 entry : { uint32(NPC_YREL), uint32(NPC_DUROTAN), uint32(NPC_DRAKA), uint32(NPC_MARAAD) })
                me->GetCreatureListWithEntryInGridAppend(foes, entry, range);
        }
        else if (IsIronHorde(me->GetEntry()))
        {
            for (uint32 entry : { uint32(NPC_SHATTRATH_DEFENDER), uint32(NPC_YREL), uint32(NPC_DUROTAN), uint32(NPC_DRAKA), uint32(NPC_MARAAD) })
                me->GetCreatureListWithEntryInGridAppend(foes, entry, range);
        }
        else
            for (uint32 entry : IronHordeUnits)
                if (me->GetEntry() != NPC_SHATTRATH_DEFENDER || !IsWave(entry))
                    me->GetCreatureListWithEntryInGridAppend(foes, entry, range);

        Creature* best = nullptr;
        for (Creature* foe : foes)
            if (foe->IsAlive() && !IsFrozen(foe) && me->IsHostileTo(foe) && (!best || me->GetDistance(foe) < me->GetDistance(best)))
                best = foe;
        return best;
    }
}

using namespace BattleForShattrath;

class instance_battle_for_shattrath : public InstanceMapScript
{
public:
    instance_battle_for_shattrath() : InstanceMapScript("instance_battle_for_shattrath", MAP_SHATTRATH_SCENARIO) { }

    struct instance_battle_for_shattrath_InstanceMapScript : public InstanceScript
    {
        instance_battle_for_shattrath_InstanceMapScript(InstanceMap* map) : InstanceScript(map) { }

        ObjectGuid _khadgarGUID, _yrelGUID, _durotanGUID, _drakaGUID, _maraadGUID, _orgrimGUID, _blackhandGUID, _brandtGUID;
        ObjectGuid _ironStarGUID, _riderGUID, _crashStarGUID;
        GuidList _waveGUIDs;
        GuidList _frontGUIDs;
        GuidList _shipGuards;
        GuidList _turretGUIDs;
        GuidList _turretGOs;
        uint8 _nextTurret = 0;
        uint8 _nextCatch = 0;
        bool _volleysOver = false;
        uint32 _crystalTimer = 4500;
        float _catchBase = 0.0f;
        bool _catchBaseSet = false;
        uint32 _volleyTimer = 3 * IN_MILLISECONDS;
        ObjectGuid _cannonGUID, _crystalGUID;
        EventMap _events;
        uint32 _crushTimer = 0;
        uint32 _rideTimer = 0;
        bool _rolling = false;
        uint8 _launchTries = 0;
        uint32 _launchCheck = 0;
        Position _launchFrom;
        bool _riderless = false;
        bool _casting = false;
        bool _khadgarJoining = false;
        bool _khadgarJoined = false;
        uint32 _checkTimer = IN_MILLISECONDS;
        uint32 _channelTimer = 0;
        uint32 _waveTimer = 0;
        uint8 _lastStep = STEP_PREPARATIONS;
        bool _channeling = false;
        bool _heroesAtPier = false;
        bool _heroesWalking = false;
        bool _confronted = false;
        bool _confrontDone = false;
        bool _brandtGreeted = false;
        bool _flagshipStarted = false;
        bool _completed = false;
        bool _awaitingFilm = false;
        uint32 _filmTimer = 0;
        bool _restoreChecked = false;

        void OnCreatureCreate(Creature* creature) override
        {
            InstanceScript::OnCreatureCreate(creature);

            switch (creature->GetEntry())
            {
                case NPC_KHADGAR:   _khadgarGUID = creature->GetGUID(); break;
                case NPC_YREL:      _yrelGUID = creature->GetGUID(); break;
                case NPC_DUROTAN:   _durotanGUID = creature->GetGUID(); break;
                case NPC_DRAKA:     _drakaGUID = creature->GetGUID(); break;
                case NPC_MARAAD:    _maraadGUID = creature->GetGUID(); break;
                case NPC_ORGRIM:    _orgrimGUID = creature->GetGUID(); break;
                case NPC_BLACKHAND: _blackhandGUID = creature->GetGUID(); break;
                case NPC_IRON_STAR_RIDE: _ironStarGUID = creature->GetGUID(); break;
                case NPC_MACHINIST_BRANDT:
                    _brandtGUID = creature->GetGUID();
                    // on his cannon, out of reach until his men have fallen, and he does not come down for anyone before
                    creature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_PC | UNIT_FLAG_NOT_SELECTABLE);
                    creature->SetReactState(REACT_PASSIVE);
                    break;
                default:
                    break;
            }

            if (creature->GetEntry() == NPC_BIG_CANNON)
                _cannonGUID = creature->GetGUID();
            if (creature->GetEntry() == NPC_AIR_DEFENSE_CRYSTAL)
            {
                // it hangs high above the docks
                _crystalGUID = creature->GetGUID();
                creature->SetCanFly(true);
                creature->SetDisableGravity(true);
                creature->setActive(true);
            }
            if (creature->GetEntry() == NPC_TURRET_MUZZLE || creature->GetEntry() == NPC_BIG_CANNON)
                creature->SetReactState(REACT_PASSIVE);
            // the Iron Stars standing on the ships are only there to be seen, and to shelter from Blackhand
            if (creature->GetEntry() == NPC_IRON_STAR_SHELTER)
            {
                creature->SetReactState(REACT_PASSIVE);
                creature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_PC | UNIT_FLAG_IMMUNE_TO_NPC);
            }
            if (creature->GetEntry() == NPC_TURRET_MUZZLE)
            {
                _turretGUIDs.push_back(creature->GetGUID());
                creature->setActive(true);
            }
            if ((creature->GetEntry() == NPC_GROMKAR_VANGUARD || creature->GetEntry() == NPC_GROMKAR_GRENADIER) && creature->GetPositionX() > 3850.0f)
                _shipGuards.push_back(creature->GetGUID());

            // Blackhand's forces already standing at the docks wait in line for the heroes
            if (IsWave(creature->GetEntry()) && creature->GetDBTableGUIDLow())
            {
                _frontGUIDs.push_back(creature->GetGUID());
                creature->SetReactState(REACT_PASSIVE);
            }

            // the defeated stay down: nothing of the Iron Horde comes back during a run
            if (IsIronHorde(creature->GetEntry()) || creature->GetEntry() == NPC_MACHINIST_BRANDT)
                creature->SetRespawnDelay(DAY);
        }

        void OnGameObjectCreate(GameObject* go) override
        {
            InstanceScript::OnGameObjectCreate(go);
            if (go->GetEntry() == GO_SHIP_TURRET)
            {
                _turretGOs.push_back(go->GetGUID());
                go->setActive(true);
            }
        }

        void OnPlayerEnter(Player* player) override
        {
            InstanceScript::OnPlayerEnter(player);

            // the ships lie far out: their grids are loaded so their turrets fire from the start
            for (Position const& top : ShipTops)
                instance->LoadGrid(top.GetPositionX(), top.GetPositionY());

            // logging back in after a server restart: the instance is new and nothing built its scenario, it starts here
            if (!GetScenario(instance) && HasBattleQuest(player))
                if (Scenario* scenario = sScenarioMgr->AddScenario(instance, SCENARIO_SHATTRATH))
                {
                    scenario->SetCompleteThroughBonusSteps(false);
                    scenario->SendStepUpdate(player, true);
                }
        }

        Creature* Get(ObjectGuid const& guid) { return instance->GetCreature(guid); }

        void Say(ObjectGuid const& guid, uint8 group, ObjectGuid target = ObjectGuid::Empty)
        {
            if (Creature* creature = Get(guid))
                creature->AI()->Talk(group, target);
        }

        Player* GetReferencePlayer() const
        {
            Map::PlayerList const& players = instance->GetPlayers();
            return players.isEmpty() ? nullptr : players.begin()->getSource();
        }

        void SendScenarioEvent(uint32 eventId)
        {
            Scenario* scenario = GetScenario(instance);
            Player* reference = GetReferencePlayer();
            if (scenario && reference)
                scenario->UpdateAchievementCriteria(CRITERIA_TYPE_SCRIPT_EVENT_2, eventId, 0, 0, nullptr, reference);
        }

        void SetData(uint32 type, uint32 /*data*/) override
        {
            switch (type)
            {
                case DATA_TALKED_TO_THAELIN:   SendScenarioEvent(EVENT_TALK_TO_THAELIN); break;
                case DATA_ENTERED_IRON_STAR:   SendScenarioEvent(EVENT_ENTER_IRON_STAR); break;
                case DATA_RIDE_ARRIVED:        SendScenarioEvent(EVENT_REACH_HARBOR); break;
                case DATA_TALKED_TO_KHADGAR:   SendScenarioEvent(EVENT_TALK_TO_KHADGAR); break;
                case DATA_TELEPORT_BATTLESHIP: SendScenarioEvent(EVENT_TELEPORT_BATTLESHIP); break;
                case DATA_TELEPORT_FLAGSHIP:
                    SendScenarioEvent(EVENT_TELEPORT_FLAGSHIP);
                    break;
                case DATA_BLACKHAND_DONE:      SendScenarioEvent(EVENT_SURVIVE_BLACKHAND); break;
                default:
                    break;
            }
        }

        ObjectGuid GetGuidData(uint32 type) const override
        {
            return type == NPC_BLACKHAND ? _blackhandGUID : ObjectGuid::Empty;
        }

        uint32 GetData(uint32 type) const override
        {
            // Khadgar offers the battleship once he has caught up with the hero at the pier
            return type == DATA_CONFRONTED ? uint32(_khadgarJoined) : 0;
        }

        void OnUnitDeath(Unit* unit) override
        {
            switch (unit->GetEntry())
            {
                case NPC_MACHINIST_BRANDT:
                    SendScenarioEvent(EVENT_BRANDT_DEFEATED);
                    break;
                case NPC_GROMKAR_VANGUARD:
                case NPC_GROMKAR_GRENADIER:
                    // the last of his men down on the battleship: B'randt jumps from his cannon onto the deck
                    if (unit->GetPositionX() > 3850.0f)
                    {
                        for (ObjectGuid const& guid : _shipGuards)
                            if (Creature* guard = Get(guid))
                                if (guard->IsAlive() && guard != unit)
                                    return;
                        BrandtJumpsDown();
                    }
                    break;
                default:
                    break;
            }
        }

        void BrandtJumpsDown()
        {
            Creature* rider = Get(_brandtGUID);
            if (!rider || !rider->IsAlive() || !rider->HasFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_PC))
                return;

            // the B'randt on the cannon is its accessory, and the core unsummons an accessory that leaves its seat:
            // a B'randt of his own takes his place and makes the leap down onto the deck
            Position const from = rider->GetPosition();
            TempSummon* brandt = rider->SummonCreature(NPC_MACHINIST_BRANDT, from, TEMPSUMMON_CORPSE_TIMED_DESPAWN, MINUTE * IN_MILLISECONDS);
            if (!brandt)
                return;
            rider->DespawnOrUnsummon();
            brandt->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
            brandt->SetHomePosition(BrandtLanding);
            brandt->AddDelayedEvent(300, [brandt]() -> void
            {
                brandt->GetMotionMaster()->MoveJump(BrandtLanding, 14.0f, 8.0f);
            });
            brandt->AddDelayedEvent(1800, [brandt]() -> void
            {
                brandt->AI()->Talk(SAY_BRANDT_END_THIS);
                brandt->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_PC);
                brandt->SetReactState(REACT_AGGRESSIVE);
                if (Player* player = brandt->SelectNearestPlayer(60.0f))
                    brandt->AI()->AttackStart(player);
            });
        }

        // the step reached survives a server restart: a new instance resumes there
        void SaveStep(uint8 step)
        {
            instance->ApplyOnEveryPlayer([step](Player* player)
            {
                CharacterDatabase.PExecute("REPLACE INTO character_scenario_step (guid, scenario, step) VALUES (" UI64FMTD ", %u, %u)",
                    uint64(player->GetGUIDLow()), uint32(SCENARIO_SHATTRATH), uint32(step));
            });
        }

        void RestoreStep(Scenario* scenario)
        {
            Player* player = GetReferencePlayer();
            if (!player)
                return;

            _restoreChecked = true;
            QueryResult result = CharacterDatabase.PQuery("SELECT step FROM character_scenario_step WHERE guid = " UI64FMTD " AND scenario = %u",
                uint64(player->GetGUIDLow()), uint32(SCENARIO_SHATTRATH));
            if (!result)
                return;

            uint8 step = result->Fetch()[0].GetUInt8();
            if (step <= scenario->GetCurrentStep() || step > STEP_BLACKHAND)
                return;

            scenario->SetCurrentStep(step);
            // the harbor is already cleared: the heroes wait at the flagship's pier
            if (step >= STEP_THE_WEAPON)
            {
                SendHeroesToPier(true);
                if (Creature* draka = Get(_drakaGUID))
                    draka->DespawnOrUnsummon(0, Seconds(DAY));
            }
            if (step == STEP_BLACKHAND)
            {
                _confronted = true;
                if (Creature* khadgar = Get(_khadgarGUID))
                    khadgar->NearTeleportTo(KhadgarBattleship);
                if (Creature* brandt = Get(_brandtGUID))
                    brandt->DespawnOrUnsummon(0, Seconds(DAY));
            }
        }

        void OnStepChanged(uint8 step)
        {
            SaveStep(step);

            switch (step)
            {
                case STEP_IRON_HARBOR:
                    StartChannel();
                    break;
                case STEP_BLACKHAND:
                    // B'randt has fallen: Khadgar joins the hero on the battleship to send them on to Blackhand
                    if (Creature* khadgar = Get(_khadgarGUID))
                    {
                        khadgar->NearTeleportTo(KhadgarBattleship);
                        khadgar->AddDelayedEvent(500, [khadgar]() -> void
                        {
                            khadgar->CastSpell(khadgar, SPELL_TELEPORT_VISUAL, true);
                            khadgar->AI()->Talk(SAY_KHADGAR_HELP_BLACKHAND);
                        });
                    }
                    break;
                default:
                    break;
            }
        }

        void StartChannel()
        {
            if (_channeling)
                return;

            _channeling = true;
            _casting = false;
            _channelTimer = CHANNEL_DURATION;
            _waveTimer = 3 * IN_MILLISECONDS;

            if (Creature* khadgar = Get(_khadgarGUID))
            {
                khadgar->AI()->Talk(SAY_KHADGAR_CLEAR_THE_WAY);
                // nothing may break his spell: the Iron Horde has to get through the heroes and the champion
                khadgar->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_PC | UNIT_FLAG_IMMUNE_TO_NPC);
                khadgar->SetReactState(REACT_PASSIVE);
            }
            Say(_maraadGUID, SAY_MARAAD_FOR_SHATTRATH);

            // down the stairs to hold their foot: Khadgar casts there, the others stand around him
            ObjectGuid const heroes[5] = { _khadgarGUID, _yrelGUID, _durotanGUID, _drakaGUID, _maraadGUID };
            for (uint8 i = 0; i < 5; ++i)
                if (Creature* hero = Get(heroes[i]))
                {
                    hero->SetUInt32Value(UNIT_FIELD_EMOTE_STATE, 0);
                    hero->SetHomePosition(HarborSpots[i]);
                    // down the middle of the stairs on foot, then to their place (the hero script chains the two)
                    hero->GetMotionMaster()->MovePoint(POINT_STAIRS_FOOT, 3492.0f, std::max(3118.0f, std::min(3136.0f, HarborSpots[i].GetPositionY())), 2.0f);
                }

            // the line waiting at the docks comes on at the same time
            uint8 n = 0;
            for (ObjectGuid const& guid : _frontGUIDs)
                if (Creature* unit = Get(guid))
                {
                    Position const& spot = HarborSpots[1 + n++ % 4];
                    unit->SetUInt32Value(UNIT_FIELD_EMOTE_STATE, 0);
                    unit->SetReactState(REACT_AGGRESSIVE);
                    // a few steps forward at a walk: the heroes come down to them
                    unit->SetWalk(true);
                    unit->GetMotionMaster()->MovePoint(1, unit->GetPositionX() - 8.0f, unit->GetPositionY(), unit->GetPositionZ());
                }

            _events.ScheduleEvent(EVENT_CHANNEL_LINE_1, 8 * IN_MILLISECONDS);
            _events.ScheduleEvent(EVENT_CHANNEL_LINE_2, 22 * IN_MILLISECONDS);
            _events.ScheduleEvent(EVENT_CHANNEL_LINE_3, 36 * IN_MILLISECONDS);
            _events.ScheduleEvent(EVENT_CHANNEL_LINE_4, 48 * IN_MILLISECONDS);
            _events.ScheduleEvent(EVENT_CHANNEL_LINE_5, 60 * IN_MILLISECONDS);
            _events.ScheduleEvent(EVENT_CHANNEL_LINE_6, 70 * IN_MILLISECONDS);
        }

        void SendWave()
        {
            Creature* khadgar = Get(_khadgarGUID);
            if (!khadgar)
                return;

            uint32 const pier = urand(0, 2);
            for (uint8 i = 0; i < 3; ++i)
            {
                WaveLane const& lane = WaveLanes[pier][i];
                Position pos(lane.Points[0].x, lane.Points[0].y, lane.Points[0].z);
                if (TempSummon* unit = khadgar->SummonCreature(WaveUnits[urand(0, 4)], pos, TEMPSUMMON_CORPSE_TIMED_DESPAWN, 10 * IN_MILLISECONDS))
                {
                    _waveGUIDs.push_back(unit->GetGUID());
                    unit->SetRespawnDelay(DAY);
                    unit->GetMotionMaster()->MoveSmoothPath(1, lane.Points, lane.Size, false);
                }
            }
        }

        // once at the foot of the stairs he rises into the air and begins Time Stop
        void UpdateKhadgarCast(Creature* khadgar)
        {
            if (khadgar->isInCombat())
                khadgar->CombatStop(true);

            if (!_casting)
            {
                if (khadgar->GetExactDist2d(&HarborSpots[0]) > 1.5f || !khadgar->movespline->Finalized())
                    return;
                _casting = true;
                _channelTimer = CHANNEL_DURATION;
                khadgar->SetFacingTo(HarborSpots[0].GetOrientation());
                khadgar->SetCanFly(true);
                khadgar->SetDisableGravity(true);
                // the airborne tier of his animations: he floats instead of standing on thin air
                khadgar->SetAnimTier(AnimTier::Fly);
                khadgar->GetMotionMaster()->MoveTakeoff(4, HarborSpots[0].GetPositionX(), HarborSpots[0].GetPositionY(), HarborSpots[0].GetPositionZ() + KHADGAR_LEVITATION);
                return;
            }

            // still rising
            if (!khadgar->movespline->Finalized())
                return;

            if (khadgar->GetUInt32Value(UNIT_FIELD_EMOTE_STATE) != EMOTE_STATE_SPELL_CHANNEL_OMNI)
                khadgar->SetUInt32Value(UNIT_FIELD_EMOTE_STATE, EMOTE_STATE_SPELL_CHANNEL_OMNI);

            if (!khadgar->HasUnitState(UNIT_STATE_CASTING))
            {
                CustomSpellValues values;
                values.AddSpellMod(SPELLVALUE_RADIUS_MOD, int32(TIME_STOP_REACH / 50000.0f * 10000.0f));
                khadgar->CastCustomSpell(SPELL_TIME_STOP, values, khadgar, false);
            }
        }

        // the shock wave of Time Stop: what is left of the Iron Horde at the harbor hangs in the air, beyond any fight
        void FreezeHarbor(Creature* khadgar)
        {
            std::list<Creature*> units;
            for (uint32 entry : IronHordeUnits)
                khadgar->GetCreatureListWithEntryInGridAppend(units, entry, TIME_STOP_REACH);
            for (Creature* unit : units)
            {
                if (!unit->IsAlive() || unit->GetPositionX() > 3850.0f)
                    continue;
                unit->CombatStop(true);
                unit->SetReactState(REACT_PASSIVE);
                unit->GetMotionMaster()->Clear();
                unit->GetMotionMaster()->MoveIdle();
                unit->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_IMMUNE_TO_PC | UNIT_FLAG_IMMUNE_TO_NPC);
                if (!unit->HasAura(SPELL_TIME_STOP))
                    unit->AddAura(SPELL_TIME_STOP, unit);
            }

            std::list<Creature*> allies;
            for (uint32 entry : { uint32(NPC_SHATTRATH_DEFENDER), uint32(NPC_YREL), uint32(NPC_DUROTAN), uint32(NPC_DRAKA), uint32(NPC_MARAAD) })
                khadgar->GetCreatureListWithEntryInGridAppend(allies, entry, TIME_STOP_REACH);
            for (Creature* ally : allies)
            {
                ally->CombatStop(true);
                if (ally->GetEntry() != NPC_SHATTRATH_DEFENDER)
                    continue;
                ally->SetReactState(REACT_PASSIVE);
                ally->SetWalk(false);
                ally->GetMotionMaster()->Clear();
                // to the foot of the stairs first, then straight up them: the street fighter script takes it from there
                ally->GetMotionMaster()->MovePoint(POINT_WITHDRAW_FOOT, StairsFoot.GetPositionX() + frand(-2.0f, 2.0f), StairsFoot.GetPositionY() + frand(-7.0f, 7.0f), StairsFoot.GetPositionZ());
            }
            _waveGUIDs.clear();
        }

        void FinishChannel()
        {
            _channeling = false;

            if (Creature* khadgar = Get(_khadgarGUID))
            {
                khadgar->InterruptNonMeleeSpells(false);
                khadgar->CastSpell(khadgar, SPELL_ARCANE_BLAST_VISUAL, true);
                FreezeHarbor(khadgar);
                // spent, he comes back down to the ground and kneels
                khadgar->SetUInt32Value(UNIT_FIELD_EMOTE_STATE, 0);
                khadgar->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_PC | UNIT_FLAG_IMMUNE_TO_NPC);
                khadgar->GetMotionMaster()->MoveLand(5, HarborSpots[0]);
                khadgar->AddDelayedEvent(2500, [khadgar]() -> void
                {
                    khadgar->SetDisableGravity(false);
                    khadgar->SetCanFly(false);
                    khadgar->SetAnimTier(AnimTier::Ground);
                    khadgar->SetStandState(UNIT_STAND_STATE_KNEEL);
                });
                khadgar->AI()->Talk(SAY_KHADGAR_FINISHED);
            }
            SendScenarioEvent(EVENT_PROTECT_KHADGAR);
            _events.ScheduleEvent(EVENT_AFTER_CHANNEL_1, 7 * IN_MILLISECONDS);
        }

        // the heroes walk (or, after a restart, are placed) at the foot of the pier where the flagship ran aground;
        // Khadgar stays behind to rest and only catches up with the hero later
        void SendHeroesToPier(bool instant)
        {
            ObjectGuid const heroes[4] = { _yrelGUID, _durotanGUID, _maraadGUID, _khadgarGUID };
            for (uint8 i = 0; i < 4; ++i)
                if (Creature* hero = Get(heroes[i]))
                {
                    if (!instant && i == 3)
                        continue;
                    hero->SetHomePosition(HeroWays[i].End);
                    if (instant)
                        hero->NearTeleportTo(HeroWays[i].End);
                    else
                        hero->GetMotionMaster()->MoveSmoothPath(1, HeroWays[i].Points, HeroWays[i].Size, false);
                }
            _heroesWalking = !instant;
            _heroesAtPier = instant;
            _khadgarJoined = instant;
        }

        // all three in their row: each turns to face the ship
        void CheckHeroesArrived()
        {
            ObjectGuid const heroes[3] = { _yrelGUID, _durotanGUID, _maraadGUID };
            for (uint8 i = 0; i < 3; ++i)
                if (Creature* hero = Get(heroes[i]))
                    if (hero->GetExactDist2d(&HeroWays[i].End) > 2.5f || !hero->movespline->Finalized())
                        return;

            for (uint8 i = 0; i < 3; ++i)
                if (Creature* hero = Get(heroes[i]))
                    hero->SetFacingTo(HeroWays[i].End.GetOrientation());
            _heroesWalking = false;
            _heroesAtPier = true;
        }

        // Khadgar has regained his strength: he runs to the hero at the pier
        void CheckKhadgarJoined()
        {
            Creature* khadgar = Get(_khadgarGUID);
            if (!khadgar || !_confrontDone || khadgar->GetExactDist2d(&HeroWays[3].End) > 2.5f || !khadgar->movespline->Finalized())
                return;

            _khadgarJoining = false;
            _khadgarJoined = true;
            khadgar->SetSpeed(MOVE_RUN, 1.0f, true);
            Player* player = khadgar->SelectNearestPlayer(60.0f);
            if (player)
                khadgar->SetFacingToObject(player);
            khadgar->AI()->Talk(SAY_KHADGAR_SPEAK_WITH_ME, player ? player->GetGUID() : ObjectGuid::Empty);
        }

        void StartConfrontation()
        {
            _confronted = true;
            _events.ScheduleEvent(EVENT_CONFRONT_1, IN_MILLISECONDS);
        }

        void StartFlagship()
        {
            if (_flagshipStarted)
                return;

            _flagshipStarted = true;
            // the warlord turns on the champion
            if (Creature* blackhand = Get(_blackhandGUID))
            {
                blackhand->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_PC | UNIT_FLAG_NOT_SELECTABLE);
                blackhand->AI()->Talk(SAY_BLACKHAND_ALL_YOU_HAVE);
            }
            _events.ScheduleEvent(EVENT_FLAGSHIP_1, 3 * IN_MILLISECONDS);
        }

        // Blackhand's blast throws everyone on the deck to the ground and sets the flagship ablaze
        void Blast()
        {
            Creature* blackhand = Get(_blackhandGUID);
            if (!blackhand)
                return;

            blackhand->CombatStop(true);
            blackhand->SetReactState(REACT_PASSIVE);
            blackhand->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_PC | UNIT_FLAG_IMMUNE_TO_NPC);
            blackhand->CastSpell(blackhand, SPELL_STRUCTURE_EXPLOSION, true);
            for (uint8 i = 0; i < 4; ++i)
            {
                float const a = float(M_PI) / 2.0f * i;
                if (TempSummon* burst = blackhand->SummonCreature(NPC_INVISIBLE_STALKER, blackhand->GetPositionX() + 4.0f * std::cos(a), blackhand->GetPositionY() + 4.0f * std::sin(a), blackhand->GetPositionZ() + 1.0f, 0.0f, TEMPSUMMON_TIMED_DESPAWN, 4 * IN_MILLISECONDS))
                    burst->CastSpell(burst, SPELL_FIRE_EXPLOSION, true);
            }

            ObjectGuid const heroes[3] = { _yrelGUID, _durotanGUID, _maraadGUID };
            for (ObjectGuid const& guid : heroes)
                if (Creature* hero = Get(guid))
                {
                    hero->CombatStop(true);
                    hero->SetReactState(REACT_PASSIVE);
                    hero->KnockbackFrom(blackhand->GetPositionX(), blackhand->GetPositionY(), 12.0f, 7.0f);
                }
            std::list<Player*> players;
            blackhand->GetPlayerListInGrid(players, 40.0f);
            for (Player* player : players)
            {
                player->CombatStop(true);
                player->KnockbackFrom(blackhand->GetPositionX(), blackhand->GetPositionY(), 12.0f, 7.0f);
            }

            for (G3D::Vector3 const& spot : FlagshipFires)
                if (TempSummon* fire = blackhand->SummonCreature(NPC_INVISIBLE_STALKER, spot.x, spot.y, spot.z, 0.0f, TEMPSUMMON_TIMED_DESPAWN, 10 * MINUTE * IN_MILLISECONDS))
                    fire->AddAura(SPELL_DECK_FIRE, fire);

            // the battle is over: Blackhand is gone in the flames and the guns fall silent
            blackhand->DespawnOrUnsummon(3 * IN_MILLISECONDS, Seconds(DAY));
            _volleysOver = true;
        }

        void Complete()
        {
            _completed = true;
            _awaitingFilm = true;
            _filmTimer = 3 * MINUTE * IN_MILLISECONDS;
            instance->ApplyOnEveryPlayer([](Player* player)
            {
                CharacterDatabase.PExecute("DELETE FROM character_scenario_step WHERE guid = " UI64FMTD " AND scenario = %u",
                    uint64(player->GetGUIDLow()), uint32(SCENARIO_SHATTRATH));
                player->SendMovieStart(MOVIE_BATTLE_FOR_SHATTRATH);
            });
        }

        // the film over (or skipped): the heroes are at the foot of the flagship, mourning, and a portal leads home
        void UpdateFilm(uint32 diff)
        {
            if (!_awaitingFilm)
                return;
            bool watching = false;
            instance->ApplyOnEveryPlayer([&](Player* player) { if (player->isWatchingMovie()) watching = true; });
            if (watching && _filmTimer > diff)
            {
                _filmTimer -= diff;
                return;
            }
            _awaitingFilm = false;
            EndingScene();
            _events.ScheduleEvent(EVENT_EXIT_PORTAL, 2 * IN_MILLISECONDS);
        }

        void EndingScene()
        {
            Creature* khadgar = Get(_khadgarGUID);
            if (Creature* maraad = Get(_maraadGUID))
            {
                if (TempSummon* fallen = maraad->SummonCreature(NPC_MARAAD, EndMaraad, TEMPSUMMON_MANUAL_DESPAWN))
                    fallen->Kill(fallen);
                maraad->DespawnOrUnsummon();
            }
            if (Creature* orgrim = Get(_orgrimGUID))
            {
                if (TempSummon* fallen = orgrim->SummonCreature(NPC_ORGRIM, EndOrgrim, TEMPSUMMON_MANUAL_DESPAWN))
                    fallen->Kill(fallen);
                orgrim->DespawnOrUnsummon();
            }
            if (Creature* durotan = Get(_durotanGUID))
            {
                durotan->CombatStop(true);
                durotan->SetReactState(REACT_PASSIVE);
                durotan->NearTeleportTo(EndDurotan);
                durotan->SetHomePosition(EndDurotan);
                durotan->AddDelayedEvent(500, [durotan]() -> void { durotan->SetStandState(UNIT_STAND_STATE_KNEEL); });
            }
            if (khadgar)
            {
                khadgar->CombatStop(true);
                khadgar->NearTeleportTo(EndKhadgar);
                khadgar->SetHomePosition(EndKhadgar);
            }
            if (Creature* yrel = Get(_yrelGUID))
                yrel->DespawnOrUnsummon();
            instance->ApplyOnEveryPlayer([](Player* player)
            {
                player->NearTeleportTo(EndPlayer);
            });
        }

        void ExecuteEvent(uint32 eventId)
        {
            Player* reference = GetReferencePlayer();
            ObjectGuid const target = reference ? reference->GetGUID() : ObjectGuid::Empty;

            switch (eventId)
            {
                case EVENT_CHANNEL_LINE_1: Say(_yrelGUID, SAY_YREL_STEEL_YOURSELVES); break;
                case EVENT_CHANNEL_LINE_2: Say(_durotanGUID, SAY_DUROTAN_DO_NOT_WAVER); break;
                case EVENT_CHANNEL_LINE_3: Say(_maraadGUID, SAY_MARAAD_NO_MERCY); break;
                case EVENT_CHANNEL_LINE_4: Say(_drakaGUID, SAY_DRAKA_GUARD_UP); break;
                case EVENT_CHANNEL_LINE_5: Say(_yrelGUID, SAY_YREL_CANNOT_HOLD); break;
                case EVENT_CHANNEL_LINE_6: Say(_durotanGUID, SAY_DUROTAN_MORE_TIME); break;
                case EVENT_CHANNEL_LINE_7: break;
                case EVENT_AFTER_CHANNEL_1:
                    Say(_durotanGUID, SAY_DUROTAN_SURVIVORS);
                    _events.ScheduleEvent(EVENT_AFTER_CHANNEL_2, 4 * IN_MILLISECONDS);
                    break;
                case EVENT_AFTER_CHANNEL_2:
                    Say(_drakaGUID, SAY_DRAKA_OF_COURSE);
                    // Draka searches the city for survivors and leaves the battle
                    if (Creature* draka = Get(_drakaGUID))
                        draka->DespawnOrUnsummon(4 * IN_MILLISECONDS, Seconds(DAY));
                    _events.ScheduleEvent(EVENT_AFTER_CHANNEL_3, 3 * IN_MILLISECONDS);
                    break;
                case EVENT_AFTER_CHANNEL_3:
                    Say(_maraadGUID, SAY_MARAAD_FORWARD);
                    SendHeroesToPier(false);
                    break;
                case EVENT_CONFRONT_1:
                    Say(_orgrimGUID, SAY_ORGRIM_INNOCENTS);
                    // rested, Khadgar runs to join the hero at the pier
                    if (Creature* khadgar = Get(_khadgarGUID))
                        if (!_khadgarJoined)
                        {
                            khadgar->SetStandState(UNIT_STAND_STATE_STAND);
                            khadgar->SetHomePosition(HeroWays[3].End);
                            khadgar->SetSpeed(MOVE_RUN, KHADGAR_RUN_RATE, true);
                            khadgar->GetMotionMaster()->MoveSmoothPath(1, HeroWays[3].Points, HeroWays[3].Size, false);
                            _khadgarJoining = true;
                        }
                    _events.ScheduleEvent(EVENT_CONFRONT_2, 4 * IN_MILLISECONDS);
                    break;
                case EVENT_CONFRONT_2:
                    Say(_blackhandGUID, SAY_BLACKHAND_INNOCENT);
                    _events.ScheduleEvent(EVENT_CONFRONT_3, 3 * IN_MILLISECONDS);
                    break;
                case EVENT_CONFRONT_3:
                    Say(_orgrimGUID, SAY_ORGRIM_YOU_MUST_STOP);
                    _events.ScheduleEvent(EVENT_CONFRONT_4, 6 * IN_MILLISECONDS);
                    break;
                case EVENT_CONFRONT_4:
                    Say(_blackhandGUID, SAY_BLACKHAND_DRAENOR_BURN);
                    _events.ScheduleEvent(EVENT_CONFRONT_KILL, 4500);
                    _events.ScheduleEvent(EVENT_CONFRONT_5, 9 * IN_MILLISECONDS);
                    break;
                case EVENT_CONFRONT_KILL:
                    // "You, traitor, will not": once said, the hammer comes down on Doomhammer
                    if (Creature* blackhand = Get(_blackhandGUID))
                    {
                        blackhand->HandleEmoteCommand(EMOTE_ONESHOT_ATTACK1H);
                        if (Creature* orgrim = Get(_orgrimGUID))
                            if (orgrim->IsAlive())
                                blackhand->Kill(orgrim);
                    }
                    break;
                case EVENT_CONFRONT_5:
                    Say(_yrelGUID, SAY_YREL_HOLD_OFF_BLACKHAND);
                    _events.ScheduleEvent(EVENT_CONFRONT_6, 3 * IN_MILLISECONDS);
                    break;
                case EVENT_CONFRONT_6:
                {
                    // Blackhand takes the middle of his deck, Yrel, Maraad and Durotan appear around him and hold him there
                    Position const flagship[3] = { YrelFlagship, MaraadFlagship, DurotanFlagship };
                    ObjectGuid const heroes[3] = { _yrelGUID, _maraadGUID, _durotanGUID };
                    _confrontDone = true;
                    if (Creature* blackhand = Get(_blackhandGUID))
                    {
                        blackhand->CastSpell(blackhand, SPELL_TELEPORT_VISUAL, true);
                        blackhand->NearTeleportTo(BlackhandFight);
                        blackhand->SetHomePosition(BlackhandFight);
                        blackhand->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_IMMUNE_TO_NPC);
                    }
                    for (uint8 i = 0; i < 3; ++i)
                        if (Creature* hero = Get(heroes[i]))
                        {
                            hero->CastSpell(hero, SPELL_TELEPORT_VISUAL, true);
                            Position const dest = flagship[i];
                            hero->SetHomePosition(dest);
                            hero->AddDelayedEvent(1200, [hero, dest]() -> void
                            {
                                hero->GetMotionMaster()->Clear();
                                hero->NearTeleportTo(dest);
                                hero->CastSpell(hero, SPELL_TELEPORT_VISUAL, true);
                                hero->AddDelayedEvent(1500, [hero]() -> void
                                {
                                    if (InstanceScript* instance = hero->GetInstanceScript())
                                        if (Creature* blackhand = ObjectAccessor::GetCreature(*hero, instance->GetGuidData(NPC_BLACKHAND)))
                                        {
                                            hero->AI()->AttackStart(blackhand);
                                            if (!blackhand->getVictim())
                                                blackhand->AI()->AttackStart(hero);
                                        }
                                });
                            });
                        }
                    SendScenarioEvent(EVENT_CONFRONT_BLACKHAND);
                    break;
                }
                case EVENT_FLAGSHIP_1:
                    Say(_durotanGUID, SAY_DUROTAN_BROTHER);
                    _events.ScheduleEvent(EVENT_FLAGSHIP_2, 3 * IN_MILLISECONDS);
                    break;
                case EVENT_FLAGSHIP_2:
                    Say(_blackhandGUID, SAY_BLACKHAND_WEAK);
                    _events.ScheduleEvent(EVENT_FLAGSHIP_3, 4 * IN_MILLISECONDS);
                    break;
                case EVENT_FLAGSHIP_3:
                    Say(_yrelGUID, SAY_YREL_HAVE_HOPE, target);
                    _events.ScheduleEvent(EVENT_FLAGSHIP_4, 10 * IN_MILLISECONDS);
                    break;
                case EVENT_FLAGSHIP_4:
                    // the laugh, then "Didn't anyone ever tell you not to play with fire?"
                    if (Creature* blackhand = Get(_blackhandGUID))
                    {
                        blackhand->HandleEmoteCommand(EMOTE_ONESHOT_LAUGH);
                        blackhand->AI()->Talk(SAY_BLACKHAND_PLAY_WITH_FIRE);
                    }
                    // the spoken line, laugh included, lasts about 7 seconds: the ship blows up a few seconds after it
                    _events.ScheduleEvent(EVENT_FLAGSHIP_5, 11 * IN_MILLISECONDS);
                    break;
                case EVENT_FLAGSHIP_5:
                    Blast();
                    _events.ScheduleEvent(EVENT_FLAGSHIP_6, 2 * IN_MILLISECONDS);
                    break;
                case EVENT_FLAGSHIP_6:
                    SetData(DATA_BLACKHAND_DONE, 0);
                    break;
                case EVENT_EXIT_PORTAL:
                    // a portal home waits beside every hero once the film is over
                    instance->ApplyOnEveryPlayer([](Player* player)
                    {
                        float angle = player->GetOrientation();
                        player->SummonGameObject(GO_PORTAL_TO_TALADOR, player->GetPositionX() + 3.0f * std::cos(angle), player->GetPositionY() + 3.0f * std::sin(angle),
                            player->GetPositionZ(), angle + float(M_PI), 0.0f, 0.0f, 0.0f, 0.0f, 0);
                    });
                    break;
                default:
                    break;
            }
        }

        // A click on the Iron Star makes the hero the star: their own body rolls down the avenue on a path laid by the server,
        // with no vehicle and nothing to leave. Near the top of the harbor stairs they get their shape back and an empty
        // star curves away into the parapet on the left.
        void SetGuidData(uint32 type, ObjectGuid guid) override
        {
            if (type != DATA_STAR_RIDER || _riderGUID || _riderless)
                return;

            Player* player = ObjectAccessor::FindPlayer(instance, guid);
            Creature* star = Get(_ironStarGUID);
            if (!player || !star)
                return;

            _riderGUID = guid;
            _rideTimer = 600;
            _rolling = false;
            _launchTries = 0;
            _launchCheck = 0;
            _crushTimer = 300;
            player->RemoveAurasByType(SPELL_AURA_MOUNTED);
            player->CombatStop(true);
            // the teleport resets the client's movement state: without it the star glides along instead of rolling
            player->NearTeleportTo(star->GetPositionX(), star->GetPositionY(), star->GetPositionZ(), star->GetOrientation());
            player->SetDisplayId(DISPLAY_IRON_STAR);
            // it only rolls over them: nothing of the Iron Horde can pick a fight with the hero inside
            player->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_NPC);
            player->SetClientControl(player, false);
            // the parked star is the hero now; it is back shortly for the rest of a group
            star->DespawnOrUnsummon(0, Seconds(20));
            SetData(DATA_ENTERED_IRON_STAR, 0);
        }

        void LaunchRide(Player* rider)
        {
            _rolling = true;
            ++_launchTries;
            _launchFrom.Relocate(rider);
            _launchCheck = 1500;
            Movement::MoveSplineInit init(*rider);
            init.MovebyPath(Movement::PointsArray(IronStarPath, IronStarPath + IronStarPathSize));
            init.SetSmooth();
            init.SetVelocity(16.0f);
            rider->GetMotionMaster()->LaunchMoveSpline(std::move(init), 1, MOTION_SLOT_ACTIVE, POINT_MOTION_TYPE);
        }

        void EndRide(Player* player)
        {
            _riderGUID.Clear();
            _rolling = false;
            if (!player)
                return;
            player->DeMorph();
            player->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_NPC);
            player->SetClientControl(player, true);
        }

        void UpdateIronStar(uint32 diff)
        {
            if (_riderless)
            {
                Creature* empty = Get(_crashStarGUID);
                if (empty && !empty->movespline->Finalized())
                    return;

                // smashed against the parapet: it blows up and takes the Iron Horde nearby with it; the blast
                // comes from a marker left on the spot, and the star's own death is it bursting apart
                _riderless = false;
                if (!empty)
                    return;
                if (TempSummon* blast = empty->SummonCreature(NPC_INVISIBLE_STALKER, empty->GetPositionX(), empty->GetPositionY(), empty->GetPositionZ() + 1.0f, 0.0f, TEMPSUMMON_TIMED_DESPAWN, 4 * IN_MILLISECONDS))
                    blast->CastSpell(blast, SPELL_FIRE_EXPLOSION, true);
                CrushAround(empty, 10.0f);
                empty->Kill(empty);
                empty->DespawnOrUnsummon(5 * IN_MILLISECONDS);
                return;
            }

            if (!_riderGUID)
                return;

            Player* rider = ObjectAccessor::FindPlayer(instance, _riderGUID);
            if (!rider || !rider->IsAlive() || rider->GetMapId() != MAP_SHATTRATH_SCENARIO)
            {
                EndRide(rider);
                return;
            }

            if (rider->GetDisplayId() != DISPLAY_IRON_STAR)
                rider->SetDisplayId(DISPLAY_IRON_STAR);

            if (!_rolling)
            {
                if (_rideTimer > diff || rider->IsBeingTeleported())
                {
                    if (_rideTimer > diff)
                        _rideTimer -= diff;
                    return;
                }
                LaunchRide(rider);
                return;
            }

            // a launch the client swallowed leaves the star standing: it is launched again
            if (_launchCheck)
            {
                if (_launchCheck > diff)
                    _launchCheck -= diff;
                else
                {
                    _launchCheck = 0;
                    if (rider->GetExactDist2d(&_launchFrom) < 2.0f && _launchTries < 3)
                    {
                        LaunchRide(rider);
                        return;
                    }
                }
            }

            if (_crushTimer <= diff)
            {
                _crushTimer = 300;
                CrushAround(rider, 6.0f);
                if (rider->isInCombat())
                    rider->CombatStop(true);
            }
            else
                _crushTimer -= diff;

            if (!rider->movespline->Finalized())
                return;

            // the end of the road: the hero gets their shape back, and an empty star curves away into the parapet
            Position const from = rider->GetPosition();
            EndRide(rider);
            rider->KnockbackFrom(IronStarCrash.GetPositionX(), IronStarCrash.GetPositionY(), 6.0f, 5.0f);
            SetData(DATA_RIDE_ARRIVED, 0);

            if (TempSummon* empty = rider->SummonCreature(NPC_IRON_STAR_SHELTER, from, TEMPSUMMON_TIMED_DESPAWN, 30 * IN_MILLISECONDS))
            {
                _crashStarGUID = empty->GetGUID();
                _riderless = true;
                empty->SetReactState(REACT_PASSIVE);
                Movement::MoveSplineInit init(*empty);
                init.MovebyPath(Movement::PointsArray(IronStarArc, IronStarArc + std::extent<decltype(IronStarArc)>::value));
                init.SetSmooth();
                init.SetVelocity(14.0f);
                empty->GetMotionMaster()->LaunchMoveSpline(std::move(init), 2, MOTION_SLOT_ACTIVE, POINT_MOTION_TYPE);
            }
        }

        void OnPlayerLeave(Player* player) override
        {
            InstanceScript::OnPlayerLeave(player);
            if (player->GetGUID() == _riderGUID)
                EndRide(player);
        }

        // the ships that ran aground keep shelling the harbor from their turrets, for as long as the battle lasts
        void UpdateVolleys(uint32 diff)
        {
            if (_volleysOver)
                return;

            // the ground and the crystal each have their own steady rhythm of fire
            if (_volleyTimer <= diff)
            {
                _volleyTimer = urand(2500, 3500);
                FireShell(false);
            }
            else
                _volleyTimer -= diff;

            if (_crystalTimer <= diff)
            {
                _crystalTimer = urand(2500, 3500);
                if (Get(_crystalGUID))
                    FireShell(true);
            }
            else
                _crystalTimer -= diff;
        }

        // four fixed spots around the crystal, on the side of the ships, where it brings the shells down
        Position CrystalCatchSpot(Creature* crystal)
        {
            if (!_catchBaseSet)
            {
                float sx = 0.0f, sy = 0.0f;
                for (ObjectGuid const& guid : _turretGUIDs)
                    if (Creature* muzzle = Get(guid))
                    {
                        float const a = crystal->GetAngle(muzzle);
                        sx += std::cos(a), sy += std::sin(a);
                    }
                _catchBase = std::atan2(sy, sx);
                _catchBaseSet = true;
            }
            static float const offsets[4] = { -0.50f, -0.17f, 0.17f, 0.50f };
            static float const heights[4] = { 5.0f, -2.0f, 3.0f, 0.0f };
            uint8 const slot = _nextCatch++ % 4;
            float const a = _catchBase + offsets[slot];
            return Position(crystal->GetPositionX() + CRYSTAL_SHIELD_RANGE * std::cos(a), crystal->GetPositionY() + CRYSTAL_SHIELD_RANGE * std::sin(a),
                crystal->GetPositionZ() + heights[slot]);
        }

        void FireShell(bool intercepted)
        {
            // the three turrets fire in turn
            if (_turretGUIDs.empty() || !GetReferencePlayer())
                return;

            auto itr = _turretGUIDs.begin();
            std::advance(itr, _nextTurret++ % _turretGUIDs.size());
            Creature* turret = Get(*itr);
            if (!turret)
                return;

            for (ObjectGuid const& guid : _turretGOs)
                if (GameObject* gun = instance->GetGameObject(guid))
                    if (gun->GetExactDist2d(turret) < 5.0f)
                        gun->SendCustomAnim(1);

            // the crystal's shells are lasered down in the air before they land; the others burst against the spots
            // picked in game, never on the heroes, the defenders or a player
            float x, y, z;
            Creature* crystal = Get(_crystalGUID);
            if (intercepted)
            {
                Position const spot = CrystalCatchSpot(crystal);
                x = spot.GetPositionX(), y = spot.GetPositionY(), z = spot.GetPositionZ();
            }
            else
            {
                G3D::Vector3 const& spot = ShellTargets[urand(0, std::extent<decltype(ShellTargets)>::value - 1)];
                x = spot.x, y = spot.y, z = spot.z;
            }
            if (TempSummon* impact = turret->SummonCreature(NPC_SHELL_IMPACT, x, y, z + 0.5f, 0.0f, TEMPSUMMON_TIMED_DESPAWN, 8 * IN_MILLISECONDS))
            {
                // the mark holds where it was put, up in the air for the crystal's catches
                impact->SetCanFly(true);
                impact->SetDisableGravity(true);
                if (!intercepted)
                    impact->SetObjectScale(SHELL_GROUND_SCALE);
                if (!intercepted)
                {
                    std::list<Creature*> nearby;
                    for (uint32 entry : { uint32(NPC_SHATTRATH_DEFENDER), uint32(NPC_YREL), uint32(NPC_DUROTAN), uint32(NPC_DRAKA), uint32(NPC_MARAAD), uint32(NPC_KHADGAR) })
                        impact->GetCreatureListWithEntryInGridAppend(nearby, entry, 12.0f);
                    bool player = false;
                    instance->ApplyOnEveryPlayer([&](Player* p) { if (p->GetDistance2d(x, y) < 12.0f) player = true; });
                    if (!nearby.empty() || player)
                    {
                        impact->DespawnOrUnsummon();
                        return;
                    }
                }
                // the shell leaves from the mark on the turret itself
                Creature* relay = turret;

                if (intercepted)
                {
                    // the crystal fires just before the shell reaches it
                    uint32 const flight = uint32(relay->GetDistance(impact) / SHELL_SPEED * IN_MILLISECONDS) + 1200;
                    ObjectGuid const markGuid = impact->GetGUID();
                    crystal->AddDelayedEvent(flight > 300 ? flight - 300 : flight, [crystal, markGuid]() -> void
                    {
                        if (Creature* mark = ObjectAccessor::GetCreature(*crystal, markGuid))
                            crystal->CastSpell(mark, SPELL_CRYSTAL_LASER, true);
                    });
                }
                // the shell leaves as the guns recoil
                ObjectGuid const impactGuid = impact->GetGUID();
                relay->AddDelayedEvent(1200, [relay, impactGuid]() -> void
                {
                    if (Creature* mark = ObjectAccessor::GetCreature(*relay, impactGuid))
                    {
                        relay->CastSpell(mark, SPELL_SHELL_IN_FLIGHT, true);
                        relay->CastSpell(mark, SPELL_FIRE_EXPLOSION, true);
                    }
                });
            }
        }

        // whatever of the Iron Horde stands in its way is crushed and thrown aside
        void CrushAround(Unit* star, float range)
        {
            std::list<Creature*> victims;
            for (uint32 entry : IronHordeUnits)
                star->GetCreatureListWithEntryInGridAppend(victims, entry, range);
            for (Creature* victim : victims)
                if (victim->IsAlive() && !IsFrozen(victim))
                {
                    victim->KnockbackFrom(star->GetPositionX(), star->GetPositionY(), 12.0f, 8.0f);
                    star->Kill(victim);
                }
        }

        void Update(uint32 diff) override
        {
            _events.Update(diff);
            while (uint32 eventId = _events.ExecuteEvent())
                ExecuteEvent(eventId);

            UpdateIronStar(diff);
            UpdateVolleys(diff);
            UpdateFilm(diff);

            if (_channeling)
            {
                if (_waveTimer <= diff)
                {
                    SendWave();
                    _waveTimer = WAVE_INTERVAL;
                }
                else
                    _waveTimer -= diff;

                // the spell's time only runs once he has taken his place
                if (_casting && _channelTimer <= diff)
                    FinishChannel();
                else
                {
                    if (_casting)
                        _channelTimer -= diff;
                    // if anything still pulled him into a fight, he goes straight back to his spell
                    if (Creature* khadgar = Get(_khadgarGUID))
                        UpdateKhadgarCast(khadgar);
                }
            }

            if (_khadgarJoining)
                CheckKhadgarJoined();

            if (_checkTimer > diff)
            {
                _checkTimer -= diff;
                return;
            }
            _checkTimer = IN_MILLISECONDS;

            Scenario* scenario = GetScenario(instance);
            if (!scenario || _completed)
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

            // Khadgar only shows a menu when he has something to offer
            if (Creature* khadgar = Get(_khadgarGUID))
            {
                bool offer = step == STEP_BATTLE_IS_JOINED || (step == STEP_THE_WEAPON && _khadgarJoined) || step == STEP_BLACKHAND;
                if (offer)
                    khadgar->SetFlag(UNIT_FIELD_NPC_FLAGS, UNIT_NPC_FLAG_GOSSIP);
                else
                    khadgar->RemoveFlag(UNIT_FIELD_NPC_FLAGS, UNIT_NPC_FLAG_GOSSIP);
            }

            // the star can only be boarded once Thaelin has sent the hero on
            if (Creature* star = Get(_ironStarGUID))
            {
                if (step == STEP_IRON_STAR && !_riderGUID && !_riderless)
                    star->SetFlag(UNIT_FIELD_NPC_FLAGS, UNIT_NPC_FLAG_GOSSIP);
                else
                    star->RemoveFlag(UNIT_FIELD_NPC_FLAGS, UNIT_NPC_FLAG_GOSSIP);
            }

            // on the flagship, Blackhand turns on the hero who comes near
            if (step == STEP_BLACKHAND && !_flagshipStarted)
                if (Creature* blackhand = Get(_blackhandGUID))
                    if (blackhand->SelectNearestPlayer(25.0f))
                        StartFlagship();

            if (step == STEP_THE_WEAPON)
            {
                // reaching the foot of the pier, where Orgrim stands up to Blackhand
                if (_heroesWalking)
                    CheckHeroesArrived();
                if (!_confronted && _heroesAtPier)
                    if (Creature* yrel = Get(_yrelGUID))
                        if (yrel->SelectNearestPlayer(40.0f))
                            StartConfrontation();

                // landing on the battleship
                if (!_brandtGreeted)
                    if (Creature* brandt = Get(_brandtGUID))
                        if (brandt->SelectNearestPlayer(60.0f))
                        {
                            _brandtGreeted = true;
                            brandt->AI()->Talk(SAY_BRANDT_NUISANCE);
                        }
            }
        }
    };

    InstanceScript* GetInstanceScript(InstanceMap* map) const override
    {
        return new instance_battle_for_shattrath_InstanceMapScript(map);
    }
};

// Khadgar, Yrel, Durotan, Draka, Maraad, Orgrim: the leaders of the assault cannot fall before the story says so
class npc_shattrath_hero : public CreatureScript
{
public:
    npc_shattrath_hero() : CreatureScript("npc_shattrath_hero") { }

    struct npc_shattrath_heroAI : public ScriptedAI
    {
        npc_shattrath_heroAI(Creature* creature) : ScriptedAI(creature) { }

        void DamageTaken(Unit* attacker, uint32& damage, DamageEffectType /*dmgType*/) override
        {
            // Blackhand's own blow ends Orgrim, everything else only wounds them
            if (me->GetEntry() == NPC_ORGRIM && attacker && attacker->GetEntry() == NPC_BLACKHAND)
                return;
            if (damage >= me->GetHealth())
                damage = me->GetHealth() > 1 ? me->GetHealth() - 1 : 0;
        }

        void MovementInform(uint32 type, uint32 id) override
        {
            if (type != POINT_MOTION_TYPE)
                return;
            if (id == 1)
                me->SetFacingTo(me->GetHomePosition().GetOrientation());
            else if (id == POINT_STAIRS_FOOT)
                me->GetMotionMaster()->MovePoint(2, me->GetHomePosition());
        }

        uint32 _seekTimer = IN_MILLISECONDS;

        void UpdateAI(uint32 diff) override
        {
            if (!UpdateVictim())
            {
                // Khadgar keeps to his spell and Orgrim to Blackhand; the others take on the Iron Horde at hand
                if (me->GetEntry() == NPC_KHADGAR || me->GetEntry() == NPC_ORGRIM)
                    return;
                if (_seekTimer > diff)
                {
                    _seekTimer -= diff;
                    return;
                }
                _seekTimer = 1500;
                if (Creature* foe = FindFoe(me, 15.0f))
                    AttackStart(foe);
                return;
            }
            DoMeleeAttackIfReady();
        }
    };

    CreatureAI* GetAI(Creature* creature) const override
    {
        return new npc_shattrath_heroAI(creature);
    }
};

// 77195 - Archmage Khadgar, in the scenario: begins his spell at the harbor, then sends the hero to the battleship and to the flagship
class npc_shattrath_khadgar : public CreatureScript
{
public:
    npc_shattrath_khadgar() : CreatureScript("npc_shattrath_khadgar") { }

    bool OnGossipHello(Player* player, Creature* creature) override
    {
        uint8 step = GetStep(creature);
        InstanceScript* instance = creature->GetInstanceScript();
        uint32 menu = 0, text = 0;

        if (step == STEP_BATTLE_IS_JOINED)
            menu = GOSSIP_MENU_BEGIN_SPELL, text = TEXT_KHADGAR_HARBOR;
        else if (step == STEP_THE_WEAPON && instance && instance->GetData(DATA_CONFRONTED))
            menu = GOSSIP_MENU_BATTLESHIP, text = TEXT_KHADGAR_BATTLESHIP;
        else if (step == STEP_BLACKHAND)
            menu = GOSSIP_MENU_FLAGSHIP, text = TEXT_KHADGAR_FLAGSHIP;

        // between two moments of the battle he has nothing to offer: not his default menu either
        if (!menu)
        {
            player->CLOSE_GOSSIP_MENU();
            return true;
        }

        player->ADD_GOSSIP_ITEM_DB(menu, 0, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_SCENARIO);
        player->SEND_GOSSIP_MENU(text, creature->GetGUID());
        return true;
    }

    // Khadgar's spell takes the hero away in a flash of arcane light
    static void Teleport(Player* player, Creature* khadgar, Position const& dest)
    {
        khadgar->SetFacingToObject(player);
        khadgar->HandleEmoteCommand(EMOTE_ONESHOT_SPELL_CAST_OMNI);
        player->CastSpell(player, SPELL_TELEPORT_VISUAL, true);
        ObjectGuid const guid = player->GetGUID();
        player->AddDelayedEvent(1200, [player, guid, dest]() -> void
        {
            if (player->GetGUID() == guid && player->IsInWorld() && player->GetMapId() == MAP_SHATTRATH_SCENARIO)
            {
                player->NearTeleportTo(dest);
                player->CastSpell(player, SPELL_TELEPORT_VISUAL, true);
            }
        });
    }

    bool OnGossipSelect(Player* player, Creature* creature, uint32 /*sender*/, uint32 action) override
    {
        player->CLOSE_GOSSIP_MENU();
        InstanceScript* instance = creature->GetInstanceScript();
        if (action != GOSSIP_ACTION_SCENARIO || !instance)
            return true;

        switch (GetStep(creature))
        {
            case STEP_BATTLE_IS_JOINED:
                instance->SetData(DATA_TALKED_TO_KHADGAR, 0);
                break;
            case STEP_THE_WEAPON:
                Teleport(player, creature, PlayerBattleship);
                instance->SetData(DATA_TELEPORT_BATTLESHIP, 0);
                break;
            case STEP_BLACKHAND:
                Teleport(player, creature, PlayerFlagship);
                instance->SetData(DATA_TELEPORT_FLAGSHIP, 0);
                break;
            default:
                break;
        }
        return true;
    }

    CreatureAI* GetAI(Creature* creature) const override
    {
        return new npc_shattrath_hero::npc_shattrath_heroAI(creature);
    }
};

// 77192 - Thaelin Darkanvil, beside the Iron Star he and Gazlowe repaired
class npc_shattrath_thaelin : public CreatureScript
{
public:
    npc_shattrath_thaelin() : CreatureScript("npc_shattrath_thaelin") { }

    bool OnGossipHello(Player* player, Creature* creature) override
    {
        if (GetStep(creature) != STEP_PREPARATIONS)
            return false;

        player->ADD_GOSSIP_ITEM_DB(GOSSIP_MENU_THAELIN, 0, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_SCENARIO);
        player->SEND_GOSSIP_MENU(player->GetGossipTextId(creature), creature->GetGUID());
        return true;
    }

    bool OnGossipSelect(Player* player, Creature* creature, uint32 /*sender*/, uint32 action) override
    {
        player->CLOSE_GOSSIP_MENU();
        if (action == GOSSIP_ACTION_SCENARIO)
            if (InstanceScript* instance = creature->GetInstanceScript())
                instance->SetData(DATA_TALKED_TO_THAELIN, 0);
        return true;
    }
};

// 86671 - Iron Star: the hero climbs in, it rolls down the avenue through the Iron Horde and drops them at the harbor
class npc_shattrath_iron_star : public CreatureScript
{
public:
    npc_shattrath_iron_star() : CreatureScript("npc_shattrath_iron_star") { }

    // once Thaelin has sent the hero on, a click makes them the star; the ride is driven by the instance script
    bool OnGossipHello(Player* player, Creature* creature) override
    {
        player->CLOSE_GOSSIP_MENU();
        if (GetStep(creature) == STEP_IRON_STAR)
            if (InstanceScript* instance = creature->GetInstanceScript())
                instance->SetGuidData(DATA_STAR_RIDER, player->GetGUID());
        return true;
    }

    struct npc_shattrath_iron_starAI : public ScriptedAI
    {
        npc_shattrath_iron_starAI(Creature* creature) : ScriptedAI(creature) { }

        void Reset() override
        {
            me->SetReactState(REACT_PASSIVE);
        }

        void UpdateAI(uint32 /*diff*/) override { }
    };

    CreatureAI* GetAI(Creature* creature) const override
    {
        return new npc_shattrath_iron_starAI(creature);
    }
};

// 77256 - Blackhand, on his flagship: he cannot be beaten, the hero has to outlast him behind the Iron Stars
class npc_shattrath_blackhand : public CreatureScript
{
public:
    npc_shattrath_blackhand() : CreatureScript("npc_shattrath_blackhand") { }

    enum
    {
        EVENT_MARK          = 1,
        EVENT_MARK_STRIKE,
        EVENT_ONSLAUGHT_END,
        FIGHT_DURATION      = 75 * IN_MILLISECONDS,
    };

    struct npc_shattrath_blackhandAI : public ScriptedAI
    {
        npc_shattrath_blackhandAI(Creature* creature) : ScriptedAI(creature) { }

        EventMap _events;
        ObjectGuid _markedGUID;
        bool _done = false;

        void Reset() override
        {
            _events.Reset();
            _markedGUID.Clear();
            if (GetStep(me) < STEP_BLACKHAND || !me->GetInstanceScript())
                me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_PC);
        }

        bool _started = false;

        // the heroes only hold him: his onslaught begins when the champion joins the fight
        void StartOnslaught()
        {
            // the scene is led by the instance script: he only fights
            _started = true;
        }

        void DamageDealt(Unit* victim, uint32& damage, DamageEffectType /*damageType*/) override
        {
            if (!victim)
                return;
            if (victim->IsControlledByPlayer())
                damage = std::min<uint32>(damage, uint32(victim->CountPctFromMaxHealth(1)));
            else
                damage = std::min<uint32>(damage, HERO_SCRATCH);
        }

        // he fights the heroes: a hero who strikes him does not draw him away from them
        uint32 _heroCheck = 1000;
        void KeepOnHeroes(uint32 diff)
        {
            if (_heroCheck > diff)
            {
                _heroCheck -= diff;
                return;
            }
            _heroCheck = 1000;
            Unit* victim = me->getVictim();
            if (victim && !victim->IsControlledByPlayer())
                return;
            std::list<Creature*> heroes;
            for (uint32 entry : { uint32(NPC_YREL), uint32(NPC_DUROTAN), uint32(NPC_MARAAD) })
                me->GetCreatureListWithEntryInGridAppend(heroes, entry, 20.0f);
            for (Creature* hero : heroes)
                if (hero->IsAlive() && hero->isInCombat())
                {
                    if (victim)
                        me->getThreatManager().modifyThreatPercent(victim, -100);
                    AttackStart(hero);
                    return;
                }
        }

        void DamageTaken(Unit* attacker, uint32& damage, DamageEffectType /*dmgType*/) override
        {
            if (attacker && attacker->IsControlledByPlayer())
                StartOnslaught();
            else
                damage = std::min<uint32>(damage, HERO_SCRATCH);
            if (damage >= me->GetHealth())
                damage = me->GetHealth() > 1 ? me->GetHealth() - 1 : 0;
        }

        // an Iron Star within a few yards of the line between Blackhand and the target shields it
        bool IsSheltered(Unit* target)
        {
            std::list<Creature*> stars;
            me->GetCreatureListWithEntryInGrid(stars, NPC_IRON_STAR_SHELTER, 40.0f);
            float ax = me->GetPositionX(), ay = me->GetPositionY();
            float bx = target->GetPositionX(), by = target->GetPositionY();
            float len2 = (bx - ax) * (bx - ax) + (by - ay) * (by - ay);
            for (Creature* star : stars)
            {
                float t = len2 > 0.0f ? ((star->GetPositionX() - ax) * (bx - ax) + (star->GetPositionY() - ay) * (by - ay)) / len2 : 0.0f;
                if (t <= 0.0f || t >= 1.0f)
                    continue;
                float px = ax + t * (bx - ax), py = ay + t * (by - ay);
                if (star->GetExactDist2d(px, py) < 3.0f)
                    return true;
            }
            return false;
        }

        void EndOnslaught()
        {
            _done = true;
            _events.Reset();
            // a last swing throws everyone back across the deck
            me->HandleEmoteCommand(EMOTE_ONESHOT_ATTACK1H);
            std::list<Player*> players;
            me->GetPlayerListInGrid(players, 40.0f);
            for (Player* player : players)
                player->KnockbackFrom(me->GetPositionX(), me->GetPositionY(), 15.0f, 7.0f);
            me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_PC);
            me->CombatStop(true);
            me->SetReactState(REACT_PASSIVE);
            if (InstanceScript* instance = me->GetInstanceScript())
                instance->SetData(DATA_BLACKHAND_DONE, 0);
        }

        void UpdateAI(uint32 diff) override
        {
            if (_done || !UpdateVictim())
                return;

            KeepOnHeroes(diff);

            _events.Update(diff);
            while (uint32 eventId = _events.ExecuteEvent())
            {
                switch (eventId)
                {
                    case EVENT_MARK:
                        if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 50.0f, true))
                        {
                            _markedGUID = target->GetGUID();
                            Talk(EMOTE_BLACKHAND_MARKED, target->GetGUID());
                        }
                        _events.ScheduleEvent(EVENT_MARK_STRIKE, 5 * IN_MILLISECONDS);
                        _events.ScheduleEvent(EVENT_MARK, 18 * IN_MILLISECONDS);
                        break;
                    case EVENT_MARK_STRIKE:
                        if (Player* target = ObjectAccessor::GetPlayer(*me, _markedGUID))
                            if (target->IsAlive() && !IsSheltered(target))
                                me->DealDamage(target, uint32(target->CountPctFromMaxHealth(60)));
                        _markedGUID.Clear();
                        break;
                    case EVENT_ONSLAUGHT_END:
                        EndOnslaught();
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
        return new npc_shattrath_blackhandAI(creature);
    }
};

// 80962 - Machinist B'randt, at the battleship's cannon: waits behind his six guards, scatters bombs when cornered
class npc_shattrath_machinist_brandt : public CreatureScript
{
public:
    npc_shattrath_machinist_brandt() : CreatureScript("npc_shattrath_machinist_brandt") { }

    struct npc_shattrath_machinist_brandtAI : public ScriptedAI
    {
        npc_shattrath_machinist_brandtAI(Creature* creature) : ScriptedAI(creature) { }

        enum
        {
            SPELL_NAPALM_THROWER    = 168127,   // sprays napalm ahead of him; its own burn (168126) does next to nothing at this level
            SPELL_NAPALM_BURN       = 168126,
            SPELL_BOMB_FRENZY       = 168367,
            EVENT_NAPALM            = 1,
            EVENT_NAPALM_TICK,
            EVENT_THROW_BOMB,
        };

        bool _bombs = false;
        uint8 _napalmTicks = 0;
        EventMap _events;

        void Reset() override
        {
            _bombs = false;
            _events.Reset();
        }

        void EnterCombat(Unit* /*who*/) override
        {
            _events.ScheduleEvent(EVENT_NAPALM, 6 * IN_MILLISECONDS);
            _events.ScheduleEvent(EVENT_THROW_BOMB, 10 * IN_MILLISECONDS);
        }

        void DamageTaken(Unit* /*attacker*/, uint32& damage, DamageEffectType /*dmgType*/) override
        {
            if (_bombs || !me->HealthBelowPctDamaged(20, damage))
                return;

            _bombs = true;
            Talk(SAY_BRANDT_TAKE_YOU_OUT);
            DoCast(me, SPELL_BOMB_FRENZY, true);
            for (uint8 i = 0; i < 6; ++i)
            {
                float angle = frand(0.0f, 2.0f * float(M_PI));
                float dist = frand(3.0f, 9.0f);
                Position pos(me->GetPositionX() + dist * std::cos(angle), me->GetPositionY() + dist * std::sin(angle), me->GetPositionZ());
                me->SummonCreature(NPC_BLACKROCK_BOMB, pos, TEMPSUMMON_TIMED_DESPAWN, 6 * IN_MILLISECONDS);
            }
        }

        void UpdateAI(uint32 diff) override
        {
            if (!UpdateVictim())
                return;

            _events.Update(diff);
            if (me->HasUnitState(UNIT_STATE_CASTING))
                return;

            while (uint32 eventId = _events.ExecuteEvent())
            {
                Unit* victim = me->getVictim();
                switch (eventId)
                {
                    case EVENT_NAPALM:
                        DoCast(me, SPELL_NAPALM_THROWER, true);
                        _napalmTicks = 8;
                        _events.ScheduleEvent(EVENT_NAPALM_TICK, 750);
                        _events.ScheduleEvent(EVENT_NAPALM, 15 * IN_MILLISECONDS);
                        break;
                    case EVENT_NAPALM_TICK:
                    {
                        // whoever stands in the spray ahead of him burns
                        std::list<Player*> players;
                        me->GetPlayerListInGrid(players, 13.0f);
                        for (Player* player : players)
                            if (player->IsAlive() && me->isInFront(player, float(M_PI) * 70.0f / 180.0f))
                            {
                                me->DealDamage(player, uint32(player->CountPctFromMaxHealth(4)));
                                if (!player->HasAura(SPELL_NAPALM_BURN))
                                    me->AddAura(SPELL_NAPALM_BURN, player);
                            }
                        if (--_napalmTicks)
                            _events.ScheduleEvent(EVENT_NAPALM_TICK, 750);
                        break;
                    }
                    case EVENT_THROW_BOMB:
                        // a fused Blackrock bomb at the feet of whoever he fights
                        me->HandleEmoteCommand(EMOTE_ONESHOT_ATTACK_THROWN);
                        me->SummonCreature(NPC_BLACKROCK_BOMB, victim->GetPositionX(), victim->GetPositionY(), victim->GetPositionZ(), 0.0f, TEMPSUMMON_TIMED_DESPAWN, 8 * IN_MILLISECONDS);
                        _events.ScheduleEvent(EVENT_THROW_BOMB, urand(10, 12) * IN_MILLISECONDS);
                        break;
                    default:
                        break;
                }
            }
            DoMeleeAttackIfReady();
        }
    };

    CreatureAI* GetAI(Creature* creature) const override
    {
        return new npc_shattrath_machinist_brandtAI(creature);
    }
};

// 84206 - Blackrock Bomb, scattered by B'randt: goes off after a short fuse
class npc_shattrath_blackrock_bomb : public CreatureScript
{
public:
    npc_shattrath_blackrock_bomb() : CreatureScript("npc_shattrath_blackrock_bomb") { }

    struct npc_shattrath_blackrock_bombAI : public ScriptedAI
    {
        npc_shattrath_blackrock_bombAI(Creature* creature) : ScriptedAI(creature) { }

        uint32 _fuse = 4 * IN_MILLISECONDS;

        void Reset() override
        {
            me->SetReactState(REACT_PASSIVE);
        }

        void UpdateAI(uint32 diff) override
        {
            if (!_fuse)
                return;
            if (_fuse > diff)
            {
                _fuse -= diff;
                return;
            }

            _fuse = 0;
            me->CastSpell(me, SPELL_FIRE_EXPLOSION, true);
            std::list<Player*> players;
            me->GetPlayerListInGrid(players, 5.0f);
            for (Player* player : players)
                if (player->IsAlive())
                {
                    me->DealDamage(player, uint32(player->CountPctFromMaxHealth(20)));
                    player->KnockbackFrom(me->GetPositionX(), me->GetPositionY(), 8.0f, 6.0f);
                }
            me->DespawnOrUnsummon(500);
        }
    };

    CreatureAI* GetAI(Creature* creature) const override
    {
        return new npc_shattrath_blackrock_bombAI(creature);
    }
};

// Shattrath defenders and the Iron Horde in the streets and on the docks: they seek each other out and fight on,
// wounds between them stay light so the battle lasts until a hero or the Iron Star settles it
class npc_shattrath_street_fighter : public CreatureScript
{
public:
    npc_shattrath_street_fighter() : CreatureScript("npc_shattrath_street_fighter") { }

    struct npc_shattrath_street_fighterAI : public ScriptedAI
    {
        npc_shattrath_street_fighterAI(Creature* creature) : ScriptedAI(creature) { }

        uint32 _seekTimer = IN_MILLISECONDS;
        uint32 _spellTimer = 4 * IN_MILLISECONDS;

        void DamageTaken(Unit* attacker, uint32& damage, DamageEffectType /*dmgType*/) override
        {
            if (attacker && !attacker->IsControlledByPlayer() && me->HealthBelowPctDamaged(30, damage))
                damage = 0;
        }

        // the defenders' withdrawal once the Iron Horde hangs frozen: up the middle of the stairs, then gone
        void MovementInform(uint32 type, uint32 id) override
        {
            if (type != POINT_MOTION_TYPE)
                return;
            if (id == POINT_WITHDRAW_FOOT)
                me->GetMotionMaster()->MovePoint(POINT_WITHDRAW_TOP, StairsTop.GetPositionX(), me->GetPositionY(), StairsTop.GetPositionZ());
            else if (id == POINT_WITHDRAW_TOP)
                me->DespawnOrUnsummon(500, Seconds(DAY));
        }

        void MoveInLineOfSight(Unit* who) override
        {
            if (KeepApart(me, who))
                return;
            ScriptedAI::MoveInLineOfSight(who);
        }

        void AttackStart(Unit* who) override
        {
            if (KeepApart(me, who))
                return;
            ScriptedAI::AttackStart(who);
        }

        // each kind of soldier has its one ability, cast on whoever it fights
        uint32 Ability(bool& onSelf) const
        {
            onSelf = false;
            switch (me->GetEntry())
            {
                case NPC_GROMKAR_VANGUARD: case NPC_DOCKS_VANGUARD: case NPC_WAVE_VANGUARD:            return SPELL_SHOULDER_CHARGE;
                case NPC_GROMKAR_GRIMSHOT: case NPC_DOCKS_GRIMSHOT: case NPC_WAVE_GRIMSHOT:            return SPELL_HIDE_PIERCING_SHOT;
                case NPC_GROMKAR_SHADOWBLADE: case NPC_DOCKS_SHADOWBLADE: case NPC_WAVE_SHADOWBLADE:   return SPELL_STORMSTRIKE;
                case NPC_GROMKAR_DEADEYE:                                                              return SPELL_RIFLE_SHOT;
                case NPC_FIREBLADE_INVOKER:                                                            return SPELL_LAVA_BURST;
                case NPC_BURNING_BLADEMASTER: case NPC_DOCKS_BLADEMASTER: case NPC_WAVE_BLADEMASTER:
                    onSelf = true;
                    return SPELL_WHIRLWIND;
                default:
                    return 0;
            }
        }

        void UpdateAI(uint32 diff) override
        {
            if (IsFrozen(me))
                return;

            if (!UpdateVictim())
            {
                // the line at the docks waits for the heroes to come down
                if (me->GetReactState() == REACT_PASSIVE)
                    return;
                if (_seekTimer > diff)
                {
                    _seekTimer -= diff;
                    return;
                }
                _seekTimer = 1500;
                // the waves come for the heroes; the line of the docks waits for them
                if (Creature* foe = FindFoe(me, IsWave(me->GetEntry()) && !me->GetDBTableGUIDLow() ? 40.0f : 12.0f))
                    AttackStart(foe);
                return;
            }

            if (Leashed(me))
            {
                EnterEvadeMode();
                return;
            }

            // caught up with the wrong foe all the same: let go of it and go for the heroes
            if (KeepApart(me, me->getVictim()))
            {
                me->getThreatManager().modifyThreatPercent(me->getVictim(), -100);
                me->AttackStop();
                if (Creature* foe = FindFoe(me, IsWave(me->GetEntry()) ? 40.0f : 12.0f))
                    AttackStart(foe);
                return;
            }

            if (_spellTimer <= diff)
            {
                _spellTimer = urand(8, 14) * IN_MILLISECONDS;
                bool onSelf = false;
                if (uint32 spell = Ability(onSelf))
                    if (!me->HasUnitState(UNIT_STATE_CASTING))
                        DoCast(onSelf ? me : me->getVictim(), spell);
            }
            else
                _spellTimer -= diff;

            if (!me->HasUnitState(UNIT_STATE_CASTING))
                DoMeleeAttackIfReady();
        }
    };

    CreatureAI* GetAI(Creature* creature) const override
    {
        return new npc_shattrath_street_fighterAI(creature);
    }
};

// 84630 - Grom'kar Grenadier, on the battleship: stands waiting for the hero, then lobs mortar shells and leaves fused bombs at their feet
class npc_shattrath_grenadier : public CreatureScript
{
public:
    npc_shattrath_grenadier() : CreatureScript("npc_shattrath_grenadier") { }

    enum
    {
        EVENT_MORTAR_SHOT       = 1,
        EVENT_DROP_BOMB,
    };

    struct npc_shattrath_grenadierAI : public ScriptedAI
    {
        npc_shattrath_grenadierAI(Creature* creature) : ScriptedAI(creature) { }

        EventMap _events;

        void Reset() override
        {
            _events.Reset();
        }

        void EnterCombat(Unit* /*who*/) override
        {
            _events.ScheduleEvent(EVENT_MORTAR_SHOT, urand(2, 4) * IN_MILLISECONDS);
            _events.ScheduleEvent(EVENT_DROP_BOMB, urand(8, 12) * IN_MILLISECONDS);
        }

        void UpdateAI(uint32 diff) override
        {
            if (!UpdateVictim())
                return;

            if (Leashed(me))
            {
                EnterEvadeMode();
                return;
            }

            _events.Update(diff);
            if (me->HasUnitState(UNIT_STATE_CASTING))
                return;

            while (uint32 eventId = _events.ExecuteEvent())
            {
                Unit* victim = me->getVictim();
                switch (eventId)
                {
                    case EVENT_MORTAR_SHOT:
                        me->CastSpell(victim->GetPositionX(), victim->GetPositionY(), victim->GetPositionZ(), SPELL_MORTAR_SHOT, false);
                        _events.ScheduleEvent(EVENT_MORTAR_SHOT, urand(6, 9) * IN_MILLISECONDS);
                        break;
                    case EVENT_DROP_BOMB:
                        me->SummonCreature(NPC_BLACKROCK_BOMB, victim->GetPositionX(), victim->GetPositionY(), victim->GetPositionZ(), 0.0f, TEMPSUMMON_TIMED_DESPAWN, 8 * IN_MILLISECONDS);
                        _events.ScheduleEvent(EVENT_DROP_BOMB, urand(12, 16) * IN_MILLISECONDS);
                        break;
                    default:
                        break;
                }
            }
            DoMeleeAttackIfReady();
        }
    };

    CreatureAI* GetAI(Creature* creature) const override
    {
        return new npc_shattrath_grenadierAI(creature);
    }
};

// 84092 - Blackrock Bomb, lying on the battleship's deck: a click hands the hero a bomb to throw where they aim
class npc_shattrath_bomb_pickup : public CreatureScript
{
public:
    npc_shattrath_bomb_pickup() : CreatureScript("npc_shattrath_bomb_pickup") { }

    struct npc_shattrath_bomb_pickupAI : public ScriptedAI
    {
        npc_shattrath_bomb_pickupAI(Creature* creature) : ScriptedAI(creature) { }

        void Reset() override
        {
            me->SetReactState(REACT_PASSIVE);
        }

        void OnSpellClick(Unit* /*clicker*/) override
        {
            me->DespawnOrUnsummon(0, Seconds(20));
        }

        void UpdateAI(uint32 /*diff*/) override { }
    };

    CreatureAI* GetAI(Creature* creature) const override
    {
        return new npc_shattrath_bomb_pickupAI(creature);
    }
};

// 84229 - the battleship's great cannon, where B'randt waits
class npc_shattrath_big_cannon : public CreatureScript
{
public:
    npc_shattrath_big_cannon() : CreatureScript("npc_shattrath_big_cannon") { }

    struct npc_shattrath_big_cannonAI : public ScriptedAI
    {
        npc_shattrath_big_cannonAI(Creature* creature) : ScriptedAI(creature) { }

        void Reset() override
        {
            me->SetReactState(REACT_PASSIVE);
        }

        void UpdateAI(uint32 /*diff*/) override { }
    };

    CreatureAI* GetAI(Creature* creature) const override
    {
        return new npc_shattrath_big_cannonAI(creature);
    }
};

// 231620 - Portal to Talador: home to Fort Wrynn or Vol'jin's Pride once the flagship is lost
class go_shattrath_portal_to_talador : public GameObjectScript
{
public:
    go_shattrath_portal_to_talador() : GameObjectScript("go_shattrath_portal_to_talador") { }

    bool OnGossipHello(Player* player, GameObject* /*go*/) override
    {
        Position const& exit = player->GetTeam() == HORDE ? HordeExit : AllianceExit;
        player->TeleportTo(MAP_TALADOR, exit.GetPositionX(), exit.GetPositionY(), exit.GetPositionZ(), exit.GetOrientation());
        return true;
    }
};

// 75805 - Archmage Khadgar, before the Arch of Sha'tar: the battle begins with him
class npc_talador_khadgar_shattrath : public CreatureScript
{
public:
    npc_talador_khadgar_shattrath() : CreatureScript("npc_talador_khadgar_shattrath") { }

    struct npc_talador_khadgar_shattrathAI : public ScriptedAI
    {
        npc_talador_khadgar_shattrathAI(Creature* creature) : ScriptedAI(creature) { }

        void sQuestAccept(Player* player, Quest const* quest) override
        {
            if (quest->GetQuestId() == QUEST_BATTLE_ALLIANCE || quest->GetQuestId() == QUEST_BATTLE_HORDE)
                Talk(SAY_KHADGAR_TALADOR_ACCEPT, player->GetGUID());
        }
    };

    bool OnGossipHello(Player* player, Creature* creature) override
    {
        if (!HasBattleQuest(player))
            return false;

        if (creature->isQuestGiver())
            player->PrepareQuestMenu(creature->GetGUID());
        player->ADD_GOSSIP_ITEM_DB(GOSSIP_MENU_ENTER, 0, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_SCENARIO);
        player->SEND_GOSSIP_MENU(player->GetGossipTextId(creature), creature->GetGUID());
        return true;
    }

    bool OnGossipSelect(Player* player, Creature* /*creature*/, uint32 /*sender*/, uint32 action) override
    {
        player->CLOSE_GOSSIP_MENU();
        if (action == GOSSIP_ACTION_SCENARIO)
            EnterScenario(player);
        return true;
    }

    CreatureAI* GetAI(Creature* creature) const override
    {
        return new npc_talador_khadgar_shattrathAI(creature);
    }
};

// walking through the Arch of Sha'tar with the quest leads into the battle; abandoning the quest starts it over
class playerscript_battle_for_shattrath : public PlayerScript
{
public:
    playerscript_battle_for_shattrath() : PlayerScript("playerscript_battle_for_shattrath") { }

    void OnUpdate(Player* player, uint32 /*diff*/) override
    {
        if (player->GetMapId() != MAP_TALADOR || player->IsBeingTeleported() || player->GetExactDist2dSq(ArchOfShatar.GetPositionX(), ArchOfShatar.GetPositionY()) > 12.0f * 12.0f)
            return;
        if (std::fabs(player->GetPositionZ() - ArchOfShatar.GetPositionZ()) < 8.0f && player->IsAlive() && HasBattleQuest(player))
            EnterScenario(player);
    }

    void OnSpellCast(Player* player, Spell* spell, bool /*skipCheck*/) override
    {
        if (spell->GetSpellInfo()->Id != SPELL_BLACKROCK_GRENADE)
            return;
        ObjectGuid const guid = player->GetGUID();
        player->AddDelayedEvent(500, [player, guid]() -> void
        {
            if (player->GetGUID() == guid)
                player->RemoveAurasDueToSpell(SPELL_BLACKROCK_GRENADES);
        });
    }

    void OnQuestAbandon(Player* player, Quest const* quest) override
    {
        if (quest->GetQuestId() == QUEST_BATTLE_ALLIANCE || quest->GetQuestId() == QUEST_BATTLE_HORDE)
            CharacterDatabase.PExecute("DELETE FROM character_scenario_step WHERE guid = " UI64FMTD " AND scenario = %u",
                uint64(player->GetGUIDLow()), uint32(SCENARIO_SHATTRATH));
    }
};

void AddSC_battle_for_shattrath()
{
    new instance_battle_for_shattrath();
    new npc_shattrath_hero();
    new npc_shattrath_khadgar();
    new npc_shattrath_thaelin();
    new npc_shattrath_iron_star();
    new npc_shattrath_blackhand();
    new npc_shattrath_machinist_brandt();
    new npc_shattrath_blackrock_bomb();
    new npc_shattrath_street_fighter();
    new npc_shattrath_grenadier();
    new npc_shattrath_bomb_pickup();
    new npc_shattrath_big_cannon();
    new go_shattrath_portal_to_talador();
    new npc_talador_khadgar_shattrath();
    new playerscript_battle_for_shattrath();
}
