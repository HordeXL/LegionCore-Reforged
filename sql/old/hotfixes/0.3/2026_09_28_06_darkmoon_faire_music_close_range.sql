-- Darkmoon Faire music at the portals of Goldshire and Mulgore: close by only, fading with distance,
-- and in place of the zone music rather than over it.
--
-- The music doodads (gameobject 180335) play SoundKit 8440, darkmoonfaire_2.mp3, whose distances
-- are 50 (full volume) and 150 (cut off). 8440 is also the zone music of Darkmoon Island
-- (ZoneMusic 244), so it is left alone: 98010 is a copy of it, full volume within 2 yards and
-- fading out to 18, which go_darkmoon_faire_music plays instead. One instance at a time.
--
-- A positional sound cannot quiet the zone music; the music channel can. 98011 plays a native
-- 9.8 s stinger (zfstinger15.mp3) at a thousandth of its volume: sent as music every few seconds to
-- the players within range, it holds the music channel, and the zone music comes back once they
-- walk away and the last one ends.
--
-- 98010-98011 and 252010-252011 are holes below the file caps (98324 and 252958): absent from the
-- 7.3.5 files, and no native SoundKitEntry points at either kit.
DELETE FROM `sound_kit` WHERE `ID` IN (98010, 98011);
INSERT INTO `sound_kit`
 (`ID`, `VolumeFloat`, `MinDistance`, `DistanceCutoff`, `Flags`, `SoundEntriesAdvancedID`,
  `SoundType`, `DialogType`, `EAXDef`, `VolumeVariationPlus`, `VolumeVariationMinus`,
  `PitchVariationPlus`, `PitchVariationMinus`, `PitchAdjust`, `BusOverwriteID`, `MaxInstances`,
  `VerifiedBuild`) VALUES
 (98010, 0.69,  2, 18, 32, 0, 28, 0, 0, 0, 0, 0, 0, 0, 0, 1, 26972),
 (98011, 0.001, 0,  0,  0, 0, 28, 0, 0, 0, 0, 0, 0, 0, 0, 1, 26972);

DELETE FROM `sound_kit_entry` WHERE `ID` IN (252010, 252011);
INSERT INTO `sound_kit_entry` (`ID`, `SoundKitID`, `FileDataID`, `Frequency`, `Volume`, `VerifiedBuild`) VALUES
 (252010, 98010,  53257, 1, 1, 26972),
 (252011, 98011, 371382, 1, 1, 26972);

DELETE FROM `hotfix_data` WHERE `Id` BETWEEN 9000830 AND 9000833;
INSERT INTO `hotfix_data` (`Id`, `TableHash`, `RecordID`, `Timestamp`, `Deleted`) VALUES
 (9000830,  908293937,  98010, 0, 0),   -- SoundKit
 (9000831, 3266400455, 252010, 0, 0),   -- SoundKitEntry
 (9000832,  908293937,  98011, 0, 0),   -- SoundKit
 (9000833, 3266400455, 252011, 0, 0);   -- SoundKitEntry

UPDATE `world_legion`.`version` SET `hotfix_cache_id` = 318;
