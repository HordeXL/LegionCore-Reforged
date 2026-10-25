-- Talador, Shattrath: the Terrorwing Riders patrolling the sky ride their bats along their flight paths instead of standing still in the air, and are seen from 300 yards
DELETE FROM `creature_addon` WHERE `guid` IN (327331, 327357, 327393, 327416, 327420, 327422, 327428, 327429);
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES
(327331, 327331, 55150, 50331648, 1, 0, ''),
(327357, 327357, 55150, 50331648, 1, 0, ''),
(327393, 327393, 55150, 50331648, 1, 0, ''),
(327416, 327416, 55150, 50331648, 1, 0, ''),
(327420, 327420, 55150, 50331648, 1, 0, ''),
(327422, 327422, 55150, 50331648, 1, 0, ''),
(327428, 327428, 55150, 50331648, 1, 0, ''),
(327429, 327429, 55150, 50331648, 1, 0, '');
DELETE FROM `creature_movement_override` WHERE `SpawnId` IN (327331, 327357, 327393, 327416, 327420, 327422, 327428, 327429);
INSERT INTO `creature_movement_override` (`SpawnId`, `Ground`, `Swim`, `Flight`, `Rooted`, `Random`, `InteractionPauseTimer`) VALUES
(327331, 0, 0, 1, 0, 0, NULL),
(327357, 0, 0, 1, 0, 0, NULL),
(327393, 0, 0, 1, 0, 0, NULL),
(327416, 0, 0, 1, 0, 0, NULL),
(327420, 0, 0, 1, 0, 0, NULL),
(327422, 0, 0, 1, 0, 0, NULL),
(327428, 0, 0, 1, 0, 0, NULL),
(327429, 0, 0, 1, 0, 0, NULL);
UPDATE `waypoint_data` SET `move_type` = 1 WHERE `id` IN (327331, 327357, 327393, 327416, 327420, 327422, 327428, 327429);
UPDATE `creature_template` SET `VisibilityDistance` = 300 WHERE `entry` = 86515;
