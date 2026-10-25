-- Legion instance entrances and exits, walked into: the 7.3.5 client has no area trigger for them. Portal places
-- (radius included) from AshamaneCore's server-side area triggers (ADB 735.10), destinations from the official
-- WorldSafeLocs (TrinityCore world_safe_locs) their areatrigger_teleport rows point to; facing converted to radians.
-- Read by AreaTriggerDataStoreMgr::LoadInstancePortals, checked by Player::CheckInstancePortals.
CREATE TABLE IF NOT EXISTS `instance_portals` (
  `ID` int unsigned NOT NULL,
  `Map` int unsigned NOT NULL,
  `X` float NOT NULL, `Y` float NOT NULL, `Z` float NOT NULL,
  `Radius` float NOT NULL,
  `TargetMap` int unsigned NOT NULL,
  `TargetX` float NOT NULL, `TargetY` float NOT NULL, `TargetZ` float NOT NULL, `TargetO` float NOT NULL,
  `Comment` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DELETE FROM `instance_portals`;
INSERT INTO `instance_portals` (`ID`, `Map`, `X`, `Y`, `Z`, `Radius`, `TargetMap`, `TargetX`, `TargetY`, `TargetZ`, `TargetO`, `Comment`) VALUES
(3, 1220, -972.170, 4310.750, 743.260, 5, 1544, 4581.610, 3993.070, 83.488, 1.1311, 'Assault on Violet Hold Entrance'),
(4, 1544, 4541.120, 4015.090, 88.771, 7, 1220, -953.057, 4333.460, 740.184, 0.9283, 'Assault on Violet Hold Exit'),
(5, 1220, 3124.310, 7564.080, 35.469, 5, 1501, 3484.260, 7645.710, -9.677, 3.3462, 'BlackRook Hold entrance'),
(6, 1501, 3508.140, 7650.480, -2.429, 5, 1220, 3105.250, 7543.430, 31.975, 3.8715, 'BlackRook Hold exit'),
(7, 1220, -422.000, 2432.390, 106.295, 5, 1677, -699.750, 2528.560, 332.080, 0.0265, 'Cathedral of Eternal Night Entrance'),
(8, 1677, -713.953, 2528.850, 334.286, 5, 1220, -425.364, 2428.470, 108.398, 0.6886, 'Cathedral of Eternal Night Exit'),
(9, 1220, 1017.370, 3826.380, 8.489, 5, 1571, 1016.070, 3819.520, 4.817, 4.5080, 'Court of Stars Entrance'),
(10, 1571, 1018.090, 3830.680, 8.489, 5, 1220, 1022.010, 3848.590, 7.827, 1.4067, 'Court of Stars Exit'),
(11, 1220, 3822.110, 6356.570, 191.034, 5, 1466, 3247.980, 1828.700, 236.767, 3.1738, 'Darkheart Thicket entrance'),
(12, 1466, 3264.800, 1831.000, 244.668, 5, 1220, 3812.910, 6347.590, 185.299, 3.8149, 'Darkheart Thicket exit'),
(13, 1220, 0.308, 5810.670, 5.719, 5, 1456, -3914.340, 4540.620, 86.584, 5.7732, 'Eye of Azshara entrance'),
(14, 1456, -3927.830, 4550.480, 93.389, 5, 1220, 0.783, 5783.040, 4.205, 4.8418, 'Eye of Azshara exit'),
(15, 1220, 2452.870, 813.793, 256.461, 5, 1477, 3801.210, 529.078, 603.332, 3.1310, 'Hall of Valors Entrance'),
(16, 1477, 3817.090, 528.909, 606.809, 5, 1220, 2434.390, 832.011, 252.923, 2.3401, 'Hall of Valors Exit'),
(17, 1220, 3434.170, 1985.100, 22.778, 5, 1492, 7184.290, 7318.970, 23.273, 6.0539, 'Maw of Souls Entrance'),
(18, 1492, 7156.930, 7317.660, 25.009, 8, 1220, 3419.010, 1988.640, 15.536, 2.9653, 'Maw of Souls Exit'),
(19, 1220, 3720.920, 4184.940, 892.522, 8, 1458, 2973.280, 987.988, 372.969, 2.6760, 'Neltharion''s Lair Entrance'),
(20, 1458, 2986.280, 982.742, 381.306, 5, 1220, 3735.320, 4182.460, 892.069, 6.1273, 'Neltharion''s Lair Exit'),
(21, 0, -11040.100, -1997.180, 93.009, 3, 1651, -11041.300, -1996.140, 95.515, 2.1425, 'Return to Karazhan Entrance'),
(22, 1651, -11074.400, -1988.620, 95.489, 3, 0, -11036.700, -2001.600, 93.000, 5.4105, 'Return to Karazhan Exit'),
(23, 1220, 1155.360, 4380.970, 14.958, 3, 1516, 3515.740, 4805.380, 590.072, 3.0951, 'The Arcway Entrance'),
(24, 1516, 3534.640, 4806.050, 596.357, 5, 1220, 1168.690, 4372.910, 8.360, 5.7427, 'The Arcway Exit'),
(25, 1220, -1712.620, 6648.820, 128.964, 7, 1493, 4184.480, -762.404, 269.472, 1.5798, 'Vault of the Warden Entrance'),
(26, 1493, 4184.080, -748.448, 269.875, 4, 1220, -1811.730, 6670.420, 146.691, 2.5854, 'Vault of the Warden Exit'),
(27, 1220, 3613.520, 6505.590, 183.438, 7, 1520, 1810.120, 1424.190, 355.169, 5.9325, 'Emerald Nightmare Entrance'),
(28, 1520, 1786.600, 1421.960, 350.735, 10, 1220, 3588.270, 6483.400, 177.970, 3.8202, 'Emerald Nightmare Exit'),
(29, 1220, 2356.120, 910.200, 257.337, 7, 1648, 3207.870, 529.281, 633.148, 3.0945, 'Trial of Valors Entrance'),
(30, 1648, 3251.980, 529.118, 640.022, 5, 1220, 2370.780, 895.832, 252.924, 5.4856, 'Trial of Valors Exit'),
(31, 1220, -1237.210, 4205.220, -65.372, 3, 1530, -149.189, 3531.720, -253.876, 5.4939, 'The Nighthold Entrance'),
(32, 1530, -67.611, 3421.670, -255.214, 5, 1220, 1226.820, 4210.800, -66.946, 5.7341, 'The Nighthold Exit'),
(34, 1220, -536.851, 2430.070, 116.416, 10, 1676, 5859.020, -795.786, 2953.090, 6.2542, 'Tomb of Sargeras entrance'),
(35, 1676, 5828.210, -795.753, 2958.380, 7, 1220, -557.716, 2459.140, 103.040, 2.1866, 'Tomb of Sargeras exit'),
(38, 1220, 3657.080, 757.410, -5.636, 5, 1463, 366.297, 365.146, 28.084, 0.2439, 'Helheim Entrance'),
(46, 1669, 5412.830, 10816.600, 22.501, 7, 1753, 5424.530, 10818.100, 20.152, 6.0836, 'Seat of Triumvirate Entrance'),
(47, 1753, 5413.990, 10818.300, 20.213, 7, 1669, 5392.790, 10823.600, 18.744, 6.0161, 'Seat of Triumvirate Exit');
