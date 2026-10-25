-- Garrison town hall (tier 3): Muradin Bronzebeard and High Overlord Saurfang hand out the Draenor dungeon dailies and raid weeklies
DELETE FROM `creature` WHERE `guid` = 146926001;
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `PhaseId`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`) VALUES
(146926001, 89753, 1153, 7004, 7103, 2, 1, '', 0, 0, 5548.79, 4603.48, 142.13, 6.16247, 7200, 0, 0, 0, 0, 0);

-- the Frostwall Saurfang was left at level 1 and neutral
UPDATE `creature_template` SET `minlevel` = 100, `maxlevel` = 100, `faction` = 29 WHERE `entry` = 89753;

DELETE FROM `creature_queststarter` WHERE `id` IN (89753, 91195, 89763, 91196) AND `quest` IN (37756, 37757, 37758, 37762, 37763, 37764, 37765, 37780, 37781, 37782, 37783, 37784, 37785, 37786, 37787, 39221, 39225, 39228, 39231, 39232,
    37766, 37767, 37768, 37769, 37770, 37771, 37772, 37796, 37789, 37790, 37791, 37792, 37793, 37794, 37795, 39250, 39253, 39256, 39259, 39260);
INSERT INTO `creature_queststarter` (`id`, `quest`)
SELECT 89753, `ID` FROM `quest_template`
WHERE `ID` IN (37756, 37757, 37758, 37762, 37763, 37764, 37765, 37780, 37781, 37782, 37783, 37784, 37785, 37786, 37787, 39221, 39225, 39228, 39231, 39232)
UNION ALL
SELECT 89763, `ID` FROM `quest_template`
WHERE `ID` IN (37766, 37767, 37768, 37769, 37770, 37771, 37772, 37796, 37789, 37790, 37791, 37792, 37793, 37794, 37795, 39250, 39253, 39256, 39259, 39260);
