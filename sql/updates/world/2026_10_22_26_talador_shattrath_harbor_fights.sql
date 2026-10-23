-- Talador, Shattrath harbor: the Iron Horde and Shadow Council attackers and the Sha'tari defenders fight in duels scattered over the plaza, each against the opponent in front of it, instead of heaping up, and only answer their own opponent or whoever attacks them

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (85489, 85495, 85501, 85490, 85966, 85498) AND `AIName` = '';
UPDATE `creature_template` SET `unit_flags` = `unit_flags` & ~0x200 WHERE `entry` IN (85489, 85495, 85501, 85490, 85966, 85498);
UPDATE `creature` SET `position_x` = 2705.11, `position_y` = 3032.96, `orientation` = 3.592, `MovementType` = 0, `spawndist` = 0 WHERE `guid` = 327484;
UPDATE `creature` SET `position_x` = 2702.86, `position_y` = 3031.87, `orientation` = 0.450, `MovementType` = 0, `spawndist` = 0 WHERE `guid` = 327487;
UPDATE `creature` SET `position_x` = 2721.35, `position_y` = 3075.66, `orientation` = 1.972, `MovementType` = 0, `spawndist` = 0 WHERE `guid` = 327628;
UPDATE `creature` SET `position_x` = 2720.37, `position_y` = 3077.96, `orientation` = 5.114, `MovementType` = 0, `spawndist` = 0 WHERE `guid` = 327461;
UPDATE `creature` SET `position_x` = 2735.73, `position_y` = 3080.38, `orientation` = 3.494, `MovementType` = 0, `spawndist` = 0 WHERE `guid` = 327463;
UPDATE `creature` SET `position_x` = 2733.38, `position_y` = 3079.52, `orientation` = 0.352, `MovementType` = 0, `spawndist` = 0 WHERE `guid` = 327468;
UPDATE `creature` SET `position_x` = 2716.14, `position_y` = 3100.18, `orientation` = 4.773, `MovementType` = 0, `spawndist` = 0 WHERE `guid` = 327638;
UPDATE `creature` SET `position_x` = 2716.30, `position_y` = 3097.68, `orientation` = 1.631, `MovementType` = 0, `spawndist` = 0 WHERE `guid` = 327469;
UPDATE `creature` SET `position_x` = 2719.61, `position_y` = 3102.61, `orientation` = 4.826, `MovementType` = 0, `spawndist` = 0 WHERE `guid` = 327467;
UPDATE `creature` SET `position_x` = 2719.90, `position_y` = 3100.13, `orientation` = 1.684, `MovementType` = 0, `spawndist` = 0 WHERE `guid` = 327492;
UPDATE `creature` SET `position_x` = 2729.63, `position_y` = 3099.44, `orientation` = 4.691, `MovementType` = 0, `spawndist` = 0 WHERE `guid` = 327464;
UPDATE `creature` SET `position_x` = 2729.57, `position_y` = 3096.94, `orientation` = 1.549, `MovementType` = 0, `spawndist` = 0 WHERE `guid` = 327460;
UPDATE `creature` SET `position_x` = 2734.98, `position_y` = 3059.75, `orientation` = 5.684, `MovementType` = 0, `spawndist` = 0 WHERE `guid` = 327473;
UPDATE `creature` SET `position_x` = 2737.05, `position_y` = 3058.34, `orientation` = 2.542, `MovementType` = 0, `spawndist` = 0 WHERE `guid` = 327478;
UPDATE `creature` SET `position_x` = 2736.54, `position_y` = 3048.42, `orientation` = 3.729, `MovementType` = 0, `spawndist` = 0 WHERE `guid` = 327625;
UPDATE `creature` SET `position_x` = 2734.46, `position_y` = 3047.03, `orientation` = 0.587, `MovementType` = 0, `spawndist` = 0 WHERE `guid` = 327477;
UPDATE `creature` SET `position_x` = 2708.16, `position_y` = 3086.71, `orientation` = 5.279, `MovementType` = 0, `spawndist` = 0 WHERE `guid` = 327516;
UPDATE `creature` SET `position_x` = 2709.50, `position_y` = 3084.61, `orientation` = 2.138, `MovementType` = 0, `spawndist` = 0 WHERE `guid` = 327626;
UPDATE `creature` SET `position_x` = 2705.92, `position_y` = 3075.17, `orientation` = 4.968, `MovementType` = 0, `spawndist` = 0 WHERE `guid` = 327639;
UPDATE `creature` SET `position_x` = 2706.55, `position_y` = 3072.75, `orientation` = 1.826, `MovementType` = 0, `spawndist` = 0 WHERE `guid` = 327475;
UPDATE `creature` SET `position_x` = 2706.20, `position_y` = 3057.90, `orientation` = 1.284, `MovementType` = 0, `spawndist` = 0 WHERE `guid` = 327634;
UPDATE `creature` SET `position_x` = 2706.90, `position_y` = 3060.30, `orientation` = 4.425, `MovementType` = 0, `spawndist` = 0 WHERE `guid` = 327483;
UPDATE `creature` SET `position_x` = 2698.76, `position_y` = 3048.47, `orientation` = 4.265, `MovementType` = 0, `spawndist` = 0 WHERE `guid` = 327523;
UPDATE `creature` SET `position_x` = 2697.68, `position_y` = 3046.21, `orientation` = 1.124, `MovementType` = 0, `spawndist` = 0 WHERE `guid` = 327481;
UPDATE `creature` SET `position_x` = 2731.57, `position_y` = 3089.12, `orientation` = 5.500, `MovementType` = 0, `spawndist` = 0 WHERE `guid` = 327471;
UPDATE `creature` SET `position_x` = 2733.34, `position_y` = 3087.35, `orientation` = 2.358, `MovementType` = 0, `spawndist` = 0 WHERE `guid` = 327465;
UPDATE `creature` SET `position_x` = 2716.17, `position_y` = 3046.98, `orientation` = 6.066, `MovementType` = 0, `spawndist` = 0 WHERE `guid` = 327454;
UPDATE `creature` SET `position_x` = 2718.62, `position_y` = 3046.44, `orientation` = 2.924, `MovementType` = 0, `spawndist` = 0 WHERE `guid` = 327462;
UPDATE `creature` SET `position_x` = 2728.74, `position_y` = 3108.16, `orientation` = 2.395, `MovementType` = 0, `spawndist` = 0 WHERE `guid` = 327453;
UPDATE `creature` SET `position_x` = 2726.91, `position_y` = 3109.85, `orientation` = 5.536, `MovementType` = 0, `spawndist` = 0 WHERE `guid` = 327451;
UPDATE `creature` SET `position_x` = 2721.07, `position_y` = 3062.89, `orientation` = 4.955, `MovementType` = 0, `spawndist` = 0 WHERE `guid` = 327629;
UPDATE `creature` SET `position_x` = 2721.67, `position_y` = 3060.46, `orientation` = 1.814, `MovementType` = 0, `spawndist` = 0 WHERE `guid` = 327527;
UPDATE `creature` SET `position_x` = 2720.76, `position_y` = 3030.37, `orientation` = 2.279, `MovementType` = 0, `spawndist` = 0 WHERE `guid` = 327482;
UPDATE `creature` SET `position_x` = 2719.14, `position_y` = 3032.26, `orientation` = 5.421, `MovementType` = 0, `spawndist` = 0 WHERE `guid` = 327632;
UPDATE `creature` SET `position_x` = 2736.77, `position_y` = 3072.17, `orientation` = 3.994, `MovementType` = 0, `spawndist` = 0 WHERE `guid` = 327472;
UPDATE `creature` SET `position_x` = 2735.13, `position_y` = 3070.29, `orientation` = 0.853, `MovementType` = 0, `spawndist` = 0 WHERE `guid` = 327633;
UPDATE `creature` SET `position_x` = 2734.46, `position_y` = 3037.93, `orientation` = 2.147, `MovementType` = 0, `spawndist` = 0 WHERE `guid` = 327624;
UPDATE `creature` SET `position_x` = 2733.10, `position_y` = 3040.02, `orientation` = 5.288, `MovementType` = 0, `spawndist` = 0 WHERE `guid` = 327525;
UPDATE `creature_addon` SET `path_id` = 0 WHERE `guid` IN (327484, 327487, 327628, 327461, 327463, 327468, 327638, 327469, 327467, 327492, 327464, 327460, 327473, 327478, 327625, 327477, 327516, 327626, 327639, 327475, 327634, 327483, 327523, 327481, 327471, 327465, 327454, 327462, 327453, 327451, 327629, 327527, 327482, 327632, 327472, 327633, 327624, 327525);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (-327461, -327468, -327470, -327477, -327483, -327487, -327492, -327494, -327515, -327527, -327626, -327632, -327454, -327455, -327458, -327464, -327471, -327472, -327473, -327484, -327488, -327489, -327522, -327624, -327627, -327630, -327634, -327640, -327451, -327456, -327460, -327462, -327465, -327469, -327475, -327478, -327480, -327481, -327490, -327491, -327495, -327525, -327633, -327635, -327636, -327463, -327482, -327511, -327516, -327523, -327623, -327628, -327629, -327631, -327638, -327641, -327643, -327474, -327485, -327498, -327499, -327500, -327503, -327453, -327457, -327467, -327486, -327512, -327517, -327521, -327625, -327639, -327642) AND `source_type` = 0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(-327484, 0, 1, 0, 1, 0, 100, 0, 1663, 2663, 5000, 8000, 49, 0, 0, 0, 0, 0, 0, 10, 327487, 85489, 0, 0, 0, 0, 0, 'Shattrath harbor - Out of combat - Attack the opponent in front'),
(-327487, 0, 1, 0, 1, 0, 100, 0, 2941, 3941, 5000, 8000, 49, 0, 0, 0, 0, 0, 0, 10, 327484, 85490, 0, 0, 0, 0, 0, 'Shattrath harbor - Out of combat - Attack the opponent in front'),
(-327628, 0, 1, 0, 1, 0, 100, 0, 1308, 2308, 5000, 8000, 49, 0, 0, 0, 0, 0, 0, 10, 327461, 85489, 0, 0, 0, 0, 0, 'Shattrath harbor - Out of combat - Attack the opponent in front'),
(-327461, 0, 1, 0, 1, 0, 100, 0, 1808, 2808, 5000, 8000, 49, 0, 0, 0, 0, 0, 0, 10, 327628, 85498, 0, 0, 0, 0, 0, 'Shattrath harbor - Out of combat - Attack the opponent in front'),
(-327463, 0, 1, 0, 1, 0, 100, 0, 2333, 3333, 5000, 8000, 49, 0, 0, 0, 0, 0, 0, 10, 327468, 85489, 0, 0, 0, 0, 0, 'Shattrath harbor - Out of combat - Attack the opponent in front'),
(-327468, 0, 1, 0, 1, 0, 100, 0, 1098, 2098, 5000, 8000, 49, 0, 0, 0, 0, 0, 0, 10, 327463, 85498, 0, 0, 0, 0, 0, 'Shattrath harbor - Out of combat - Attack the opponent in front'),
(-327638, 0, 1, 0, 1, 0, 100, 0, 1148, 2148, 5000, 8000, 49, 0, 0, 0, 0, 0, 0, 10, 327469, 85495, 0, 0, 0, 0, 0, 'Shattrath harbor - Out of combat - Attack the opponent in front'),
(-327469, 0, 1, 0, 1, 0, 100, 0, 2681, 3681, 5000, 8000, 49, 0, 0, 0, 0, 0, 0, 10, 327638, 85498, 0, 0, 0, 0, 0, 'Shattrath harbor - Out of combat - Attack the opponent in front'),
(-327467, 0, 1, 0, 1, 0, 100, 0, 2097, 3097, 5000, 8000, 49, 0, 0, 0, 0, 0, 0, 10, 327492, 85489, 0, 0, 0, 0, 0, 'Shattrath harbor - Out of combat - Attack the opponent in front'),
(-327492, 0, 1, 0, 1, 0, 100, 0, 1192, 2192, 5000, 8000, 49, 0, 0, 0, 0, 0, 0, 10, 327467, 85966, 0, 0, 0, 0, 0, 'Shattrath harbor - Out of combat - Attack the opponent in front'),
(-327464, 0, 1, 0, 1, 0, 100, 0, 1748, 2748, 5000, 8000, 49, 0, 0, 0, 0, 0, 0, 10, 327460, 85495, 0, 0, 0, 0, 0, 'Shattrath harbor - Out of combat - Attack the opponent in front'),
(-327460, 0, 1, 0, 1, 0, 100, 0, 2193, 3193, 5000, 8000, 49, 0, 0, 0, 0, 0, 0, 10, 327464, 85490, 0, 0, 0, 0, 0, 'Shattrath harbor - Out of combat - Attack the opponent in front'),
(-327473, 0, 1, 0, 1, 0, 100, 0, 1118, 2118, 5000, 8000, 49, 0, 0, 0, 0, 0, 0, 10, 327478, 85495, 0, 0, 0, 0, 0, 'Shattrath harbor - Out of combat - Attack the opponent in front'),
(-327478, 0, 1, 0, 1, 0, 100, 0, 2863, 3863, 5000, 8000, 49, 0, 0, 0, 0, 0, 0, 10, 327473, 85490, 0, 0, 0, 0, 0, 'Shattrath harbor - Out of combat - Attack the opponent in front'),
(-327625, 0, 1, 0, 1, 0, 100, 0, 2039, 3039, 5000, 8000, 49, 0, 0, 0, 0, 0, 0, 10, 327477, 85489, 0, 0, 0, 0, 0, 'Shattrath harbor - Out of combat - Attack the opponent in front'),
(-327477, 0, 1, 0, 1, 0, 100, 0, 1439, 2439, 5000, 8000, 49, 0, 0, 0, 0, 0, 0, 10, 327625, 85966, 0, 0, 0, 0, 0, 'Shattrath harbor - Out of combat - Attack the opponent in front'),
(-327516, 0, 1, 0, 1, 0, 100, 0, 1076, 2076, 5000, 8000, 49, 0, 0, 0, 0, 0, 0, 10, 327626, 85489, 0, 0, 0, 0, 0, 'Shattrath harbor - Out of combat - Attack the opponent in front'),
(-327626, 0, 1, 0, 1, 0, 100, 0, 1176, 2176, 5000, 8000, 49, 0, 0, 0, 0, 0, 0, 10, 327516, 85498, 0, 0, 0, 0, 0, 'Shattrath harbor - Out of combat - Attack the opponent in front'),
(-327639, 0, 1, 0, 1, 0, 100, 0, 1888, 2888, 5000, 8000, 49, 0, 0, 0, 0, 0, 0, 10, 327475, 85495, 0, 0, 0, 0, 0, 'Shattrath harbor - Out of combat - Attack the opponent in front'),
(-327475, 0, 1, 0, 1, 0, 100, 0, 1856, 2856, 5000, 8000, 49, 0, 0, 0, 0, 0, 0, 10, 327639, 85966, 0, 0, 0, 0, 0, 'Shattrath harbor - Out of combat - Attack the opponent in front'),
(-327634, 0, 1, 0, 1, 0, 100, 0, 1143, 2143, 5000, 8000, 49, 0, 0, 0, 0, 0, 0, 10, 327483, 85489, 0, 0, 0, 0, 0, 'Shattrath harbor - Out of combat - Attack the opponent in front'),
(-327483, 0, 1, 0, 1, 0, 100, 0, 1492, 2492, 5000, 8000, 49, 0, 0, 0, 0, 0, 0, 10, 327634, 85490, 0, 0, 0, 0, 0, 'Shattrath harbor - Out of combat - Attack the opponent in front'),
(-327523, 0, 1, 0, 1, 0, 100, 0, 1185, 2185, 5000, 8000, 49, 0, 0, 0, 0, 0, 0, 10, 327481, 85495, 0, 0, 0, 0, 0, 'Shattrath harbor - Out of combat - Attack the opponent in front'),
(-327481, 0, 1, 0, 1, 0, 100, 0, 2128, 3128, 5000, 8000, 49, 0, 0, 0, 0, 0, 0, 10, 327523, 85498, 0, 0, 0, 0, 0, 'Shattrath harbor - Out of combat - Attack the opponent in front'),
(-327471, 0, 1, 0, 1, 0, 100, 0, 1869, 2869, 5000, 8000, 49, 0, 0, 0, 0, 0, 0, 10, 327465, 85495, 0, 0, 0, 0, 0, 'Shattrath harbor - Out of combat - Attack the opponent in front'),
(-327465, 0, 1, 0, 1, 0, 100, 0, 1121, 2121, 5000, 8000, 49, 0, 0, 0, 0, 0, 0, 10, 327471, 85490, 0, 0, 0, 0, 0, 'Shattrath harbor - Out of combat - Attack the opponent in front'),
(-327454, 0, 1, 0, 1, 0, 100, 0, 2693, 3693, 5000, 8000, 49, 0, 0, 0, 0, 0, 0, 10, 327462, 85495, 0, 0, 0, 0, 0, 'Shattrath harbor - Out of combat - Attack the opponent in front'),
(-327462, 0, 1, 0, 1, 0, 100, 0, 2158, 3158, 5000, 8000, 49, 0, 0, 0, 0, 0, 0, 10, 327454, 85490, 0, 0, 0, 0, 0, 'Shattrath harbor - Out of combat - Attack the opponent in front'),
(-327453, 0, 1, 0, 1, 0, 100, 0, 1253, 2253, 5000, 8000, 49, 0, 0, 0, 0, 0, 0, 10, 327451, 85495, 0, 0, 0, 0, 0, 'Shattrath harbor - Out of combat - Attack the opponent in front'),
(-327451, 0, 1, 0, 1, 0, 100, 0, 2940, 3940, 5000, 8000, 49, 0, 0, 0, 0, 0, 0, 10, 327453, 85966, 0, 0, 0, 0, 0, 'Shattrath harbor - Out of combat - Attack the opponent in front'),
(-327629, 0, 1, 0, 1, 0, 100, 0, 1457, 2457, 5000, 8000, 49, 0, 0, 0, 0, 0, 0, 10, 327527, 85489, 0, 0, 0, 0, 0, 'Shattrath harbor - Out of combat - Attack the opponent in front'),
(-327527, 0, 1, 0, 1, 0, 100, 0, 2291, 3291, 5000, 8000, 49, 0, 0, 0, 0, 0, 0, 10, 327629, 85498, 0, 0, 0, 0, 0, 'Shattrath harbor - Out of combat - Attack the opponent in front'),
(-327482, 0, 1, 0, 1, 0, 100, 0, 2284, 3284, 5000, 8000, 49, 0, 0, 0, 0, 0, 0, 10, 327632, 85489, 0, 0, 0, 0, 0, 'Shattrath harbor - Out of combat - Attack the opponent in front'),
(-327632, 0, 1, 0, 1, 0, 100, 0, 2193, 3193, 5000, 8000, 49, 0, 0, 0, 0, 0, 0, 10, 327482, 85498, 0, 0, 0, 0, 0, 'Shattrath harbor - Out of combat - Attack the opponent in front'),
(-327472, 0, 1, 0, 1, 0, 100, 0, 2940, 3940, 5000, 8000, 49, 0, 0, 0, 0, 0, 0, 10, 327633, 85495, 0, 0, 0, 0, 0, 'Shattrath harbor - Out of combat - Attack the opponent in front'),
(-327633, 0, 1, 0, 1, 0, 100, 0, 1126, 2126, 5000, 8000, 49, 0, 0, 0, 0, 0, 0, 10, 327472, 85490, 0, 0, 0, 0, 0, 'Shattrath harbor - Out of combat - Attack the opponent in front'),
(-327624, 0, 1, 0, 1, 0, 100, 0, 2181, 3181, 5000, 8000, 49, 0, 0, 0, 0, 0, 0, 10, 327525, 85495, 0, 0, 0, 0, 0, 'Shattrath harbor - Out of combat - Attack the opponent in front'),
(-327525, 0, 1, 0, 1, 0, 100, 0, 2199, 3199, 5000, 8000, 49, 0, 0, 0, 0, 0, 0, 10, 327624, 85490, 0, 0, 0, 0, 0, 'Shattrath harbor - Out of combat - Attack the opponent in front'),
(-327451, 0, 0, 0, 25, 0, 100, 0, 0, 0, 0, 0, 8, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Shattrath harbor - On reset - Defensive'),
(-327453, 0, 0, 0, 25, 0, 100, 0, 0, 0, 0, 0, 8, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Shattrath harbor - On reset - Defensive'),
(-327454, 0, 0, 0, 25, 0, 100, 0, 0, 0, 0, 0, 8, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Shattrath harbor - On reset - Defensive'),
(-327455, 0, 0, 0, 25, 0, 100, 0, 0, 0, 0, 0, 8, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Shattrath harbor - On reset - Defensive'),
(-327456, 0, 0, 0, 25, 0, 100, 0, 0, 0, 0, 0, 8, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Shattrath harbor - On reset - Defensive'),
(-327457, 0, 0, 0, 25, 0, 100, 0, 0, 0, 0, 0, 8, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Shattrath harbor - On reset - Defensive'),
(-327458, 0, 0, 0, 25, 0, 100, 0, 0, 0, 0, 0, 8, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Shattrath harbor - On reset - Defensive'),
(-327460, 0, 0, 0, 25, 0, 100, 0, 0, 0, 0, 0, 8, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Shattrath harbor - On reset - Defensive'),
(-327461, 0, 0, 0, 25, 0, 100, 0, 0, 0, 0, 0, 8, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Shattrath harbor - On reset - Defensive'),
(-327462, 0, 0, 0, 25, 0, 100, 0, 0, 0, 0, 0, 8, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Shattrath harbor - On reset - Defensive'),
(-327463, 0, 0, 0, 25, 0, 100, 0, 0, 0, 0, 0, 8, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Shattrath harbor - On reset - Defensive'),
(-327464, 0, 0, 0, 25, 0, 100, 0, 0, 0, 0, 0, 8, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Shattrath harbor - On reset - Defensive'),
(-327465, 0, 0, 0, 25, 0, 100, 0, 0, 0, 0, 0, 8, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Shattrath harbor - On reset - Defensive'),
(-327467, 0, 0, 0, 25, 0, 100, 0, 0, 0, 0, 0, 8, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Shattrath harbor - On reset - Defensive'),
(-327468, 0, 0, 0, 25, 0, 100, 0, 0, 0, 0, 0, 8, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Shattrath harbor - On reset - Defensive'),
(-327469, 0, 0, 0, 25, 0, 100, 0, 0, 0, 0, 0, 8, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Shattrath harbor - On reset - Defensive'),
(-327470, 0, 0, 0, 25, 0, 100, 0, 0, 0, 0, 0, 8, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Shattrath harbor - On reset - Defensive'),
(-327471, 0, 0, 0, 25, 0, 100, 0, 0, 0, 0, 0, 8, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Shattrath harbor - On reset - Defensive'),
(-327472, 0, 0, 0, 25, 0, 100, 0, 0, 0, 0, 0, 8, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Shattrath harbor - On reset - Defensive'),
(-327473, 0, 0, 0, 25, 0, 100, 0, 0, 0, 0, 0, 8, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Shattrath harbor - On reset - Defensive'),
(-327474, 0, 0, 0, 25, 0, 100, 0, 0, 0, 0, 0, 8, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Shattrath harbor - On reset - Defensive'),
(-327475, 0, 0, 0, 25, 0, 100, 0, 0, 0, 0, 0, 8, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Shattrath harbor - On reset - Defensive'),
(-327477, 0, 0, 0, 25, 0, 100, 0, 0, 0, 0, 0, 8, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Shattrath harbor - On reset - Defensive'),
(-327478, 0, 0, 0, 25, 0, 100, 0, 0, 0, 0, 0, 8, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Shattrath harbor - On reset - Defensive'),
(-327480, 0, 0, 0, 25, 0, 100, 0, 0, 0, 0, 0, 8, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Shattrath harbor - On reset - Defensive'),
(-327481, 0, 0, 0, 25, 0, 100, 0, 0, 0, 0, 0, 8, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Shattrath harbor - On reset - Defensive'),
(-327482, 0, 0, 0, 25, 0, 100, 0, 0, 0, 0, 0, 8, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Shattrath harbor - On reset - Defensive'),
(-327483, 0, 0, 0, 25, 0, 100, 0, 0, 0, 0, 0, 8, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Shattrath harbor - On reset - Defensive'),
(-327484, 0, 0, 0, 25, 0, 100, 0, 0, 0, 0, 0, 8, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Shattrath harbor - On reset - Defensive'),
(-327485, 0, 0, 0, 25, 0, 100, 0, 0, 0, 0, 0, 8, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Shattrath harbor - On reset - Defensive'),
(-327487, 0, 0, 0, 25, 0, 100, 0, 0, 0, 0, 0, 8, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Shattrath harbor - On reset - Defensive'),
(-327488, 0, 0, 0, 25, 0, 100, 0, 0, 0, 0, 0, 8, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Shattrath harbor - On reset - Defensive'),
(-327491, 0, 0, 0, 25, 0, 100, 0, 0, 0, 0, 0, 8, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Shattrath harbor - On reset - Defensive'),
(-327492, 0, 0, 0, 25, 0, 100, 0, 0, 0, 0, 0, 8, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Shattrath harbor - On reset - Defensive'),
(-327494, 0, 0, 0, 25, 0, 100, 0, 0, 0, 0, 0, 8, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Shattrath harbor - On reset - Defensive'),
(-327498, 0, 0, 0, 25, 0, 100, 0, 0, 0, 0, 0, 8, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Shattrath harbor - On reset - Defensive'),
(-327499, 0, 0, 0, 25, 0, 100, 0, 0, 0, 0, 0, 8, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Shattrath harbor - On reset - Defensive'),
(-327500, 0, 0, 0, 25, 0, 100, 0, 0, 0, 0, 0, 8, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Shattrath harbor - On reset - Defensive'),
(-327503, 0, 0, 0, 25, 0, 100, 0, 0, 0, 0, 0, 8, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Shattrath harbor - On reset - Defensive'),
(-327511, 0, 0, 0, 25, 0, 100, 0, 0, 0, 0, 0, 8, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Shattrath harbor - On reset - Defensive'),
(-327512, 0, 0, 0, 25, 0, 100, 0, 0, 0, 0, 0, 8, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Shattrath harbor - On reset - Defensive'),
(-327515, 0, 0, 0, 25, 0, 100, 0, 0, 0, 0, 0, 8, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Shattrath harbor - On reset - Defensive'),
(-327516, 0, 0, 0, 25, 0, 100, 0, 0, 0, 0, 0, 8, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Shattrath harbor - On reset - Defensive'),
(-327517, 0, 0, 0, 25, 0, 100, 0, 0, 0, 0, 0, 8, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Shattrath harbor - On reset - Defensive'),
(-327521, 0, 0, 0, 25, 0, 100, 0, 0, 0, 0, 0, 8, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Shattrath harbor - On reset - Defensive'),
(-327522, 0, 0, 0, 25, 0, 100, 0, 0, 0, 0, 0, 8, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Shattrath harbor - On reset - Defensive'),
(-327523, 0, 0, 0, 25, 0, 100, 0, 0, 0, 0, 0, 8, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Shattrath harbor - On reset - Defensive'),
(-327525, 0, 0, 0, 25, 0, 100, 0, 0, 0, 0, 0, 8, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Shattrath harbor - On reset - Defensive'),
(-327527, 0, 0, 0, 25, 0, 100, 0, 0, 0, 0, 0, 8, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Shattrath harbor - On reset - Defensive'),
(-327623, 0, 0, 0, 25, 0, 100, 0, 0, 0, 0, 0, 8, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Shattrath harbor - On reset - Defensive'),
(-327624, 0, 0, 0, 25, 0, 100, 0, 0, 0, 0, 0, 8, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Shattrath harbor - On reset - Defensive'),
(-327625, 0, 0, 0, 25, 0, 100, 0, 0, 0, 0, 0, 8, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Shattrath harbor - On reset - Defensive'),
(-327626, 0, 0, 0, 25, 0, 100, 0, 0, 0, 0, 0, 8, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Shattrath harbor - On reset - Defensive'),
(-327627, 0, 0, 0, 25, 0, 100, 0, 0, 0, 0, 0, 8, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Shattrath harbor - On reset - Defensive'),
(-327628, 0, 0, 0, 25, 0, 100, 0, 0, 0, 0, 0, 8, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Shattrath harbor - On reset - Defensive'),
(-327629, 0, 0, 0, 25, 0, 100, 0, 0, 0, 0, 0, 8, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Shattrath harbor - On reset - Defensive'),
(-327630, 0, 0, 0, 25, 0, 100, 0, 0, 0, 0, 0, 8, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Shattrath harbor - On reset - Defensive'),
(-327631, 0, 0, 0, 25, 0, 100, 0, 0, 0, 0, 0, 8, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Shattrath harbor - On reset - Defensive'),
(-327632, 0, 0, 0, 25, 0, 100, 0, 0, 0, 0, 0, 8, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Shattrath harbor - On reset - Defensive'),
(-327633, 0, 0, 0, 25, 0, 100, 0, 0, 0, 0, 0, 8, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Shattrath harbor - On reset - Defensive'),
(-327634, 0, 0, 0, 25, 0, 100, 0, 0, 0, 0, 0, 8, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Shattrath harbor - On reset - Defensive'),
(-327635, 0, 0, 0, 25, 0, 100, 0, 0, 0, 0, 0, 8, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Shattrath harbor - On reset - Defensive'),
(-327636, 0, 0, 0, 25, 0, 100, 0, 0, 0, 0, 0, 8, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Shattrath harbor - On reset - Defensive'),
(-327638, 0, 0, 0, 25, 0, 100, 0, 0, 0, 0, 0, 8, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Shattrath harbor - On reset - Defensive'),
(-327639, 0, 0, 0, 25, 0, 100, 0, 0, 0, 0, 0, 8, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Shattrath harbor - On reset - Defensive'),
(-327640, 0, 0, 0, 25, 0, 100, 0, 0, 0, 0, 0, 8, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Shattrath harbor - On reset - Defensive'),
(-327643, 0, 0, 0, 25, 0, 100, 0, 0, 0, 0, 0, 8, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Shattrath harbor - On reset - Defensive');
