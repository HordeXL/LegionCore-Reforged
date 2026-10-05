-- Uldum quest chains checked against Wowhead (Cataclysm Classic) and TDB 7.3.5 / 12.1.
-- Angered Spirits (27943) follows The Desert Fox (27939); it only required 27928 and could be taken too early.
UPDATE `quest_template_addon` SET `PrevQuestID` = 27939 WHERE `ID` = 27943;
-- The Pit of Scales (27738) is given by Vizier Tanotep (46136) only; three Sun Acolytes (47709) offered it too.
DELETE FROM `creature_queststarter` WHERE `id` = 47709 AND `quest` = 27738;
-- Easy Money (27003) required Meetup with the Caravan 28295, the Alliance breadcrumb: no Horde player could take it.
-- Both breadcrumbs (28295 / 28296) already lead to it; as in TDB 7.3.5 / 12.1 it needs neither.
UPDATE `quest_template_addon` SET `PrevQuestID` = 0 WHERE `ID` = 27003;
-- This core turns NextQuestID into a requirement (QuestData: the next quest gets this one in its prevQuests), so the
-- four optional breadcrumbs pointing at Easy Money (Meetup with the Caravan, Hero's Call / Warchief's Command boards)
-- still made one of them mandatory: Adarrah offered nothing to a player who walked in. Breadcrumbs only.
UPDATE `quest_template_addon` SET `NextQuestID` = 0 WHERE `ID` IN (28295, 28296, 28557, 28558) AND `NextQuestID` = 27003;   -- caravan meetups + city boards
