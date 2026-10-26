-- Spires of Arak: the Assault on Skettis bonus objective gets its area drawn on the world map
DELETE FROM `quest_poi` WHERE `QuestID` IN (36069, 36070);
INSERT INTO `quest_poi` (`QuestID`, `BlobIndex`, `Idx1`, `ObjectiveIndex`, `QuestObjectiveID`, `QuestObjectID`, `MapID`, `WorldMapAreaId`, `Floor`, `Priority`, `Flags`, `WorldEffectID`, `PlayerConditionID`, `WoDUnk1`, `AlwaysAllowMergingBlobs`, `VerifiedBuild`) VALUES
(36069, 0, 0, 0, 274299, 0, 1116, 948, 0, 0, 0, 0, 0, 0, 0, 0),
(36070, 0, 0, 0, 274300, 0, 1116, 948, 0, 0, 0, 0, 0, 0, 0, 0);
DELETE FROM `quest_poi_points` WHERE `QuestID` IN (36069, 36070);
INSERT INTO `quest_poi_points` (`QuestID`, `Idx1`, `Idx2`, `X`, `Y`, `VerifiedBuild`) VALUES
(36069, 0, 0, 795, 1293, 0),
(36069, 0, 1, 869, 1077, 0),
(36069, 0, 2, 918, 1049, 0),
(36069, 0, 3, 1062, 1053, 0),
(36069, 0, 4, 1103, 1540, 0),
(36069, 0, 5, 1021, 1861, 0),
(36069, 0, 6, 977, 1835, 0),
(36069, 0, 7, 837, 1628, 0),
(36069, 0, 8, 808, 1542, 0),
(36070, 0, 0, 795, 1293, 0),
(36070, 0, 1, 869, 1077, 0),
(36070, 0, 2, 918, 1049, 0),
(36070, 0, 3, 1062, 1053, 0),
(36070, 0, 4, 1103, 1540, 0),
(36070, 0, 5, 1021, 1861, 0),
(36070, 0, 6, 977, 1835, 0),
(36070, 0, 7, 837, 1628, 0),
(36070, 0, 8, 808, 1542, 0);
