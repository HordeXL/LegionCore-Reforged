-- Spires of Arak outposts: the chosen building (inn or trading post) replaces the construction plot at Southport and Axefall, the matching zone ability is granted in the zone, and Home Away from Home has somewhere to send you
DELETE FROM `gameobject` WHERE `guid` BETWEEN 25813001 AND 25813005;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `PhaseId`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(25813001, 232389, 1116, 6722, 0, 1, 1, '3437', -1094.450, 2284.870, 6.1534, 5.85558, 0, 0, 0.212177, -0.977231, 300, 255, 1),
(25813002, 232386, 1116, 6722, 0, 1, 1, '3439', -1094.450, 2284.870, 6.1534, 5.85558, 0, 0, 0.212177, -0.977231, 300, 255, 1),
(25813003, 232387, 1116, 6722, 0, 1, 1, '3443', -1094.450, 2284.870, 6.1534, 5.85558, 0, 0, 0.212177, -0.977231, 300, 255, 1),
(25813004, 232384, 1116, 6722, 0, 1, 1, '3447', -347.229, 2257.020, 27.5024, 3.55331, 0, 0, 0.978886, -0.204408, 300, 255, 1),
(25813005, 232385, 1116, 6722, 0, 1, 1, '3449', -347.229, 2257.020, 27.5024, 3.55331, 0, 0, 0.978886, -0.204408, 300, 255, 1);
UPDATE `gameobject` SET `PhaseId` = '3445' WHERE `guid` = 122042;
DELETE FROM `phase_definitions` WHERE `zoneId` = 6722 AND `entry` BETWEEN 201 AND 206;
INSERT INTO `phase_definitions` (`zoneId`, `entry`, `phasemask`, `phaseId`, `PreloadMapID`, `VisibleMapID`, `UiWorldMapAreaID`, `flags`, `comment`) VALUES
(6722, 201, 0, 3437, 0, 0, 0, 16, 'Southport construction plot - no building chosen'),
(6722, 202, 0, 3439, 0, 0, 0, 16, 'Southport Stoktron Brewery (inn)'),
(6722, 203, 0, 3443, 0, 0, 0, 16, 'Southport Smuggler''s Den (trading post)'),
(6722, 204, 0, 3445, 0, 0, 0, 16, 'Axefall construction plot - no building chosen'),
(6722, 205, 0, 3447, 0, 0, 0, 16, 'Axefall tavern'),
(6722, 206, 0, 3449, 0, 0, 0, 16, 'Axefall trading post');
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 23 AND `SourceGroup` = 6722 AND `SourceEntry` BETWEEN 201 AND 206;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(23, 6722, 201, 0, 0, 8, 0, 35290, 0, 0, 1, 0, '', 'Outpost building phase - quest 35290 not rewarded'),
(23, 6722, 201, 0, 0, 8, 0, 35291, 0, 0, 1, 0, '', 'Outpost building phase - quest 35291 not rewarded'),
(23, 6722, 202, 0, 0, 8, 0, 35290, 0, 0, 0, 0, '', 'Outpost building phase - quest 35290 rewarded'),
(23, 6722, 203, 0, 0, 8, 0, 35291, 0, 0, 0, 0, '', 'Outpost building phase - quest 35291 rewarded'),
(23, 6722, 204, 0, 0, 8, 0, 35283, 0, 0, 1, 0, '', 'Outpost building phase - quest 35283 not rewarded'),
(23, 6722, 204, 0, 0, 8, 0, 35284, 0, 0, 1, 0, '', 'Outpost building phase - quest 35284 not rewarded'),
(23, 6722, 205, 0, 0, 8, 0, 35283, 0, 0, 0, 0, '', 'Outpost building phase - quest 35283 rewarded'),
(23, 6722, 206, 0, 0, 8, 0, 35284, 0, 0, 0, 0, '', 'Outpost building phase - quest 35284 rewarded');
DELETE FROM `spell_area` WHERE `spell` IN (171333, 170109, 171334, 170098);
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_end`, `aura_spell`, `racemask`, `classmask`, `active_event`, `gender`, `autocast`, `quest_start_status`, `quest_end_status`) VALUES
(171333, 6722, 35290, 0, 0, 0, 0, 0, 2, 1, 64, 64),
(170109, 6722, 35291, 0, 0, 0, 0, 0, 2, 1, 64, 64),
(171334, 6722, 35283, 0, 0, 0, 0, 0, 2, 1, 64, 64),
(170098, 6722, 35284, 0, 0, 0, 0, 0, 2, 1, 64, 64);
DELETE FROM `spell_target_position` WHERE `id` IN (168487, 168499);
INSERT INTO `spell_target_position` (`id`, `target_map`, `target_position_x`, `target_position_y`, `target_position_z`, `target_orientation`) VALUES
(168487, 1116, -1078.50, 2279.50, 6.60, 2.80),
(168499, 1116, -365.50, 2249.00, 26.40, 3.55);
