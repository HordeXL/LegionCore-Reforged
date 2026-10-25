-- Stormshield peasant 5200026: standing still, he hammers at the building site (without the sack of his template).
UPDATE `creature` SET `position_x` = 3925.64, `position_y` = -3993.2, `position_z` = 37.8019, `orientation` = 6.02593, `MovementType` = 0, `spawndist` = 0 WHERE `guid` = 5200026;

DELETE FROM `creature_addon` WHERE `guid` = 5200026;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES
(5200026, 0, 0, 0, 1, 613, NULL);
