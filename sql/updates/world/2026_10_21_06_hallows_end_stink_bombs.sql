-- Hallow's End "Stink Bombs Away!": Gertrude Fenlow and the Hag's Broom run their scripts, the broom offers its return button, the option needs the quest, and both quests can be turned in
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (52548, 51710);
UPDATE `creature_template` SET `spell1` = 96026, `spell2` = 96017 WHERE `entry` = 51710;

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 15 AND `SourceGroup` = 52548 AND `SourceEntry` = 0;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(15, 52548, 0, 0, 0, 9, 0, 29054, 0, 0, 0, 0, '', 'Gertrude Fenlow - show the bombing flight while Stink Bombs Away! is taken');

DELETE FROM `creature_questender` WHERE `quest` IN (29054, 29374);
INSERT INTO `creature_questender` (`id`, `quest`) VALUES
(51934, 29054),
(53763, 29374);
