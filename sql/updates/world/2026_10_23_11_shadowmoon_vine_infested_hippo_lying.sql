-- Shadowmoon Valley: the vine-infested Twilight Hippos lie on the ground and cannot move, instead of standing up and lying down again
UPDATE `creature_template_addon` SET `bytes1` = 3 WHERE `entry` = 83455;
DELETE FROM `creature_template_movement` WHERE `CreatureId` = 83455;
INSERT INTO `creature_template_movement` (`CreatureId`, `Ground`, `Swim`, `Flight`, `Rooted`, `Random`) VALUES
(83455, 1, 0, 0, 1, 0);
