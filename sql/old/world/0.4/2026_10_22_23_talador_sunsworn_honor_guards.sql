-- Talador, Shattrath: the Sunsworn Honor Guards stand on foot at their posts in the city instead of hovering on their phoenixes
DELETE FROM `creature_addon` WHERE `guid` IN (327369, 327374, 327402, 327514, 327518, 327524, 327532, 327535, 327542, 327543, 327548, 327549);
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES
(327369, 0, 0, 0, 1, 0, ''),
(327374, 0, 0, 0, 1, 0, ''),
(327402, 0, 0, 0, 1, 0, ''),
(327514, 0, 0, 0, 1, 0, ''),
(327518, 0, 0, 0, 1, 0, ''),
(327524, 0, 0, 0, 1, 0, ''),
(327532, 0, 0, 0, 1, 0, ''),
(327535, 0, 0, 0, 1, 0, ''),
(327542, 0, 0, 0, 1, 0, ''),
(327543, 0, 0, 0, 1, 0, ''),
(327548, 0, 0, 0, 1, 0, ''),
(327549, 0, 0, 0, 1, 0, '');
DELETE FROM `creature_movement_override` WHERE `SpawnId` IN (327369, 327374, 327402, 327514, 327518, 327524, 327532, 327535, 327542, 327543, 327548, 327549);
INSERT INTO `creature_movement_override` (`SpawnId`, `Ground`, `Swim`, `Flight`, `Rooted`, `Random`, `InteractionPauseTimer`) VALUES
(327369, 1, 0, 0, 0, 0, NULL),
(327374, 1, 0, 0, 0, 0, NULL),
(327402, 1, 0, 0, 0, 0, NULL),
(327514, 1, 0, 0, 0, 0, NULL),
(327518, 1, 0, 0, 0, 0, NULL),
(327524, 1, 0, 0, 0, 0, NULL),
(327532, 1, 0, 0, 0, 0, NULL),
(327535, 1, 0, 0, 0, 0, NULL),
(327542, 1, 0, 0, 0, 0, NULL),
(327543, 1, 0, 0, 0, 0, NULL),
(327548, 1, 0, 0, 0, 0, NULL),
(327549, 1, 0, 0, 0, 0, NULL);
UPDATE `creature` SET `MovementType` = 0, `spawndist` = 0 WHERE `guid` IN (327369, 327374, 327402, 327514, 327518, 327524);
-- the three pairs of guards left floating above the forest east of the city, once the start of flying patrols, no longer spawn
UPDATE `creature` SET `spawnMask` = 0 WHERE `guid` IN (327369, 327374, 327402, 327385, 327409, 327430);
