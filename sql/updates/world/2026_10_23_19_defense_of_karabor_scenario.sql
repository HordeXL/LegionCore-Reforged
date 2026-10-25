-- The Defense of Karabor: Exarch Akama sends the player into the private scenario on map 1277, which shows the Defense phase only; the waves at the docks and the extra copies of Arnokk now come from the script
DELETE FROM `instance_template` WHERE `map` = 1277;
INSERT INTO `instance_template` (`map`, `parent`, `script`, `allowMount`, `bonusChance`) VALUES
(1277, 1116, 'instance_defense_of_karabor', 1, 0);

DELETE FROM `spell_script_names` WHERE `spell_id` = 148425;
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(148425, 'spell_defense_of_karabor_launch');

DELETE FROM `smart_scripts` WHERE `entryorguid` = 72413 AND `source_type` = 0;
UPDATE `creature_template` SET `AIName` = '', `ScriptName` = 'npc_karabor_exarch_akama' WHERE `entry` = 72413;

DELETE FROM `gossip_menu_option` WHERE `MenuID` = 65010;
INSERT INTO `gossip_menu_option` (`MenuID`, `OptionID`, `OptionNpc`, `OptionText`, `OptionBroadcastTextID`, `ActionMenuID`, `ActionPoiID`, `BoxCoded`, `BoxMoney`, `BoxText`, `BoxBroadcastTextID`, `VerifiedBuild`) VALUES
(65010, 0, 0, 'I am ready to defend Karabor.', 0, 0, 0, 0, 0, '', 0, 0);
DELETE FROM `gossip_menu_option_locale` WHERE `MenuID` = 65010;
INSERT INTO `gossip_menu_option_locale` (`MenuID`, `OptionID`, `Locale`, `OptionText`, `BoxText`) VALUES
(65010, 0, 'frFR', 'Je suis prêt à défendre Karabor.', '');

DELETE FROM `phase_definitions` WHERE `zoneId` = 6719 AND `entry` = 110;
INSERT INTO `phase_definitions` (`zoneId`, `entry`, `phasemask`, `phaseId`, `PreloadMapID`, `VisibleMapID`, `UiWorldMapAreaID`, `flags`, `comment`) VALUES
(6719, 110, 0, '3460', 0, 0, 0, 3, 'Defense of Karabor scenario');
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 23 AND `SourceGroup` = 6719 AND `SourceEntry` = 110;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(23, 6719, 110, 0, 0, 22, 0, 1277, 0, 0, 0, 0, '', 'Defense of Karabor scenario - map 1277'),
(23, 6719, 110, 0, 0, 9, 0, 33256, 0, 0, 0, 0, '', 'Defense of Karabor scenario - quest taken'),
(23, 6719, 110, 0, 1, 22, 0, 1277, 0, 0, 0, 0, '', 'Defense of Karabor scenario - map 1277'),
(23, 6719, 110, 0, 1, 28, 0, 33256, 0, 0, 0, 0, '', 'Defense of Karabor scenario - quest complete');

DELETE FROM `creature_addon` WHERE `guid` IN (357801, 357802, 357803, 357804, 357805, 357824, 357825, 357826, 357827, 357828, 357829, 357830, 357831, 357832, 357833, 357834, 357846, 357847, 357848, 357849, 357852, 357853, 357854, 357855, 357856, 357857, 357858, 357859, 357860, 357865, 357869, 357870, 357871, 357872, 357873, 357874, 357875, 357876, 357877, 357878, 357879, 385217, 385219, 385220, 385221);
DELETE FROM `creature` WHERE `map` = 1277 AND `guid` IN (357801, 357802, 357803, 357804, 357805, 357824, 357825, 357826, 357827, 357828, 357829, 357830, 357831, 357832, 357833, 357834, 357846, 357847, 357848, 357849, 357852, 357853, 357854, 357855, 357856, 357857, 357858, 357859, 357860, 357865, 357869, 357870, 357871, 357872, 357873, 357874, 357875, 357876, 357877, 357878, 357879, 385217, 385219, 385220, 385221);
