-- The holiday commoners (19169, 19175-19178, 20102) spawn only during holidays, but three holiday quests
-- were linked to them permanently, so each of them was offered during every holiday: e.g. the Pilgrim's
-- Bounty quest during Brewfest. They are now linked to their own event instead:
--   11357 Masked Orphan Matron          -> 12 Hallow's End     (quest sort -21, like the other Hallow's End quests)
--   11971 The Spinner of Summer Tales   -> 1  Midsummer        (quest sort -369)
--   14036 Pilgrim's Bounty              -> 26 Pilgrim's Bounty (quest sort -375, confirmed by TDB 12.1)
-- Re-runnable.
INSERT IGNORE INTO `game_event_creature_quest` (`eventEntry`, `id`, `quest`)
SELECT CASE s.`quest` WHEN 11357 THEN 12 WHEN 11971 THEN 1 WHEN 14036 THEN 26 END, s.`id`, s.`quest`
FROM `creature_queststarter` s
WHERE s.`id` IN (19169, 19175, 19176, 19177, 19178, 20102) AND s.`quest` IN (11357, 11971, 14036);

DELETE FROM `creature_queststarter`
WHERE `id` IN (19169, 19175, 19176, 19177, 19178, 20102) AND `quest` IN (11357, 11971, 14036);
