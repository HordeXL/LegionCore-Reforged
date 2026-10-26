-- Vol'jin's Pride: peons mine, hammer at repairs or at the forge, one sleeps
DELETE FROM `creature` WHERE `guid` = 329235;
DELETE FROM `creature_addon` WHERE `guid` = 329235;
DELETE FROM `waypoint_data` WHERE `id` = 329235;
DELETE FROM `creature` WHERE `guid` = 329236;
DELETE FROM `creature_addon` WHERE `guid` = 329236;
DELETE FROM `waypoint_data` WHERE `id` = 329236;
UPDATE `creature_template` SET `ScriptName` = 'npc_talador_camp_worker' WHERE `entry` IN (79680, 81744);
DELETE FROM `creature_equip_template` WHERE (`CreatureID` = 79680 OR `CreatureID` = 81744) AND `ID` = 2;
INSERT INTO `creature_equip_template` (`CreatureID`, `ID`, `ItemID1`, `ItemID2`, `ItemID3`, `ItemID4`, `ItemID5`, `ItemID6`) VALUES
(79680, 2, 2901, 0, 0, 0, 0, 0),
(81744, 2, 5956, 0, 0, 0, 0, 0);
UPDATE `creature` SET `equipment_id` = 2 WHERE `guid` IN (329096, 329098, 329103, 329105, 329108, 329237, 329238, 329240, 329242, 329243, 329244, 329245, 329246, 329247, 329248, 329251);
DELETE FROM `waypoint_data` WHERE `id` = 329252;
UPDATE `creature` SET `MovementType` = 0, `spawndist` = 0 WHERE `guid` = 329252;
DELETE FROM `creature_addon` WHERE `guid` IN (329251, 329252, 329096, 329098, 329103, 329105, 329108, 329237, 329238, 329240, 329242, 329243, 329244, 329245, 329246, 329247, 329248);
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES
(329251, 0, 0, 0, 1, 613, ''),
(329252, 0, 0, 3, 1, 0, '125567'),
(329096, 0, 0, 0, 1, 233, ''),
(329098, 0, 0, 0, 1, 233, ''),
(329103, 0, 0, 0, 1, 233, ''),
(329105, 0, 0, 0, 1, 233, ''),
(329108, 0, 0, 0, 1, 233, ''),
(329237, 0, 0, 0, 1, 173, ''),
(329238, 0, 0, 0, 1, 173, ''),
(329240, 0, 0, 0, 1, 173, ''),
(329242, 0, 0, 0, 1, 173, ''),
(329243, 0, 0, 0, 1, 173, ''),
(329244, 0, 0, 0, 1, 173, ''),
(329245, 0, 0, 0, 1, 173, ''),
(329246, 0, 0, 0, 1, 173, ''),
(329247, 0, 0, 0, 1, 173, ''),
(329248, 0, 0, 0, 1, 173, '');
