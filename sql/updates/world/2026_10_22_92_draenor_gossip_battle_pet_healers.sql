-- Draenor battle pet healers: the heal and revive option casts Revive Battle Pets on the player.
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (80833, 80854, 86056);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (80833, 80854, 86056) AND `source_type` = 0 AND `id` IN (0, 1);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `Difficulties`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(80833, 0, 0, 1, '', 62, 0, 100, 0, 9821, 2, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'Beastmaster Tagh - On gossip option 2 selected - Close gossip'),
(80833, 0, 1, 0, '', 61, 0, 100, 0, 0, 0, 0, 0, 0, 85, 133994, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'Beastmaster Tagh - On gossip option 2 selected - Invoker cast Revive Battle Pets'),
(80854, 0, 0, 1, '', 62, 0, 100, 0, 9821, 2, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'Patrick Messer - On gossip option 2 selected - Close gossip'),
(80854, 0, 1, 0, '', 61, 0, 100, 0, 0, 0, 0, 0, 0, 85, 133994, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'Patrick Messer - On gossip option 2 selected - Invoker cast Revive Battle Pets'),
(86056, 0, 0, 1, '', 62, 0, 100, 0, 66420, 0, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'Zarg Bonecrunch - On gossip option 0 selected - Close gossip'),
(86056, 0, 1, 0, '', 61, 0, 100, 0, 0, 0, 0, 0, 0, 85, 133994, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'Zarg Bonecrunch - On gossip option 0 selected - Invoker cast Revive Battle Pets');
