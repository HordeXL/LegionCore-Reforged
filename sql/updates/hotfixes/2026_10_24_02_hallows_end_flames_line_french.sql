-- Wickerman Reveler: the French line matches the spoken one
UPDATE `broadcast_text_locale` SET `Text_lang` = 'Que s’envolent les flammes ! La Sanssaint est arrivée !' WHERE `ID` = 50757 AND `locale` = 'frFR';

DELETE FROM `hotfix_data` WHERE `Id` = 9100193;
INSERT INTO `hotfix_data` (`Id`, `TableHash`, `RecordID`, `Timestamp`, `Deleted`) VALUES
(9100193, 35137211, 50757, 0, 0);

UPDATE `world_legion`.`version` SET `hotfix_cache_id` = `hotfix_cache_id` + 1;
