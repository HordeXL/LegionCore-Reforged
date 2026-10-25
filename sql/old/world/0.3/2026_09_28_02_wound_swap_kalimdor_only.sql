-- The Wound's terrain swap stays on Kalimdor.
--
-- Entry 4600 (2026_09_08_11) hands the Silithus swap, map 1817, to every zone found among the
-- spawns of map 1, on the grounds that a swap only replaces tiles the swapped map has, so a stray
-- zone would cost nothing. It does cost something: the client replaces tiles by their grid
-- numbers, whatever the continent, and the 25 tiles of 1817 have numbers that exist elsewhere.
-- Standing in Westfall, Stranglethorn or Redridge drew the Silithus of the Wound, sword included,
-- over the sea off the Eastern Kingdoms; the other continents in the list got it too.
--
-- 27 of the 56 zones are not on Kalimdor (AreaTable.ContinentID, 7.3.5.26972): the Eastern
-- Kingdoms, Vashj'ir, Outland, Deepholm, the Wandering Isle, Stormheim, Mardum and a few
-- dungeons. Their rows go; the 29 Kalimdor zones keep the swap.
DELETE FROM `phase_definitions` WHERE `entry` = 4600 AND `zoneId` IN
(4, 8, 33, 40, 44, 85, 719, 1497, 2159, 3483, 3518, 3519, 3520, 3521, 3522, 3523, 3717, 5042, 5144, 5145,
 5146, 5287, 5339, 5736, 5788, 7541, 7705);
