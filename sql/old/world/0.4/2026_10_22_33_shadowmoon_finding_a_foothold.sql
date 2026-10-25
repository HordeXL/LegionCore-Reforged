-- Shadowmoon Valley, Finding a Foothold: the escort completes when Velen reaches Lunarfall instead of halfway, and the French completion text
UPDATE `smart_scripts` SET `event_param1` = 6 WHERE `entryorguid` = 79635 AND `source_type` = 0 AND `id` = 2 AND `event_type` = 40;
DELETE FROM `smart_scripts` WHERE `entryorguid` = 79635 AND `source_type` = 0 AND `id` = 3;
INSERT INTO `smart_scripts` VALUES
(79635,0,3,0,'',40,0,100,0,6,79635,0,0,0,15,34582,0,0,0,0,0,23,0,0,0,0,0,0,0,0,'on wp reach - complete event');
UPDATE `smart_scripts` SET `action_param1` = 2000 WHERE `entryorguid` = 79635 AND `source_type` = 0 AND `id` = 1 AND `action_type` = 41;
UPDATE `quest_template_locale` SET `QuestCompletionLog` = 'Retournez voir le redresseur de torts Maraad à Chutelune, dans la vallée d''Ombrelune.' WHERE `ID` = 34582 AND `locale` = 'frFR';
