-- Garrison quests: Lunarfall tier 3 bounty board quests, New Goods talk objective, Migrant Workers and Ashran Appearance after Delegating on Draenor
DELETE FROM `gameobject_queststarter` WHERE `id` = 232398 AND `quest` IN (33111, 34674, 35459, 35556);
INSERT INTO `gameobject_queststarter` (`id`, `quest`) VALUES
(232398, 33111),
(232398, 34674),
(232398, 35459),
(232398, 35556);

-- "Find Sergeant Grimjaw" is said by talking to him, as in the Alliance quest
UPDATE `quest_objectives` SET `Type` = 3 WHERE `ID` = 277856 AND `QuestID` = 38427;

UPDATE `quest_template_addon` SET `PrevQuestID` = 34692 WHERE `ID` IN (34778, 36624);
