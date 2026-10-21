-- Spires of Arak, Bloodmane camp: the saberon spar or face off out of combat, and the Bonereavers prowl
UPDATE `creature` SET `MovementType` = 1, `spawndist` = 8 WHERE `id` = 85896 AND `map` = 1116;
UPDATE `creature` SET `orientation` = 6.2003 WHERE `guid` = 11297056;
UPDATE `creature` SET `orientation` = 3.0587 WHERE `guid` = 11297059;
UPDATE `creature` SET `orientation` = 4.7421 WHERE `guid` = 11297057;
UPDATE `creature` SET `orientation` = 1.6005 WHERE `guid` = 11297058;
UPDATE `creature` SET `orientation` = 2.1958 WHERE `guid` = 11297064;
UPDATE `creature` SET `orientation` = 5.3374 WHERE `guid` = 11297065;
UPDATE `creature` SET `orientation` = 6.0437 WHERE `guid` = 11297067;
UPDATE `creature` SET `orientation` = 2.9021 WHERE `guid` = 11297068;
UPDATE `creature` SET `orientation` = 2.7301 WHERE `guid` = 11297070;
UPDATE `creature` SET `orientation` = 5.8717 WHERE `guid` = 11297100;
UPDATE `creature` SET `orientation` = 5.5384 WHERE `guid` = 11297075;
UPDATE `creature` SET `orientation` = 2.3968 WHERE `guid` = 324166;
UPDATE `creature` SET `orientation` = 0.5269 WHERE `guid` = 11297076;
UPDATE `creature` SET `orientation` = 3.6685 WHERE `guid` = 11297077;
UPDATE `creature` SET `orientation` = 3.1634 WHERE `guid` = 11297079;
UPDATE `creature` SET `orientation` = 0.0218 WHERE `guid` = 11297082;
UPDATE `creature` SET `orientation` = 1.9878 WHERE `guid` = 11297080;
UPDATE `creature` SET `orientation` = 5.1294 WHERE `guid` = 11297081;
UPDATE `creature` SET `orientation` = 3.9794 WHERE `guid` = 11297089;
UPDATE `creature` SET `orientation` = 0.8378 WHERE `guid` = 11297114;
UPDATE `creature` SET `orientation` = 4.8918 WHERE `guid` = 11297097;
UPDATE `creature` SET `orientation` = 1.7502 WHERE `guid` = 11297111;
UPDATE `creature` SET `orientation` = 0.0000 WHERE `guid` = 11297103;
UPDATE `creature` SET `orientation` = 0.0000 WHERE `guid` = 324201;
UPDATE `creature` SET `orientation` = 4.4613 WHERE `guid` = 11297113;
UPDATE `creature` SET `orientation` = 1.3197 WHERE `guid` = 324165;
UPDATE `creature` SET `orientation` = 4.7810 WHERE `guid` = 11297115;
UPDATE `creature` SET `orientation` = 1.6394 WHERE `guid` = 11297126;
UPDATE `creature` SET `orientation` = 1.1769 WHERE `guid` = 11297123;
UPDATE `creature` SET `orientation` = 4.3185 WHERE `guid` = 324177;
UPDATE `creature` SET `orientation` = 2.8648 WHERE `guid` = 324130;
UPDATE `creature` SET `orientation` = 6.0064 WHERE `guid` = 324133;
UPDATE `creature` SET `orientation` = 4.2215 WHERE `guid` = 324189;
UPDATE `creature` SET `orientation` = 1.0799 WHERE `guid` = 324195;
UPDATE `creature` SET `orientation` = 0.3438 WHERE `guid` = 324191;
UPDATE `creature` SET `orientation` = 3.4853 WHERE `guid` = 324194;
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (82938, 82944, 82946, 82947, 85892, 85897, 85900, 86161);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (-11297056, -11297059, -11297057, -11297058, -11297064, -11297065, -11297070, -11297100, -11297075, -324166, -11297076, -11297077, -11297080, -11297081, -11297097, -11297111, -11297103, -324201, -11297113, -324165, -11297115, -11297126, -324189, -324195, -324191, -324194) AND `source_type` = 0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(-11297056, 0, 0, 0, 1, 0, 100, 0, 576, 2076, 2500, 5000, 10, 36, 37, 54, 36, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Bloodmane camp - Out of combat - Sparring emote'),
(-11297059, 0, 0, 0, 1, 0, 100, 0, 878, 2378, 2500, 5000, 10, 36, 37, 54, 36, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Bloodmane camp - Out of combat - Sparring emote'),
(-11297057, 0, 0, 0, 1, 0, 100, 0, 2222, 3722, 2500, 5000, 10, 36, 37, 54, 36, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Bloodmane camp - Out of combat - Sparring emote'),
(-11297058, 0, 0, 0, 1, 0, 100, 0, 1839, 3339, 2500, 5000, 10, 36, 37, 54, 36, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Bloodmane camp - Out of combat - Sparring emote'),
(-11297064, 0, 0, 0, 1, 0, 100, 0, 1787, 3287, 2500, 5000, 10, 36, 37, 54, 36, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Bloodmane camp - Out of combat - Sparring emote'),
(-11297065, 0, 0, 0, 1, 0, 100, 0, 1454, 2954, 2500, 5000, 10, 36, 37, 54, 36, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Bloodmane camp - Out of combat - Sparring emote'),
(-11297070, 0, 0, 0, 1, 0, 100, 0, 2506, 4006, 2500, 5000, 10, 36, 37, 54, 36, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Bloodmane camp - Out of combat - Sparring emote'),
(-11297100, 0, 0, 0, 1, 0, 100, 0, 1605, 3105, 2500, 5000, 10, 36, 37, 54, 36, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Bloodmane camp - Out of combat - Sparring emote'),
(-11297075, 0, 0, 0, 1, 0, 100, 0, 1710, 3210, 2500, 5000, 10, 36, 37, 54, 36, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Bloodmane camp - Out of combat - Sparring emote'),
(-324166, 0, 0, 0, 1, 0, 100, 0, 1253, 2753, 2500, 5000, 10, 51, 463, 36, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Bloodmane camp - Out of combat - Sparring emote'),
(-11297076, 0, 0, 0, 1, 0, 100, 0, 2032, 3532, 2500, 5000, 10, 36, 37, 54, 36, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Bloodmane camp - Out of combat - Sparring emote'),
(-11297077, 0, 0, 0, 1, 0, 100, 0, 2772, 4272, 2500, 5000, 10, 36, 37, 54, 36, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Bloodmane camp - Out of combat - Sparring emote'),
(-11297080, 0, 0, 0, 1, 0, 100, 0, 2921, 4421, 2500, 5000, 10, 36, 37, 54, 36, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Bloodmane camp - Out of combat - Sparring emote'),
(-11297081, 0, 0, 0, 1, 0, 100, 0, 2767, 4267, 2500, 5000, 10, 36, 37, 54, 36, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Bloodmane camp - Out of combat - Sparring emote'),
(-11297097, 0, 0, 0, 1, 0, 100, 0, 2506, 4006, 2500, 5000, 10, 36, 37, 54, 36, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Bloodmane camp - Out of combat - Sparring emote'),
(-11297111, 0, 0, 0, 1, 0, 100, 0, 710, 2210, 2500, 5000, 10, 51, 463, 36, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Bloodmane camp - Out of combat - Sparring emote'),
(-11297103, 0, 0, 0, 1, 0, 100, 0, 1569, 3069, 2500, 5000, 10, 36, 37, 54, 36, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Bloodmane camp - Out of combat - Sparring emote'),
(-324201, 0, 0, 0, 1, 0, 100, 0, 2146, 3646, 2500, 5000, 10, 36, 37, 54, 36, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Bloodmane camp - Out of combat - Sparring emote'),
(-11297113, 0, 0, 0, 1, 0, 100, 0, 1471, 2971, 2500, 5000, 10, 51, 463, 36, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Bloodmane camp - Out of combat - Sparring emote'),
(-324165, 0, 0, 0, 1, 0, 100, 0, 599, 2099, 2500, 5000, 10, 51, 463, 36, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Bloodmane camp - Out of combat - Sparring emote'),
(-11297115, 0, 0, 0, 1, 0, 100, 0, 2604, 4104, 2500, 5000, 10, 51, 463, 36, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Bloodmane camp - Out of combat - Sparring emote'),
(-11297126, 0, 0, 0, 1, 0, 100, 0, 1956, 3456, 2500, 5000, 10, 36, 37, 54, 36, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Bloodmane camp - Out of combat - Sparring emote'),
(-324189, 0, 0, 0, 1, 0, 100, 0, 2436, 3936, 2500, 5000, 10, 51, 463, 36, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Bloodmane camp - Out of combat - Sparring emote'),
(-324195, 0, 0, 0, 1, 0, 100, 0, 892, 2392, 2500, 5000, 10, 36, 37, 54, 36, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Bloodmane camp - Out of combat - Sparring emote'),
(-324191, 0, 0, 0, 1, 0, 100, 0, 866, 2366, 2500, 5000, 10, 36, 37, 54, 36, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Bloodmane camp - Out of combat - Sparring emote'),
(-324194, 0, 0, 0, 1, 0, 100, 0, 2803, 4303, 2500, 5000, 10, 51, 463, 36, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Bloodmane camp - Out of combat - Sparring emote');
