-- Draenor information dialogues: each question opens the NPC's answer page, Lagar the Wise credits the talk objective.
DELETE FROM `npc_text` WHERE `ID` IN (23831, 26387, 26550, 26551);
INSERT INTO `npc_text` (`ID`, `Probability0`, `Probability1`, `Probability2`, `Probability3`, `Probability4`, `Probability5`, `Probability6`, `Probability7`, `BroadcastTextID0`, `BroadcastTextID1`, `BroadcastTextID2`, `BroadcastTextID3`, `BroadcastTextID4`, `BroadcastTextID5`, `BroadcastTextID6`, `BroadcastTextID7`, `VerifiedBuild`) VALUES
(23831, 1, 0, 0, 0, 0, 0, 0, 0, 87538, 0, 0, 0, 0, 0, 0, 0, 0),
(26387, 1, 0, 0, 0, 0, 0, 0, 0, 94069, 0, 0, 0, 0, 0, 0, 0, 27791),
(26550, 1, 0, 0, 0, 0, 0, 0, 0, 94826, 0, 0, 0, 0, 0, 0, 0, 27791),
(26551, 1, 0, 0, 0, 0, 0, 0, 0, 94828, 0, 0, 0, 0, 0, 0, 0, 27791);

DELETE FROM `gossip_menu` WHERE `MenuID` IN (16470, 18221, 18332, 18413, 18415, 18416);
INSERT INTO `gossip_menu` (`MenuID`, `TextID`) VALUES
(16470, 23831),
(18221, 26175),
(18332, 26387),
(18413, 26543),
(18415, 26550),
(18416, 26551);

UPDATE `gossip_menu_option` SET `ActionMenuID` = 16258 WHERE `MenuID` = 16236 AND `OptionID` = 0;
UPDATE `gossip_menu_option` SET `ActionMenuID` = 16354 WHERE `MenuID` = 16353 AND `OptionID` = 0;
UPDATE `gossip_menu_option` SET `ActionMenuID` = 16483 WHERE `MenuID` = 16467 AND `OptionID` = 0;
UPDATE `gossip_menu_option` SET `ActionMenuID` = 16470 WHERE `MenuID` = 16472 AND `OptionID` = 1;
UPDATE `gossip_menu_option` SET `ActionMenuID` = 18227 WHERE `MenuID` = 18228 AND `OptionID` = 0;
UPDATE `gossip_menu_option` SET `ActionMenuID` = 18413 WHERE `MenuID` = 18412 AND `OptionID` = 1;
UPDATE `gossip_menu_option` SET `ActionMenuID` = 18217 WHERE `MenuID` = 18218 AND `OptionID` = 0;
UPDATE `gossip_menu_option` SET `ActionMenuID` = 18332 WHERE `MenuID` = 18218 AND `OptionID` = 1;
UPDATE `gossip_menu_option` SET `ActionMenuID` = 18415 WHERE `MenuID` = 18218 AND `OptionID` = 3;
UPDATE `gossip_menu_option` SET `ActionMenuID` = 18221 WHERE `MenuID` = 18222 AND `OptionID` = 0;
UPDATE `gossip_menu_option` SET `ActionMenuID` = 18416 WHERE `MenuID` = 18222 AND `OptionID` = 1;

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 90644;
DELETE FROM `smart_scripts` WHERE `entryorguid` = 90644 AND `source_type` = 0 AND `id` = 0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `Difficulties`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(90644, 0, 0, 0, '', 62, 0, 100, 0, 18228, 0, 0, 0, 0, 33, 90644, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'Lagar the Wise - On gossip option 0 selected - Quest credit');
