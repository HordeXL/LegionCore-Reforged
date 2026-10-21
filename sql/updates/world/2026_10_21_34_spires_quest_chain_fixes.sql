-- Spires of Arak: missing quest NPCs, corpse clues, peace offering credit, Ka'alu ride at quest accept and official quest order in the storylines

-- When All Is Aligned: Reshad sends the player on Ka'alu (phase of the Adherents) when the quest is accepted
DELETE FROM `smart_scripts` WHERE `entryorguid` = 84262 AND `source_type` = 0 AND `id` = 1;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(84262, 0, 1, 0, 19, 0, 100, 0, 35704, 0, 0, 0, 85, 174121, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Reshad - On quest accepted When All Is Aligned - Invoker cast Summon Windswept Ka''alu');

-- Assassin's Mark: searching a Vigilant Outcast corpse gives the mark, each faction only clicks while on its own quest
DELETE FROM `spell_linked_spell` WHERE `spell_trigger` IN (167424, 167457) AND `spell_effect` IN (167430, 167456);
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES
(167424, 167430, 0, 'Investigating (Horde corpse) - Assassin''s Mark'),
(167457, 167456, 0, 'Investigating (Alliance corpse) - Assassin''s Mark');
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 18 AND `SourceGroup` = 83615 AND `SourceEntry` IN (167424, 167457);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(18, 83615, 167424, 0, 0, 9, 0, 35924, 0, 0, 0, 0, '', 'Vigilant Outcast - Horde corpse search requires Assassin''s Mark'),
(18, 83615, 167457, 0, 0, 9, 0, 35926, 0, 0, 0, 0, '', 'Vigilant Outcast - Alliance corpse search requires Assassin''s Mark');

-- Peace Offering: Dusk-Seer Irizzar takes the crate when a player on the quest comes close
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 83463 AND `AIName` = '';
DELETE FROM `smart_scripts` WHERE `entryorguid` = 83463 AND `source_type` = 0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(83463, 0, 0, 0, 10, 0, 100, 0, 1, 8, 5000, 5000, 85, 166515, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Dusk-Seer Irizzar - Player on Peace Offering in range - Invoker cast Deliver Peace Offering');
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 22 AND `SourceGroup` = 1 AND `SourceEntry` = 83463;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(22, 1, 83463, 0, 0, 9, 0, 35697, 0, 0, 0, 0, '', 'Dusk-Seer Irizzar - Peace Offering (Horde) taken'),
(22, 1, 83463, 0, 0, 28, 0, 35697, 0, 0, 1, 0, '', 'Dusk-Seer Irizzar - Peace Offering (Horde) not complete'),
(22, 1, 83463, 0, 1, 9, 0, 35699, 0, 0, 0, 0, '', 'Dusk-Seer Irizzar - Peace Offering (Alliance) taken'),
(22, 1, 83463, 0, 1, 28, 0, 35699, 0, 0, 1, 0, '', 'Dusk-Seer Irizzar - Peace Offering (Alliance) not complete');

-- Provisioner Galgar (Axefall), Milly Osworth (Southport), Filbert and Dilbert Tinkertoss
DELETE FROM `creature` WHERE `guid` IN (343074, 343089, 343284, 343347);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `PhaseId`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`) VALUES
(343074, 82691, 1116, 6722, 7197, 1, 1, '', -361.68, 2259.15, 27.4928, 3.49656, 180),
(343089, 82709, 1116, 6722, 7198, 1, 1, '', -1088.9, 2287.4, 6.14, 5.70, 180),
(343284, 82759, 1116, 6722, 7272, 1, 1, '', -334.8, 1273.6, 17.55, 0.80, 180),
(343347, 82788, 1116, 6722, 7274, 1, 1, '', -777.8, 1038.9, 5.89, 2.38, 180);

-- Official quest order: Admiral Taylor (Alliance) needs both garrison quests like the Horde version
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 19 AND `SourceEntry` IN (35482, 35634, 35718, 35719, 35797, 35835);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(19, 0, 35482, 0, 0, 8, 0, 35407, 0, 0, 0, 0, '', 'Admiral Taylor (Alliance) requires Under Penalty of Death'),
(19, 0, 35482, 0, 0, 8, 0, 35408, 0, 0, 0, 0, '', 'Admiral Taylor (Alliance) requires the second garrison quest'),
-- the Apexis chapter closes once both of its branches are done
(19, 0, 35634, 0, 0, 8, 0, 35258, 0, 0, 0, 0, '', 'It''s All In The Control requires Legacy of the Apexis'),
(19, 0, 35634, 0, 0, 8, 0, 35260, 0, 0, 0, 0, '', 'It''s All In The Control requires the second Apexis quest'),
(19, 0, 35634, 0, 0, 8, 0, 35273, 0, 0, 0, 0, '', 'It''s All In The Control requires Seat of Power'),
-- Southport and Axefall: each twin quest waits for both quests given at the same camp
(19, 0, 35718, 0, 0, 8, 0, 35706, 0, 0, 0, 0, '', 'Axefall twins - requires the first Mixxy quest'),
(19, 0, 35718, 0, 0, 8, 0, 35879, 0, 0, 0, 0, '', 'Axefall twins - requires the second Mixxy quest'),
(19, 0, 35719, 0, 0, 8, 0, 35716, 0, 0, 0, 0, '', 'Southport twins - requires the first Filbert quest'),
(19, 0, 35719, 0, 0, 8, 0, 35878, 0, 0, 0, 0, '', 'Southport twins - requires the second Filbert quest'),
(19, 0, 35797, 0, 0, 8, 0, 35738, 0, 0, 0, 0, '', 'Axefall final - requires the first Trixxy quest'),
(19, 0, 35797, 0, 0, 8, 0, 35766, 0, 0, 0, 0, '', 'Axefall final - requires the second Trixxy quest'),
(19, 0, 35835, 0, 0, 8, 0, 35739, 0, 0, 0, 0, '', 'Southport final - requires the first Dilbert quest'),
(19, 0, 35835, 0, 0, 8, 0, 35782, 0, 0, 0, 0, '', 'Southport final - requires the second Dilbert quest');
UPDATE `quest_template_addon` SET `NextQuestID` = 35718 WHERE `ID` = 35879;
