-- Spires of Arak: When All Is Aligned starts from Ka'alu's spellclick and the ride ends once the Adherents quota is met

-- The ride starts when the player clicks Ka'alu, not when the quest is accepted
DELETE FROM `smart_scripts` WHERE `entryorguid` = 84262 AND `source_type` = 0 AND `id` = 1;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 18 AND `SourceGroup` = 86254 AND `SourceEntry` = 174121;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(18, 86254, 174121, 0, 0, 9, 0, 35704, 0, 0, 0, 0, '', 'Ka''alu - Summon Windswept Ka''alu only while When All Is Aligned is in progress');

-- The idle Ka'alu stands on the same spot as the rideable one: hide it during the quest
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 23 AND `SourceGroup` = 6722 AND `SourceEntry` = 59 AND `ConditionTypeOrReference` = 9 AND `ConditionValue1` = 35704;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(23, 6722, 59, 0, 0, 9, 0, 35704, 0, 0, 1, 0, '', 'Phase 3478 - idle Ka''alu hidden while When All Is Aligned is in progress');

-- Reshad calls the extraction only once the quest is complete, and checks again every 2 seconds
UPDATE `smart_scripts` SET `event_flags` = 0, `event_param3` = 2000, `event_param4` = 2000, `comment` = 'Reshad - Player has completed When All Is Aligned - Set Data 3 on Elder Dread Raven' WHERE `entryorguid` = 84306 AND `source_type` = 0 AND `id` = 0;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 22 AND `SourceGroup` = 1 AND `SourceEntry` = 84306;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(22, 1, 84306, 0, 0, 28, 0, 35704, 0, 0, 0, 0, '', 'Reshad - extraction only when When All Is Aligned is complete');

-- Extraction: Ka'alu credit, Destruction of the Terraces cast by the rider (drops phase 3767), back to Veil Terokk
DELETE FROM `smart_scripts` WHERE `entryorguid` = 8702301 AND `source_type` = 9;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(8702301, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 45, 1, 1, 0, 0, 0, 0, 19, 82902, 100, 0, 0, 0, 0, 0, 'Elder Dread Raven - Set Data 1 on Player Doppleganger'),
(8702301, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 45, 1, 1, 0, 0, 0, 0, 19, 84306, 100, 0, 0, 0, 0, 0, 'Elder Dread Raven - Set Data 1 on Reshad'),
(8702301, 9, 2, 0, 0, 0, 100, 0, 0, 0, 0, 0, 33, 82651, 0, 0, 0, 0, 0, 23, 0, 0, 0, 0, 0, 0, 0, 'Elder Dread Raven - Quest credit Ka''alu to rider'),
(8702301, 9, 3, 0, 0, 0, 100, 0, 0, 0, 0, 0, 86, 175178, 2, 23, 0, 0, 0, 23, 0, 0, 0, 0, 0, 0, 0, 'Elder Dread Raven - Rider casts Destruction of the Terraces'),
(8702301, 9, 4, 0, 0, 0, 100, 0, 0, 0, 0, 0, 62, 1116, 0, 0, 0, 0, 0, 23, 0, 0, 0, -491.53, 1862.29, 43.2343, 0, 'Elder Dread Raven - Teleport rider to Veil Terokk'),
(8702301, 9, 5, 0, 0, 0, 100, 0, 0, 0, 0, 0, 41, 2000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Elder Dread Raven - Despawn');
