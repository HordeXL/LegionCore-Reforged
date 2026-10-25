-- Stink Bombs Away!: brooms fly their route on their own, Return Home works, one Return Home button, Horde broom summoned

UPDATE `creature_template` SET `AIName` = '', `ScriptName` = 'npc_hallows_end_broom', `spell6` = 0 WHERE `entry` = 51710;
UPDATE `creature_template` SET `AIName` = '', `ScriptName` = 'npc_hallows_end_broom', `spell2` = 100030, `spell6` = 0 WHERE `entry` = 53761;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (51710, 53761);

DELETE FROM `spell_script_names` WHERE `spell_id` IN (96017, 100030, 96024);
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(96017, 'spell_hallows_end_broom_return_home'),
(100030, 'spell_hallows_end_broom_return_home'),
(96024, 'spell_hallows_end_stink_bomb_lands');

-- Crina Fenlow lends the Horde broom
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 53764;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 53764;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `Difficulties`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(53764, 0, 0, 0, '', 62, 0, 100, 0, 53764, 0, 0, 0, 0, 85, 100042, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'Crina Fenlow - On gossip option selected - Invoker casts Summon Crone''s Broom');
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 15 AND `SourceGroup` = 53764 AND `SourceEntry` = 0;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(15, 53764, 0, 0, 0, 9, 0, 29374, 0, 0, 0, 0, '', 'Crina Fenlow - show the bombing flight while Stink Bombs Away! is taken');

-- Loop flown by the Horde broom above Stormwind
DELETE FROM `waypoints` WHERE `entry` = 537610;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES
(537610, 1, -8992.6, 510.0, 137.7, 'Crone''s Broom - Stormwind loop'),
(537610, 2, -8900.0, 600.0, 145.0, 'Crone''s Broom - Stormwind loop'),
(537610, 3, -8800.0, 700.0, 150.0, 'Crone''s Broom - Stormwind loop'),
(537610, 4, -8680.0, 800.0, 160.0, 'Crone''s Broom - Stormwind loop'),
(537610, 5, -8580.0, 880.0, 172.0, 'Crone''s Broom - Stormwind loop'),
(537610, 6, -8470.0, 760.0, 160.0, 'Crone''s Broom - Stormwind loop'),
(537610, 7, -8420.0, 620.0, 150.0, 'Crone''s Broom - Stormwind loop'),
(537610, 8, -8520.0, 480.0, 155.0, 'Crone''s Broom - Stormwind loop'),
(537610, 9, -8680.0, 420.0, 148.0, 'Crone''s Broom - Stormwind loop'),
(537610, 10, -8820.0, 440.0, 142.0, 'Crone''s Broom - Stormwind loop'),
(537610, 11, -8940.0, 470.0, 138.0, 'Crone''s Broom - Stormwind loop');
