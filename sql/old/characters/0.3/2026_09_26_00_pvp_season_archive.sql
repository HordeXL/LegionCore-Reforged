-- PvP ratings saved per season: filled when the season changes or on .pvpseason reset
CREATE TABLE IF NOT EXISTS `character_brackets_info_season` (
  `season` tinyint unsigned NOT NULL,
  `guid` bigint unsigned NOT NULL,
  `bracket` smallint NOT NULL,
  `rating` mediumint NOT NULL DEFAULT '0',
  `best` mediumint NOT NULL DEFAULT '0',
  `bestWeek` smallint NOT NULL DEFAULT '0',
  `mmr` mediumint NOT NULL DEFAULT '0',
  `games` int NOT NULL DEFAULT '0',
  `wins` int NOT NULL DEFAULT '0',
  `weekGames` mediumint NOT NULL DEFAULT '0',
  `weekWins` mediumint NOT NULL DEFAULT '0',
  `bestWeekLast` mediumint NOT NULL DEFAULT '0',
  `archived` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`season`, `guid`, `bracket`),
  KEY `guid` (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='PvP ratings saved per season';
