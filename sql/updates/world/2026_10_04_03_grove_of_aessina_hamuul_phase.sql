-- Grove of Aessina: one Archdruid Hamuul Runetotem at a time.
--
-- Two Hamuuls stood on the same spot, both phase-neutral: 39858 (guid 146834), who takes back Aessina's Miracle
-- (25372) and the rest of the burned-Hyjal chain, and 41480 (guid 146836), who only offers what comes after
-- (25843 Tortolla's Revenge, also offered by 39858). Clicking landed on 41480 and the quest could not be handed in.
-- 39858 now shows while 25372 is not rewarded (phase 432, sent with the burned terrain swap), 41480 once it is
-- (phase 434). Both ids exist in Phase.db2 and were unused.
UPDATE `phase_definitions` SET `phaseId` = '432' WHERE `zoneId` = 616 AND `entry` = 6;

DELETE FROM `phase_definitions` WHERE `zoneId` = 616 AND `entry` = 7;
INSERT INTO `phase_definitions` (`zoneId`, `entry`, `phasemask`, `phaseId`, `PreloadMapID`, `VisibleMapID`, `UiWorldMapAreaID`, `flags`, `comment`) VALUES
(616, 7, 0, '434', 0, 0, 0, 0, 'Mount Hyjal - healed Grove of Aessina once Aessina''s Miracle (25372) is rewarded');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 23 AND `SourceGroup` = 616 AND `SourceEntry` = 7;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(23, 616, 7, 0, 0, 8, 0, 25372, 0, 0, 0, 0, '', 'Mount Hyjal healed phase (434) once Aessina''s Miracle is rewarded');

UPDATE `creature` SET `PhaseId` = '432' WHERE `guid` = 146834 AND `id` = 39858;
UPDATE `creature` SET `PhaseId` = '434' WHERE `guid` = 146836 AND `id` = 41480;

-- The template addon of 39858 carries Generic Quest Invisibility 1 (49414) and the invisible vis flag, and nothing in
-- Mount Hyjal grants the matching detection: the Grove's Hamuul was invisible to everyone. Only this spawn is cleared,
-- the other 39858 (guid 146835, Nordune Ridge) keeps the template.
DELETE FROM `creature_addon` WHERE `guid` = 146834;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES
(146834, 0, 0, 0, 256, 0, '');

-- Tortolla's Revenge (25843) opens "The mountain blooms again!": it follows Aessina's Miracle. Wowhead lists only
-- 41480 (healed Grove) and 52838 (Nordune Ridge) as its quest givers, 39858 offered it before the healing.
DELETE FROM `creature_queststarter` WHERE `id` = 39858 AND `quest` = 25843;
