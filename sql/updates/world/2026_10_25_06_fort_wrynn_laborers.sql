-- Fort Wrynn: Yrel waits where the quest map points, eleven laborers hammer at repairs or sleep, two officers talk, the footmen stay awake
DELETE FROM `creature` WHERE `guid` = 329555;
DELETE FROM `creature_addon` WHERE `guid` = 329555;
DELETE FROM `waypoint_data` WHERE `id` = 329555;
DELETE FROM `creature` WHERE `guid` = 329563;
DELETE FROM `creature_addon` WHERE `guid` = 329563;
DELETE FROM `waypoint_data` WHERE `id` = 329563;
DELETE FROM `creature` WHERE `guid` = 329562;
DELETE FROM `creature_addon` WHERE `guid` = 329562;
DELETE FROM `waypoint_data` WHERE `id` = 329562;
DELETE FROM `creature` WHERE `guid` = 329580;
DELETE FROM `creature_addon` WHERE `guid` = 329580;
DELETE FROM `waypoint_data` WHERE `id` = 329580;
UPDATE `creature_template` SET `ScriptName` = 'npc_talador_camp_worker' WHERE `entry` = 81242;
UPDATE `creature` SET `position_x` = 3613.00, `position_y` = 1686.00, `position_z` = 178.00, `orientation` = 4.158 WHERE `guid` = 377219;
DELETE FROM `creature_equip_template` WHERE `CreatureID` = 81242 AND `ID` = 2;
INSERT INTO `creature_equip_template` (`CreatureID`, `ID`, `ItemID1`, `ItemID2`, `ItemID3`, `ItemID4`, `ItemID5`, `ItemID6`) VALUES
(81242, 2, 5956, 0, 0, 0, 0, 0);
UPDATE `creature` SET `equipment_id` = 2 WHERE `guid` IN (329566, 329567, 329570, 329575, 329577, 329579, 329581, 329583, 329585, 329586, 329622);
DELETE FROM `waypoint_data` WHERE `id` = 329565;
UPDATE `creature` SET `MovementType` = 0, `spawndist` = 0 WHERE `guid` IN (329565, 329574);
UPDATE `creature` SET `orientation` = 4.135 WHERE `guid` = 329553;
UPDATE `creature` SET `orientation` = 0.993 WHERE `guid` = 329554;
UPDATE `creature_template_addon` SET `auras` = '' WHERE `entry` = 79666;
DELETE FROM `creature_addon` WHERE `guid` IN (329553, 329554, 329565, 329574, 329566, 329567, 329570, 329575, 329577, 329579, 329581, 329583, 329585, 329586, 329622);
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES
(329565, 0, 0, 3, 1, 0, ''),
(329574, 0, 0, 3, 1, 0, ''),
(329553, 0, 0, 0, 1, 378, ''),
(329554, 0, 0, 0, 1, 378, ''),
(329566, 0, 0, 0, 1, 173, ''),
(329567, 0, 0, 0, 1, 173, ''),
(329570, 0, 0, 0, 1, 173, ''),
(329575, 0, 0, 0, 1, 173, ''),
(329577, 0, 0, 0, 1, 173, ''),
(329579, 0, 0, 0, 1, 173, ''),
(329581, 0, 0, 0, 1, 173, ''),
(329583, 0, 0, 0, 1, 173, ''),
(329585, 0, 0, 0, 1, 173, ''),
(329586, 0, 0, 0, 1, 173, ''),
(329622, 0, 0, 0, 1, 173, '');
