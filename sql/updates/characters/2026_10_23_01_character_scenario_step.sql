-- Step a character reached in a scripted scenario, so that a new instance resumes there after a server restart
CREATE TABLE IF NOT EXISTS `character_scenario_step` (
  `guid` BIGINT UNSIGNED NOT NULL,
  `scenario` INT UNSIGNED NOT NULL,
  `step` TINYINT UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`guid`, `scenario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
