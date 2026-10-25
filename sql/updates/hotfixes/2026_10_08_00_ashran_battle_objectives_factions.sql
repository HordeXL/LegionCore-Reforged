-- Ashran: the bonus objectives against the other faction's leaders are shown to their own faction only.
DELETE FROM `quest_v2_cli_task` WHERE `ID` IN (37295, 37297);
INSERT INTO `quest_v2_cli_task` (`ID`, `FiltRaces`, `QuestTitle`, `BulletText`, `StartItem`, `UniqueBitFlag`, `ConditionID`, `FiltClasses`, `FiltCompletedQuest1`, `FiltCompletedQuest2`, `FiltCompletedQuest3`, `FiltMinSkillID`, `WorldStateExpressionID`, `FiltActiveQuest`, `FiltCompletedQuestLogic`, `FiltMaxFactionID`, `FiltMaxFactionValue`, `FiltMaxLevel`, `FiltMinFactionID`, `FiltMinFactionValue`, `FiltMinLevel`, `FiltMinSkillValue`, `FiltNonActiveQuest`, `BreadCrumbID`, `QuestInfoID`, `SandboxScalingID`, `VerifiedBuild`) VALUES
(37295, 234881970, 'Kill Rylai Crestfall', '', 0, 21151, 36471, 65535, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 100, 0, 0, 0, 113, 0, 26972),
(37297, 18875469, 'Kill Jeron Emberfall', '', 0, 21150, 36470, 65535, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 100, 0, 0, 0, 113, 0, 26972);
DELETE FROM `hotfix_data` WHERE `Id` IN (9009180, 9009181);
INSERT INTO `hotfix_data` (`Id`, `TableHash`, `RecordID`, `Timestamp`, `Deleted`) VALUES
(9009180, 261693969, 37295, 0, 0),
(9009181, 261693969, 37297, 0, 0);
