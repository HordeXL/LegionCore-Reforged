-- Verrou hebdomadaire du livre de connaissance des armes prodigieuses.
-- Un joueur ne peut recuperer qu'un seul livre par semaine, toutes sources confondues
-- (raid, coffre de Mythique+, coffre de victoire JcJ). La table est videe a chaque
-- reset hebdomadaire par World::ResetWeekly().

CREATE TABLE IF NOT EXISTS `character_ak_book_weekly` (
  `guid` BIGINT UNSIGNED NOT NULL COMMENT 'GUID du personnage ayant deja loote son livre cette semaine',
  PRIMARY KEY (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Verrou hebdomadaire du livre de connaissance (custom)';
