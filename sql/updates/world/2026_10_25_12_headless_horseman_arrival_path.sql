-- Headless Horseman: his flight from the soil around the courtyard before landing to fight
DELETE FROM `waypoint_data` WHERE `id` = 23682;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `delay_chance`, `move_type`, `speed`, `action`, `action_chance`, `entry`, `wpguid`) VALUES
(23682, 0, 1094.00, 606.00, 10.00, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(23682, 1, 1108.00, 620.00, 12.00, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(23682, 2, 1096.00, 634.00, 8.00, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(23682, 3, 1086.24, 627.44, -0.05, 0, 0, 0, 0, 0, 0, 100, 0, 0);
