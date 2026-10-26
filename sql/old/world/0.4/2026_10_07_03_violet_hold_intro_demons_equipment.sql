-- Assault on Violet Hold: the intro Felguard Destroyer (102272) and Eredar Invader (102270) had no weapon; they take the
-- equipment of their wave versions (102368, 102370)
DELETE FROM `creature_equip_template` WHERE `CreatureID` IN (102270, 102272);
INSERT INTO `creature_equip_template` (`CreatureID`, `ID`, `ItemID1`, `ItemID2`, `ItemID3`, `ItemID4`, `ItemID5`, `ItemID6`)
SELECT 102272, `ID`, `ItemID1`, `ItemID2`, `ItemID3`, `ItemID4`, `ItemID5`, `ItemID6` FROM `creature_equip_template` WHERE `CreatureID` = 102368
UNION ALL
SELECT 102270, `ID`, `ItemID1`, `ItemID2`, `ItemID3`, `ItemID4`, `ItemID5`, `ItemID6` FROM `creature_equip_template` WHERE `CreatureID` = 102370;
