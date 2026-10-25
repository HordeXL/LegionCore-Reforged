-- Zidormi passes from SmartAI to a creature script.
--
-- The menu now has to show one line and not two - the present to whoever is in the past, and the
-- reverse - which SmartAI cannot express: it reads its options from gossip_menu_option, and that
-- table has no notion of the player's state. The script builds the menu in code instead, so the
-- SQL scaffolding it replaces goes away.
UPDATE `creature_template` SET `ScriptName` = 'npc_zidormi_silithus', `AIName` = '', `gossip_menu_id` = 0
WHERE `entry` = 128607;

DELETE FROM `smart_scripts` WHERE `entryorguid` = 128607 AND `source_type` = 0;
DELETE FROM `gossip_menu_option` WHERE `MenuID` = 542001;
