-- Mount Hyjal: burned terrain until Aessina's Miracle.
--
-- Map 719 (MountHyjalPhase1) is Blizzard's burned Mount Hyjal: The Regrowth, Ashen Lake and the
-- Sanctuary of Malorne on fire, with the Twilight's Hammer camps (9 tiles, 34_21 to 37_23). Kalimdor
-- itself carries the healed state. Nothing sent the swap, so everyone saw the healed forest from the
-- start. The swap is the default view and goes away once quest 25372 "Aessina's Miracle" is rewarded.
--
-- Both map columns are filled: PreloadMapID becomes the terrain swap, VisibleMapID the world map
-- area, and the client only redraws the ground when both are sent (see the Silithus swap, entry 4600).
DELETE FROM `phase_definitions` WHERE `zoneId` = 616 AND `entry` = 6;
INSERT INTO `phase_definitions` (`zoneId`, `entry`, `phasemask`, `phaseId`, `PreloadMapID`, `VisibleMapID`, `UiWorldMapAreaID`, `flags`, `comment`) VALUES
(616, 6, 0, '', 719, 719, 0, 0, 'Mount Hyjal - burned terrain until Aessina''s Miracle (25372) is rewarded');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 23 AND `SourceGroup` = 616 AND `SourceEntry` = 6;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(23, 616, 6, 0, 0, 8, 0, 25372, 0, 0, 1, 0, '', 'Mount Hyjal burned terrain swap (719) while Aessina''s Miracle is not rewarded');
