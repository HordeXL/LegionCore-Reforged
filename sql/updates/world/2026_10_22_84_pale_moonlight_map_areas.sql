-- Pale Moonlight: the pale devourers' area is only at Brunant's landing, the turn-in points follow as on retail
DELETE FROM `quest_poi` WHERE `QuestID` = 35174 AND `Idx1` = 3 AND `ObjectiveIndex` = 0;
UPDATE `quest_poi` SET `Idx1` = `Idx1` - 1 WHERE `QuestID` = 35174 AND `Idx1` BETWEEN 4 AND 9 ORDER BY `Idx1` ASC;
