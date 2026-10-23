-- Garrison architect quests: the tier 3 upgrade follows the tier 2 upgrade, Gems of the Apexis follows the garrison establishment
UPDATE `quest_template_addon` SET `PrevQuestID` = 36592 WHERE `ID` = 36615;
UPDATE `quest_template_addon` SET `PrevQuestID` = 36567 WHERE `ID` = 36614;
UPDATE `quest_template_addon` SET `PrevQuestID` = 34586 WHERE `ID` = 39195;
