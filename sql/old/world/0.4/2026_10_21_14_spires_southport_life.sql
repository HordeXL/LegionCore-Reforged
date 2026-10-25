-- Spires of Arak, Southport: laborers chop or mine depending on what stands around them, one fumes outside the latrine, Lieutenant Willem paces before his footmen, a few footmen walk rounds and one sleeps
DELETE FROM `creature_equip_template` WHERE `CreatureID` = 82677 AND `ID` IN (2, 3);
INSERT INTO `creature_equip_template` (`CreatureID`, `ID`, `ItemID1`, `ItemID2`, `ItemID3`, `ItemID4`, `ItemID5`, `ItemID6`) VALUES
(82677, 2, 19015, 0, 0, 0, 0, 0),
(82677, 3, 1910, 0, 0, 0, 0, 0);
UPDATE `creature` SET `equipment_id` = 3, `orientation` = 0.4159, `MovementType` = 0, `spawndist` = 0 WHERE `guid` = 323950;
UPDATE `creature` SET `equipment_id` = 3, `orientation` = 0.2280, `MovementType` = 0, `spawndist` = 0 WHERE `guid` = 323952;
UPDATE `creature` SET `equipment_id` = 3, `orientation` = 2.1208, `MovementType` = 0, `spawndist` = 0 WHERE `guid` = 323953;
UPDATE `creature` SET `equipment_id` = 3, `orientation` = 1.0184, `MovementType` = 0, `spawndist` = 0 WHERE `guid` = 323954;
UPDATE `creature` SET `equipment_id` = 1, `orientation` = 0.5566, `MovementType` = 0, `spawndist` = 0 WHERE `guid` = 323955;
UPDATE `creature` SET `equipment_id` = 2, `orientation` = 2.5321, `MovementType` = 0, `spawndist` = 0 WHERE `guid` = 323956;
UPDATE `creature` SET `equipment_id` = 3, `orientation` = 1.8749, `MovementType` = 0, `spawndist` = 0 WHERE `guid` = 323958;
UPDATE `creature` SET `equipment_id` = 1, `orientation` = 1.4610, `MovementType` = 0, `spawndist` = 0 WHERE `guid` = 323959;
UPDATE `creature` SET `equipment_id` = 2, `orientation` = 4.2929, `MovementType` = 0, `spawndist` = 0 WHERE `guid` = 323961;
UPDATE `creature` SET `equipment_id` = 2, `orientation` = 6.1369, `MovementType` = 0, `spawndist` = 0 WHERE `guid` = 323962;
UPDATE `creature` SET `equipment_id` = 2, `orientation` = 2.4182, `MovementType` = 0, `spawndist` = 0 WHERE `guid` = 323963;
UPDATE `creature` SET `equipment_id` = 2, `orientation` = 0.6737, `MovementType` = 0, `spawndist` = 0 WHERE `guid` = 323964;
UPDATE `creature` SET `equipment_id` = 2, `orientation` = 0.7310, `MovementType` = 0, `spawndist` = 0 WHERE `guid` = 323965;
UPDATE `creature` SET `equipment_id` = 2, `orientation` = 1.7100, `MovementType` = 0, `spawndist` = 0 WHERE `guid` = 323966;
UPDATE `creature` SET `equipment_id` = 2, `orientation` = 5.2604, `MovementType` = 0, `spawndist` = 0 WHERE `guid` = 323968;
UPDATE `creature` SET `equipment_id` = 2, `orientation` = 5.9401, `MovementType` = 0, `spawndist` = 0 WHERE `guid` = 323970;
UPDATE `creature` SET `equipment_id` = 2, `orientation` = 4.0152, `MovementType` = 0, `spawndist` = 0 WHERE `guid` = 323973;
UPDATE `creature` SET `equipment_id` = 2, `orientation` = 2.4378, `MovementType` = 0, `spawndist` = 0 WHERE `guid` = 323974;
UPDATE `creature` SET `equipment_id` = 2, `orientation` = 3.6058, `MovementType` = 0, `spawndist` = 0 WHERE `guid` = 323977;
UPDATE `creature` SET `equipment_id` = 2, `orientation` = 2.2359, `MovementType` = 0, `spawndist` = 0 WHERE `guid` = 323978;
UPDATE `creature` SET `equipment_id` = 2, `orientation` = 0.0244, `MovementType` = 0, `spawndist` = 0 WHERE `guid` = 323979;
UPDATE `creature` SET `equipment_id` = 2, `orientation` = 4.7026, `MovementType` = 0, `spawndist` = 0 WHERE `guid` = 323980;
UPDATE `creature` SET `equipment_id` = 2, `orientation` = 0.5503, `MovementType` = 0, `spawndist` = 0 WHERE `guid` = 323981;
UPDATE `creature` SET `equipment_id` = 2, `orientation` = 3.0105, `MovementType` = 0, `spawndist` = 0 WHERE `guid` = 323982;
UPDATE `creature` SET `equipment_id` = 1, `orientation` = 0.7412, `MovementType` = 0, `spawndist` = 0 WHERE `guid` = 323983;
UPDATE `creature` SET `equipment_id` = 2, `orientation` = 3.8983, `MovementType` = 0, `spawndist` = 0 WHERE `guid` = 323984;
UPDATE `creature` SET `equipment_id` = 2, `orientation` = 4.6386, `MovementType` = 0, `spawndist` = 0 WHERE `guid` = 323985;
UPDATE `creature` SET `equipment_id` = 1, `orientation` = 2.4790, `MovementType` = 0, `spawndist` = 0 WHERE `guid` = 323986;
UPDATE `creature` SET `equipment_id` = 3, `orientation` = 5.1705, `MovementType` = 0, `spawndist` = 0 WHERE `guid` = 323991;
UPDATE `creature` SET `equipment_id` = 3, `orientation` = 4.9664, `MovementType` = 0, `spawndist` = 0 WHERE `guid` = 323992;
UPDATE `creature` SET `equipment_id` = 2, `orientation` = 4.6829, `MovementType` = 0, `spawndist` = 0 WHERE `guid` = 323997;
UPDATE `creature` SET `equipment_id` = 2, `orientation` = 4.7317, `MovementType` = 0, `spawndist` = 0 WHERE `guid` = 323998;
UPDATE `creature` SET `equipment_id` = 2, `orientation` = 5.6410, `MovementType` = 0, `spawndist` = 0 WHERE `guid` = 323999;
UPDATE `creature` SET `equipment_id` = 2, `orientation` = 3.9335, `MovementType` = 0, `spawndist` = 0 WHERE `guid` = 324001;
UPDATE `creature` SET `equipment_id` = 2, `orientation` = 3.8215, `MovementType` = 0, `spawndist` = 0 WHERE `guid` = 324004;
UPDATE `creature` SET `equipment_id` = 2, `orientation` = 2.4427, `MovementType` = 0, `spawndist` = 0 WHERE `guid` = 324023;
UPDATE `creature` SET `equipment_id` = 2, `orientation` = 1.6163, `MovementType` = 0, `spawndist` = 0 WHERE `guid` = 324024;
UPDATE `creature` SET `equipment_id` = 2, `orientation` = 0.2425, `MovementType` = 0, `spawndist` = 0 WHERE `guid` = 324028;
UPDATE `creature` SET `equipment_id` = 2, `orientation` = 3.3123, `MovementType` = 0, `spawndist` = 0 WHERE `guid` = 324029;
UPDATE `creature` SET `equipment_id` = 2, `orientation` = 5.6897, `MovementType` = 0, `spawndist` = 0 WHERE `guid` = 324034;
UPDATE `creature` SET `equipment_id` = 2, `orientation` = 3.9569, `MovementType` = 0, `spawndist` = 0 WHERE `guid` = 324035;
UPDATE `creature` SET `equipment_id` = 1, `orientation` = 4.6480, `MovementType` = 0, `spawndist` = 0 WHERE `guid` = 324046;
UPDATE `creature` SET `equipment_id` = 2, `orientation` = 2.7577, `MovementType` = 0, `spawndist` = 0 WHERE `guid` = 324048;
UPDATE `creature` SET `equipment_id` = 1, `orientation` = 0.6818, `MovementType` = 0, `spawndist` = 0 WHERE `guid` = 324049;
UPDATE `creature` SET `equipment_id` = 1, `orientation` = 4.0367, `MovementType` = 0, `spawndist` = 0 WHERE `guid` = 324050;
UPDATE `creature` SET `equipment_id` = 1, `orientation` = 5.9239, `MovementType` = 0, `spawndist` = 0 WHERE `guid` = 324051;
UPDATE `creature` SET `equipment_id` = 1, `orientation` = 0.0000, `MovementType` = 0, `spawndist` = 0 WHERE `guid` = 324236;
UPDATE `creature` SET `equipment_id` = 3, `orientation` = 5.3326, `MovementType` = 0, `spawndist` = 0 WHERE `guid` = 324241;
UPDATE `creature` SET `equipment_id` = 1, `orientation` = 5.8126, `MovementType` = 0, `spawndist` = 0 WHERE `guid` = 324252;
UPDATE `creature` SET `MovementType` = 2, `spawndist` = 0 WHERE `guid` IN (343394, 323996, 324008, 324026);
UPDATE `creature` SET `MovementType` = 0, `spawndist` = 0 WHERE `guid` IN (324037, 324052);
DELETE FROM `creature_addon` WHERE `guid` IN (323950, 323952, 323953, 323954, 323955, 323956, 323958, 323959, 323961, 323962, 323963, 323964, 323965, 323966, 323968, 323970, 323973, 323974, 323977, 323978, 323979, 323980, 323981, 323982, 323983, 323984, 323985, 323986, 323991, 323992, 323997, 323998, 323999, 324001, 324004, 324023, 324024, 324028, 324029, 324034, 324035, 324046, 324048, 324049, 324050, 324051, 324236, 324241, 324252, 324037, 324052, 343394, 323996, 324008, 324026);
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES
(323950, 0, 0, 0, 1, 233, ''),
(323952, 0, 0, 0, 1, 233, ''),
(323953, 0, 0, 0, 1, 233, ''),
(323954, 0, 0, 0, 1, 233, ''),
(323955, 0, 0, 0, 1, 173, ''),
(323956, 0, 0, 0, 1, 234, ''),
(323958, 0, 0, 0, 1, 233, ''),
(323959, 0, 0, 0, 1, 173, ''),
(323961, 0, 0, 0, 1, 234, ''),
(323962, 0, 0, 0, 1, 234, ''),
(323963, 0, 0, 0, 1, 234, ''),
(323964, 0, 0, 0, 1, 234, ''),
(323965, 0, 0, 0, 1, 234, ''),
(323966, 0, 0, 0, 1, 234, ''),
(323968, 0, 0, 0, 1, 234, ''),
(323970, 0, 0, 0, 1, 234, ''),
(323973, 0, 0, 0, 1, 234, ''),
(323974, 0, 0, 0, 1, 234, ''),
(323977, 0, 0, 0, 1, 234, ''),
(323978, 0, 0, 0, 1, 234, ''),
(323979, 0, 0, 0, 1, 234, ''),
(323980, 0, 0, 0, 1, 234, ''),
(323981, 0, 0, 0, 1, 234, ''),
(323982, 0, 0, 0, 1, 234, ''),
(323983, 0, 0, 0, 1, 173, ''),
(323984, 0, 0, 0, 1, 234, ''),
(323985, 0, 0, 0, 1, 234, ''),
(323986, 0, 0, 0, 1, 173, ''),
(323991, 0, 0, 0, 1, 233, ''),
(323992, 0, 0, 0, 1, 233, ''),
(323997, 0, 0, 0, 1, 234, ''),
(323998, 0, 0, 0, 1, 234, ''),
(323999, 0, 0, 0, 1, 234, ''),
(324001, 0, 0, 0, 1, 234, ''),
(324004, 0, 0, 0, 1, 234, ''),
(324023, 0, 0, 0, 1, 234, ''),
(324024, 0, 0, 0, 1, 234, ''),
(324028, 0, 0, 0, 1, 234, ''),
(324029, 0, 0, 0, 1, 234, ''),
(324034, 0, 0, 0, 1, 234, ''),
(324035, 0, 0, 0, 1, 234, ''),
(324046, 0, 0, 0, 1, 173, ''),
(324048, 0, 0, 0, 1, 234, ''),
(324049, 0, 0, 0, 1, 173, ''),
(324050, 0, 0, 0, 1, 173, ''),
(324051, 0, 0, 0, 1, 173, ''),
(324236, 0, 0, 0, 1, 173, ''),
(324241, 0, 0, 0, 1, 233, ''),
(324252, 0, 0, 0, 1, 173, ''),
(324037, 0, 0, 0, 1, 0, ''),
(324052, 0, 0, 3, 1, 0, '55701'),
(343394, 1500343394, 0, 0, 1, 0, ''),
(323996, 1500323996, 0, 0, 1, 0, ''),
(324008, 1500324008, 0, 0, 1, 0, ''),
(324026, 1500324026, 0, 0, 1, 0, '');
DELETE FROM `waypoint_data` WHERE `id` IN (1500343394, 1500323996, 1500324008, 1500324026);
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `delay_chance`, `move_type`, `speed`, `action`, `action_chance`, `entry`, `wpguid`) VALUES
(1500343394, 1, -1076.40, 2258.88, 7.17, 2.7084, 3000, 0, 0, 0, 0, 100, 0, 0),
(1500343394, 2, -1071.84, 2267.78, 6.92, 2.7084, 3000, 0, 0, 0, 0, 100, 0, 0),
(1500323996, 1, -1046.28, 2250.34, 9.13, 0, 4000, 0, 0, 0, 0, 100, 0, 0),
(1500323996, 2, -1041.98, 2260.37, 8.91, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(1500323996, 3, -1048.51, 2269.11, 8.00, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(1500323996, 4, -1059.35, 2267.82, 6.89, 0, 4000, 0, 0, 0, 0, 100, 0, 0),
(1500323996, 5, -1063.65, 2257.79, 8.22, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(1500323996, 6, -1057.12, 2249.05, 8.92, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(1500324008, 1, -1059.06, 2279.73, 6.90, 0, 4000, 0, 0, 0, 0, 100, 0, 0),
(1500324008, 2, -1050.91, 2279.12, 7.19, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(1500324008, 3, -1046.30, 2285.87, 7.59, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(1500324008, 4, -1049.85, 2293.24, 7.82, 0, 4000, 0, 0, 0, 0, 100, 0, 0),
(1500324008, 5, -1058.00, 2293.85, 7.82, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(1500324008, 6, -1062.61, 2287.10, 6.96, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(1500324026, 1, -1103.91, 2268.38, 6.62, 0, 4000, 0, 0, 0, 0, 100, 0, 0),
(1500324026, 2, -1109.86, 2261.01, 8.92, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(1500324026, 3, -1106.46, 2252.17, 8.92, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(1500324026, 4, -1097.10, 2250.70, 8.92, 0, 4000, 0, 0, 0, 0, 100, 0, 0),
(1500324026, 5, -1091.15, 2258.07, 8.41, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(1500324026, 6, -1094.55, 2266.91, 6.57, 0, 0, 0, 0, 0, 0, 100, 0, 0);
DELETE FROM `creature_text` WHERE `CreatureID` = 82677 AND `GroupID` = 10;
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextID`, `MinTimer`, `MaxTimer`, `SpellID`, `comment`) VALUES
(82677, 10, 0, 'Hurry up in there!', 14, 0, 100, 0, 0, 0, 0, 0, 0, 0, 'Laborer - impatient at the latrine'),
(82677, 10, 1, 'Come on, it''s urgent!', 14, 0, 100, 0, 0, 0, 0, 0, 0, 0, 'Laborer - impatient at the latrine'),
(82677, 10, 2, 'What are you doing in there, building a second one?', 14, 0, 100, 0, 0, 0, 0, 0, 0, 0, 'Laborer - impatient at the latrine'),
(82677, 10, 3, 'Open up! I can''t hold it much longer!', 14, 0, 100, 0, 0, 0, 0, 0, 0, 0, 'Laborer - impatient at the latrine'),
(82677, 10, 4, 'Some of us have work to do, you know!', 14, 0, 100, 0, 0, 0, 0, 0, 0, 0, 'Laborer - impatient at the latrine');
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 82677 AND `GroupID` = 10;
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(82677, 10, 0, 'frFR', 'Dépêche-toi là-dedans !'),
(82677, 10, 1, 'frFR', 'Allez, ça presse !'),
(82677, 10, 2, 'frFR', 'Mais qu''est-ce que tu fabriques là-dedans, tu en construis une deuxième ?'),
(82677, 10, 3, 'frFR', 'Ouvre ! Je ne vais pas tenir longtemps !'),
(82677, 10, 4, 'frFR', 'Y en a qui ont du travail, tu sais !');
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 82677;
DELETE FROM `smart_scripts` WHERE `entryorguid` = -324037 AND `source_type` = 0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(-324037, 0, 0, 0, 1, 0, 100, 0, 2000, 4000, 4000, 8000, 10, 5, 14, 15, 22, 25, 603, 1, 0, 0, 0, 0, 0, 0, 0, 'Laborer - Out of combat - Fidget at the latrine'),
(-324037, 0, 1, 0, 1, 0, 100, 0, 6000, 12000, 20000, 35000, 1, 10, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Laborer - Out of combat - Shout at the latrine');
