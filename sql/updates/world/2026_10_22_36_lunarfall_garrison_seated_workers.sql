-- Lunarfall garrison: the workers around the gameboard and assistant Brightstone sit on the chairs next to them, one of them eating
UPDATE `creature` SET `position_x` = 1847.10, `position_y` = 237.62, `position_z` = 76.66, `orientation` = 3.936, `MovementType` = 0, `spawndist` = 0 WHERE `guid` = 351741;
UPDATE `creature` SET `position_x` = 1843.56, `position_y` = 239.53, `position_z` = 76.66, `orientation` = 1.213, `MovementType` = 0, `spawndist` = 0 WHERE `guid` = 351748;
UPDATE `creature` SET `position_x` = 1847.50, `position_y` = 235.48, `position_z` = 76.66, `orientation` = 2.286, `MovementType` = 0, `spawndist` = 0 WHERE `guid` = 351759;
UPDATE `creature` SET `position_x` = 1845.60, `position_y` = 240.62, `position_z` = 76.65, `orientation` = 3.142, `MovementType` = 0, `spawndist` = 0 WHERE `guid` = 351750;
UPDATE `creature` SET `position_x` = 1844.25, `position_y` = 242.47, `position_z` = 76.66, `orientation` = 4.346, `MovementType` = 0, `spawndist` = 0 WHERE `guid` = 351756;
DELETE FROM `creature_addon` WHERE `guid` IN (351741, 351748, 351759, 351750, 351756);
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES
(351741, 0, 0, 5, 1, 0, ''),
(351748, 0, 0, 5, 1, 0, ''),
(351759, 0, 0, 5, 1, 0, ''),
(351750, 0, 0, 5, 1, 0, ''),
(351756, 0, 0, 5, 257, 0, '');
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 77617 AND `AIName` = '';
DELETE FROM `smart_scripts` WHERE `entryorguid` = -351756 AND `source_type` = 0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(-351756, 0, 0, 0, 1, 0, 100, 0, 3000, 6000, 6000, 12000, 5, 7, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Lunarfall Worker - Out of combat - Eat');
