-- Stormshield peasant 5200023: standing still, he works for 13 seconds then rests for 3, in a loop (without the sack of his template).
UPDATE `creature` SET `position_x` = 3986.49, `position_y` = -4051.62, `position_z` = 54.6691, `orientation` = 2.57018, `MovementType` = 0, `spawndist` = 0 WHERE `guid` = 5200023;

DELETE FROM `creature_addon` WHERE `guid` = 5200023;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES
(5200023, 0, 0, 0, 1, 0, NULL);

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 86087;
DELETE FROM `smart_scripts` WHERE (`entryorguid` = -5200023 AND `source_type` = 0) OR (`entryorguid` = 520002300 AND `source_type` = 9);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `target_type`, `comment`) VALUES
(-5200023, 0, 0, 0, 1, 0, 100, 0, 1000, 1000, 16000, 16000, 80, 520002300, 0, 0, 1, 'Stormshield Peasant - OOC - Work then pause cycle'),
(520002300, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 17, 69, 0, 0, 1, 'Stormshield Peasant - Work'),
(520002300, 9, 1, 0, 0, 0, 100, 0, 13000, 13000, 0, 0, 17, 0, 0, 0, 1, 'Stormshield Peasant - Pause');
