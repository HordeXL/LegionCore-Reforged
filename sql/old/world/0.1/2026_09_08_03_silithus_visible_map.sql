-- The Wound was preloaded but never shown.
--
-- SMSG_SET_PHASE_SHIFT carries two lists. VisibleMapIDs is what the client draws; PreloadMapIDs
-- only warms the terrain up. The five Silithus rows filled PreloadMapID and left VisibleMapID at
-- zero, so the swapped ground was loaded and then never displayed - which is exactly the symptom:
-- the sword and the Legion creatures appear, because those are phased objects, while the ground
-- underneath stays the one from 2006.
--
-- The three Dark Portal rows, the only terrain swaps on this realm known to work, fill both.
UPDATE `phase_definitions` SET `VisibleMapID` = 1817
WHERE `zoneId` = 1377 AND `PreloadMapID` = 1817;
