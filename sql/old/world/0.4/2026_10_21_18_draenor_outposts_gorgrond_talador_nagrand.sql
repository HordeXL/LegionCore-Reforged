-- Draenor outposts (Gorgrond, Talador, Nagrand): the drafting choices build the right structure, the chosen building replaces the construction plot, and the matching zone ability is granted in the zone
DELETE FROM `gameobject` WHERE `guid` BETWEEN 25813006 AND 25813018;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `PhaseId`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(25813006, 231810, 1116, 6721, 0, 1, 1, '3453', 6350.220, 726.780, 115.970, 2.50450, 0, 0, 0.949692, 0.313186, 300, 255, 1),
(25813007, 231777, 1116, 6721, 0, 1, 1, '3459', 6350.220, 726.780, 115.970, 2.50450, 0, 0, 0.949692, 0.313186, 300, 255, 1),
(25813008, 231731, 1116, 6721, 0, 1, 1, '3461', 5811.540, 1281.280, 109.440, 2.82740, 0, 0, 0.987686, 0.156451, 300, 255, 1),
(25813009, 231803, 1116, 6721, 0, 1, 1, '3465', 5811.540, 1281.280, 109.440, 2.82740, 0, 0, 0.987686, 0.156451, 300, 255, 1),
(25813010, 231140, 1116, 6662, 0, 1, 1, '3469', 3625.360, 1655.320, 175.980, 2.46090, 0, 0, 0.942639, 0.333814, 300, 255, 1),
(25813011, 231141, 1116, 6662, 0, 1, 1, '3471', 3625.360, 1655.320, 175.980, 2.46090, 0, 0, 0.942639, 0.333814, 300, 255, 1),
(25813012, 231142, 1116, 6662, 0, 1, 1, '3477', 3209.020, 1605.870, 164.960, 5.77060, 0, 0, 0.253496, -0.967336, 300, 255, 1),
(25813013, 231143, 1116, 6662, 0, 1, 1, '3479', 3209.020, 1605.870, 164.960, 5.77060, 0, 0, 0.253496, -0.967336, 300, 255, 1),
(25813014, 232017, 1116, 6755, 0, 1, 1, '3483', 2558.180, 5743.940, 103.759, 5.48906, 0, 0, 0.386711, -0.922201, 300, 255, 1),
(25813015, 232016, 1116, 6755, 0, 1, 1, '3485', 2558.180, 5743.940, 103.759, 5.48906, 0, 0, 0.386711, -0.922201, 300, 255, 1),
(25813016, 232020, 1116, 6755, 0, 1, 1, '3487', 2558.180, 5743.940, 103.759, 5.48906, 0, 0, 0.386711, -0.922201, 300, 255, 1),
(25813017, 229648, 1116, 6755, 0, 1, 1, '3491', 3274.760, 4587.740, 146.630, 2.88740, 0, 0, 0.991934, 0.126754, 300, 255, 1),
(25813018, 232019, 1116, 6755, 0, 1, 1, '3493', 3274.760, 4587.740, 146.630, 2.88740, 0, 0, 0.991934, 0.126754, 300, 255, 1);
UPDATE `gameobject` SET `PhaseId` = '3457', `rotation0` = 0, `rotation1` = 0, `rotation2` = 0.949692, `rotation3` = 0.313186 WHERE `guid` = 141028;
UPDATE `gameobject` SET `PhaseId` = '3463', `rotation0` = 0, `rotation1` = 0, `rotation2` = 0.987686, `rotation3` = 0.156451 WHERE `guid` = 141044;
UPDATE `gameobject` SET `PhaseId` = '3467', `rotation0` = 0, `rotation1` = 0, `rotation2` = 0.942639, `rotation3` = 0.333814 WHERE `guid` = 122894;
UPDATE `gameobject` SET `PhaseId` = '3475', `rotation0` = 0, `rotation1` = 0, `rotation2` = 0.253496, `rotation3` = -0.967336 WHERE `guid` = 118370;
UPDATE `gameobject` SET `PhaseId` = '3489', `rotation0` = 0, `rotation1` = 0, `rotation2` = 0.991934, `rotation3` = 0.126754 WHERE `guid` = 120116;
UPDATE `creature` SET `PhaseId` = '3463' WHERE `id` = 89248 AND `map` = 1116;
DELETE FROM `phase_definitions` WHERE `zoneId` IN (6721, 6662, 6755) AND `entry` BETWEEN 201 AND 206;
INSERT INTO `phase_definitions` (`zoneId`, `entry`, `phasemask`, `phaseId`, `PreloadMapID`, `VisibleMapID`, `UiWorldMapAreaID`, `flags`, `comment`) VALUES
(6721, 201, 0, 3453, 0, 0, 0, 16, 'Highpass construction plot - no building chosen'),
(6721, 202, 0, 3457, 0, 0, 0, 16, 'Highpass lumber mill'),
(6721, 203, 0, 3459, 0, 0, 0, 16, 'Highpass sparring arena'),
(6721, 204, 0, 3461, 0, 0, 0, 16, 'Beastwatch construction plot - no building chosen'),
(6721, 205, 0, 3463, 0, 0, 0, 16, 'Beastwatch lumber mill'),
(6721, 206, 0, 3465, 0, 0, 0, 16, 'Beastwatch sparring arena'),
(6662, 201, 0, 3467, 0, 0, 0, 16, 'Talador Alliance construction plot - no building chosen'),
(6662, 202, 0, 3469, 0, 0, 0, 16, 'Talador Alliance armory'),
(6662, 203, 0, 3471, 0, 0, 0, 16, 'Talador Alliance mage tower'),
(6662, 204, 0, 3475, 0, 0, 0, 16, 'Talador Horde construction plot - no building chosen'),
(6662, 205, 0, 3477, 0, 0, 0, 16, 'Talador Horde armory'),
(6662, 206, 0, 3479, 0, 0, 0, 16, 'Talador Horde mage tower'),
(6755, 201, 0, 3483, 0, 0, 0, 16, 'Nagrand Alliance worksite - no building chosen'),
(6755, 202, 0, 3485, 0, 0, 0, 16, 'Nagrand Alliance corral'),
(6755, 203, 0, 3487, 0, 0, 0, 16, 'Nagrand Alliance tankworks'),
(6755, 204, 0, 3489, 0, 0, 0, 16, 'Nagrand Horde worksite - no building chosen'),
(6755, 205, 0, 3491, 0, 0, 0, 16, 'Nagrand Horde corral'),
(6755, 206, 0, 3493, 0, 0, 0, 16, 'Nagrand Horde tankworks');
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 23 AND `SourceGroup` IN (6721, 6662, 6755) AND `SourceEntry` BETWEEN 201 AND 206;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(23, 6721, 201, 0, 0, 8, 0, 35049, 0, 0, 1, 0, '', 'Outpost building phase - quest 35049 not rewarded'),
(23, 6721, 201, 0, 0, 8, 0, 35064, 0, 0, 1, 0, '', 'Outpost building phase - quest 35064 not rewarded'),
(23, 6721, 202, 0, 0, 8, 0, 35049, 0, 0, 0, 0, '', 'Outpost building phase - quest 35049 rewarded'),
(23, 6721, 203, 0, 0, 8, 0, 35064, 0, 0, 0, 0, '', 'Outpost building phase - quest 35064 rewarded'),
(23, 6721, 204, 0, 0, 8, 0, 34992, 0, 0, 1, 0, '', 'Outpost building phase - quest 34992 not rewarded'),
(23, 6721, 204, 0, 0, 8, 0, 35149, 0, 0, 1, 0, '', 'Outpost building phase - quest 35149 not rewarded'),
(23, 6721, 205, 0, 0, 8, 0, 34992, 0, 0, 0, 0, '', 'Outpost building phase - quest 34992 rewarded'),
(23, 6721, 206, 0, 0, 8, 0, 35149, 0, 0, 0, 0, '', 'Outpost building phase - quest 35149 rewarded'),
(23, 6662, 201, 0, 0, 8, 0, 34560, 0, 0, 1, 0, '', 'Outpost building phase - quest 34560 not rewarded'),
(23, 6662, 201, 0, 0, 8, 0, 34561, 0, 0, 1, 0, '', 'Outpost building phase - quest 34561 not rewarded'),
(23, 6662, 202, 0, 0, 8, 0, 34560, 0, 0, 0, 0, '', 'Outpost building phase - quest 34560 rewarded'),
(23, 6662, 203, 0, 0, 8, 0, 34561, 0, 0, 0, 0, '', 'Outpost building phase - quest 34561 rewarded'),
(23, 6662, 204, 0, 0, 8, 0, 34568, 0, 0, 1, 0, '', 'Outpost building phase - quest 34568 not rewarded'),
(23, 6662, 204, 0, 0, 8, 0, 34567, 0, 0, 1, 0, '', 'Outpost building phase - quest 34567 not rewarded'),
(23, 6662, 205, 0, 0, 8, 0, 34568, 0, 0, 0, 0, '', 'Outpost building phase - quest 34568 rewarded'),
(23, 6662, 206, 0, 0, 8, 0, 34567, 0, 0, 0, 0, '', 'Outpost building phase - quest 34567 rewarded'),
(23, 6755, 201, 0, 0, 8, 0, 34679, 0, 0, 1, 0, '', 'Outpost building phase - quest 34679 not rewarded'),
(23, 6755, 201, 0, 0, 8, 0, 34680, 0, 0, 1, 0, '', 'Outpost building phase - quest 34680 not rewarded'),
(23, 6755, 202, 0, 0, 8, 0, 34679, 0, 0, 0, 0, '', 'Outpost building phase - quest 34679 rewarded'),
(23, 6755, 203, 0, 0, 8, 0, 34680, 0, 0, 0, 0, '', 'Outpost building phase - quest 34680 rewarded'),
(23, 6755, 204, 0, 0, 8, 0, 34812, 0, 0, 1, 0, '', 'Outpost building phase - quest 34812 not rewarded'),
(23, 6755, 204, 0, 0, 8, 0, 34813, 0, 0, 1, 0, '', 'Outpost building phase - quest 34813 not rewarded'),
(23, 6755, 205, 0, 0, 8, 0, 34812, 0, 0, 0, 0, '', 'Outpost building phase - quest 34812 rewarded'),
(23, 6755, 206, 0, 0, 8, 0, 34813, 0, 0, 0, 0, '', 'Outpost building phase - quest 34813 rewarded');
DELETE FROM `spell_area` WHERE `spell` IN (168478, 168474, 162130, 162131, 166499, 166502, 166498, 166500);
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_end`, `aura_spell`, `racemask`, `classmask`, `active_event`, `gender`, `autocast`, `quest_start_status`, `quest_end_status`) VALUES
(168478, 6721, 35049, 0, 0, 0, 0, 0, 2, 1, 64, 64),
(168478, 6721, 34992, 0, 0, 0, 0, 0, 2, 1, 64, 64),
(168474, 6721, 35064, 0, 0, 0, 0, 0, 2, 1, 64, 64),
(168474, 6721, 35149, 0, 0, 0, 0, 0, 2, 1, 64, 64),
(162130, 6662, 34560, 0, 0, 0, 0, 0, 2, 1, 64, 64),
(162130, 6662, 34568, 0, 0, 0, 0, 0, 2, 1, 64, 64),
(162131, 6662, 34561, 0, 0, 0, 0, 0, 2, 1, 64, 64),
(162131, 6662, 34567, 0, 0, 0, 0, 0, 2, 1, 64, 64),
(166499, 6755, 34679, 0, 0, 0, 0, 0, 2, 1, 64, 64),
(166502, 6755, 34680, 0, 0, 0, 0, 0, 2, 1, 64, 64),
(166498, 6755, 34812, 0, 0, 0, 0, 0, 2, 1, 64, 64),
(166500, 6755, 34813, 0, 0, 0, 0, 0, 2, 1, 64, 64);
UPDATE `playerchoice_response_reward` SET `SpellID` = 159984 WHERE `ChoiceId` = 51 AND `ResponseId` = 119;
UPDATE `playerchoice_response_reward` SET `SpellID` = 159986 WHERE `ChoiceId` = 51 AND `ResponseId` = 120;
UPDATE `playerchoice_response_reward` SET `SpellID` = 160026 WHERE `ChoiceId` = 52 AND `ResponseId` = 121;
UPDATE `playerchoice_response_reward` SET `SpellID` = 160024 WHERE `ChoiceId` = 52 AND `ResponseId` = 122;
UPDATE `playerchoice_response_reward` SET `SpellID` = 163737 WHERE `ChoiceId` = 55 AND `ResponseId` = 127;
UPDATE `playerchoice_response_reward` SET `SpellID` = 163734 WHERE `ChoiceId` = 55 AND `ResponseId` = 128;
UPDATE `playerchoice_response_reward` SET `SpellID` = 164028 WHERE `ChoiceId` = 56 AND `ResponseId` = 129;
UPDATE `playerchoice_response_reward` SET `SpellID` = 164029 WHERE `ChoiceId` = 56 AND `ResponseId` = 130;
UPDATE `playerchoice_response` SET `Answer` = 'Vol''jin''s Armory' WHERE `ChoiceId` = 52 AND `ResponseId` = 121;
UPDATE `playerchoice_response` SET `Answer` = 'Mage Tower' WHERE `ChoiceId` = 52 AND `ResponseId` = 122;
UPDATE `playerchoice_response` SET `Answer` = 'Rangari Corral' WHERE `ChoiceId` = 53 AND `ResponseId` = 123;
UPDATE `playerchoice_response` SET `Answer` = 'Telaari Tankworks' WHERE `ChoiceId` = 53 AND `ResponseId` = 124;
UPDATE `playerchoice_response` SET `Answer` = 'Wor''var Corral' WHERE `ChoiceId` = 54 AND `ResponseId` = 125;
UPDATE `playerchoice_response` SET `Answer` = 'Wor''var Tankworks' WHERE `ChoiceId` = 54 AND `ResponseId` = 126;
UPDATE `playerchoice_response` SET `Answer` = 'Beastwatch Lumber Mill' WHERE `ChoiceId` = 56 AND `ResponseId` = 129;
UPDATE `playerchoice_response` SET `Answer` = 'Beastwatch Sparring Arena' WHERE `ChoiceId` = 56 AND `ResponseId` = 130;
UPDATE `playerchoice_response` SET `Answer` = 'Axefall Tavern' WHERE `ChoiceId` = 57 AND `ResponseId` = 131;
UPDATE `playerchoice_response` SET `Answer` = 'Smuggler''s Den' WHERE `ChoiceId` = 57 AND `ResponseId` = 132;
DELETE FROM `playerchoice_locale` WHERE `ChoiceId` IN (51, 52, 53, 54, 55, 56, 57) AND `locale` = 'frFR';
INSERT INTO `playerchoice_locale` (`ChoiceId`, `locale`, `Question`, `VerifiedBuild`) VALUES
(51, 'frFR', 'Quel bâtiment devons-nous construire à l''avant-poste ?', 0),
(52, 'frFR', 'Quel type de bâtiment allons-nous ériger à l''avant-poste ?', 0),
(53, 'frFR', 'Quel type de bâtiment allons-nous ériger à l''avant-poste ?', 0),
(54, 'frFR', 'Quel type de bâtiment allons-nous ériger à l''avant-poste ?', 0),
(55, 'frFR', 'Quel bâtiment devons-nous construire à l''avant-poste ?', 0),
(56, 'frFR', 'Quel type de bâtiment allons-nous ériger à l''avant-poste ?', 0),
(57, 'frFR', 'Quel type de bâtiment allons-nous ériger à l''avant-poste ?', 0);
DELETE FROM `playerchoice_response_locale` WHERE `ChoiceId` IN (51, 52, 53, 54, 55, 56, 57) AND `locale` = 'frFR';
INSERT INTO `playerchoice_response_locale` (`ChoiceId`, `ResponseId`, `locale`, `Header`, `Answer`, `Description`, `Confirmation`, `VerifiedBuild`) VALUES
(51, 119, 'frFR', '', 'Tour d''artillerie de Wrynn', '', '', 0),
(51, 120, 'frFR', '', 'Sanctuaire des arcanes', '', '', 0),
(52, 121, 'frFR', '', 'Armurerie de Vol''jin', '', '', 0),
(52, 122, 'frFR', '', 'Tour des mages', '', '', 0),
(53, 123, 'frFR', '', 'Corral rangari', '', '', 0),
(53, 124, 'frFR', '', 'Atelier de chars telaari', '', '', 0),
(54, 125, 'frFR', '', 'Corral wor''var', '', '', 0),
(54, 126, 'frFR', '', 'Atelier de chars wor''var', '', '', 0),
(55, 127, 'frFR', '', 'Camp de bûcherons du Haut-Col', '', '', 0),
(55, 128, 'frFR', '', 'Arène d''entraînement du Haut-Col', '', '', 0),
(56, 129, 'frFR', '', 'Scierie du Guet-des-Bêtes', '', '', 0),
(56, 130, 'frFR', '', 'Arène d''entraînement du Guet-des-Bêtes', '', '', 0),
(57, 131, 'frFR', '', 'Taverne d''Hache-Tombée', '', '', 0),
(57, 132, 'frFR', '', 'Repaire des contrebandiers', '', '', 0);
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 17 AND `SourceEntry` IN (159975, 160028, 160921, 161683, 164977);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(17, 0, 159975, 0, 0, 9, 0, 34558, 0, 0, 0, 0, '', 'Drafting Table - outpost quest taken'),
(17, 0, 159975, 0, 1, 8, 0, 34558, 0, 0, 0, 0, '', 'Drafting Table - outpost quest rewarded'),
(17, 0, 160028, 0, 0, 9, 0, 34566, 0, 0, 0, 0, '', 'Drafting Table - outpost quest taken'),
(17, 0, 160028, 0, 1, 8, 0, 34566, 0, 0, 0, 0, '', 'Drafting Table - outpost quest rewarded'),
(17, 0, 160921, 0, 0, 9, 0, 34769, 0, 0, 0, 0, '', 'Drafting Table - outpost quest taken'),
(17, 0, 160921, 0, 1, 8, 0, 34769, 0, 0, 0, 0, '', 'Drafting Table - outpost quest rewarded'),
(17, 0, 161683, 0, 0, 9, 0, 34899, 0, 0, 0, 0, '', 'Drafting Table - outpost quest taken'),
(17, 0, 161683, 0, 1, 8, 0, 34899, 0, 0, 0, 0, '', 'Drafting Table - outpost quest rewarded'),
(17, 0, 164977, 0, 0, 9, 0, 35277, 0, 0, 0, 0, '', 'Drafting Table - outpost quest taken'),
(17, 0, 164977, 0, 1, 8, 0, 35277, 0, 0, 0, 0, '', 'Drafting Table - outpost quest rewarded');
