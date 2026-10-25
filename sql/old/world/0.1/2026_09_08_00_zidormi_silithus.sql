-- ==========================================================================================
-- Zidormi shows Silithus after the Wound.
--
-- She is already standing in Silithus - creature 128607, spawned at -6468 / -220 - but with no
-- gossip menu, no AI and no script, so she has nothing to say. The Legion terrain is there too:
-- map 1817 is extracted, 25 tiles, and phase_definitions already swaps to it for zone 1377.
--
-- What was missing is the switch. Those phases are gated on the Antorus questline alone - phase 10
-- needs quest 49977 or 50371 - so a player who has not run it can never see the sword, and nothing
-- lets them ask.
--
-- The Blasted Lands Zidormi, 88206, is the working precedent: her gossip adds or removes aura
-- 176111, and the zone 4 phases are conditioned on not having it. The same shape is used here,
-- with aura 254169 "Time Travelling" - the Legion-era twin of 176111, unused anywhere in this
-- database - so the two zones stay independent.
--
-- The polarity is reversed against Blasted Lands, and deliberately. There the modern terrain is
-- the default and the aura sends you back; here the old zone is the default, because almost no one
-- has run the questline, so the aura brings the Wound forward:
--
--   phase 10, the Wound        active if quest 49977, or quest 50371, or the aura
--   phase 11, old Silithus     active if neither quest and no aura
--
-- Phases 12 to 15 are questline sub-states and are left alone.
-- ==========================================================================================

-- The Wound also answers to the aura.
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 23 AND `SourceGroup` = 1377 AND `SourceEntry` = 10 AND `ElseGroup` = 2;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`,
                          `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`,
                          `ConditionValue3`, `NegativeCondition`, `Comment`) VALUES
(23, 1377, 10, 0, 2, 1, 0, 254169, 0, 0, 0, 'Silithus - the Wound if Zidormi sent the player forward');

-- Old Silithus steps aside when the aura is up.
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 23 AND `SourceGroup` = 1377 AND `SourceEntry` = 11 AND `ConditionValue1` = 254169;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`,
                          `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`,
                          `ConditionValue3`, `NegativeCondition`, `Comment`) VALUES
(23, 1377, 11, 0, 0, 1, 0, 254169, 0, 0, 1, 'Silithus - old zone only while Zidormi has not sent the player forward');

-- Her menu.
DELETE FROM `gossip_menu_option` WHERE `MenuID` = 542001;
INSERT INTO `gossip_menu_option` (`MenuID`, `OptionID`, `OptionNpc`, `OptionText`, `OptionBroadcastTextID`,
                                  `ActionMenuID`, `ActionPoiID`, `BoxCoded`, `BoxMoney`, `BoxText`,
                                  `BoxBroadcastTextID`, `VerifiedBuild`) VALUES
(542001, 0, 0, 'Montre-moi Silithus apres la Plaie.', 0, 0, 0, 0, 0, '', 0, 26972),
(542001, 1, 0, 'Ramene-moi au present.',              0, 0, 0, 0, 0, '', 0, 26972);

UPDATE `creature_template` SET `gossip_menu_id` = 542001, `AIName` = 'SmartAI' WHERE `entry` = 128607;

-- Target 7 is the invoker, the player who picked the line.
DELETE FROM `smart_scripts` WHERE `entryorguid` = 128607 AND `source_type` = 0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`,
                             `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`,
                             `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`,
                             `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`,
                             `target_param1`, `target_param2`, `target_param3`, `target_param4`,
                             `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(128607, 0, 0, 0, 62, 0, 100, 0, 542001, 0, 0, 0, 0, 75, 254169, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'Zidormi - show Silithus after the Wound'),
(128607, 0, 1, 0, 62, 0, 100, 0, 542001, 1, 0, 0, 0, 28, 254169, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'Zidormi - back to the present');
