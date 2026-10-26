-- Garrison Campaign: Bladefury's Orders scroll in Gorgrond, Rexxar offers A Good Death, Azuka Bladefury follows Brokyo Beatdown for the Alliance
DELETE FROM `gameobject` WHERE `guid` = 25926004;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `PhaseId`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `AiID`, `state`, `isActive`, `personal_size`) VALUES
(25926004, 237821, 1116, 6721, 0, 1, 1, '', 7393.23, 1763.13, 79.5, 0, 0, 0, 0, 1, 300, 255, 0, 1, 0, 0);

DELETE FROM `creature_queststarter` WHERE (`id` = 77982 AND `quest` = 34354) OR (`id` = 76508 AND `quest` = 36095);
INSERT INTO `creature_queststarter` (`id`, `quest`) VALUES
(77982, 34354),
(76508, 36095);

INSERT INTO `quest_template_addon` (`ID`, `PrevQuestID`) VALUES (36095, 35973)
ON DUPLICATE KEY UPDATE `PrevQuestID` = 35973;
