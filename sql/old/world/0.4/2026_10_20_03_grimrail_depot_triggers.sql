-- Invisible triggers the Grimrail Depot scripts summon or look for, with the ones placed in the depot and on the train
DROP TEMPORARY TABLE IF EXISTS `tmp_trigger`, `tmp_trigger_wdb`, `tmp_trigger_movement`;
CREATE TEMPORARY TABLE `tmp_trigger` AS SELECT * FROM `creature_template` WHERE `entry` = 79417;
CREATE TEMPORARY TABLE `tmp_trigger_wdb` AS SELECT * FROM `creature_template_wdb` WHERE `Entry` = 79417;
CREATE TEMPORARY TABLE `tmp_trigger_movement` AS SELECT * FROM `creature_template_movement` WHERE `CreatureId` = 79417;
DELETE FROM `creature_template` WHERE `entry` IN (432425, 324256, 324235, 543533, 877894, 877896, 324265);
DELETE FROM `creature_template_wdb` WHERE `Entry` IN (432425, 324256, 324235, 543533, 877894, 877896, 324265);
DELETE FROM `creature_template_movement` WHERE `CreatureId` IN (432425, 324256, 324235, 543533, 877894, 877896, 324265);
UPDATE `tmp_trigger` SET `entry` = 432425; INSERT INTO `creature_template` SELECT * FROM `tmp_trigger`;
UPDATE `tmp_trigger_wdb` SET `Entry` = 432425, `Name1` = 'Grimrail Depot - Mad Dash Target'; INSERT INTO `creature_template_wdb` SELECT * FROM `tmp_trigger_wdb`;
UPDATE `tmp_trigger_movement` SET `CreatureId` = 432425; INSERT INTO `creature_template_movement` SELECT * FROM `tmp_trigger_movement`;
UPDATE `tmp_trigger` SET `entry` = 324256; INSERT INTO `creature_template` SELECT * FROM `tmp_trigger`;
UPDATE `tmp_trigger_wdb` SET `Entry` = 324256, `Name1` = 'Grimrail Depot - Blackrock Bomb Target'; INSERT INTO `creature_template_wdb` SELECT * FROM `tmp_trigger_wdb`;
UPDATE `tmp_trigger_movement` SET `CreatureId` = 324256; INSERT INTO `creature_template_movement` SELECT * FROM `tmp_trigger_movement`;
UPDATE `tmp_trigger` SET `entry` = 324235; INSERT INTO `creature_template` SELECT * FROM `tmp_trigger`;
UPDATE `tmp_trigger_wdb` SET `Entry` = 324235, `Name1` = 'Grimrail Depot - Diffused Energy Target'; INSERT INTO `creature_template_wdb` SELECT * FROM `tmp_trigger_wdb`;
UPDATE `tmp_trigger_movement` SET `CreatureId` = 324235; INSERT INTO `creature_template_movement` SELECT * FROM `tmp_trigger_movement`;
UPDATE `tmp_trigger` SET `entry` = 543533; INSERT INTO `creature_template` SELECT * FROM `tmp_trigger`;
UPDATE `tmp_trigger_wdb` SET `Entry` = 543533, `Name1` = 'Grimrail Depot - Slag Blast Spread'; INSERT INTO `creature_template_wdb` SELECT * FROM `tmp_trigger_wdb`;
UPDATE `tmp_trigger_movement` SET `CreatureId` = 543533; INSERT INTO `creature_template_movement` SELECT * FROM `tmp_trigger_movement`;
UPDATE `tmp_trigger` SET `entry` = 877894; INSERT INTO `creature_template` SELECT * FROM `tmp_trigger`;
UPDATE `tmp_trigger_wdb` SET `Entry` = 877894, `Name1` = 'Grimrail Depot - X21-01A Target'; INSERT INTO `creature_template_wdb` SELECT * FROM `tmp_trigger_wdb`;
UPDATE `tmp_trigger_movement` SET `CreatureId` = 877894; INSERT INTO `creature_template_movement` SELECT * FROM `tmp_trigger_movement`;
UPDATE `tmp_trigger` SET `entry` = 877896; INSERT INTO `creature_template` SELECT * FROM `tmp_trigger`;
UPDATE `tmp_trigger_wdb` SET `Entry` = 877896, `Name1` = 'Grimrail Depot - Iron Turret Destination'; INSERT INTO `creature_template_wdb` SELECT * FROM `tmp_trigger_wdb`;
UPDATE `tmp_trigger_movement` SET `CreatureId` = 877896; INSERT INTO `creature_template_movement` SELECT * FROM `tmp_trigger_movement`;
UPDATE `tmp_trigger` SET `entry` = 324265; INSERT INTO `creature_template` SELECT * FROM `tmp_trigger`;
UPDATE `tmp_trigger_wdb` SET `Entry` = 324265, `Name1` = 'Grimrail Depot - Suppressive Fire Target'; INSERT INTO `creature_template_wdb` SELECT * FROM `tmp_trigger_wdb`;
UPDATE `tmp_trigger_movement` SET `CreatureId` = 324265; INSERT INTO `creature_template_movement` SELECT * FROM `tmp_trigger_movement`;
DROP TEMPORARY TABLE `tmp_trigger`, `tmp_trigger_wdb`, `tmp_trigger_movement`;

DELETE FROM `creature` WHERE `map` = 1208 AND `id` IN (432425, 324256, 324235, 543533, 877894, 877896, 324265);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `PhaseId`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`) VALUES
(10540123, 432425, 1208, 6984, 6984, 8388870, 1, 0, 0, 0, 1714.66, 1547.99, 7.77, 0, 300, 0, 0, 0, 0, 0),
(10540124, 432425, 1208, 6984, 6984, 8388870, 1, 0, 0, 0, 1731.58, 1567.16, 7.65, 0, 300, 0, 0, 0, 0, 0),
(10540125, 432425, 1208, 6984, 6984, 8388870, 1, 0, 0, 0, 1685.39, 1563.84, 7.81, 0, 300, 0, 0, 0, 0, 0),
(10540126, 432425, 1208, 6984, 6984, 8388870, 1, 0, 0, 0, 1704.42, 1582.68, 7.78, 0, 300, 0, 0, 0, 0, 0),
(10540127, 432425, 1208, 6984, 6984, 8388870, 1, 0, 0, 0, 1690.96, 1580.63, 7.78, 0, 300, 0, 0, 0, 0, 0),
(10540128, 432425, 1208, 6984, 6984, 8388870, 1, 0, 0, 0, 1725.88, 1555.42, 7.70, 0, 300, 0, 0, 0, 0, 0),
(10540129, 432425, 1208, 6984, 6984, 8388870, 1, 0, 0, 0, 1717.14, 1574.92, 7.78, 0, 300, 0, 0, 0, 0, 0),
(10540130, 432425, 1208, 6984, 6984, 8388870, 1, 0, 0, 0, 1685.04, 1551.08, 7.81, 0, 300, 0, 0, 0, 0, 0),
(10540131, 432425, 1208, 6984, 6984, 8388870, 1, 0, 0, 0, 1701.33, 1544.61, 7.79, 0, 300, 0, 0, 0, 0, 0),
(10540132, 324256, 1208, 6984, 6984, 8388870, 1, 0, 0, 0, 1718.66, 1543.99, 7.77, 0, 300, 0, 0, 0, 0, 0),
(10540133, 324256, 1208, 6984, 6984, 8388870, 1, 0, 0, 0, 1735.58, 1563.16, 7.65, 0, 300, 0, 0, 0, 0, 0),
(10540134, 324256, 1208, 6984, 6984, 8388870, 1, 0, 0, 0, 1689.39, 1559.84, 7.81, 0, 300, 0, 0, 0, 0, 0),
(10540135, 324256, 1208, 6984, 6984, 8388870, 1, 0, 0, 0, 1708.42, 1578.68, 7.78, 0, 300, 0, 0, 0, 0, 0),
(10540136, 324256, 1208, 6984, 6984, 8388870, 1, 0, 0, 0, 1694.96, 1576.63, 7.78, 0, 300, 0, 0, 0, 0, 0),
(10540137, 324256, 1208, 6984, 6984, 8388870, 1, 0, 0, 0, 1729.88, 1551.42, 7.70, 0, 300, 0, 0, 0, 0, 0),
(10540138, 324256, 1208, 6984, 6984, 8388870, 1, 0, 0, 0, 1721.14, 1570.92, 7.78, 0, 300, 0, 0, 0, 0, 0),
(10540139, 324256, 1208, 6984, 6984, 8388870, 1, 0, 0, 0, 1689.04, 1547.08, 7.81, 0, 300, 0, 0, 0, 0, 0),
(10540140, 324256, 1208, 6984, 6984, 8388870, 1, 0, 0, 0, 1705.33, 1540.61, 7.79, 0, 300, 0, 0, 0, 0, 0),
(10540141, 543533, 1208, 6984, 6984, 8388870, 1, 0, 0, 0, 1647.00, 1690.00, 107.00, 0, 300, 0, 0, 0, 0, 0),
(10540142, 543533, 1208, 6984, 6984, 8388870, 1, 0, 0, 0, 1647.00, 1700.00, 107.00, 0, 300, 0, 0, 0, 0, 0),
(10540143, 543533, 1208, 6984, 6984, 8388870, 1, 0, 0, 0, 1647.00, 1710.00, 107.00, 0, 300, 0, 0, 0, 0, 0),
(10540144, 543533, 1208, 6984, 6984, 8388870, 1, 0, 0, 0, 1647.00, 1720.00, 107.00, 0, 300, 0, 0, 0, 0, 0),
(10540145, 543533, 1208, 6984, 6984, 8388870, 1, 0, 0, 0, 1647.00, 1730.00, 107.00, 0, 300, 0, 0, 0, 0, 0),
(10540146, 877896, 1208, 6984, 6984, 8388870, 1, 0, 0, 0, 1652.26, 1791.44, 108.07, 0, 300, 0, 0, 0, 0, 0),
(10540147, 877896, 1208, 6984, 6984, 8388870, 1, 0, 0, 0, 1642.58, 1779.59, 108.07, 0, 300, 0, 0, 0, 0, 0),
(10540148, 877896, 1208, 6984, 6984, 8388870, 1, 0, 0, 0, 1643.19, 1840.45, 108.07, 0, 300, 0, 0, 0, 0, 0),
(10540149, 877896, 1208, 6984, 6984, 8388870, 1, 0, 0, 0, 1640.96, 1814.91, 108.07, 0, 300, 0, 0, 0, 0, 0),
(10540150, 877896, 1208, 6984, 6984, 8388870, 1, 0, 0, 0, 1651.28, 1822.95, 108.07, 0, 300, 0, 0, 0, 0, 0),
(10540151, 877896, 1208, 6984, 6984, 8388870, 1, 0, 0, 0, 1652.18, 1814.54, 108.24, 0, 300, 0, 0, 0, 0, 0),
(10540152, 324235, 1208, 6984, 6984, 8388870, 1, 0, 0, 0, 1642.00, 1985.00, 107.80, 0, 300, 0, 0, 0, 0, 0),
(10540153, 324235, 1208, 6984, 6984, 8388870, 1, 0, 0, 0, 1642.00, 1995.00, 107.80, 0, 300, 0, 0, 0, 0, 0),
(10540154, 324235, 1208, 6984, 6984, 8388870, 1, 0, 0, 0, 1642.00, 2005.00, 107.80, 0, 300, 0, 0, 0, 0, 0),
(10540155, 324235, 1208, 6984, 6984, 8388870, 1, 0, 0, 0, 1642.00, 2015.00, 107.80, 0, 300, 0, 0, 0, 0, 0),
(10540156, 324235, 1208, 6984, 6984, 8388870, 1, 0, 0, 0, 1647.00, 1985.00, 107.80, 0, 300, 0, 0, 0, 0, 0),
(10540157, 324235, 1208, 6984, 6984, 8388870, 1, 0, 0, 0, 1647.00, 1995.00, 107.80, 0, 300, 0, 0, 0, 0, 0),
(10540158, 324235, 1208, 6984, 6984, 8388870, 1, 0, 0, 0, 1647.00, 2005.00, 107.80, 0, 300, 0, 0, 0, 0, 0),
(10540159, 324235, 1208, 6984, 6984, 8388870, 1, 0, 0, 0, 1647.00, 2015.00, 107.80, 0, 300, 0, 0, 0, 0, 0),
(10540160, 324235, 1208, 6984, 6984, 8388870, 1, 0, 0, 0, 1652.00, 1985.00, 107.80, 0, 300, 0, 0, 0, 0, 0),
(10540161, 324235, 1208, 6984, 6984, 8388870, 1, 0, 0, 0, 1652.00, 1995.00, 107.80, 0, 300, 0, 0, 0, 0, 0),
(10540162, 324235, 1208, 6984, 6984, 8388870, 1, 0, 0, 0, 1652.00, 2005.00, 107.80, 0, 300, 0, 0, 0, 0, 0),
(10540163, 324235, 1208, 6984, 6984, 8388870, 1, 0, 0, 0, 1652.00, 2015.00, 107.80, 0, 300, 0, 0, 0, 0, 0);
