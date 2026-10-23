-- Draenor innkeepers and merchants: bind and vendor gossip options open their window, Trader Yula's trick-or-treat casts the Hallow's End spell.
UPDATE `gossip_menu_option` SET `OptionNpc` = 5 WHERE `MenuID` = 16454 AND `OptionID` = 0;
DELETE FROM `gossip_menu_option` WHERE `MenuID` = 16454 AND `OptionID` = 1;
INSERT INTO `gossip_menu_option` (`MenuID`, `OptionID`, `OptionNpc`, `OptionText`, `OptionBroadcastTextID`, `ActionMenuID`, `ActionPoiID`, `BoxCoded`, `BoxMoney`, `BoxText`, `BoxBroadcastTextID`, `VerifiedBuild`) VALUES
(16454, 1, 1, 'I would like to buy from you.', 14967, 0, 0, 0, 0, '', 0, 0);

UPDATE `gossip_menu_option` SET `OptionNpc` = 5 WHERE `MenuID` = 16268 AND `OptionID` = 0;
UPDATE `gossip_menu_option` SET `OptionNpc` = 1 WHERE `MenuID` = 16268 AND `OptionID` = 1;
UPDATE `gossip_menu_option` SET `OptionNpc` = 1 WHERE `MenuID` = 16919 AND `OptionID` = 0;

-- Pyxni Pennypocket sells nothing: the buy option is not part of her menu.
DELETE FROM `gossip_menu_option` WHERE `MenuID` = 16457 AND `OptionID` = 0;

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 85968;
DELETE FROM `smart_scripts` WHERE `entryorguid` = 85968 AND `source_type` = 0 AND `id` IN (0, 1);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `Difficulties`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(85968, 0, 0, 1, '', 62, 0, 100, 0, 7481, 0, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'Trader Yula - On gossip option 0 selected - Close gossip'),
(85968, 0, 1, 0, '', 61, 0, 100, 0, 0, 0, 0, 0, 0, 85, 24751, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'Trader Yula - On gossip option 0 selected - Invoker cast Trick or Treat');
