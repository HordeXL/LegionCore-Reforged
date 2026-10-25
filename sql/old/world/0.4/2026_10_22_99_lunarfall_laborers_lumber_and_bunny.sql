-- Lunarfall garrison: the debug bunny stays invisible; the laborers chop or hammer on wood, or work at the crates without their hammer

UPDATE `creature` SET `modelid` = 23767 WHERE `id` = 80026;
UPDATE `creature` SET `orientation` = 0 WHERE `guid` = 351775;
UPDATE `creature_addon` SET `emote` = 69, `bytes2` = 0 WHERE `guid` IN (351783, 351784);
DELETE FROM `gameobject` WHERE `guid` IN (25926005, 25926006, 25926007);
DELETE FROM `creature_equip_template` WHERE `CreatureID` = 81654 AND `ID` = 2;
INSERT INTO `creature_equip_template` (`CreatureID`, `ID`, `ItemID1`) VALUES (81654, 2, 109579);
UPDATE `creature` SET `equipment_id` = 2 WHERE `guid` = 351770;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `PhaseId`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(25926005, 230365, 1158, 7078, 7085, 2, 1, '', 1861.09, 251.69, 77.75, 3.951, 0, 0, 0.919259, -0.393653, 7200, 255, 1),
(25926007, 230365, 1158, 7078, 7085, 2, 1, '', 1839.96, 259.56, 78.27, 4.261, 0, 0, 0.847467, -0.530849, 7200, 255, 1);
