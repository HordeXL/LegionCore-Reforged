-- Headless Horseman: his official lines, the conflagration one with its own broadcast text
UPDATE `creature_text` SET `Text` = 'It is over, your search is done. Let fate choose now, the righteous one.' WHERE `CreatureID` = 23682 AND `GroupID` = 0;
UPDATE `creature_text` SET `Text` = 'Here\'s my body, fit and pure!  Now, your blackened souls I\'ll cure!' WHERE `CreatureID` = 23682 AND `GroupID` = 1;
UPDATE `creature_text` SET `Text` = 'Harken, cur!  Tis you I spurn!  Now feel... the burn!', `BroadcastTextId` = 22587, `Sound` = 12573 WHERE `CreatureID` = 23682 AND `GroupID` = 2;
UPDATE `creature_text` SET `Text` = 'Soldiers arise, stand and fight! Bring victory at last to this fallen knight!' WHERE `CreatureID` = 23682 AND `GroupID` = 3;
UPDATE `creature_text` SET `Text` = 'This end have I reached before.  What new adventure lies in store?' WHERE `CreatureID` = 23682 AND `GroupID` = 4;
UPDATE `creature_text` SET `Text` = 'Get over here, you idiot!' WHERE `CreatureID` = 23775 AND `GroupID` = 0;
