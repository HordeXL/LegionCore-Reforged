-- Lunarfall garrison: Arsenio Zerep works at his cooking spot instead of standing frozen on a few yards of path
DELETE FROM `waypoint_data` WHERE `id` = 351753;
UPDATE `creature` SET `position_x` = 1904.38, `position_y` = 211.18, `position_z` = 77.14, `orientation` = 0.233, `MovementType` = 0, `spawndist` = 0 WHERE `guid` = 351753;
DELETE FROM `creature_addon` WHERE `guid` = 351753;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES
(351753, 0, 0, 0, 257, 69, '');
