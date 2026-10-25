-- ==========================================================================================
-- Zidormi, corrected: the right aura, and the right way round.
--
-- The first pass picked 254169 by name alone. Four spells are called "Time Travelling" and their
-- descriptions are identical; only the localised aura text tells them apart, and 254169 turned out
-- to be Serenity Peak. The one for this zone is 255152:
--
--   "Vous visitez Silithus avant que le monde soit blesse grace a un voyage dans le temps.
--    Parlez a nouveau a Rhonormu ou Zidormi pour retourner dans le present."
--
-- It is the only one of the four that names Zidormi, and its wording also settles the polarity I
-- had backwards. The aura shows the zone BEFORE the wound, so the Wound is the default state and
-- Zidormi sends you back - exactly like Blasted Lands, and like retail since 7.3.5, where the
-- sword is there for everyone rather than being earned.
--
-- So the quest gating on phases 10 and 11 goes. It made the Wound reachable only by players who
-- had run the Antorus questline, which on this realm is nobody, and left everyone else with no way
-- to ask. Phases 12 to 15 are questline sub-states and keep theirs.
--
--   phase 10, the Wound        default, hidden only while the aura is up
--   phase 11, old Silithus     only while the aura is up
-- ==========================================================================================

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 23 AND `SourceGroup` = 1377 AND `SourceEntry` IN (10, 11);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`,
                          `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`,
                          `ConditionValue3`, `NegativeCondition`, `Comment`) VALUES
(23, 1377, 10, 0, 0, 1, 0, 255152, 0, 0, 1, 'Silithus - the Wound unless Zidormi sent the player to the past'),
(23, 1377, 11, 0, 0, 1, 0, 255152, 0, 0, 0, 'Silithus - the old zone while Zidormi has sent the player to the past');

-- The wording follows the aura: she offers the past, then the way back.
DELETE FROM `gossip_menu_option` WHERE `MenuID` = 542001;
INSERT INTO `gossip_menu_option` (`MenuID`, `OptionID`, `OptionNpc`, `OptionText`, `OptionBroadcastTextID`,
                                  `ActionMenuID`, `ActionPoiID`, `BoxCoded`, `BoxMoney`, `BoxText`,
                                  `BoxBroadcastTextID`, `VerifiedBuild`) VALUES
(542001, 0, 0, 'Montre-moi Silithus avant la Plaie.', 0, 0, 0, 0, 0, '', 0, 26972),
(542001, 1, 0, 'Ramene-moi au present.',              0, 0, 0, 0, 0, '', 0, 26972);

DELETE FROM `smart_scripts` WHERE `entryorguid` = 128607 AND `source_type` = 0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`,
                             `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`,
                             `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`,
                             `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`,
                             `target_param1`, `target_param2`, `target_param3`, `target_param4`,
                             `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(128607, 0, 0, 0, 62, 0, 100, 0, 542001, 0, 0, 0, 0, 75, 255152, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'Zidormi - show Silithus before the Wound'),
(128607, 0, 1, 0, 62, 0, 100, 0, 542001, 1, 0, 0, 0, 28, 255152, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'Zidormi - back to the present');
