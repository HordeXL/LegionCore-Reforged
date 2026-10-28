-- French reminder of "Let the Fires Come!" (Horde) when the quest is not done yet
DELETE FROM `quest_request_items_locale` WHERE `ID` = 12139 AND `Locale` = 'frFR';
INSERT INTO `quest_request_items_locale` (`ID`, `Locale`, `CompletionText`, `VerifiedBuild`) VALUES
(12139, 'frFR', 'Les enfants de la Horde ont besoin de vous ! Ne les abandonnez pas !', 0);
