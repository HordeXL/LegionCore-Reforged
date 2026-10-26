-- New Goods: the map area of Sergeant Crowler on each Lunarfall level, not only on level 3
DELETE FROM `quest_poi` WHERE `QuestID` = 38408 AND `Idx1` IN (41, 42, 43);
INSERT INTO `quest_poi` (`QuestID`, `BlobIndex`, `Idx1`, `ObjectiveIndex`, `QuestObjectiveID`, `QuestObjectID`, `MapID`, `WorldMapAreaId`, `Floor`, `Priority`, `Flags`, `WorldEffectID`, `PlayerConditionID`, `WoDUnk1`, `AlwaysAllowMergingBlobs`, `VerifiedBuild`) VALUES
(38408, 0, 41, 0, 277821, 78564, 1116, 973, 0, 0, 0, 0, 0, 0, 0, 0),
(38408, 0, 42, 0, 277821, 78564, 1116, 974, 0, 0, 0, 0, 0, 0, 0, 0),
(38408, 0, 43, 0, 277821, 78564, 1116, 975, 0, 0, 0, 0, 0, 0, 0, 0);
DELETE FROM `quest_poi_points` WHERE `QuestID` = 38408 AND `Idx1` IN (41, 42, 43);
INSERT INTO `quest_poi_points` (`QuestID`, `Idx1`, `Idx2`, `X`, `Y`, `VerifiedBuild`) VALUES
(38408, 41, 0, 1886, 256, 0),
(38408, 42, 0, 1928, 288, 0),
(38408, 43, 0, 1948, 283, 0);
