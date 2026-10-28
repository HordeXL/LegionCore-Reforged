-- Eversong Woods: the Silvermoon apprentices in front of Instructor Antheol practise magic: arcane channelling, joy at a success, a sheep now and then, a backfire that makes some classmates laugh
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 15971;
DELETE FROM `smart_scripts` WHERE (`entryorguid` = 15971 AND `source_type` = 0) OR (`entryorguid` BETWEEN 1597100 AND 1597103 AND `source_type` = 9);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(15971, 0, 0, 0, 1, 0, 100, 0, 3000, 25000, 25000, 45000, 87, 1597100, 1597101, 1597102, 1597103, 1597103, 1597100, 1, 0, 0, 0, 0, 0, 0, 0, 'Silvermoon Apprentice - OOC - Random magic lesson'),
(15971, 0, 1, 0, 38, 0, 40, 0, 1, 1, 0, 0, 5, 11, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Silvermoon Apprentice - On Data Set - Laugh at a failed spell'),
(1597100, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 11, 77855, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Silvermoon Apprentice - Channel arcane'),
(1597100, 9, 1, 0, 0, 0, 100, 0, 4000, 6000, 0, 0, 28, 77855, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Silvermoon Apprentice - Stop channeling'),
(1597100, 9, 2, 0, 0, 0, 100, 0, 0, 0, 0, 0, 11, 65633, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Silvermoon Apprentice - Success sparkle'),
(1597100, 9, 3, 0, 0, 0, 100, 0, 600, 600, 0, 0, 5, 4, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Silvermoon Apprentice - Cheer'),
(1597100, 9, 4, 0, 0, 0, 100, 0, 2500, 2500, 0, 0, 5, 21, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Silvermoon Apprentice - Applaud'),
(1597101, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 11, 77855, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Silvermoon Apprentice - Channel arcane'),
(1597101, 9, 1, 0, 0, 0, 100, 0, 5000, 7000, 0, 0, 28, 77855, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Silvermoon Apprentice - Stop channeling'),
(1597101, 9, 2, 0, 0, 0, 100, 0, 0, 0, 0, 0, 11, 135030, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Silvermoon Apprentice - Success sparkle'),
(1597101, 9, 3, 0, 0, 0, 100, 0, 500, 500, 0, 0, 5, 4, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Silvermoon Apprentice - Cheer'),
(1597101, 9, 4, 0, 0, 0, 100, 0, 1800, 1800, 0, 0, 5, 4, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Silvermoon Apprentice - Cheer again'),
(1597101, 9, 5, 0, 0, 0, 100, 0, 2000, 2000, 0, 0, 5, 11, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Silvermoon Apprentice - Laugh'),
(1597102, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 11, 77855, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Silvermoon Apprentice - Channel arcane'),
(1597102, 9, 1, 0, 0, 0, 100, 0, 4000, 6000, 0, 0, 28, 77855, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Silvermoon Apprentice - Stop channeling'),
(1597102, 9, 2, 0, 0, 0, 100, 0, 0, 0, 0, 0, 11, 27123, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Silvermoon Apprentice - Polymorph impact'),
(1597102, 9, 3, 0, 0, 0, 100, 0, 300, 300, 0, 0, 3, 0, 856, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Silvermoon Apprentice - Turned into a sheep'),
(1597102, 9, 4, 0, 0, 0, 100, 0, 6000, 8000, 0, 0, 11, 27123, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Silvermoon Apprentice - Polymorph impact'),
(1597102, 9, 5, 0, 0, 0, 100, 0, 200, 200, 0, 0, 3, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Silvermoon Apprentice - Back to normal'),
(1597102, 9, 6, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 5, 5, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Silvermoon Apprentice - Exclamation'),
(1597103, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 11, 77855, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Silvermoon Apprentice - Channel arcane'),
(1597103, 9, 1, 0, 0, 0, 100, 0, 3000, 5000, 0, 0, 28, 77855, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Silvermoon Apprentice - Stop channeling'),
(1597103, 9, 2, 0, 0, 0, 100, 0, 0, 0, 0, 0, 11, 126807, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Silvermoon Apprentice - Spell backfires'),
(1597103, 9, 3, 0, 0, 0, 100, 0, 0, 0, 0, 0, 45, 1, 1, 0, 0, 0, 0, 9, 15971, 1, 20, 0, 0, 0, 0, 'Silvermoon Apprentice - Tell the others'),
(1597103, 9, 4, 0, 0, 0, 100, 0, 1200, 1200, 0, 0, 5, 18, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Silvermoon Apprentice - Cry');
