-- Joao Calhandro (257438) sits on a chair.
DELETE FROM `creature_addon` WHERE `guid` = 257438;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES
(257438, 0, 0, 5, 1, 0, NULL);
