-- Shadowmoon Valley: the garrison laborers of the missing cart are always men; the raiders and the voidspeaker rush at the nearest player instead of walking away
UPDATE `smart_scripts` SET `action_type` = 49, `action_param1` = 0, `target_type` = 21, `target_param1` = 100, `target_param2` = 0, `comment` = 'Shadowmoon raider - On summoned - Attack the nearest player' WHERE `entryorguid` IN (81906, 81908) AND `source_type` = 0 AND `id` = 0 AND `event_type` = 54;
DELETE FROM `smart_scripts` WHERE `entryorguid` = 81908 AND `source_type` = 0 AND `id` = 1;
DELETE FROM `smart_scripts` WHERE `entryorguid` = 81853 AND `source_type` = 0 AND `id` = 12;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `target_type`, `target_param1`, `target_param2`, `target_x`, `target_y`, `target_z`, `comment`) VALUES
(81853, 0, 12, 0, 54, 0, 100, 0, 0, 0, 0, 0, 3, 0, 53839, 0, 1, 0, 0, 0, 0, 0, 'Garrison Laborer - On summoned - Always the human man');
