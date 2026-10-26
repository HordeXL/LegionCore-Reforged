-- Ashran: world PvP engine registered at startup (one battle shared by every player on map 1191).
DELETE FROM `outdoorpvp_template` WHERE `TypeId` = 6;
INSERT INTO `outdoorpvp_template` (`TypeId`, `ScriptName`, `ZoneList`, `MapList`, `comment`) VALUES (6, 'outdoorpvp_ashran', '8485', '1191', 'Ashran');
