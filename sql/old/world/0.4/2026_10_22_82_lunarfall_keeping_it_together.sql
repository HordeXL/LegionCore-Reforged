-- Keeping it Together: Shelly only offers her report during the quest; Brightstone ends the break, she and the worker leave the table for the worksite and come back seated

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 15 AND `SourceGroup` IN (16598, 16613) AND `SourceEntry` = 0;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `Comment`) VALUES
(15, 16598, 0, 0, 0, 9, 0, 35176, 0, 0, 0, 'Shelly Hamby - report option while Keeping it Together is taken'),
(15, 16598, 0, 0, 0, 2, 0, 112730, 1, 0, 1, 'Shelly Hamby - report option while the report is not in the bags'),
(15, 16613, 0, 0, 0, 9, 0, 35176, 0, 0, 0, 'Assistant Brightstone - work ethic option while Keeping it Together is taken');

UPDATE `creature` SET `spawntimesecs` = 15 WHERE `guid` IN (351750, 351756);

DELETE FROM `smart_scripts` WHERE `entryorguid` IN (-351750, -351756) AND `source_type` = 0;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (8445500, 7761700) AND `source_type` = 9;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `target_type`, `target_param1`, `target_param2`, `target_x`, `target_y`, `target_z`, `comment`) VALUES
(-351750, 0, 0, 0, 62, 0, 100, 0, 16613, 0, 0, 0, 11, 164548, 18, 0, 7, 0, 0, 0, 0, 0, 'Assistant Brightstone - On gossip select - Cast credit on invoker'),
(-351750, 0, 1, 0, 62, 0, 100, 0, 16613, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 'Assistant Brightstone - On gossip select - Say break is over'),
(-351750, 0, 2, 0, 62, 0, 100, 0, 16613, 0, 0, 0, 45, 1, 1, 0, 10, 351756, 77617, 0, 0, 0, 'Assistant Brightstone - On gossip select - Send the worker back to work'),
(-351750, 0, 3, 0, 62, 0, 100, 0, 16613, 0, 0, 0, 80, 8445500, 0, 0, 1, 0, 0, 0, 0, 0, 'Assistant Brightstone - On gossip select - Leave the table'),
(-351750, 0, 4, 0, 34, 0, 100, 0, 8, 1, 0, 0, 41, 0, 0, 0, 1, 0, 0, 0, 0, 0, 'Assistant Brightstone - At the worksite - Despawn, back at the table on respawn'),
(8445500, 9, 0, 0, 0, 0, 100, 0, 2500, 2500, 0, 0, 91, 5, 0, 0, 1, 0, 0, 0, 0, 0, 'Assistant Brightstone - Stand up'),
(8445500, 9, 1, 0, 0, 0, 100, 0, 1500, 1500, 0, 0, 69, 1, 0, 0, 8, 0, 0, 1857.0, 253.5, 77.83, 'Assistant Brightstone - Walk to the worksite'),
(-351756, 0, 0, 0, 1, 1, 100, 0, 3000, 6000, 6000, 12000, 5, 7, 0, 0, 1, 0, 0, 0, 0, 0, 'Lunarfall Worker - Out of combat, at the table - Eat'),
(-351756, 0, 1, 0, 63, 0, 100, 0, 0, 0, 0, 0, 22, 1, 0, 0, 1, 0, 0, 0, 0, 0, 'Lunarfall Worker - On spawn - At the table'),
(-351756, 0, 2, 0, 25, 0, 100, 0, 0, 0, 0, 0, 22, 1, 0, 0, 1, 0, 0, 0, 0, 0, 'Lunarfall Worker - On reset - At the table'),
(-351756, 0, 3, 4, 38, 0, 100, 0, 1, 1, 0, 0, 22, 2, 0, 0, 1, 0, 0, 0, 0, 0, 'Lunarfall Worker - Break is over - Stop eating'),
(-351756, 0, 4, 0, 61, 0, 100, 0, 0, 0, 0, 0, 80, 7761700, 0, 0, 1, 0, 0, 0, 0, 0, 'Lunarfall Worker - Break is over - Leave the table'),
(-351756, 0, 5, 0, 34, 0, 100, 0, 8, 1, 0, 0, 41, 0, 0, 0, 1, 0, 0, 0, 0, 0, 'Lunarfall Worker - At the worksite - Despawn, back at the table on respawn'),
(7761700, 9, 0, 0, 0, 0, 100, 0, 3500, 3500, 0, 0, 91, 5, 0, 0, 1, 0, 0, 0, 0, 0, 'Lunarfall Worker - Stand up'),
(7761700, 9, 1, 0, 0, 0, 100, 0, 1500, 1500, 0, 0, 69, 1, 0, 0, 8, 0, 0, 1858.6, 256.2, 77.71, 'Lunarfall Worker - Walk to the worksite');
