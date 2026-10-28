-- Eversong Woods: the Wretched Captive stands behind Sergeant Kan'ren, between the two guards, does not move and begs from time to time
UPDATE `creature` SET `position_x` = 9511.29, `position_y` = -6841.73, `position_z` = 16.60, `orientation` = 1.05, `MovementType` = 0, `spawndist` = 0 WHERE `guid` = 12558;
UPDATE `creature_addon` SET `auras` = '' WHERE `guid` = 12558;
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 16916;
DELETE FROM `smart_scripts` WHERE `entryorguid` = 16916 AND `source_type` = 0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `target_type`, `comment`) VALUES
(16916, 0, 0, 0, 1, 0, 100, 0, 6000, 18000, 18000, 18000, 5, 20, 1, 'Wretched Captive - OOC - Play Emote 20 "Beg"');
