-- Spires of Arak: the Toxicfang Rylak corpses can no longer be targeted or attacked, and the six hung on hooks and branches stay up where they were placed
UPDATE `creature_template` SET `unit_flags` = `unit_flags` | 0x2 | 0x100 | 0x200 | 0x2000000 WHERE `entry` = 83740;
DELETE FROM `creature_movement_override` WHERE `SpawnId` IN (326090, 326100, 326118, 326123, 326132, 326138);
INSERT INTO `creature_movement_override` (`SpawnId`, `Ground`, `Swim`, `Flight`, `Rooted`, `Random`, `InteractionPauseTimer`) VALUES
(326090, 1, 0, 1, 1, 0, NULL),
(326100, 1, 0, 1, 1, 0, NULL),
(326118, 1, 0, 1, 1, 0, NULL),
(326123, 1, 0, 1, 1, 0, NULL),
(326132, 1, 0, 1, 1, 0, NULL),
(326138, 1, 0, 1, 1, 0, NULL);
