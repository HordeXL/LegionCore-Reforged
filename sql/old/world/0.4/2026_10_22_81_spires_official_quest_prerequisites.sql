-- Spires of Arak: official prerequisites for the Veil Zekk, Talonpriest, Terokk and outpost quests

-- Ishaal's Orb -> Behind the Veil -> Blades in the Dark and A Feast of Shadows -> Back from Beyond (New Neighbors stays optional)
UPDATE `quest_template_addon` SET `NextQuestID` = 34830 WHERE `ID` = 34828;
UPDATE `quest_template_addon` SET `NextQuestID` = 0 WHERE `ID` = 34829;
UPDATE `quest_template_addon` SET `PrevQuestID` = 34830 WHERE `ID` = 34882;

-- Trading post: I See Dead Arakkoa follows Back on Track, the Alliance Back on Track follows its own Sticky Situation
UPDATE `quest_template_addon` SET `PrevQuestID` = 35718 WHERE `ID` = 35766;
UPDATE `quest_template_addon` SET `PrevQuestID` = 35719 WHERE `ID` = 35782;
UPDATE `quest_template_addon` SET `PrevQuestID` = 35716 WHERE `ID` = 35719;

-- Orders, Commander? (Horde) follows Inspecting the Troops like the Alliance version
UPDATE `quest_template_addon` SET `PrevQuestID` = 35275 WHERE `ID` = 35277;

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 19 AND `SourceEntry` IN (34942, 35897);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(19, 0, 34942, 0, 0, 8, 0, 34882, 0, 0, 0, 0, '', 'Back from Beyond requires Blades in the Dark'),
(19, 0, 34942, 0, 0, 8, 0, 34883, 0, 0, 0, 0, '', 'Back from Beyond requires A Feast of Shadows'),
(19, 0, 35897, 0, 0, 8, 0, 35245, 0, 0, 0, 0, '', 'The Missing Piece requires A Sentimental Relic'),
(19, 0, 35897, 0, 0, 8, 0, 35734, 0, 0, 0, 0, '', 'The Missing Piece requires The Talon King');
