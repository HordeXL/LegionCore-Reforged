-- Kharanos: Tognus Flintfire and Kogan Forgestone work at the forge.
DELETE FROM `creature_addon` WHERE `guid` IN (83507, 83509);
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES
(83507, 0, 0, 0, 257, 233, ''),
(83509, 0, 0, 0, 257, 233, '');
