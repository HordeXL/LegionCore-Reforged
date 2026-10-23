-- Garrison bulletin boards: Horde command boards list the zone quests of the official tiers, board quests give way to the chain quests they replace, Alliance News from Nagrand leads to Bodrick Grey's Nagrand quest

-- Horde command boards as on the official ones: Talador and Gorgrond on tier 1, everything on tier 2, Nagrand and Gorgrond on tier 3 (The Arakkoa Exodus only on tier 2)
DELETE FROM `gameobject_queststarter` WHERE (`id` = 233291 AND `quest` IN (36951, 36952)) OR (`id` = 237022 AND `quest` IN (36951, 36953));

-- the board quest and the quest handed out by the chain are the same step: one of them only, never both
UPDATE `quest_template_addon` SET `ExclusiveGroup` = 35556 WHERE `ID` IN (35556, 33533, 36632);
UPDATE `quest_template_addon` SET `ExclusiveGroup` = 34676 WHERE `ID` IN (34676, 37183);
UPDATE `quest_template_addon` SET `ExclusiveGroup` = 34674 WHERE `ID` IN (34674, 37184);
UPDATE `quest_template_addon` SET `ExclusiveGroup` = 35557 WHERE `ID` IN (35557, 34867);
UPDATE `quest_template_addon` SET `ExclusiveGroup` = 36953 WHERE `ID` IN (36953, 34681);
UPDATE `quest_template_addon` SET `ExclusiveGroup` = 36952 WHERE `ID` IN (36952, 34794);
UPDATE `quest_template_addon` SET `ExclusiveGroup` = 36951 WHERE `ID` IN (36951, 34653);

-- Alliance News from Nagrand is followed by Bodrick Grey's quest (37184) like the Horde one by Rokhan's, not by the bulletin board note (34674), which stays free of any prerequisite
UPDATE `quest_template_addon` SET `NextQuestID` = 37184 WHERE `ID` = 36601;
UPDATE `quest_template_addon` SET `PrevQuestID` = 36601 WHERE `ID` = 37184;

-- the board quests are for those who skipped the chain: they are not offered once the "News from" quest is done, which makes the chain quest available
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 19 AND `ConditionTypeOrReference` = 8 AND `NegativeCondition` = 1
    AND `SourceEntry` IN (35556, 34676, 34674, 36951, 35557, 36953, 36952);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(19, 0, 35556, 0, 0, 8, 0, 33256, 0, 0, 1, 0, '', 'The Secrets of Gorgrond (board): not once The Defense of Karabor is done, Yrel offers the chain quest'),
(19, 0, 34676, 0, 0, 8, 0, 36495, 0, 0, 1, 0, '', 'The Critical Path (board): not once News from Talador is done, Bodrick Grey offers the chain quest'),
(19, 0, 34674, 0, 0, 8, 0, 36601, 0, 0, 1, 0, '', 'Taking the Fight to Nagrand (board): not once News from Nagrand is done, Bodrick Grey offers the chain quest'),
(19, 0, 35557, 0, 0, 8, 0, 34124, 0, 0, 1, 0, '', 'The Secrets of Gorgrond (Horde board): not once The Battle of Thunder Pass is done, Durotan offers the chain quest'),
(19, 0, 36953, 0, 0, 8, 0, 36494, 0, 0, 1, 0, '', 'It''s a Matter of Strategy (Horde board): not once News from Talador is done, Grobash offers the chain quest'),
(19, 0, 36952, 0, 0, 8, 0, 36602, 0, 0, 1, 0, '', 'Taking the Fight to Nagrand (Horde board): not once News from Nagrand is done, Rokhan offers the chain quest'),
(19, 0, 36951, 0, 0, 8, 0, 35537, 0, 0, 1, 0, '', 'Arakkoa Exodus (board): not once the Horde News from Spires of Arak is done'),
(19, 0, 36951, 0, 0, 8, 0, 35554, 0, 0, 1, 0, '', 'Arakkoa Exodus (board): not once the Alliance News from Spires of Arak is done');
