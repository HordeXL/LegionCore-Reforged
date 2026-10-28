-- Sunstrider Isle creatures scale with the player from level 1 to 10, like every starting zone since 7.3.5
INSERT INTO `creature_template_scaling` (`Entry`, `LevelScalingMin`, `LevelScalingMax`, `LevelScalingDeltaMin`, `LevelScalingDeltaMax`, `LevelScalingDuration`) VALUES
(15274, 1, 10, 0, 0, 0),
(15294, 1, 10, 0, 0, 0),
(15271, 1, 10, 0, 0, 0),
(15366, 1, 10, 0, 0, 0),
(15372, 1, 10, 0, 0, 0),
(15273, 1, 10, 0, 0, 0),
(15298, 1, 10, 0, 0, 0),
(15367, 1, 10, 0, 0, 0)
ON DUPLICATE KEY UPDATE `LevelScalingMin` = VALUES(`LevelScalingMin`), `LevelScalingMax` = VALUES(`LevelScalingMax`), `LevelScalingDeltaMin` = VALUES(`LevelScalingDeltaMin`), `LevelScalingDeltaMax` = VALUES(`LevelScalingDeltaMax`);
