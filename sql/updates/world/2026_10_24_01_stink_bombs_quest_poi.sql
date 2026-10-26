-- Hallow's End, "Stink Bombs Away!" (Alliance): the objective area on the map is the Undercity, not the witches' camp
UPDATE `quest_poi` SET `ObjectiveIndex` = 0, `QuestObjectiveID` = 252432, `QuestObjectID` = 51833, `WorldMapAreaId` = 382 WHERE `QuestID` = 29054 AND `BlobIndex` = 1 AND `Idx1` = 1;
DELETE FROM `quest_poi` WHERE `QuestID` = 29054 AND `Idx1` = 2;
DELETE FROM `quest_poi_points` WHERE `QuestID` = 29054 AND `Idx1` = 2;
