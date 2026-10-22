-- Garrison Campaign: places the chapter NPCs and the scroll that had no spawn (Rexxar, Gurgthock, Exarch Akama, Rangari Saardar, Laanda's Scroll)
DELETE FROM `creature` WHERE `guid` IN (146926002, 146926003, 146926004, 146926005);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `PhaseId`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`) VALUES
(146926002, 77982, 1116, 6719, 6910, 1, 1, '', 0, 0, -1012.8, -1699.28, 8.00174, 3.4365, 300, 0, 0, 0, 0, 0),
(146926003, 84637, 1116, 6755, 7368, 1, 1, '', 0, 0, 3553.05, 5743.75, 48.674, 5.2971, 300, 0, 0, 0, 0, 0),
(146926004, 84973, 1116, 6719, 6945, 1, 1, '', 0, 0, 69.9967, -2749.23, 62.5315, 6.03072, 300, 0, 0, 0, 0, 0),
(146926005, 84459, 1116, 6755, 7370, 1, 1, '', 0, 0, 4295.34, 6503.63, 4.6699, 3.15016, 300, 0, 0, 0, 0, 0);

DELETE FROM `gameobject` WHERE `guid` = 25926003;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `PhaseId`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `AiID`, `state`, `isActive`, `personal_size`) VALUES
(25926003, 231918, 1116, 6719, 6909, 1, 1, '', -969.027, -1079.86, 107.943, 4.92651, 0, 0, 0.6275, -0.778617, 300, 0, 0, 1, 0, 0);
