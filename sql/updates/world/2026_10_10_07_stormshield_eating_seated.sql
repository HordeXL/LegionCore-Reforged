-- Lee Moonsung (257231) and Phillip Hillenbrand (257251) eat seated: on their chair, they take another bite (Eat Chicken) every few seconds.
UPDATE `creature` SET `position_x` = 3566.59, `position_y` = -3865.62, `position_z` = 7.18, `orientation` = 3.29 WHERE `guid` = 257231;

DELETE FROM `creature_addon` WHERE `guid` = 257231;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES
(257231, 0, 0, 5, 1, 0, NULL);

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (87278, 86762);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (87278, 86762) AND `source_type` = 0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `target_type`, `comment`) VALUES
(87278, 0, 0, 0, 1, 0, 100, 0, 1000, 4000, 4000, 9000, 11, 174598, 2, 0, 1, 'Lee Moonsung - OOC - Eat Chicken'),
(86762, 0, 0, 0, 1, 0, 100, 0, 2000, 5000, 4000, 9000, 11, 174598, 2, 0, 1, 'Phillip Hillenbrand - OOC - Eat Chicken');
