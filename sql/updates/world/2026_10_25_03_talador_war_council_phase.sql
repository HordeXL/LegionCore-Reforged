-- Talador: the war council before Shattrath gathers once Khadgar's Plan is under way, and is gone once the battle is won
UPDATE `creature` SET `PhaseId` = '4224' WHERE `guid` IN (378795, 378793, 378791, 378786, 378797, 378792);   -- Maraad, Yrel, Khadgar, Draka, Durotan, Thrall
DELETE FROM `phase_definitions` WHERE `zoneId` = 6662 AND `entry` = 248;
INSERT INTO `phase_definitions` (`zoneId`, `entry`, `phasemask`, `phaseId`, `PreloadMapID`, `VisibleMapID`, `UiWorldMapAreaID`, `flags`, `comment`) VALUES (6662, 248, 0, '4224', 0, 0, 0, 0, 'Talador - war council before Shattrath');
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 23 AND `SourceGroup` = 6662 AND `SourceEntry` = 248;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(23, 6662, 248, 0, 0, 9, 0, 34963, 0, 0, 0, 0, '', 'War council before Shattrath - Khadgar''s Plan taken'),
(23, 6662, 248, 0, 0, 8, 0, 34099, 0, 0, 1, 0, '', 'War council before Shattrath - battle not yet won (Alliance)'),
(23, 6662, 248, 0, 0, 8, 0, 33731, 0, 0, 1, 0, '', 'War council before Shattrath - battle not yet won (Horde)'),
(23, 6662, 248, 0, 1, 28, 0, 34963, 0, 0, 0, 0, '', 'War council before Shattrath - Khadgar''s Plan complete'),
(23, 6662, 248, 0, 1, 8, 0, 34099, 0, 0, 1, 0, '', 'War council before Shattrath - battle not yet won (Alliance)'),
(23, 6662, 248, 0, 1, 8, 0, 33731, 0, 0, 1, 0, '', 'War council before Shattrath - battle not yet won (Horde)'),
(23, 6662, 248, 0, 2, 8, 0, 34963, 0, 0, 0, 0, '', 'War council before Shattrath - Khadgar''s Plan rewarded'),
(23, 6662, 248, 0, 2, 8, 0, 34099, 0, 0, 1, 0, '', 'War council before Shattrath - battle not yet won (Alliance)'),
(23, 6662, 248, 0, 2, 8, 0, 33731, 0, 0, 1, 0, '', 'War council before Shattrath - battle not yet won (Horde)'),
(23, 6662, 248, 0, 3, 9, 0, 34962, 0, 0, 0, 0, '', 'War council before Shattrath - Khadgar''s Plan taken'),
(23, 6662, 248, 0, 3, 8, 0, 34099, 0, 0, 1, 0, '', 'War council before Shattrath - battle not yet won (Alliance)'),
(23, 6662, 248, 0, 3, 8, 0, 33731, 0, 0, 1, 0, '', 'War council before Shattrath - battle not yet won (Horde)'),
(23, 6662, 248, 0, 4, 28, 0, 34962, 0, 0, 0, 0, '', 'War council before Shattrath - Khadgar''s Plan complete'),
(23, 6662, 248, 0, 4, 8, 0, 34099, 0, 0, 1, 0, '', 'War council before Shattrath - battle not yet won (Alliance)'),
(23, 6662, 248, 0, 4, 8, 0, 33731, 0, 0, 1, 0, '', 'War council before Shattrath - battle not yet won (Horde)'),
(23, 6662, 248, 0, 5, 8, 0, 34962, 0, 0, 0, 0, '', 'War council before Shattrath - Khadgar''s Plan rewarded'),
(23, 6662, 248, 0, 5, 8, 0, 34099, 0, 0, 1, 0, '', 'War council before Shattrath - battle not yet won (Alliance)'),
(23, 6662, 248, 0, 5, 8, 0, 33731, 0, 0, 1, 0, '', 'War council before Shattrath - battle not yet won (Horde)');
