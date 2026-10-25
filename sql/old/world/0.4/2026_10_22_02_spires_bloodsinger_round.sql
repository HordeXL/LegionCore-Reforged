-- Spires of Arak: the Shattered Hand Bloodsinger walks a small round around the camp benches and the fire
DELETE FROM `waypoint_data` WHERE `id` = 326109;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `delay_chance`, `move_type`, `speed`, `action`, `action_chance`, `entry`, `wpguid`) VALUES
(326109, 0, 232.78, 1334.15, 0.47, 0.000, 0, 0, 0, 0, 0, 100, 83760, 0),
(326109, 1, 226.05, 1335.51, 0.47, 2.943, 6000, 0, 0, 0, 0, 100, 83760, 0),
(326109, 2, 223.31, 1339.53, 0.47, 2.169, 4000, 0, 0, 0, 0, 100, 83760, 0),
(326109, 3, 220.62, 1345.94, 0.47, 1.968, 5000, 0, 0, 0, 0, 100, 83760, 0),
(326109, 4, 227.15, 1348.51, 0.47, 0.000, 0, 0, 0, 0, 0, 100, 83760, 0),
(326109, 5, 233.67, 1351.08, 0.47, 0.375, 0, 0, 0, 0, 0, 100, 83760, 0),
(326109, 6, 235.62, 1344.99, 0.47, 0.000, 0, 0, 0, 0, 0, 100, 83760, 0),
(326109, 7, 237.56, 1338.89, 0.47, 0.000, 0, 0, 0, 0, 0, 100, 83760, 0),
(326109, 8, 239.50, 1332.80, 0.46, 0.000, 0, 0, 0, 0, 0, 100, 83760, 0);
DELETE FROM `creature_addon` WHERE `guid` = 326109;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES
(326109, 326109, 0, 0, 1, 0, '175098');
