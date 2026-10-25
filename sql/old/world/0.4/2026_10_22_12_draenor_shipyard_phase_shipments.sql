-- Draenor shipyard: a phase shows the bay fleet and its people once the garrison shipyard is built, and the shipwrights take work orders
DELETE FROM `phase_definitions` WHERE `zoneId` IN (6719, 6720) AND `entry` = 101;
INSERT INTO `phase_definitions` (`zoneId`, `entry`, `phasemask`, `phaseId`, `PreloadMapID`, `VisibleMapID`, `UiWorldMapAreaID`, `flags`, `comment`) VALUES
(6719, 101, 0, '10230', 0, 0, 0, 16, 'Draenor. Shadowmoon Valley. Garrison shipyard built, alliance bay'),
(6720, 101, 0, '10231', 0, 0, 0, 16, 'Draenor. Frostfire Ridge. Garrison shipyard built, horde bay');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 23 AND `SourceGroup` IN (6719, 6720) AND `SourceEntry` = 101;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(23, 6719, 101, 0, 0, 6, 0, 469, 0, 0, 0, 0, '', 'Garrison shipyard bay: alliance'),
(23, 6719, 101, 0, 0, 43, 0, 9, 1, 0, 0, 0, '', 'Garrison shipyard bay: shipyard built'),
(23, 6720, 101, 0, 0, 6, 0, 67, 0, 0, 0, 0, '', 'Garrison shipyard bay: horde'),
(23, 6720, 101, 0, 0, 43, 0, 9, 1, 0, 0, 0, '', 'Garrison shipyard bay: shipyard built');

-- The alliance shipwright and the horde shipwright (the iron shipwright) take the ship orders, the tutorial destroyers come while their quest is open
DELETE FROM `garrison_shipment` WHERE `NpcEntry` IN (95002, 94429);
INSERT INTO `garrison_shipment` (`SiteID`, `ContainerID`, `NpcEntry`, `questReq`, `classReq`, `ShipmentID`, `comment`) VALUES
(2, 109, 95002, 0, 0, 222, 'Alliance. Ships.'),
(2, 114, 95002, 39404, 0, 227, 'Alliance. Tutorial destroyer while Eliminate the Competition is open.'),
(2, 119, 95002, 39655, 0, 232, 'Alliance. Second tutorial destroyer while Try Again is open.'),
(71, 109, 94429, 0, 0, 222, 'Horde. Ships.'),
(71, 115, 94429, 39401, 0, 228, 'Horde. Tutorial destroyer while Eliminate the Competition is open.'),
(71, 121, 94429, 39674, 0, 234, 'Horde. Second tutorial destroyer while Try Again is open.');

UPDATE `creature_template` SET `gossip_menu_id` = 62200 WHERE `entry` = 94429;
DELETE FROM `gossip_menu` WHERE `MenuID` IN (62200, 94429);
INSERT INTO `gossip_menu` (`MenuID`, `TextID`) VALUES (62200, 26710);

DELETE FROM `gossip_menu_option` WHERE `MenuID` IN (18486, 62200, 94429);
INSERT INTO `gossip_menu_option` (`MenuID`, `OptionID`, `OptionNpc`, `OptionText`, `OptionBroadcastTextID`, `ActionMenuID`, `ActionPoiID`, `BoxCoded`, `BoxMoney`, `BoxText`, `BoxBroadcastTextID`, `VerifiedBuild`) VALUES
(18486, 0, 28, 'I would like to order a ship.', 0, 0, 0, 0, 0, '', 0, 0),
(62200, 0, 28, 'I would like to order a ship.', 0, 0, 0, 0, 0, '', 0, 0);

DELETE FROM `gossip_menu_option_locale` WHERE `MenuID` IN (18486, 62200, 94429) AND `Locale` = 'frFR';
INSERT INTO `gossip_menu_option_locale` (`MenuID`, `OptionID`, `Locale`, `OptionText`, `BoxText`) VALUES
(18486, 0, 'frFR', 'Je voudrais commander un navire.', NULL),
(62200, 0, 'frFR', 'Je voudrais commander un navire.', NULL);
