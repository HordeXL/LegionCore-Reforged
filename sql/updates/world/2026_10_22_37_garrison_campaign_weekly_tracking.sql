-- Garrison campaign: hidden weekly quest marking that a chapter was completed this week
DELETE FROM `quest_template` WHERE `ID` = 50250;
DROP TEMPORARY TABLE IF EXISTS `tmp_weekly_tracking`;
CREATE TEMPORARY TABLE `tmp_weekly_tracking` SELECT * FROM `quest_template` WHERE `ID` = 9611;
UPDATE `tmp_weekly_tracking` SET `ID` = 50250, `LogTitle` = 'Weekly Tracking: Garrison Campaign Chapter';
INSERT INTO `quest_template` SELECT * FROM `tmp_weekly_tracking`;
DROP TEMPORARY TABLE `tmp_weekly_tracking`;
