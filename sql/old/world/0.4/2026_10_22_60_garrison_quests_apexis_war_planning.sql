-- Garrison Apexis assaults: scripted War Planning Maps (tier 2 and 3), one assault a day, repeatable missives, Heart of Shattrath tasks enabled
UPDATE `gameobject_template` SET `ScriptName` = 'go_garrison_war_planning_map' WHERE `entry` IN (236165, 236206);

DELETE FROM `gameobject` WHERE `guid` IN (25926001, 25926002);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `PhaseId`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `AiID`, `state`, `isActive`, `personal_size`) VALUES
(25926001, 236165, 1159, 7078, 7086, 2, 1, '', 1950.43, 330.899, 91.3188, 0.482405, 0, 0, 0.23887, 0.971051, 7200, 255, 0, 1, 0, 0),
(25926002, 236206, 1153, 7004, 7103, 2, 1, '', 5576.45, 4597.65, 143.205, 0.582408, 0, 0, 0.287106, 0.957899, 7200, 255, 0, 1, 0, 0);

-- the assaults of the War Planning Map: only one a day, all sites and both factions together
INSERT INTO `quest_template_addon` (`ID`, `ExclusiveGroup`, `SpecialFlags`)
SELECT `ID`, 36648, 1 FROM `quest_template` WHERE `ID` IN (36648, 36649, 36674, 36675, 36676, 36677, 36678, 36679, 36680, 36681, 36682, 36683, 36685, 36686, 37523,
    36667, 36669, 36688, 36689, 36690, 36691, 36692, 36693, 36694, 36695, 36696, 36697, 36699, 36701, 37524)
ON DUPLICATE KEY UPDATE `ExclusiveGroup` = 36648, `SpecialFlags` = 1;

-- a Scouting Missive is bought again and again
INSERT INTO `quest_template_addon` (`ID`, `SpecialFlags`)
SELECT `ID`, 1 FROM `quest_template` WHERE `ID` IN (38176, 38177, 38178, 38179, 38180, 38181, 38182, 38183, 38184, 38185, 38186, 38187, 38202, 40941, 40943,
    38189, 38190, 38191, 38192, 38193, 38194, 38195, 38196, 38197, 38198, 38199, 38200, 38201, 40942, 40944)
ON DUPLICATE KEY UPDATE `SpecialFlags` = `SpecialFlags` | 1;

-- Shattrath Harbor was asking for its own missive to be done first
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 19 AND `SourceEntry` = 36649 AND `ConditionTypeOrReference` = 8 AND `ConditionValue1` = 38201;

DELETE FROM `disables` WHERE `sourceType` = 1 AND `entry` IN (36807, 36809);
