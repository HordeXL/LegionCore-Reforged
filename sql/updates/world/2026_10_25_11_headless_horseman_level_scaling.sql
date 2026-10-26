-- Headless Horseman: he, his head, his pumpkins and their fiends match the level of each hero, from 20 to 110
DELETE FROM `creature_template_scaling` WHERE `Entry` IN (23682, 23800, 23775, 23694, 23545);
INSERT INTO `creature_template_scaling` (`Entry`, `LevelScalingMin`, `LevelScalingMax`, `LevelScalingDeltaMin`, `LevelScalingDeltaMax`, `LevelScalingDuration`, `VerifiedBuild`) VALUES
(23682, 20, 110, 0, 0, 0, 0),
(23800, 20, 110, 0, 0, 0, 0),
(23775, 20, 110, 0, 0, 0, 0),
(23694, 20, 110, 0, 0, 0, 0),
(23545, 20, 110, 0, 0, 0, 0);
