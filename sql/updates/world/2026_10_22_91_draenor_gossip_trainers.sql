-- Draenor profession trainers: Mak'jin's fishing option and Reshad's archaeology and inscription options open the trainer window.
UPDATE `gossip_menu_option` SET `OptionNpc` = 3 WHERE `MenuID` = 16503 AND `OptionID` = 0;
UPDATE `gossip_menu_option` SET `OptionNpc` = 3 WHERE `MenuID` IN (16718, 16849, 17107) AND `OptionID` IN (0, 1);
