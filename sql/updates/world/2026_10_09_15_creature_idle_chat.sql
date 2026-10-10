-- Creatures that chat together (talk emotes in turns): three groups in Stormshield.
CREATE TABLE IF NOT EXISTS `creature_idle_chat` (
  `guid` BIGINT UNSIGNED NOT NULL,
  `group_id` INT UNSIGNED NOT NULL,
  `laugh_min` SMALLINT UNSIGNED NOT NULL DEFAULT 0,
  `laugh_max` SMALLINT UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`guid`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DELETE FROM `creature_idle_chat` WHERE `guid` IN (257295, 257301, 257316, 257324, 257319, 257424);
INSERT INTO `creature_idle_chat` (`guid`, `group_id`, `laugh_min`, `laugh_max`) VALUES
(257295, 257295, 0, 0),
(257301, 257295, 0, 0),
(257316, 257316, 0, 0),
(257324, 257316, 0, 0),
(257319, 257319, 30, 40),
(257424, 257319, 30, 40);
