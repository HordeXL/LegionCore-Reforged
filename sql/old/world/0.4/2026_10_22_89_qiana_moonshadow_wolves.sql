-- Qiana Moonshadow cowers while the wounded stalkers are alive and can only be spoken to once they are dead; their unphased duplicates are removed
DELETE FROM `creature` WHERE `guid` IN (308428, 308429, 308431) AND `id` = 81774;
DELETE FROM `creature_addon` WHERE `guid` IN (308428, 308429, 308431);

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 79446;
DELETE FROM `smart_scripts` WHERE `entryorguid` = 79446 AND `source_type` = 0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `target_type`, `target_param1`, `target_param2`, `target_x`, `target_y`, `target_z`, `comment`) VALUES
(79446, 0, 0, 0, 1, 0, 100, 0, 0, 0, 2000, 2000, 17, 431, 0, 0, 1, 0, 0, 0, 0, 0, 'Qiana Moonshadow - Out of combat, stalkers alive - Cower'),
(79446, 0, 1, 0, 1, 0, 100, 0, 0, 0, 2000, 2000, 17, 0, 0, 0, 1, 0, 0, 0, 0, 0, 'Qiana Moonshadow - Out of combat, stalkers dead - Stand up');

DELETE FROM `conditions` WHERE (`SourceTypeOrReferenceId` = 22 AND `SourceEntry` = 79446 AND `SourceGroup` IN (1, 2)) OR (`SourceTypeOrReferenceId` = 18 AND `SourceGroup` = 79446 AND `SourceEntry` = 155071);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `Comment`) VALUES
(22, 1, 79446, 0, 0, 29, 1, 81774, 25, 0, 0, 'Qiana Moonshadow - cowers while a wounded stalker is alive nearby'),
(22, 2, 79446, 0, 0, 29, 1, 81774, 25, 0, 1, 'Qiana Moonshadow - stands once no wounded stalker is alive nearby'),
(18, 79446, 155071, 0, 0, 29, 1, 81774, 25, 0, 1, 'Qiana Moonshadow - can be spoken to once the wounded stalkers are dead');
