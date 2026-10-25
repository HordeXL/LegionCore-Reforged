-- Migrant Workers: the objective shows its area where Foreman Zipfizzle waits with the workers
DELETE FROM `quest_poi` WHERE `QuestID` = 34778 AND `Idx1` = 7;
INSERT INTO `quest_poi` (`QuestID`, `BlobIndex`, `Idx1`, `ObjectiveIndex`, `QuestObjectiveID`, `QuestObjectID`, `MapID`, `WorldMapAreaId`, `Floor`, `Priority`, `Flags`, `WorldEffectID`, `PlayerConditionID`, `WoDUnk1`, `AlwaysAllowMergingBlobs`, `VerifiedBuild`) VALUES
(34778, 0, 7, 0, 273592, 81660, 1116, 947, 0, 0, 0, 0, 0, 0, 0, 0);
DELETE FROM `quest_poi_points` WHERE `QuestID` = 34778 AND `Idx1` = 7;
INSERT INTO `quest_poi_points` (`QuestID`, `Idx1`, `Idx2`, `X`, `Y`, `VerifiedBuild`) VALUES
(34778, 7, 0, 1204, -1483, 0);
