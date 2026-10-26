-- Arnokk the Burner works the northern courtyard of Karabor with his flamethrower; the line of fire burns whoever stands in it
UPDATE `creature_template` SET `AIName` = '', `ScriptName` = 'npc_arnokk_the_burner' WHERE `entry` = 75358;
UPDATE `creature` SET `MovementType` = 0, `spawndist` = 0 WHERE `id` = 75358;
DELETE FROM `areatrigger_actions` WHERE `entry` = 0 AND `customEntry` = 5633;
INSERT INTO `areatrigger_actions` (`entry`, `customEntry`, `id`, `moment`, `actionType`, `spellId`, `targetFlags`, `comment`) VALUES
(0, 5633, 0, 1, 0, 150642, 2, 'Fiery Blast - Burning on enter'),
(0, 5633, 1, 2, 1, 150642, 2, 'Fiery Blast - Burning removed on leave');
