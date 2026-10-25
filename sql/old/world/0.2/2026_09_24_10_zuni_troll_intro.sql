-- Troll starting scene (Echo Isles): Calm of the Novice (71033) kneels the new troll and summons Zuni (71241).
-- Nothing ended the scene: Jin'thala had no script, nothing cast 71037 on Zuni, and Zuni had no script. Data from TDB 12.1.
-- Accepting The Rise of the Darkspear: Jin'thala speaks, the troll stands up, and the invoker casts the tracking
-- quest spell (71035) which applies 93342; when that aura ends, 71037 sends Zuni to the training grounds.

DELETE FROM `spell_linked_spell` WHERE `spell_trigger` IN (-71033, -93342) AND `spell_effect` = 71037;
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES
(-93342, 71037, 0, 'Zuni Lvl 1 Trigger Aura - Zuni Lvl 1 Trigger');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 13 AND `SourceEntry` = 71037;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(13, 1, 71037, 0, 0, 31, 0, 3, 37988, 0, 0, 0, '', 'Spell Zuni Lvl 1 Trigger (effect 0) will hit the potential target of the spell if target is unit Zuni Lvl 1.');

-- The old rows were German text sharing one group
DELETE FROM `creature_text` WHERE `CreatureID` = 37988;
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextID`, `MinTimer`, `MaxTimer`, `SpellID`, `comment`) VALUES
(37988, 0, 0, 'Ya, mon. Let\'s crack some tiki target skulls!', 12, 0, 100, 5, 0, 21366, 37818, 0, 0, 0, 'Zuni Lvl 1'),
(37988, 1, 0, 'Ya trainer should be somewhere in the grounds \'ere. I\'ll catch you lata, mon.', 12, 0, 100, 1, 0, 21367, 39087, 0, 0, 0, 'Zuni Lvl 1');

DELETE FROM `waypoints` WHERE `entry` = 303905;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES
(303905, 1, -1172.82, -5299.05, 5.2013, 'Zuni Lvl 1'),
(303905, 2, -1176.12, -5326.73, 13.6854, 'Zuni Lvl 1'),
(303905, 3, -1172.4, -5343.75, 15.3865, 'Zuni Lvl 1'),
(303905, 4, -1164.62, -5369.52, 14.2502, 'Zuni Lvl 1'),
(303905, 5, -1162.04, -5391.75, 12.0603, 'Zuni Lvl 1');

-- Summon Zuni next to the troll start point (TDB 7.3.5); without it the spell picks another spot and Zuni runs off
DELETE FROM `spell_target_position` WHERE `id` = 71241;
INSERT INTO `spell_target_position` (`id`, `target_map`, `target_position_x`, `target_position_y`, `target_position_z`, `target_orientation`) VALUES
(71241, 1, -1173.45, -5266.4, 0.942393, 0);

-- Zuni waits seated next to the new troll; his script stands him up before he leaves.
-- No turn on reset: the facing spline sent as the summon spawns stands him up in a running pose.
-- He stands and speaks one second after being called (TDB waited 4 s), then leaves 4 s later.
DELETE FROM `creature_template_addon` WHERE `entry` = 37988;
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`) VALUES
(37988, 0, 0, 1, 1, 0);

UPDATE `creature_template` SET `AIName` = 'SmartAI', `ScriptName` = '' WHERE `entry` = 37988;

DELETE FROM `smart_scripts` WHERE `entryorguid` = 37988 AND `source_type` = 0;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (3798800, 3798801) AND `source_type` = 9;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `Difficulties`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(37988, 0, 2, 0, '', 25, 0, 100, 0, 0, 0, 0, 0, 0, 22, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Zuni Lvl 1 - On Reset - Set Event Phase 1'),
(37988, 0, 3, 4, '', 8, 1, 100, 0, 71037, 0, 0, 0, 0, 80, 3798800, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Zuni Lvl 1 - On Spellhit - Play script'),
(37988, 0, 4, 0, '', 61, 0, 100, 0, 0, 0, 0, 0, 0, 22, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Zuni Lvl 1 - On Spellhit - Set Event Phase 0'),
(37988, 0, 5, 6, '', 40, 0, 100, 0, 5, 303905, 0, 0, 0, 66, 0, 0, 0, 0, 0, 0, 23, 0, 0, 0, 0, 0, 0, 0, 0, 'Zuni Lvl 1 - On Reached WP5 - Turn to summoner'),
(37988, 0, 6, 7, '', 61, 0, 100, 0, 0, 0, 0, 0, 0, 1, 1, 0, 1, 0, 0, 0, 23, 0, 0, 0, 0, 0, 0, 0, 0, 'Zuni Lvl 1 - On Reached WP5 - Say 1'),
(37988, 0, 7, 8, '', 61, 0, 100, 0, 0, 0, 0, 0, 0, 41, 20000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Zuni Lvl 1 - On Reached WP5 - Despawn in 20 seconds'),
(37988, 0, 8, 0, '', 61, 0, 100, 0, 0, 0, 0, 0, 0, 80, 3798801, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Zuni Lvl 1 - On Reached WP5 - Play script'),
(3798800, 9, 0, 0, '', 0, 0, 100, 0, 1000, 1000, 0, 0, 0, 91, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Zuni Lvl 1 - Script - Stand up'),
(3798800, 9, 1, 0, '', 0, 0, 100, 0, 0, 0, 0, 0, 0, 66, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'Zuni Lvl 1 - Script - Turn to invoker'),
(3798800, 9, 2, 0, '', 0, 0, 100, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'Zuni Lvl 1 - Script - Say 0'),
(3798800, 9, 3, 0, '', 0, 0, 100, 0, 4000, 4000, 0, 0, 0, 53, 1, 303905, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Zuni Lvl 1 - Script - Move path'),
(3798801, 9, 0, 0, '', 0, 0, 100, 0, 7000, 7000, 0, 0, 0, 66, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 3.49066, 'Zuni Lvl 1 - Script - Turn to');

-- The old row was German text without a broadcast text, so no client translation could show
DELETE FROM `creature_text` WHERE `CreatureID` = 37951;
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextID`, `MinTimer`, `MaxTimer`, `SpellID`, `comment`) VALUES
(37951, 0, 0, '$n. Zuni. Ya''ll find ya trainer in the trainin'' grounds to the east. Bring pride to the Darkspear.', 12, 0, 100, 1, 0, 0, 37821, 0, 0, 0, 'Jin''thala');

UPDATE `creature_template` SET `AIName` = 'SmartAI', `ScriptName` = '' WHERE `entry` = 37951;

-- The Rise of the Darkspear was auto-accepted as soon as its window opened, so the scene started before the
-- player clicked Accept; accepting it by hand keeps the scene on the click (0x80000 = QUEST_FLAGS_AUTO_ACCEPT)
UPDATE `quest_template` SET `Flags` = `Flags` & ~0x80000 WHERE `ID` IN (24607, 24750, 24758, 24764, 24770, 24776, 24782, 26272, 31159);

-- Zuni leaves as soon as the quest is taken rather than when the troll first moves (93342 still ends the same way)
DELETE FROM `smart_scripts` WHERE `entryorguid` = 37951 AND `source_type` = 0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `Difficulties`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(37951, 0, 0, 1, '', 19, 0, 100, 0, 24607, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'Jin''thala - On Quest 24607 Accepted - Say 0'),
(37951, 0, 1, 2, '', 61, 0, 100, 0, 0, 0, 0, 0, 0, 28, 71033, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'Jin''thala - On Quest 24607 Accepted - Remove Calm of the Novice from invoker'),
(37951, 0, 2, 3, '', 61, 0, 100, 0, 0, 0, 0, 0, 0, 85, 71035, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'Jin''thala - On Quest 24607 Accepted - Invoker Cast Troll Introduction Tracking Quest'),
(37951, 0, 3, 0, '', 61, 0, 100, 0, 0, 0, 0, 0, 0, 85, 71037, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'Jin''thala - On Quest 24607 Accepted - Invoker Cast Zuni Lvl 1 Trigger'),
(37951, 0, 4, 5, '', 19, 0, 100, 0, 24750, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'Jin''thala - On Quest 24750 Accepted - Say 0'),
(37951, 0, 5, 6, '', 61, 0, 100, 0, 0, 0, 0, 0, 0, 28, 71033, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'Jin''thala - On Quest 24750 Accepted - Remove Calm of the Novice from invoker'),
(37951, 0, 6, 7, '', 61, 0, 100, 0, 0, 0, 0, 0, 0, 85, 71035, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'Jin''thala - On Quest 24750 Accepted - Invoker Cast Troll Introduction Tracking Quest'),
(37951, 0, 7, 0, '', 61, 0, 100, 0, 0, 0, 0, 0, 0, 85, 71037, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'Jin''thala - On Quest 24750 Accepted - Invoker Cast Zuni Lvl 1 Trigger'),
(37951, 0, 8, 9, '', 19, 0, 100, 0, 24758, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'Jin''thala - On Quest 24758 Accepted - Say 0'),
(37951, 0, 9, 10, '', 61, 0, 100, 0, 0, 0, 0, 0, 0, 28, 71033, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'Jin''thala - On Quest 24758 Accepted - Remove Calm of the Novice from invoker'),
(37951, 0, 10, 11, '', 61, 0, 100, 0, 0, 0, 0, 0, 0, 85, 71035, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'Jin''thala - On Quest 24758 Accepted - Invoker Cast Troll Introduction Tracking Quest'),
(37951, 0, 11, 0, '', 61, 0, 100, 0, 0, 0, 0, 0, 0, 85, 71037, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'Jin''thala - On Quest 24758 Accepted - Invoker Cast Zuni Lvl 1 Trigger'),
(37951, 0, 12, 13, '', 19, 0, 100, 0, 24764, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'Jin''thala - On Quest 24764 Accepted - Say 0'),
(37951, 0, 13, 14, '', 61, 0, 100, 0, 0, 0, 0, 0, 0, 28, 71033, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'Jin''thala - On Quest 24764 Accepted - Remove Calm of the Novice from invoker'),
(37951, 0, 14, 15, '', 61, 0, 100, 0, 0, 0, 0, 0, 0, 85, 71035, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'Jin''thala - On Quest 24764 Accepted - Invoker Cast Troll Introduction Tracking Quest'),
(37951, 0, 15, 0, '', 61, 0, 100, 0, 0, 0, 0, 0, 0, 85, 71037, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'Jin''thala - On Quest 24764 Accepted - Invoker Cast Zuni Lvl 1 Trigger'),
(37951, 0, 16, 17, '', 19, 0, 100, 0, 24770, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'Jin''thala - On Quest 24770 Accepted - Say 0'),
(37951, 0, 17, 18, '', 61, 0, 100, 0, 0, 0, 0, 0, 0, 28, 71033, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'Jin''thala - On Quest 24770 Accepted - Remove Calm of the Novice from invoker'),
(37951, 0, 18, 19, '', 61, 0, 100, 0, 0, 0, 0, 0, 0, 85, 71035, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'Jin''thala - On Quest 24770 Accepted - Invoker Cast Troll Introduction Tracking Quest'),
(37951, 0, 19, 0, '', 61, 0, 100, 0, 0, 0, 0, 0, 0, 85, 71037, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'Jin''thala - On Quest 24770 Accepted - Invoker Cast Zuni Lvl 1 Trigger'),
(37951, 0, 20, 21, '', 19, 0, 100, 0, 24776, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'Jin''thala - On Quest 24776 Accepted - Say 0'),
(37951, 0, 21, 22, '', 61, 0, 100, 0, 0, 0, 0, 0, 0, 28, 71033, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'Jin''thala - On Quest 24776 Accepted - Remove Calm of the Novice from invoker'),
(37951, 0, 22, 23, '', 61, 0, 100, 0, 0, 0, 0, 0, 0, 85, 71035, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'Jin''thala - On Quest 24776 Accepted - Invoker Cast Troll Introduction Tracking Quest'),
(37951, 0, 23, 0, '', 61, 0, 100, 0, 0, 0, 0, 0, 0, 85, 71037, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'Jin''thala - On Quest 24776 Accepted - Invoker Cast Zuni Lvl 1 Trigger'),
(37951, 0, 24, 25, '', 19, 0, 100, 0, 24782, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'Jin''thala - On Quest 24782 Accepted - Say 0'),
(37951, 0, 25, 26, '', 61, 0, 100, 0, 0, 0, 0, 0, 0, 28, 71033, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'Jin''thala - On Quest 24782 Accepted - Remove Calm of the Novice from invoker'),
(37951, 0, 26, 27, '', 61, 0, 100, 0, 0, 0, 0, 0, 0, 85, 71035, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'Jin''thala - On Quest 24782 Accepted - Invoker Cast Troll Introduction Tracking Quest'),
(37951, 0, 27, 0, '', 61, 0, 100, 0, 0, 0, 0, 0, 0, 85, 71037, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'Jin''thala - On Quest 24782 Accepted - Invoker Cast Zuni Lvl 1 Trigger'),
(37951, 0, 28, 29, '', 19, 0, 100, 0, 26272, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'Jin''thala - On Quest 26272 Accepted - Say 0'),
(37951, 0, 29, 30, '', 61, 0, 100, 0, 0, 0, 0, 0, 0, 28, 71033, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'Jin''thala - On Quest 26272 Accepted - Remove Calm of the Novice from invoker'),
(37951, 0, 30, 31, '', 61, 0, 100, 0, 0, 0, 0, 0, 0, 85, 71035, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'Jin''thala - On Quest 26272 Accepted - Invoker Cast Troll Introduction Tracking Quest'),
(37951, 0, 31, 0, '', 61, 0, 100, 0, 0, 0, 0, 0, 0, 85, 71037, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'Jin''thala - On Quest 26272 Accepted - Invoker Cast Zuni Lvl 1 Trigger'),
(37951, 0, 32, 33, '', 19, 0, 100, 0, 31159, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'Jin''thala - On Quest 31159 Accepted - Say 0'),
(37951, 0, 33, 34, '', 61, 0, 100, 0, 0, 0, 0, 0, 0, 28, 71033, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'Jin''thala - On Quest 31159 Accepted - Remove Calm of the Novice from invoker'),
(37951, 0, 34, 35, '', 61, 0, 100, 0, 0, 0, 0, 0, 0, 85, 71035, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'Jin''thala - On Quest 31159 Accepted - Invoker Cast Troll Introduction Tracking Quest'),
(37951, 0, 35, 0, '', 61, 0, 100, 0, 0, 0, 0, 0, 0, 85, 71037, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'Jin''thala - On Quest 31159 Accepted - Invoker Cast Zuni Lvl 1 Trigger');
