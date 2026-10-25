-- Stephen Hicklin (257242) and Phillip Hillenbrand (257251) sit on the restored Stormshield chairs beneath them.
UPDATE `creature` SET `position_x` = 3556.93, `position_y` = -3871.57, `position_z` = 6.98, `orientation` = 4.74 WHERE `guid` = 257242;
UPDATE `creature` SET `position_x` = 3559.20, `position_y` = -3874.34, `position_z` = 6.98, `orientation` = 2.63 WHERE `guid` = 257251;

DELETE FROM `creature_addon` WHERE `guid` IN (257242, 257251);
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES
(257242, 0, 0, 5, 1, 0, NULL),
(257251, 0, 0, 5, 1, 0, NULL);
