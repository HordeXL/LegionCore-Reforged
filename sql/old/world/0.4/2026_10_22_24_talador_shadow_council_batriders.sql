-- Talador, Shattrath: the Shadowgaze Batriders and the Terrorwing Commander patrolling the sky fly along their paths, the commanders on the ground stand on foot
DELETE FROM `creature_addon` WHERE `guid` IN (331144, 331147, 331157, 331158, 331160, 331164, 331165, 331167, 331171, 331174, 331175, 331188, 331194, 331198, 331213, 327418, 327810, 327822);
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`)
SELECT c.`guid`, c.`guid`, t.`mount`, t.`bytes1`, t.`bytes2`, t.`emote`, IFNULL(t.`auras`, '') FROM `creature` c JOIN `creature_template_addon` t ON t.`entry` = c.`id` WHERE c.`guid` IN (331144, 331147, 331157, 331158, 331160, 331164, 331165, 331167, 331171, 331174, 331175, 331188, 331194, 331198, 331213, 327418);
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES
(327810, 0, 0, 0, 1, 0, ''),
(327822, 0, 0, 0, 1, 0, '');
UPDATE `creature` SET `MovementType` = 0, `spawndist` = 0 WHERE `guid` IN (327810, 327822);
UPDATE `waypoint_data` SET `move_type` = 1 WHERE `id` IN (331144, 331147, 331157, 331158, 331160, 331164, 331165, 331167, 331171, 331174, 331175, 331188, 331194, 331198, 331213, 327418);
DELETE FROM `creature_movement_override` WHERE `SpawnId` IN (331144, 331147, 331157, 331158, 331160, 331164, 331165, 331167, 331171, 331174, 331175, 331188, 331194, 331198, 331213, 327418, 327810, 327822);
INSERT INTO `creature_movement_override` (`SpawnId`, `Ground`, `Swim`, `Flight`, `Rooted`, `Random`, `InteractionPauseTimer`) VALUES
(331144, 0, 0, 1, 0, 0, NULL),
(331147, 0, 0, 1, 0, 0, NULL),
(331157, 0, 0, 1, 0, 0, NULL),
(331158, 0, 0, 1, 0, 0, NULL),
(331160, 0, 0, 1, 0, 0, NULL),
(331164, 0, 0, 1, 0, 0, NULL),
(331165, 0, 0, 1, 0, 0, NULL),
(331167, 0, 0, 1, 0, 0, NULL),
(331171, 0, 0, 1, 0, 0, NULL),
(331174, 0, 0, 1, 0, 0, NULL),
(331175, 0, 0, 1, 0, 0, NULL),
(331188, 0, 0, 1, 0, 0, NULL),
(331194, 0, 0, 1, 0, 0, NULL),
(331198, 0, 0, 1, 0, 0, NULL),
(331213, 0, 0, 1, 0, 0, NULL),
(327418, 0, 0, 1, 0, 0, NULL),
(327810, 1, 0, 0, 0, 0, NULL),
(327822, 1, 0, 0, 0, 0, NULL);
UPDATE `creature_template` SET `VisibilityDistance` = 300 WHERE `entry` IN (79514, 86838);
