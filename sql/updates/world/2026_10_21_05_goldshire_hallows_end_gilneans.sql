-- Goldshire Hallow's End: the pumpkin standing on Jesper moves aside, and Gretchen Fenlow works at her potions
UPDATE `gameobject` SET `position_x` = -9107.4, `position_y` = 420.6, `position_z` = 93.8 WHERE `guid` = 75017;
DELETE FROM `creature_addon` WHERE `guid` = 146728403;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES
(146728403, 0, 0, 0, 1, 133, '');
