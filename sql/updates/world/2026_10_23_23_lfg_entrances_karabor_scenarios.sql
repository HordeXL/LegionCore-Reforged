-- Entrance of the Defense and the Fate of Karabor scenarios, at the temple gates beside Exarch Akama
DELETE FROM `lfg_entrances` WHERE `dungeonId` IN (818, 819);
INSERT INTO `lfg_entrances` (`dungeonId`, `position_x`, `position_y`, `position_z`, `orientation`) VALUES
(818, 980.3, -2921.1, 99.4, 2.64),
(819, 980.3, -2921.1, 99.4, 2.64);
