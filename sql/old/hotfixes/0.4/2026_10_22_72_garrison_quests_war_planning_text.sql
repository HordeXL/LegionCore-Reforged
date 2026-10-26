-- Garrison War Planning Map: the text shown when the day's assault has been taken or done
DELETE FROM `broadcast_text` WHERE `ID` = 5421861;
INSERT INTO `broadcast_text` (`ID`, `Text`, `Text1`, `EmoteID1`, `EmoteID2`, `EmoteID3`, `EmoteDelay1`, `EmoteDelay2`, `EmoteDelay3`, `EmotesID`, `LanguageID`, `Flags`, `ConditionID`, `SoundEntriesID1`, `SoundEntriesID2`, `VerifiedBuild`) VALUES
(5421861, 'The scouts have no other assault to report today. Come back tomorrow for new orders.', 'The scouts have no other assault to report today. Come back tomorrow for new orders.', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 26365);
DELETE FROM `broadcast_text_locale` WHERE `ID` = 5421861;
INSERT INTO `broadcast_text_locale` (`ID`, `locale`, `Text_lang`, `Text1_lang`, `VerifiedBuild`) VALUES
(5421861, 'frFR', 'Les éclaireurs n’ont aucun autre assaut à signaler aujourd’hui. Revenez demain pour de nouveaux ordres.', 'Les éclaireurs n’ont aucun autre assaut à signaler aujourd’hui. Revenez demain pour de nouveaux ordres.', 26365);

DELETE FROM `hotfix_data` WHERE `Id` = 9100146;
INSERT INTO `hotfix_data` (`Id`, `TableHash`, `RecordID`, `Timestamp`, `Deleted`) VALUES
(9100146, 35137211, 5421861, 0, 0);

UPDATE `world_legion`.`version` SET `hotfix_cache_id` = `hotfix_cache_id` + 1;
