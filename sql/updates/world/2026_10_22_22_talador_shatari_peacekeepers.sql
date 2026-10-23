-- Talador, Shattrath: the Sha'tari Peacekeepers stand on foot at their posts in the city instead of hovering on their mounts
DELETE FROM `creature_addon` WHERE `guid` IN (327385, 327409, 327430, 327496, 327508, 327513, 327519, 327520);
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES
(327385, 0, 0, 0, 1, 0, '18950'),
(327409, 0, 0, 0, 1, 0, '18950'),
(327430, 0, 0, 0, 1, 0, '18950'),
(327496, 0, 0, 0, 1, 0, '18950'),
(327508, 0, 0, 0, 1, 0, '18950'),
(327513, 0, 0, 0, 1, 0, '18950'),
(327519, 0, 0, 0, 1, 0, '18950'),
(327520, 0, 0, 0, 1, 0, '18950');
DELETE FROM `creature_movement_override` WHERE `SpawnId` IN (327385, 327409, 327430, 327496, 327508, 327513, 327519, 327520, 327504, 327505, 327564, 327565);
INSERT INTO `creature_movement_override` (`SpawnId`, `Ground`, `Swim`, `Flight`, `Rooted`, `Random`, `InteractionPauseTimer`) VALUES
(327385, 1, 0, 0, 0, 0, NULL),
(327409, 1, 0, 0, 0, 0, NULL),
(327430, 1, 0, 0, 0, 0, NULL),
(327496, 1, 0, 0, 0, 0, NULL),
(327508, 1, 0, 0, 0, 0, NULL),
(327513, 1, 0, 0, 0, 0, NULL),
(327519, 1, 0, 0, 0, 0, NULL),
(327520, 1, 0, 0, 0, 0, NULL),
(327504, 1, 0, 0, 0, 0, NULL),
(327505, 1, 0, 0, 0, 0, NULL),
(327564, 1, 0, 0, 0, 0, NULL),
(327565, 1, 0, 0, 0, 0, NULL);
-- guards standing on the bridges and terraces: dismounted
DELETE FROM `creature_addon` WHERE `guid` IN (327504, 327505, 327564, 327565, 327529, 327530, 327531, 327533, 327534, 327536, 327538, 327539, 327540, 327545, 327552, 327557, 327559);
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES
(327504, 0, 0, 0, 1, 0, '18950'),
(327505, 0, 0, 0, 1, 0, '18950'),
(327564, 0, 0, 0, 1, 0, '18950'),
(327565, 0, 0, 0, 1, 0, '18950'),
(327529, 0, 0, 0, 1, 0, '18950'),
(327530, 0, 0, 0, 1, 0, '18950'),
(327531, 0, 0, 0, 1, 0, '18950'),
(327533, 0, 0, 0, 1, 0, '18950'),
(327534, 0, 0, 0, 1, 0, '18950'),
(327536, 0, 0, 0, 1, 0, '18950'),
(327538, 0, 0, 0, 1, 0, '18950'),
(327539, 0, 0, 0, 1, 0, '18950'),
(327540, 0, 0, 0, 1, 0, '18950'),
(327545, 0, 0, 0, 1, 0, '18950'),
(327552, 0, 0, 0, 1, 0, '18950'),
(327557, 0, 0, 0, 1, 0, '18950'),
(327559, 0, 0, 0, 1, 0, '18950');
UPDATE `creature` SET `MovementType` = 0, `spawndist` = 0 WHERE `guid` IN (327529, 327530, 327531, 327533, 327534, 327536, 327538, 327539, 327540, 327545, 327552, 327557, 327559);
UPDATE `creature` SET `MovementType` = 0, `spawndist` = 0 WHERE `guid` IN (327385, 327409, 327430, 327496, 327508, 327513, 327519, 327520);
