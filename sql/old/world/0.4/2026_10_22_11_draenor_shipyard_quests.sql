-- Draenor shipyard: the garrison leaders and the foremen offer the naval quests, the broken chain links are fixed and the tutorial naval missions come with their quests
DELETE FROM `creature_queststarter` WHERE `quest` IN (39082, 39236, 39056, 39243, 39067, 39245);
INSERT INTO `creature_queststarter` (`id`, `quest`) VALUES
(92219, 39082),
(92400, 39236),
(93822, 39056),
(94789, 39243),
(93822, 39067),
(94789, 39245);

-- Get to Work follows the shipyard purchase, the foremen quests follow the first ship and the first naval mission
UPDATE `quest_template_addon` SET `PrevQuestID` = 38259 WHERE `ID` = 39082;
UPDATE `quest_template_addon` SET `PrevQuestID` = 38574 WHERE `ID` = 39236;
UPDATE `quest_template_addon` SET `PrevQuestID` = 39055 WHERE `ID` = 39056;
UPDATE `quest_template_addon` SET `PrevQuestID` = 39242 WHERE `ID` = 39243;
UPDATE `quest_template_addon` SET `PrevQuestID` = 39056 WHERE `ID` = 39067;
UPDATE `quest_template_addon` SET `PrevQuestID` = 39243 WHERE `ID` = 39245;

-- Try Again led the alliance to the horde quest, and the horde Eliminate the Competition led nowhere
UPDATE `quest_template` SET `RewardNextQuest` = 39666 WHERE `ID` = 39655;
UPDATE `quest_template` SET `RewardNextQuest` = 39674 WHERE `ID` = 39401;

-- Tutorial naval missions offered while their quest is in the log
DELETE FROM `mission_quest_link` WHERE `QuestID` IN (39056, 39404, 39655, 39665, 39243, 39401, 39674, 39676);
INSERT INTO `mission_quest_link` (`QuestID`, `MissionStartID`) VALUES
(39056, 637),
(39404, 636),
(39655, 523),
(39665, 729),
(39243, 639),
(39401, 638),
(39674, 522),
(39676, 733);

-- Meeting the foreman is credited when the first fleet quest is accepted from him
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (93822, 94789);
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (93822, 94789);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(93822, 0, 0, 0, 19, 0, 100, 0, 39056, 0, 0, 0, 0, 33, 94473, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'Merreck Vonder - On quest accept - Give credit'),
(94789, 0, 0, 0, 19, 0, 100, 0, 39243, 0, 0, 0, 0, 33, 94926, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'Rolosh Wavechaser - On quest accept - Give credit');
