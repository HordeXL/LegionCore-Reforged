-- Golden king statue (lion, 257288): animation frozen like a real statue (Freeze Anim).
DELETE FROM `creature_addon` WHERE `guid` = 257288;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES
(257288, 0, 0, 0, 1, 0, '16245');
