-- Draenor: the waypoint scripts of the Shadowmoon herds and riverbeasts and of the Elodor villagers count their delays in seconds, as the server reads them
UPDATE `waypoint_scripts` SET `delay` = `delay` DIV 1000 WHERE `id` IN (877001, 877002) AND `delay` >= 1000;
DELETE FROM `waypoint_scripts` WHERE `id` IN (877010, 877011);
INSERT INTO `waypoint_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`, `guid`) VALUES
(877010, 1, 1, 1, 0, 0, 0, 0, 0, 0, 8770100),
(877010, 3, 1, 6, 0, 0, 0, 0, 0, 0, 8770101),
(877010, 6, 1, 1, 0, 0, 0, 0, 0, 0, 8770102),
(877010, 8, 1, 273, 0, 0, 0, 0, 0, 0, 8770103),
(877010, 11, 1, 1, 0, 0, 0, 0, 0, 0, 8770104),
(877011, 0, 1, 133, 1, 0, 0, 0, 0, 0, 8770110),
(877011, 9, 1, 26, 1, 0, 0, 0, 0, 0, 8770111);
