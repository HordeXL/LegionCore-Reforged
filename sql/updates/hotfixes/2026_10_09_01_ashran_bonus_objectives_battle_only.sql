-- Ashran bonus objectives: shown on the map only during a battleground game; the PvE ones, whose creatures are gone, never.
DELETE FROM `world_state_expression` WHERE `ID` IN (24580, 24581);
INSERT INTO `world_state_expression` (`ID`, `Expression`, `VerifiedBuild`) VALUES
(24580, '0102F74A0000000101010000000000', 0),
(24581, '0102F74A0000000101020000000000', 0);
UPDATE `quest_v2_cli_task` SET `WorldStateExpressionID` = 24580 WHERE `ID` IN (37295, 37297);
DELETE FROM `quest_v2_cli_task` WHERE `ID` IN (37475, 37476, 37477, 37478);
INSERT INTO `quest_v2_cli_task` (`FiltRaces`, `QuestTitle`, `BulletText`, `StartItem`, `UniqueBitFlag`, `ConditionID`, `FiltClasses`, `FiltCompletedQuest1`, `FiltCompletedQuest2`, `FiltCompletedQuest3`, `FiltMinSkillID`, `WorldStateExpressionID`, `FiltActiveQuest`, `FiltCompletedQuestLogic`, `FiltMaxFactionID`, `FiltMaxFactionValue`, `FiltMaxLevel`, `FiltMinFactionID`, `FiltMinFactionValue`, `FiltMinLevel`, `FiltMinSkillValue`, `FiltNonActiveQuest`, `ID`, `BreadCrumbID`, `QuestInfoID`, `SandboxScalingID`, `VerifiedBuild`) VALUES
(-1, 'The Molten Quarry', '', 0, 18374, 0, 65535, 0, 0, 0, 0, 24581, 0, 0, 0, 0, -1, 0, 0, 100, 0, 0, 37475, 0, 113, 0, 26972),
(-1, 'Ashmaul Burial Grounds', '', 0, 18376, 0, 65535, 0, 0, 0, 0, 24581, 0, 0, 0, 0, -1, 0, 0, 100, 0, 0, 37476, 0, 113, 0, 26972),
(-1, 'Brute''s Rise', '', 0, 18647, 0, 65535, 0, 0, 0, 0, 24581, 0, 0, 0, 0, -1, 0, 0, 100, 0, 0, 37477, 0, 113, 0, 26972),
(-1, 'Amphitheater of Annihilation', '', 0, 18377, 0, 65535, 0, 0, 0, 0, 24581, 0, 0, 0, 0, -1, 0, 0, 100, 0, 0, 37478, 0, 113, 0, 26972);
DELETE FROM `hotfix_data` WHERE `Id` BETWEEN 9009184 AND 9009189;
INSERT INTO `hotfix_data` (`Id`, `TableHash`, `RecordID`, `Timestamp`, `Deleted`) VALUES
(9009184, 492039028, 24580, 0, 0),
(9009185, 492039028, 24581, 0, 0),
(9009186, 261693969, 37475, 0, 0),
(9009187, 261693969, 37476, 0, 0),
(9009188, 261693969, 37477, 0, 0),
(9009189, 261693969, 37478, 0, 0);
