-- Amber Michele and Orim Steeltoe chat; now and then one does the chicken and the other bursts out laughing (style 2).
DELETE FROM `creature_idle_chat` WHERE `guid` IN (257246, 257257);
INSERT INTO `creature_idle_chat` (`guid`, `group_id`, `laugh_min`, `laugh_max`, `style`) VALUES
(257246, 257246, 0, 0, 2),
(257257, 257246, 0, 0, 2);
