-- Talador, Shattrath: the Armored Felbats resting on the platforms and docks sit on the ground instead of hovering wings spread, the ones patrolling high up keep flying
DELETE FROM `creature_addon` WHERE `guid` IN (326898, 327261, 326893, 326889, 326888, 326886, 326890, 326871, 326872, 326930, 326870, 326953, 326947);
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES
(326898, 0, 0, 1, 1, 0, ''),
(327261, 0, 0, 1, 1, 0, ''),
(326893, 0, 0, 1, 1, 0, ''),
(326889, 0, 0, 1, 1, 0, ''),
(326888, 0, 0, 1, 1, 0, ''),
(326886, 0, 0, 1, 1, 0, ''),
(326890, 0, 0, 1, 1, 0, ''),
(326871, 0, 0, 1, 1, 0, ''),
(326872, 0, 0, 1, 1, 0, ''),
(326930, 0, 0, 1, 1, 0, ''),
(326870, 0, 0, 1, 1, 0, ''),
(326953, 0, 0, 1, 1, 0, ''),
(326947, 0, 0, 1, 1, 0, '');
DELETE FROM `creature_movement_override` WHERE `SpawnId` IN (326898, 327261, 326893, 326889, 326888, 326886, 326890, 326871, 326872, 326930, 326870, 326953, 326947);
INSERT INTO `creature_movement_override` (`SpawnId`, `Ground`, `Swim`, `Flight`, `Rooted`, `Random`, `InteractionPauseTimer`) VALUES
(326898, 1, 0, 0, 0, 0, NULL),
(327261, 1, 0, 0, 0, 0, NULL),
(326893, 1, 0, 0, 0, 0, NULL),
(326889, 1, 0, 0, 0, 0, NULL),
(326888, 1, 0, 0, 0, 0, NULL),
(326886, 1, 0, 0, 0, 0, NULL),
(326890, 1, 0, 0, 0, 0, NULL),
(326871, 1, 0, 0, 0, 0, NULL),
(326872, 1, 0, 0, 0, 0, NULL),
(326930, 1, 0, 0, 0, 0, NULL),
(326870, 1, 0, 0, 0, 0, NULL),
(326953, 1, 0, 0, 0, 0, NULL),
(326947, 1, 0, 0, 0, 0, NULL);
UPDATE `creature` SET `MovementType` = 0, `spawndist` = 0 WHERE `guid` IN (326898, 327261, 326893, 326889, 326888, 326886, 326890, 326871, 326872, 326930, 326870, 326953, 326947);
