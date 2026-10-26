-- Hallow's End: the Wickerman revelers of Elwynn hold torches, chat, cheer and throw torches at the effigy

DELETE FROM `creature_template_addon` WHERE `entry` = 51699;
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES (51699, 0, 0, 0, 1, 0, '95957');

UPDATE `creature_template` SET `AIName` = 'SmartAI', `ScriptName` = '' WHERE `entry` = 51699;
DELETE FROM `smart_scripts` WHERE `entryorguid` = 51699 AND `source_type` = 0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `Difficulties`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(51699, 0, 0, 0, '', 1, 0, 100, 0, 0, 10000, 6000, 11000, 0, 10, 1, 6, 273, 274, 11, 5, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Wickerman Reveler - Out of combat - Play random chat emote'),
(51699, 0, 1, 0, '', 1, 0, 100, 0, 15000, 40000, 25000, 45000, 0, 10, 4, 21, 11, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Wickerman Reveler - Out of combat - Cheer, applaud or laugh'),
(51699, 0, 2, 0, '', 1, 0, 25, 0, 30000, 90000, 60000, 150000, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Wickerman Reveler - Out of combat - Say line'),
(51699, 0, 3, 0, '', 1, 0, 30, 0, 20000, 60000, 45000, 90000, 0, 11, 95958, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Wickerman Reveler - Out of combat - Cast Throw Torch at the effigy');

DELETE FROM `creature_text` WHERE `CreatureID` = 51699;
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextID`, `MinTimer`, `MaxTimer`, `SpellID`, `comment`) VALUES
(51699, 0, 0, 'Happy Hallow''s End!', 12, 0, 50, 4, 0, 0, 23284, 0, 0, 0, 'Wickerman Reveler'),
(51699, 0, 1, 'Let the flames fly! Hallow''s End is upon us!', 12, 0, 50, 5, 0, 0, 50757, 0, 0, 0, 'Wickerman Reveler');

-- Torch points spread over the effigy as sniffed
DELETE FROM `game_event_creature` WHERE `guid` = 201100 OR `guid` BETWEEN 10560001 AND 10560011;
DELETE FROM `creature` WHERE `guid` = 201100 OR `guid` BETWEEN 10560001 AND 10560011;
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `PhaseId`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`) VALUES
(10560001, 51684, 0, 12, 12, 1, 1, 0, 0, 0, -9058.61, 376.672, 104.814, 2.61799, 300, 0, 0, 0, 0, 0),
(10560002, 51684, 0, 12, 12, 1, 1, 0, 0, 0, -9059.96, 376.62, 113.441, 2.38829, 300, 0, 0, 0, 0, 0),
(10560003, 51684, 0, 12, 12, 1, 1, 0, 0, 0, -9055.78, 380.345, 104.824, 2.35619, 300, 0, 0, 0, 0, 0),
(10560004, 51684, 0, 12, 12, 1, 1, 0, 0, 0, -9054.89, 377.946, 115.544, 2.35619, 300, 0, 0, 0, 0, 0),
(10560005, 51684, 0, 12, 12, 1, 1, 0, 0, 0, -9057.52, 376.748, 101.174, 2.42188, 300, 0, 0, 0, 0, 0),
(10560006, 51684, 0, 12, 12, 1, 1, 0, 0, 0, -9061.05, 372.832, 102.226, 2.61799, 300, 0, 0, 0, 0, 0),
(10560007, 51684, 0, 12, 12, 1, 1, 0, 0, 0, -9061.79, 372.481, 114.277, 2.28951, 300, 0, 0, 0, 0, 0),
(10560008, 51684, 0, 12, 12, 1, 1, 0, 0, 0, -9062.07, 371.859, 96.7958, 2.3134, 300, 0, 0, 0, 0, 0),
(10560009, 51684, 0, 12, 12, 1, 1, 0, 0, 0, -9061.08, 374.356, 110.432, 2.27622, 300, 0, 0, 0, 0, 0),
(10560010, 51684, 0, 12, 12, 1, 1, 0, 0, 0, -9060.23, 376.172, 108.656, 2.46091, 300, 0, 0, 0, 0, 0),
(10560011, 51684, 0, 12, 12, 1, 1, 0, 0, 0, -9061.44, 373.877, 106.88, 2.35619, 300, 0, 0, 0, 0, 0);
INSERT INTO `game_event_creature` (`eventEntry`, `guid`) VALUES (12, 10560001), (12, 10560002), (12, 10560003), (12, 10560004), (12, 10560005), (12, 10560006), (12, 10560007), (12, 10560008), (12, 10560009), (12, 10560010), (12, 10560011);
