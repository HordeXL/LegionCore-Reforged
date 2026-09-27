-- Contribution quests of the Legionfall buildings: repeatable, as on retail - a character contributes as long as it
-- has War Supplies
UPDATE `quest_template_addon` SET `SpecialFlags` = `SpecialFlags` | 1 WHERE `ID` IN (46277, 46735, 46736);
