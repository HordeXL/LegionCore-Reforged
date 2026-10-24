-- The hotfix base dump shipped creature display/model rows recorded from a client newer than 7.3.5:
-- their FileDataIDs (1.6m-8m) point at files the 7.3.5 client does not have (its ceiling is ~1.86m),
-- and hotfix_data pushed them onto clients, overwriting the correct local rows of
-- 2115 creature templates (starter boars, hunter/warlock pets, ...) which then rendered as cubes.
-- Drop everything those two tables carried, then restore the ten legitimate custom display rows
-- (custom mounts 83281-83292 reference vanilla models and stay).
-- GameObjectDisplayInfo carried the same kind of newer-client rows; all but two of its rows are dropped as well.
-- Hotfix table hashes: 0xBFDAF9F1 CreatureDisplayInfo, 0x7F695FA5 CreatureModelData, 0x6D100DCB GameObjectDisplayInfo.

DELETE FROM `hotfix_data` WHERE `TableHash` = 3218799089 AND `RecordID` NOT BETWEEN 83281 AND 83292;
DELETE FROM `hotfix_data` WHERE `TableHash` = 2137612197;
DELETE FROM `hotfix_data` WHERE `TableHash` = 1830824795 AND `RecordID` NOT IN (47596, 47597);

DELETE FROM `creature_display_info` WHERE VerifiedBuild = 26972;
DELETE FROM `creature_model_data` WHERE VerifiedBuild = 26972;
DELETE FROM `gameobject_display_info` WHERE `FileDataID` > 1861620;

-- The ten custom display rows the custom mounts ride on (vanilla models, valid texture FileDataIDs)
REPLACE INTO `creature_display_info` (`ID`, `CreatureModelScale`, `ModelID`, `NPCSoundID`, `SizeClass`, `Flags`, `Gender`, `ExtendedDisplayInfoID`, `PortraitTextureFileDataID`, `CreatureModelAlpha`, `SoundID`, `PlayerOverrideScale`, `PortraitCreatureDisplayInfoID`, `BloodID`, `ParticleColorID`, `DissolveEffectID`, `ObjectEffectPackageID`, `AnimReplacementSetID`, `UnarmedWeaponType`, `StateSpellVisualKitID`, `PetInstanceScale`, `MountPoofSpellVisualKitID`, `TextureVariationFileDataID1`, `TextureVariationFileDataID2`, `TextureVariationFileDataID3`, `VerifiedBuild`) VALUES
(83281,1,3797,0,1,0,2,0,0,255,0,0,0,0,0,0,0,0,-1,88879,1,0,0,0,0,0),
(83283,1,4039,0,255,0,2,0,0,255,4612,0,0,0,0,0,0,0,-1,83366,1,0,526602,526600,526602,0),
(83284,1,4039,0,255,0,2,0,0,255,4612,0,0,0,0,0,0,0,-1,83366,1,0,526602,526600,526602,0),
(83285,1,3797,0,1,0,2,0,0,255,0,0,0,0,0,0,0,0,-1,78133,1,0,0,0,0,0),
(83286,1.5,3011,0,1,0,2,0,0,255,4196,0,0,0,0,0,0,0,-1,0,1,0,0,0,0,0),
(83287,1,3797,0,1,0,2,0,0,255,0,0,0,0,0,0,0,0,-1,78123,1,0,0,0,0,0),
(83288,1.4,4835,0,1,0,2,0,0,255,4196,0,0,0,0,0,0,0,-1,0,1,0,0,0,0,0),
(83289,1,8939,0,0,0,2,0,0,255,0,0,0,0,0,0,0,0,-1,0,1,0,1601792,0,0,0),
(83291,0.75,8805,0,1,0,2,0,0,255,0,0,0,0,0,0,0,0,-1,0,1,0,1321549,1321552,1321548,0),
(83292,0.9,3957,0,1,0,1,0,0,255,3958,0,0,0,334,0,0,0,-1,0,1,0,520914,520914,520914,0);

REPLACE INTO `hotfix_data` (`Id`, `TableHash`, `RecordID`, `Timestamp`, `Deleted`) VALUES
(83281, 3218799089, 83281, 0, 0),
(83283, 3218799089, 83283, 0, 0),
(83284, 3218799089, 83284, 0, 0),
(83285, 3218799089, 83285, 0, 0),
(83286, 3218799089, 83286, 0, 0),
(83287, 3218799089, 83287, 0, 0),
(83288, 3218799089, 83288, 0, 0),
(83289, 3218799089, 83289, 0, 0),
(83291, 3218799089, 83291, 0, 0),
(83292, 3218799089, 83292, 0, 0);
