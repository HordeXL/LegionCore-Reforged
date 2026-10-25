-- Stormshield crafters: Nichole Swann hammers at the forge (motionless, hammer, without the sword she carried), Jistun Sharpfeather works leather, Rangari Laandon sits on an invisible chair.
UPDATE `creature` SET `MovementType` = 0, `spawndist` = 0 WHERE `guid` = 257352;

DELETE FROM `creature_equip_template` WHERE `CreatureID` = 86142 AND `ID` = 1;
INSERT INTO `creature_equip_template` (`CreatureID`, `ID`, `ItemID1`, `ItemID2`, `ItemID3`, `ItemID4`, `ItemID5`, `ItemID6`) VALUES
(86142, 1, 45123, 0, 0, 0, 0, 0);

DELETE FROM `creature_addon` WHERE `guid` IN (257352, 257379, 257382);
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES
(257352, 0, 0, 0, 1, 613, NULL),
(257382, 0, 0, 0, 1, 69, NULL),
(257379, 0, 0, 5, 1, 0, NULL);
