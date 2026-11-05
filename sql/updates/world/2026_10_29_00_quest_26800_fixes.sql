-- Quest 26800 "Recruitment" (Deathknell): consolidated fix set.
--
-- The chain: Saltain (1740) is supposed to summon Darnell (49337) on quest accept, the
-- player then spell-clicks Scarlet Corpses (49340) which board Darnell's vehicle (spell
-- 46598) and credit the objective. Final state after several diagnosis rounds:
--
-- 1) Saltain casts 91938 through SMART_ACTION_INVOKER_CAST. A non-triggered cast can be
--    refused by the spell's own requirements (level/target/state), silently leaving the
--    player without Darnell. Cast it triggered (flags 2), like retail quest summons.
-- 2) Darnell is driven by action list 4933701. SmartAI starts with mRun = false, so
--    SetFollow() launched a walking spline and the escort could not keep up. Enable run
--    first, then (re)issue the follow at run speed. The 200 ms delay on the follow row is
--    rejected at load (SmartAIMgr validates min/max from event_param1/2), so use delay 0.
-- 3) The spell_area row for 91938 (area 154) had quest_end_status=67 (bits {0,1,6}) and
--    quest_start_status=74 (bits {1,3,6}) on the same quest: the intersection {1,6} does
--    not cover QUEST_STATUS_INCOMPLETE=3, so IsFitToRequirements returned NOT FIT while
--    the quest was in progress and both cast paths were silently blocked. Add bit 3:
--    67 -> 75 (bits {0,1,3,6}).
-- 4) Spell 91938 has a single SPELL_EFFECT_APPLY_AURA / SPELL_AURA_PERIODIC_DUMMY effect
--    in the 7.3.5 client data (SpellEffect.db2) and no summon effect at all, so the
--    SmartAI chain can never actually spawn Darnell. The quest is therefore implemented
--    by the C++ AIs in zone_tirisfal_glades.cpp:
--      1740  npc_deathguard_saltain    - on reward ejects Darnell's passengers, dismisses him
--      49337 npc_darnel_q26800         - follows the player at run speed, carries the corpses
--      49340 npc_scarlet_corpse_q26800 - spell click credits the objective and boards Darnell
--    A ScriptName always wins over AIName, so bind the templates to their scripts.

-- 1) triggered invoker cast
UPDATE `smart_scripts` SET `action_param2` = 2 WHERE `entryorguid` = 1740 AND `id` = 0 AND `source_type` = 0;

-- 2) Darnell runs and follows at run speed
DELETE FROM `smart_scripts` WHERE `entryorguid` = 4933701 AND `source_type` = 9 AND `id` IN (3, 4);

INSERT INTO `smart_scripts`
(`entryorguid`, `source_type`, `id`, `link`, `Difficulties`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`,
 `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`,
 `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`,
 `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`,
 `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(4933701, 9, 3, 0, '', 0, 0, 100, 0, 0, 0, 0, 0, 0, 59, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Darnell - On spawn - run'),
(4933701, 9, 4, 0, '', 0, 0, 100, 0, 0, 0, 0, 0, 0, 29, 0, 0, 0, 0, 0, 0, 23, 0, 0, 0, 0, 0, 0, 0, 0, 'Darnell - On spawn - follow summoner at run speed');

-- 3) allow casting while the quest is in progress
UPDATE `spell_area` SET `quest_end_status` = 75 WHERE `spell` = 91938 AND `area` = 154;

-- 4) bind the templates to the C++ implementations
UPDATE `creature_template` SET `ScriptName` = 'npc_deathguard_saltain' WHERE `entry` = 1740;
UPDATE `creature_template` SET `ScriptName` = 'npc_darnel_q26800' WHERE `entry` = 49337;
UPDATE `creature_template` SET `ScriptName` = 'npc_scarlet_corpse_q26800' WHERE `entry` = 49340;
