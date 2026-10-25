-- Great Gnomeregan Run: the 34th gate quest 47709 asks for, on the road from New Tinkertown to Kharanos.
DELETE FROM `game_event_creature` WHERE `guid` = 5299002;
DELETE FROM `creature` WHERE `guid` = 5299002;
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `PhaseId`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `dynamicflags`, `AiID`, `MovementID`, `MeleeID`, `isActive`, `skipClone`, `personal_size`, `isTeemingSpawn`, `unit_flags3`) VALUES
(5299002, 123412, 0, 6457, 801, 1, 1, '', 0, 0, -5387.5000, -17.5000, 391.0000, 4.71000, 120, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `game_event_creature` (`eventEntry`, `guid`) VALUES
(304, 5299002);
