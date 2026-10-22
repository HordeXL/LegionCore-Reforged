-- Untitled quests handed out on entering an area are Blizzard's hidden server-side flags: they get the tracking flag so the client never lists them
UPDATE `quest_template` SET `Flags` = `Flags` | 0x400
WHERE `ID` IN (SELECT `quest` FROM (SELECT DISTINCT `quest` FROM `area_queststart`) AS `a`)
  AND (`LogTitle` IS NULL OR `LogTitle` = '');
