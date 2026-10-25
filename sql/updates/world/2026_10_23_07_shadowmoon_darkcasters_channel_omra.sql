-- Shadowmoon Valley: the three Shadowmoon Darkcasters around Mother Om'ra channel the Shadowmoon Channellers' spell into her
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 78993 AND `AIName` = '';
UPDATE `creature_action` SET `spellId` = 159514 WHERE `entry` = 78993 AND `target` = 75071;
DELETE FROM `smart_scripts` WHERE `entryorguid` = 78993 AND `source_type` = 0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(78993, 0, 0, 0, 1, 0, 100, 0, 1000, 3000, 5000, 8000, 11, 159514, 32, 0, 0, 0, 0, 19, 75071, 30, 0, 0, 0, 0, 0, 'Shadowmoon Darkcaster - Out of Combat - Channel into Mother Om''ra'),
(78993, 0, 1, 0, 0, 0, 100, 0, 3000, 6000, 8000, 12000, 11, 157406, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Shadowmoon Darkcaster - In Combat - Cast Crackling Void');
