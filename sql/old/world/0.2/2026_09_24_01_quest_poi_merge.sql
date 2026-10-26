-- Quest map markers: 27,066 `quest_poi` rows from 7.3.5 (build 26124) were imported without their
-- points, which all date from 7.1. The core ties points to rows by (QuestID, Idx1) (QuestData.cpp), so
-- every new row reusing the Idx1 of an older one displayed another marker's points. Quest 870: the
-- objective got the turn-in point at the Crossroads, and the client shows the area nearest to the
-- player - right at the pools, wrong everywhere else.
--
-- Both versions are merged: the older row keeps its points and takes the objective index of the 7.3.5
-- row for the same objective (old rows use 0 even for the second objective), then the conflicting new
-- row is removed. About 6,000 quests. Re-runnable: once no conflict remains, nothing changes.

DROP TEMPORARY TABLE IF EXISTS `poi_conflit`;
CREATE TEMPORARY TABLE `poi_conflit` AS
SELECT DISTINCT n.`QuestID`, n.`BlobIndex`, n.`Idx1`, n.`QuestObjectiveID`, n.`ObjectiveIndex`
FROM `quest_poi` n
JOIN `quest_poi` o ON o.`QuestID` = n.`QuestID` AND o.`Idx1` = n.`Idx1` AND o.`VerifiedBuild` < n.`VerifiedBuild`;

DROP TEMPORARY TABLE IF EXISTS `poi_index`;
CREATE TEMPORARY TABLE `poi_index` AS
SELECT `QuestID`, `QuestObjectiveID`, MIN(`ObjectiveIndex`) AS `Idx`
FROM `poi_conflit`
WHERE `QuestObjectiveID` <> 0 AND `ObjectiveIndex` >= 0
GROUP BY `QuestID`, `QuestObjectiveID`
HAVING COUNT(DISTINCT `ObjectiveIndex`) = 1;

UPDATE `quest_poi` p
JOIN `poi_index` i ON i.`QuestID` = p.`QuestID` AND i.`QuestObjectiveID` = p.`QuestObjectiveID`
LEFT JOIN `poi_conflit` c ON c.`QuestID` = p.`QuestID` AND c.`BlobIndex` = p.`BlobIndex` AND c.`Idx1` = p.`Idx1`
SET p.`ObjectiveIndex` = i.`Idx`
WHERE c.`QuestID` IS NULL AND p.`ObjectiveIndex` >= 0;

DELETE p FROM `quest_poi` p
JOIN `poi_conflit` c ON c.`QuestID` = p.`QuestID` AND c.`BlobIndex` = p.`BlobIndex` AND c.`Idx1` = p.`Idx1`;

DROP TEMPORARY TABLE `poi_index`;
DROP TEMPORARY TABLE `poi_conflit`;
