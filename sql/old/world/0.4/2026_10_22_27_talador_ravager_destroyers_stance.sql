-- Talador, Shattrath harbor: the Ravager Destroyers standing still lose the hunched walking stance that made them look drowned
DELETE FROM `creature_addon` WHERE `guid` IN (326876, 326948, 326999, 327036);
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES
(326876, 0, 0, 0, 1, 0, ''),
(326948, 0, 0, 0, 1, 0, ''),
(326999, 0, 0, 0, 1, 0, ''),
(327036, 0, 0, 0, 1, 0, '');
UPDATE `creature` SET `MovementType` = 0, `spawndist` = 0 WHERE `guid` IN (326876, 326948, 326999, 327036);
