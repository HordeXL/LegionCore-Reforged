-- Spires of Arak: the Toxicfang Rylak corpses lie on top of their tree branches or hang on the gibbet hooks instead of floating under them

UPDATE `creature` SET `position_x` = 309.90, `position_y` = 1341.70, `position_z` = 18.27, `orientation` = 2.106 WHERE `guid` = 326090 AND `id` = 83740;
UPDATE `creature` SET `position_x` = 250.67, `position_y` = 1338.38, `position_z` = 4.04, `orientation` = 4.109 WHERE `guid` = 326100 AND `id` = 83740;
UPDATE `creature` SET `position_x` = 256.52, `position_y` = 1322.62, `position_z` = 2.43, `orientation` = 5.042 WHERE `guid` = 326103 AND `id` = 83740;
UPDATE `creature` SET `position_x` = 217.30, `position_y` = 1313.90, `position_z` = 17.56, `orientation` = 0.455 WHERE `guid` = 326118 AND `id` = 83740;
UPDATE `creature` SET `position_x` = 208.40, `position_y` = 1313.20, `position_z` = 24.95, `orientation` = 1.863 WHERE `guid` = 326123 AND `id` = 83740;
UPDATE `creature` SET `position_x` = 191.99, `position_y` = 1345.87, `position_z` = 3.47, `orientation` = 0.123 WHERE `guid` = 326127 AND `id` = 83740;
UPDATE `creature` SET `position_x` = 212.30, `position_y` = 1299.40, `position_z` = 16.12, `orientation` = 5.255 WHERE `guid` = 326132 AND `id` = 83740;
UPDATE `creature` SET `position_x` = 167.10, `position_y` = 1368.80, `position_z` = 19.40, `orientation` = 4.752 WHERE `guid` = 326138 AND `id` = 83740;
DELETE FROM `creature_movement_override` WHERE `SpawnId` IN (326103, 326127);
INSERT INTO `creature_movement_override` (`SpawnId`, `Ground`, `Swim`, `Flight`, `Rooted`, `Random`, `InteractionPauseTimer`) VALUES
(326103, 1, 0, 1, 1, 0, NULL),
(326127, 1, 0, 1, 1, 0, NULL);
