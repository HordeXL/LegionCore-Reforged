-- The gameobjects of Silithus get a timeline, as the creatures already have.
--
-- 2026_09_08_02 phased the creatures and left the gameobjects alone, so 461 of them stood in both
-- eras at once: the vanilla herbs, geysers and camps floating over the crater, and the Wound's own
-- props still standing in the zone as it was before. The four war banners are the ones that show
-- worst - 267178, 267179, 268413 and 268414 carry MaxVisible, so they were readable a kilometre
-- away in the old timeline where nothing of the sort exists.
--
-- The split is the entry number, which is a date in disguise: everything Legion added to this zone
-- was numbered from 260000 up, and everything below is what was already there. That gives 31
-- objects to the Wound and 430 to the zone as it was. Objects that already carry a phase - 129 on
-- 10277, eight on the questline sub-phases - are left exactly as they are.
--
-- The previous rows are kept before anything is written. The backup made for the creatures turned
-- out empty because its script dropped and recreated the table on every run; this one is created
-- only if absent and filled once, so re-running cannot erase it.

CREATE TABLE IF NOT EXISTS `gameobject_phase_backup_silithus` (
  `guid` INT UNSIGNED NOT NULL PRIMARY KEY,
  `id` INT UNSIGNED NOT NULL,
  `PhaseId` VARCHAR(255) NOT NULL
);

INSERT IGNORE INTO `gameobject_phase_backup_silithus` (`guid`, `id`, `PhaseId`)
SELECT `guid`, `id`, COALESCE(`PhaseId`, '')
FROM `gameobject`
WHERE `map` = 1 AND `zoneId` = 1377 AND (`PhaseId` = '' OR `PhaseId` IS NULL);

-- Ce que Legion a pose : la Plaie.
UPDATE `gameobject` SET `PhaseId` = '10277'
WHERE `map` = 1 AND `zoneId` = 1377 AND (`PhaseId` = '' OR `PhaseId` IS NULL) AND `id` >= 260000;

-- Ce qui etait la avant : la zone d'avant.
UPDATE `gameobject` SET `PhaseId` = '9491'
WHERE `map` = 1 AND `zoneId` = 1377 AND (`PhaseId` = '' OR `PhaseId` IS NULL);

-- Pour revenir en arriere :
--   UPDATE gameobject g JOIN gameobject_phase_backup_silithus b ON b.guid = g.guid
--   SET g.PhaseId = b.PhaseId;
