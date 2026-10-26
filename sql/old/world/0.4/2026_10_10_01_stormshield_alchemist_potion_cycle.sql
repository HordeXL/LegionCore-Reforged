-- Jaiden Trask (master alchemist, 257248): holds a vial for 5 to 7 seconds, then works for 10 to 15 seconds, in a loop.
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 85905;

-- the vial is no longer carried all the time: the script hands it out and takes it back
DELETE FROM `creature_addon` WHERE `guid` = 257248;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES
(257248, 0, 0, 0, 1, 0, NULL);

DELETE FROM `smart_scripts` WHERE (`entryorguid` = 85905 AND `source_type` = 0) OR (`entryorguid` = 8590500 AND `source_type` = 9);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `target_type`, `comment`) VALUES
(85905, 0, 0, 0, 1, 0, 100, 0, 1000, 3000, 17000, 20000, 80, 8590500, 0, 0, 1, 'Jaiden Trask - OOC - Potion then work cycle'),
(8590500, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 17, 0, 0, 0, 1, 'Jaiden Trask - Stop working'),
(8590500, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 75, 171987, 1, 0, 1, 'Jaiden Trask - Hold Potion'),
(8590500, 9, 2, 0, 0, 0, 100, 0, 5000, 7000, 0, 0, 28, 171987, 0, 0, 1, 'Jaiden Trask - Put the potion down'),
(8590500, 9, 3, 0, 0, 0, 100, 0, 0, 0, 0, 0, 17, 69, 0, 0, 1, 'Jaiden Trask - Work');
