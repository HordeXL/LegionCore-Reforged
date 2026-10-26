-- Lost City of the Tol'vir.
-- Siamat (47285) waiting on the terrace for the traitors (quest 27922 "Traitors!"): he stands and channels instead
-- of wandering.
UPDATE `creature` SET `MovementType` = 0, `spawndist` = 0 WHERE `guid` = 190946;
DELETE FROM `creature_addon` WHERE `guid` = 190946;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES (190946, 0, 0, 0, 1, 468, '');   -- spell channel omni

-- Neferset Sentinels (47306): all 14 wandered at random. They stand guard (as in TDB 7.3.5 / 12.1), and two walk a
-- round: one along the western street between the five guards posted there, one between two posts in the centre.
-- Routes follow the line of the posted guards (no official path exists in either TDB).
UPDATE `creature` SET `MovementType` = 0, `spawndist` = 0 WHERE `id` = 47306;
UPDATE `creature` SET `MovementType` = 2 WHERE `guid` IN (191293, 191659);
DELETE FROM `creature_addon` WHERE `guid` IN (191293, 191659);
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES
(191293, 1912930, 0, 0, 1, 0, ''),
(191659, 1916590, 0, 0, 1, 0, '');
DELETE FROM `waypoint_data` WHERE `id` IN (1912930, 1916590);
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `delay_chance`, `move_type`, `speed`, `action`, `action_chance`, `entry`, `wpguid`) VALUES
(1912930, 1, -11163.25, -1385.30, 10.89, 0, 0, 100, 0, 0, 0, 100, 0, 0),
(1912930, 2, -11155.45, -1404.91, 10.89, 0, 0, 100, 0, 0, 0, 100, 0, 0),
(1912930, 3, -11147.85, -1420.91, 10.89, 0, 0, 100, 0, 0, 0, 100, 0, 0),
(1912930, 4, -11133.05, -1431.32, 10.89, 0, 0, 100, 0, 0, 0, 100, 0, 0),
(1912930, 5, -11115.25, -1428.77, 10.89, 0, 6000, 100, 0, 0, 0, 100, 0, 0),
(1912930, 6, -11133.05, -1431.32, 10.89, 0, 0, 100, 0, 0, 0, 100, 0, 0),
(1912930, 7, -11147.85, -1420.91, 10.89, 0, 0, 100, 0, 0, 0, 100, 0, 0),
(1912930, 8, -11155.45, -1404.91, 10.89, 0, 0, 100, 0, 0, 0, 100, 0, 0),
(1912930, 9, -11163.25, -1385.30, 10.89, 0, 6000, 100, 0, 0, 0, 100, 0, 0),
(1916590, 1, -11034.00, -1381.99, 10.82, 0, 6000, 100, 0, 0, 0, 100, 0, 0),
(1916590, 2, -11015.50, -1371.20, 10.85, 0, 0, 100, 0, 0, 0, 100, 0, 0),
(1916590, 3, -10998.50, -1362.80, 10.89, 0, 6000, 100, 0, 0, 0, 100, 0, 0),
(1916590, 4, -11015.50, -1371.20, 10.85, 0, 0, 100, 0, 0, 0, 100, 0, 0);

-- The two Neferset High Guards (48263) on Siamat's terrace stand still.
UPDATE `creature` SET `MovementType` = 0, `spawndist` = 0 WHERE `guid` IN (191067, 191119);
