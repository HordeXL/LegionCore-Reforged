-- Spires of Arak, Assault on Skettis: the darkscryers give their official briefing, captive outcasts are chained to a Ball and Chain that frees them on click, and the freed outcast runs off to the darkscryers
DELETE FROM `npc_text` WHERE `ID` = 89061;
INSERT INTO `npc_text` (`ID`, `Probability0`, `Probability1`, `Probability2`, `Probability3`, `Probability4`, `Probability5`, `Probability6`, `Probability7`, `BroadcastTextID0`, `BroadcastTextID1`, `BroadcastTextID2`, `BroadcastTextID3`, `BroadcastTextID4`, `BroadcastTextID5`, `BroadcastTextID6`, `BroadcastTextID7`, `VerifiedBuild`) VALUES
(89061, 1, 0, 0, 0, 0, 0, 0, 0, 91739, 0, 0, 0, 0, 0, 0, 0, 0);
DELETE FROM `gossip_menu` WHERE `MenuID` = 89061;
INSERT INTO `gossip_menu` (`MenuID`, `TextID`) VALUES (89061, 89061);
DELETE FROM `gossip_menu_option` WHERE `MenuID` = 89061;
INSERT INTO `gossip_menu_option` (`MenuID`, `OptionID`, `OptionNpc`, `OptionText`, `OptionBroadcastTextID`, `ActionMenuID`, `ActionPoiID`, `BoxCoded`, `BoxMoney`, `BoxText`, `BoxBroadcastTextID`, `VerifiedBuild`) VALUES
(89061, 0, 0, 'Free the outcasts, lead them in battle, escort them out to the Darkscryers, don''t let them perish. Got it.', 91742, 0, 0, 0, 0, NULL, 0, 0);
UPDATE `creature_template` SET `gossip_menu_id` = 89061, `AIName` = 'SmartAI' WHERE `entry` IN (89061, 89063);
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (85813, 89076);

DELETE FROM `smart_scripts` WHERE `entryorguid` IN (89061, 89063, 85813, 89076) AND `source_type` = 0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(89061, 0, 0, 1, 62, 0, 100, 0, 89061, 0, 0, 0, 33, 89061, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Darkscryer Raastok - On Gossip Option - Quest Credit'),
(89061, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Darkscryer Raastok - Linked - Close Gossip'),
(89063, 0, 0, 1, 62, 0, 100, 0, 89061, 0, 0, 0, 33, 89063, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Outcast Darkscryer - On Gossip Option - Quest Credit'),
(89063, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Outcast Darkscryer - Linked - Close Gossip'),
(85813, 0, 0, 0, 63, 0, 100, 0, 0, 0, 0, 0, 11, 171399, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Arakkoa Outcast - Just Created - Summon Ball and Chain'),
(85813, 0, 1, 0, 11, 0, 100, 0, 0, 0, 0, 0, 11, 171399, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Arakkoa Outcast - On Respawn - Summon Ball and Chain'),
(85813, 0, 2, 3, 38, 0, 100, 0, 1, 1, 0, 0, 59, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Arakkoa Outcast - Freed - Run'),
(85813, 0, 3, 4, 61, 0, 100, 0, 0, 0, 0, 0, 69, 1, 0, 0, 0, 0, 0, 19, 89061, 400, 0, 0, 0, 0, 0, 'Arakkoa Outcast - Freed - Run to the darkscryers'),
(85813, 0, 4, 0, 61, 0, 100, 0, 0, 0, 0, 0, 41, 15000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Arakkoa Outcast - Freed - Leave after 15 s'),
(89076, 0, 0, 1, 8, 0, 100, 0, 175795, 0, 0, 0, 33, 89076, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Ball and Chain - Freed - Quest Credit'),
(89076, 0, 1, 2, 61, 0, 100, 0, 0, 0, 0, 0, 45, 1, 1, 0, 0, 0, 0, 23, 0, 0, 0, 0, 0, 0, 0, 'Ball and Chain - Freed - Tell the outcast'),
(89076, 0, 2, 0, 61, 0, 100, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Ball and Chain - Freed - Despawn');
