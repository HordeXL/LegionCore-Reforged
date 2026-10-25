-- Draenor shipyard: the shipwright, the foreman, the equipment specialist, the fleet command table, the scouting map and the work order object of each bay, seen only with the shipyard built
DELETE FROM `creature` WHERE `guid` BETWEEN 11318000 AND 11318010;
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `PhaseId`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`) VALUES
(11318000, 94429, 1116, 6719, 7760, 1, 1, '10230', 2161.5, 421.5, 16.5, 0.6, 120),
(11318001, 95002, 1116, 6719, 7760, 1, 1, '10230', 2154.5, 428.0, 16.6, 5.5, 120),
(11318002, 93822, 1116, 6719, 7760, 1, 1, '10230', 2282.0, 432.5, 13.2, 3.1, 120),
(11318003, 93812, 1116, 6719, 7760, 1, 1, '10230', 2272.0, 429.0, 13.2, 1.6, 120),
(11318004, 94398, 1116, 6719, 7760, 1, 1, '10230', 2284.5, 440.5, 13.2, 3.6, 120),
(11318005, 93787, 1116, 6719, 7760, 1, 1, '10230', 2281.0, 443.0, 13.2, 3.6, 120),
(11318006, 94429, 1116, 6720, 7765, 1, 1, '10231', 5429.0, 4968.0, 62.8, 1.7, 120),
(11318007, 94789, 1116, 6720, 7765, 1, 1, '10231', 5356.0, 5112.0, 4.2, 2.0, 120),
(11318008, 94801, 1116, 6720, 7765, 1, 1, '10231', 5362.0, 5112.5, 4.2, 2.0, 120),
(11318009, 94399, 1116, 6720, 7765, 1, 1, '10231', 5350.5, 5108.5, 4.2, 5.0, 120),
(11318010, 93787, 1116, 6720, 7765, 1, 1, '10231', 5364.5, 5109.5, 4.2, 5.0, 120);

DELETE FROM `gameobject` WHERE `guid` BETWEEN 25900000 AND 25900001;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `PhaseId`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(25900000, 243699, 1116, 6719, 7760, 1, 1, '10230', 2166.0, 428.5, 16.7, 0.0, 0, 0, 0, 1, 180, 255, 1),
(25900001, 243699, 1116, 6720, 7765, 1, 1, '10231', 5421.0, 4975.0, 61.1, 0.0, 0, 0, 0, 1, 180, 255, 1);
