-- Headless Horseman: his official lines instead of a retranslation from Russian
UPDATE `broadcast_text` SET `Text` = 'It is over, your search is done. Let fate choose now, the righteous one.' WHERE `ID` = 22261;
UPDATE `broadcast_text` SET `Text` = 'Here\'s my body, fit and pure!  Now, your blackened souls I\'ll cure!' WHERE `ID` = 22271;
UPDATE `broadcast_text` SET `Text` = 'This end have I reached before.  What new adventure lies in store?' WHERE `ID` = 23455;
UPDATE `broadcast_text` SET `Text` = 'Soldiers arise, stand and fight! Bring victory at last to this fallen knight!' WHERE `ID` = 23861;
UPDATE `broadcast_text_locale` SET `Text_lang` = 'It is over, your search is done. Let fate choose now, the righteous one.' WHERE `ID` = 22261 AND `locale` = 'enUS';
UPDATE `broadcast_text_locale` SET `Text_lang` = 'Here\'s my body, fit and pure!  Now, your blackened souls I\'ll cure!' WHERE `ID` = 22271 AND `locale` = 'enUS';
UPDATE `broadcast_text_locale` SET `Text_lang` = 'This end have I reached before.  What new adventure lies in store?' WHERE `ID` = 23455 AND `locale` = 'enUS';
UPDATE `broadcast_text_locale` SET `Text_lang` = 'Soldiers arise, stand and fight! Bring victory at last to this fallen knight!' WHERE `ID` = 23861 AND `locale` = 'enUS';
