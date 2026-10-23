-- Foreman Thazz'ril switches the Nagrand outpost between corral and tankworks for gold.
DELETE FROM `gossip_menu_option` WHERE `MenuID` = 16461 AND `OptionID` IN (0, 1);
INSERT INTO `gossip_menu_option` (`MenuID`, `OptionID`, `OptionNpc`, `OptionText`, `OptionBroadcastTextID`, `ActionMenuID`, `ActionPoiID`, `BoxCoded`, `BoxMoney`, `BoxText`, `BoxBroadcastTextID`, `VerifiedBuild`) VALUES
(16461, 0, 0, 'Foreman, change this building into a tankworks.', 85684, 0, 0, 0, 50000000, 'Switching the building will cost 5,000 gold. Are you sure?', 85688, 0),
(16461, 1, 0, 'Foreman, change this building into a corral.', 85696, 0, 0, 0, 50000000, 'Switching the building will cost 5,000 gold. Are you sure?', 85688, 0);

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 15 AND `SourceGroup` = 16461;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(15, 16461, 0, 0, 0, 8, 0, 34812, 0, 0, 0, 0, '', 'Foreman Thazz''ril - Tankworks option only with the corral built'),
(15, 16461, 0, 0, 0, 8, 0, 34813, 0, 0, 1, 0, '', 'Foreman Thazz''ril - Tankworks option hidden with the tankworks built'),
(15, 16461, 1, 0, 0, 8, 0, 34813, 0, 0, 0, 0, '', 'Foreman Thazz''ril - Corral option only with the tankworks built'),
(15, 16461, 1, 0, 0, 8, 0, 34812, 0, 0, 1, 0, '', 'Foreman Thazz''ril - Corral option hidden with the corral built');

DELETE FROM `smart_scripts` WHERE `entryorguid` = 80140 AND `source_type` = 0 AND `id` BETWEEN 2 AND 7;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `Difficulties`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(80140, 0, 2, 3, '', 62, 0, 100, 0, 16461, 0, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'Foreman Thazz''ril - On gossip option 0 selected - Close gossip'),
(80140, 0, 3, 4, '', 61, 0, 100, 0, 0, 0, 0, 0, 0, 211, 34812, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'Foreman Thazz''ril - On gossip option 0 selected - Clear corral tracking quest'),
(80140, 0, 4, 0, '', 61, 0, 100, 0, 0, 0, 0, 0, 0, 85, 161682, 2, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'Foreman Thazz''ril - On gossip option 0 selected - Invoker cast Workshop Tracking Event Quest Complete'),
(80140, 0, 5, 6, '', 62, 0, 100, 0, 16461, 1, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'Foreman Thazz''ril - On gossip option 1 selected - Close gossip'),
(80140, 0, 6, 7, '', 61, 0, 100, 0, 0, 0, 0, 0, 0, 211, 34813, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'Foreman Thazz''ril - On gossip option 1 selected - Clear tankworks tracking quest'),
(80140, 0, 7, 0, '', 61, 0, 100, 0, 0, 0, 0, 0, 0, 85, 161681, 2, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'Foreman Thazz''ril - On gossip option 1 selected - Invoker cast Stables Tracking Event Quest Complete');
