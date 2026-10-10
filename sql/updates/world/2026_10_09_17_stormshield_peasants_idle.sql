-- Stormshield peasants: two sleep (257263, 257330), one chops wood (257320), one works the forge (257275), one works (257277); motionless, without their entry's sack.
UPDATE `creature` SET `MovementType` = 0, `spawndist` = 0 WHERE `guid` IN (257263, 257275, 257277, 257320, 257330);
UPDATE `creature` SET `equipment_id` = 2 WHERE `guid` = 257320;

DELETE FROM `creature_equip_template` WHERE `CreatureID` = 86087 AND `ID` = 2;
INSERT INTO `creature_equip_template` (`CreatureID`, `ID`, `ItemID1`, `ItemID2`, `ItemID3`, `ItemID4`, `ItemID5`, `ItemID6`) VALUES
(86087, 2, 109579, 0, 0, 0, 0, 0);

DELETE FROM `creature_addon` WHERE `guid` IN (257263, 257275, 257277, 257320, 257330);
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES
(257263, 0, 0, 3, 1, 0, '55701'),
(257330, 0, 0, 3, 1, 0, '55701'),
(257320, 0, 0, 0, 1, 234, NULL),
(257275, 0, 0, 0, 1, 613, NULL),
(257277, 0, 0, 0, 1, 69, NULL);
