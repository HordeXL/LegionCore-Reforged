-- Shadowmoon Valley: the Shadowmoon Void Priestesses standing before a ritual stone channel a shadow beam into it, and use their combat spells
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 82196 AND `AIName` = '';
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 13 AND `SourceEntry` = 122499;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(13, 1, 122499, 0, 0, 31, 0, 3, 79067, 0, 0, 0, '', 'Cosmetic Shadow Channel - Spirit Fields Stalker');
DELETE FROM `smart_scripts` WHERE `entryorguid` = 82196 AND `source_type` = 0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(82196, 0, 0, 0, 1, 0, 100, 0, 1000, 3000, 5000, 8000, 11, 122499, 32, 0, 0, 0, 0, 19, 79067, 25, 0, 0, 0, 0, 0, 'Shadowmoon Void Priestess - Out of Combat - Channel into the ritual stone in front of her'),
(82196, 0, 1, 0, 0, 0, 100, 0, 3000, 6000, 8000, 12000, 11, 157406, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Shadowmoon Void Priestess - In Combat - Cast Crackling Void'),
(82196, 0, 2, 0, 2, 0, 100, 0, 0, 50, 20000, 25000, 11, 11974, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Shadowmoon Void Priestess - Between 0-50% Health - Cast Power Word: Shield');
