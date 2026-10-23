-- Chronicler Kezak replays the Warlords of Draenor cinematics chosen in his menu.
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 88608;
DELETE FROM `smart_scripts` WHERE `entryorguid` = 88608 AND `source_type` = 0 AND `id` BETWEEN 0 AND 11;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `Difficulties`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(88608, 0, 0, 1, '', 62, 0, 100, 0, 17309, 0, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'Chronicler Kezak - On gossip option 0 selected - Close gossip'),
(88608, 0, 1, 0, '', 61, 0, 100, 0, 0, 0, 0, 0, 0, 68, 185, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'Chronicler Kezak - On gossip option 0 selected - Play movie Dark Portal Intro'),
(88608, 0, 2, 3, '', 62, 0, 100, 0, 17309, 1, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'Chronicler Kezak - On gossip option 1 selected - Close gossip'),
(88608, 0, 3, 0, '', 61, 0, 100, 0, 0, 0, 0, 0, 0, 68, 187, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'Chronicler Kezak - On gossip option 1 selected - Play movie Tanaan Intro Finale'),
(88608, 0, 4, 5, '', 62, 0, 100, 0, 17309, 5, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'Chronicler Kezak - On gossip option 5 selected - Close gossip'),
(88608, 0, 5, 0, '', 61, 0, 100, 0, 0, 0, 0, 0, 0, 68, 270, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'Chronicler Kezak - On gossip option 5 selected - Play movie The Legendary Quest Continues'),
(88608, 0, 6, 7, '', 62, 0, 100, 0, 17309, 6, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'Chronicler Kezak - On gossip option 6 selected - Close gossip'),
(88608, 0, 7, 0, '', 61, 0, 100, 0, 0, 0, 0, 0, 0, 68, 292, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'Chronicler Kezak - On gossip option 6 selected - Play movie Horde Shipyard Construction'),
(88608, 0, 8, 9, '', 62, 0, 100, 0, 17309, 7, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'Chronicler Kezak - On gossip option 7 selected - Close gossip'),
(88608, 0, 9, 0, '', 61, 0, 100, 0, 0, 0, 0, 0, 0, 68, 294, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'Chronicler Kezak - On gossip option 7 selected - Play movie Gul''dan''s Plan'),
(88608, 0, 10, 11, '', 62, 0, 100, 0, 17309, 8, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'Chronicler Kezak - On gossip option 8 selected - Close gossip'),
(88608, 0, 11, 0, '', 61, 0, 100, 0, 0, 0, 0, 0, 0, 68, 295, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'Chronicler Kezak - On gossip option 8 selected - Play movie Victory on Draenor');
