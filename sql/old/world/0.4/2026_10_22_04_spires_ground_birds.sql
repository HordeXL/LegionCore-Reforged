-- Spires of Arak: the birds and bats found on the ground hover 2.5 yards up instead, some still, the others wandering a little, and land when attacked

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (79895, 82828, 84013, 85417, 88677) AND `AIName` = '';
DELETE FROM `creature_addon` WHERE `guid` IN (324454, 324486, 324493, 324496, 324560, 324671, 324687, 325619, 325630, 325656, 325685, 325709, 10542088, 324480, 324485, 324488, 324489, 324494, 324495, 324506, 324507, 324613, 324622, 324675, 324679, 324700, 325617, 325621, 325629, 325631, 325649, 325662, 325683, 325692, 325704, 326246, 326337, 326144, 326194, 326204, 326219) AND `path_id` <> 0;
UPDATE `creature` SET `MovementType` = 0, `spawndist` = 0, `position_z` = 15.88 WHERE `guid` = 324454;
UPDATE `creature` SET `MovementType` = 0, `spawndist` = 0, `position_z` = 25.33 WHERE `guid` = 324486;
UPDATE `creature` SET `MovementType` = 0, `spawndist` = 0, `position_z` = 26.62 WHERE `guid` = 324493;
UPDATE `creature` SET `MovementType` = 0, `spawndist` = 0, `position_z` = 32.71 WHERE `guid` = 324496;
UPDATE `creature` SET `MovementType` = 0, `spawndist` = 0, `position_z` = 15.32 WHERE `guid` = 324560;
UPDATE `creature` SET `MovementType` = 0, `spawndist` = 0, `position_z` = 29.76 WHERE `guid` = 324671;
UPDATE `creature` SET `MovementType` = 0, `spawndist` = 0, `position_z` = 16.62 WHERE `guid` = 324687;
UPDATE `creature` SET `MovementType` = 0, `spawndist` = 0, `position_z` = 15.32 WHERE `guid` = 325619;
UPDATE `creature` SET `MovementType` = 0, `spawndist` = 0, `position_z` = 11.65 WHERE `guid` = 325630;
UPDATE `creature` SET `MovementType` = 0, `spawndist` = 0, `position_z` = 14.75 WHERE `guid` = 325656;
UPDATE `creature` SET `MovementType` = 0, `spawndist` = 0, `position_z` = 15.44 WHERE `guid` = 325685;
UPDATE `creature` SET `MovementType` = 0, `spawndist` = 0, `position_z` = 42.77 WHERE `guid` = 325709;
UPDATE `creature` SET `MovementType` = 0, `spawndist` = 0, `position_z` = 178.69 WHERE `guid` = 10542088;
UPDATE `creature` SET `MovementType` = 1, `spawndist` = 3, `position_z` = 23.08 WHERE `guid` = 324480;
UPDATE `creature` SET `MovementType` = 1, `spawndist` = 4, `position_z` = 16.81 WHERE `guid` = 324485;
UPDATE `creature` SET `MovementType` = 1, `spawndist` = 5, `position_z` = 20.45 WHERE `guid` = 324488;
UPDATE `creature` SET `MovementType` = 1, `spawndist` = 6, `position_z` = 25.10 WHERE `guid` = 324489;
UPDATE `creature` SET `MovementType` = 1, `spawndist` = 3, `position_z` = 29.74 WHERE `guid` = 324494;
UPDATE `creature` SET `MovementType` = 1, `spawndist` = 4, `position_z` = 35.31 WHERE `guid` = 324495;
UPDATE `creature` SET `MovementType` = 1, `spawndist` = 5, `position_z` = 32.59 WHERE `guid` = 324506;
UPDATE `creature` SET `MovementType` = 1, `spawndist` = 6, `position_z` = 24.41 WHERE `guid` = 324507;
UPDATE `creature` SET `MovementType` = 1, `spawndist` = 3, `position_z` = 16.28 WHERE `guid` = 324613;
UPDATE `creature` SET `MovementType` = 1, `spawndist` = 4, `position_z` = 21.57 WHERE `guid` = 324622;
UPDATE `creature` SET `MovementType` = 1, `spawndist` = 5, `position_z` = 18.29 WHERE `guid` = 324675;
UPDATE `creature` SET `MovementType` = 1, `spawndist` = 6, `position_z` = 25.78 WHERE `guid` = 324679;
UPDATE `creature` SET `MovementType` = 1, `spawndist` = 3, `position_z` = 27.06 WHERE `guid` = 324700;
UPDATE `creature` SET `MovementType` = 1, `spawndist` = 4, `position_z` = 13.34 WHERE `guid` = 325617;
UPDATE `creature` SET `MovementType` = 1, `spawndist` = 5, `position_z` = 9.00 WHERE `guid` = 325621;
UPDATE `creature` SET `MovementType` = 1, `spawndist` = 6, `position_z` = 9.35 WHERE `guid` = 325629;
UPDATE `creature` SET `MovementType` = 1, `spawndist` = 3, `position_z` = 11.53 WHERE `guid` = 325631;
UPDATE `creature` SET `MovementType` = 1, `spawndist` = 4, `position_z` = 11.69 WHERE `guid` = 325649;
UPDATE `creature` SET `MovementType` = 1, `spawndist` = 5, `position_z` = 13.46 WHERE `guid` = 325662;
UPDATE `creature` SET `MovementType` = 1, `spawndist` = 6, `position_z` = 18.59 WHERE `guid` = 325683;
UPDATE `creature` SET `MovementType` = 1, `spawndist` = 3, `position_z` = 18.83 WHERE `guid` = 325692;
UPDATE `creature` SET `MovementType` = 1, `spawndist` = 4, `position_z` = 39.12 WHERE `guid` = 325704;
UPDATE `creature` SET `MovementType` = 1, `spawndist` = 5, `position_z` = 47.58 WHERE `guid` = 326246;
UPDATE `creature` SET `MovementType` = 1, `spawndist` = 6, `position_z` = 70.77 WHERE `guid` = 326337;
UPDATE `creature` SET `MovementType` = 1, `spawndist` = 3, `position_z` = -1.21 WHERE `guid` = 326144;
UPDATE `creature` SET `MovementType` = 1, `spawndist` = 4, `position_z` = 9.38 WHERE `guid` = 326194;
UPDATE `creature` SET `MovementType` = 1, `spawndist` = 5, `position_z` = 13.30 WHERE `guid` = 326204;
UPDATE `creature` SET `MovementType` = 1, `spawndist` = 6, `position_z` = 53.24 WHERE `guid` = 326219;
DELETE FROM `creature_movement_override` WHERE `SpawnId` IN (324454, 324486, 324493, 324496, 324560, 324671, 324687, 325619, 325630, 325656, 325685, 325709, 10542088, 324480, 324485, 324488, 324489, 324494, 324495, 324506, 324507, 324613, 324622, 324675, 324679, 324700, 325617, 325621, 325629, 325631, 325649, 325662, 325683, 325692, 325704, 326246, 326337, 326144, 326194, 326204, 326219);
INSERT INTO `creature_movement_override` (`SpawnId`, `Ground`, `Swim`, `Flight`, `Rooted`, `Random`, `InteractionPauseTimer`) VALUES
(324454, 0, 0, 1, 0, 0, NULL),
(324486, 0, 0, 1, 0, 0, NULL),
(324493, 0, 0, 1, 0, 0, NULL),
(324496, 0, 0, 1, 0, 0, NULL),
(324560, 0, 0, 1, 0, 0, NULL),
(324671, 0, 0, 1, 0, 0, NULL),
(324687, 0, 0, 1, 0, 0, NULL),
(325619, 0, 0, 1, 0, 0, NULL),
(325630, 0, 0, 1, 0, 0, NULL),
(325656, 0, 0, 1, 0, 0, NULL),
(325685, 0, 0, 1, 0, 0, NULL),
(325709, 0, 0, 1, 0, 0, NULL),
(10542088, 0, 0, 1, 0, 0, NULL),
(324480, 0, 0, 1, 0, 0, NULL),
(324485, 0, 0, 1, 0, 0, NULL),
(324488, 0, 0, 1, 0, 0, NULL),
(324489, 0, 0, 1, 0, 0, NULL),
(324494, 0, 0, 1, 0, 0, NULL),
(324495, 0, 0, 1, 0, 0, NULL),
(324506, 0, 0, 1, 0, 0, NULL),
(324507, 0, 0, 1, 0, 0, NULL),
(324613, 0, 0, 1, 0, 0, NULL),
(324622, 0, 0, 1, 0, 0, NULL),
(324675, 0, 0, 1, 0, 0, NULL),
(324679, 0, 0, 1, 0, 0, NULL),
(324700, 0, 0, 1, 0, 0, NULL),
(325617, 0, 0, 1, 0, 0, NULL),
(325621, 0, 0, 1, 0, 0, NULL),
(325629, 0, 0, 1, 0, 0, NULL),
(325631, 0, 0, 1, 0, 0, NULL),
(325649, 0, 0, 1, 0, 0, NULL),
(325662, 0, 0, 1, 0, 0, NULL),
(325683, 0, 0, 1, 0, 0, NULL),
(325692, 0, 0, 1, 0, 0, NULL),
(325704, 0, 0, 1, 0, 0, NULL),
(326246, 0, 0, 1, 0, 0, NULL),
(326337, 0, 0, 1, 0, 0, NULL),
(326144, 0, 0, 1, 0, 0, NULL),
(326194, 0, 0, 1, 0, 0, NULL),
(326204, 0, 0, 1, 0, 0, NULL),
(326219, 0, 0, 1, 0, 0, NULL);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (-324454, -324486, -324493, -324496, -324560, -324671, -324687, -325619, -325630, -325656, -325685, -325709, -10542088, -324480, -324485, -324488, -324489, -324494, -324495, -324506, -324507, -324613, -324622, -324675, -324679, -324700, -325617, -325621, -325629, -325631, -325649, -325662, -325683, -325692, -325704, -326246, -326337, -326144, -326194, -326204, -326219) AND `source_type` = 0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(-324454, 0, 0, 0, 4, 0, 100, 0, 0, 0, 0, 0, 60, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Hovering - On Aggro - Land'),
(-324454, 0, 1, 0, 7, 0, 100, 0, 0, 0, 0, 0, 60, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Hovering - On Evade - Take Off'),
(-324486, 0, 0, 0, 4, 0, 100, 0, 0, 0, 0, 0, 60, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Hovering - On Aggro - Land'),
(-324486, 0, 1, 0, 7, 0, 100, 0, 0, 0, 0, 0, 60, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Hovering - On Evade - Take Off'),
(-324493, 0, 0, 0, 4, 0, 100, 0, 0, 0, 0, 0, 60, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Hovering - On Aggro - Land'),
(-324493, 0, 1, 0, 7, 0, 100, 0, 0, 0, 0, 0, 60, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Hovering - On Evade - Take Off'),
(-324496, 0, 0, 0, 4, 0, 100, 0, 0, 0, 0, 0, 60, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Hovering - On Aggro - Land'),
(-324496, 0, 1, 0, 7, 0, 100, 0, 0, 0, 0, 0, 60, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Hovering - On Evade - Take Off'),
(-324560, 0, 0, 0, 4, 0, 100, 0, 0, 0, 0, 0, 60, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Hovering - On Aggro - Land'),
(-324560, 0, 1, 0, 7, 0, 100, 0, 0, 0, 0, 0, 60, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Hovering - On Evade - Take Off'),
(-324671, 0, 0, 0, 4, 0, 100, 0, 0, 0, 0, 0, 60, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Hovering - On Aggro - Land'),
(-324671, 0, 1, 0, 7, 0, 100, 0, 0, 0, 0, 0, 60, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Hovering - On Evade - Take Off'),
(-324687, 0, 0, 0, 4, 0, 100, 0, 0, 0, 0, 0, 60, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Hovering - On Aggro - Land'),
(-324687, 0, 1, 0, 7, 0, 100, 0, 0, 0, 0, 0, 60, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Hovering - On Evade - Take Off'),
(-325619, 0, 0, 0, 4, 0, 100, 0, 0, 0, 0, 0, 60, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Hovering - On Aggro - Land'),
(-325619, 0, 1, 0, 7, 0, 100, 0, 0, 0, 0, 0, 60, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Hovering - On Evade - Take Off'),
(-325630, 0, 0, 0, 4, 0, 100, 0, 0, 0, 0, 0, 60, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Hovering - On Aggro - Land'),
(-325630, 0, 1, 0, 7, 0, 100, 0, 0, 0, 0, 0, 60, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Hovering - On Evade - Take Off'),
(-325656, 0, 0, 0, 4, 0, 100, 0, 0, 0, 0, 0, 60, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Hovering - On Aggro - Land'),
(-325656, 0, 1, 0, 7, 0, 100, 0, 0, 0, 0, 0, 60, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Hovering - On Evade - Take Off'),
(-325685, 0, 0, 0, 4, 0, 100, 0, 0, 0, 0, 0, 60, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Hovering - On Aggro - Land'),
(-325685, 0, 1, 0, 7, 0, 100, 0, 0, 0, 0, 0, 60, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Hovering - On Evade - Take Off'),
(-325709, 0, 0, 0, 4, 0, 100, 0, 0, 0, 0, 0, 60, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Hovering - On Aggro - Land'),
(-325709, 0, 1, 0, 7, 0, 100, 0, 0, 0, 0, 0, 60, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Hovering - On Evade - Take Off'),
(-10542088, 0, 0, 0, 4, 0, 100, 0, 0, 0, 0, 0, 60, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Hovering - On Aggro - Land'),
(-10542088, 0, 1, 0, 7, 0, 100, 0, 0, 0, 0, 0, 60, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Hovering - On Evade - Take Off'),
(-324480, 0, 0, 0, 4, 0, 100, 0, 0, 0, 0, 0, 60, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Hovering - On Aggro - Land'),
(-324480, 0, 1, 0, 7, 0, 100, 0, 0, 0, 0, 0, 60, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Hovering - On Evade - Take Off'),
(-324485, 0, 0, 0, 4, 0, 100, 0, 0, 0, 0, 0, 60, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Hovering - On Aggro - Land'),
(-324485, 0, 1, 0, 7, 0, 100, 0, 0, 0, 0, 0, 60, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Hovering - On Evade - Take Off'),
(-324488, 0, 0, 0, 4, 0, 100, 0, 0, 0, 0, 0, 60, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Hovering - On Aggro - Land'),
(-324488, 0, 1, 0, 7, 0, 100, 0, 0, 0, 0, 0, 60, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Hovering - On Evade - Take Off'),
(-324489, 0, 0, 0, 4, 0, 100, 0, 0, 0, 0, 0, 60, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Hovering - On Aggro - Land'),
(-324489, 0, 1, 0, 7, 0, 100, 0, 0, 0, 0, 0, 60, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Hovering - On Evade - Take Off'),
(-324494, 0, 0, 0, 4, 0, 100, 0, 0, 0, 0, 0, 60, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Hovering - On Aggro - Land'),
(-324494, 0, 1, 0, 7, 0, 100, 0, 0, 0, 0, 0, 60, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Hovering - On Evade - Take Off'),
(-324495, 0, 0, 0, 4, 0, 100, 0, 0, 0, 0, 0, 60, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Hovering - On Aggro - Land'),
(-324495, 0, 1, 0, 7, 0, 100, 0, 0, 0, 0, 0, 60, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Hovering - On Evade - Take Off'),
(-324506, 0, 0, 0, 4, 0, 100, 0, 0, 0, 0, 0, 60, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Hovering - On Aggro - Land'),
(-324506, 0, 1, 0, 7, 0, 100, 0, 0, 0, 0, 0, 60, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Hovering - On Evade - Take Off'),
(-324507, 0, 0, 0, 4, 0, 100, 0, 0, 0, 0, 0, 60, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Hovering - On Aggro - Land'),
(-324507, 0, 1, 0, 7, 0, 100, 0, 0, 0, 0, 0, 60, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Hovering - On Evade - Take Off'),
(-324613, 0, 0, 0, 4, 0, 100, 0, 0, 0, 0, 0, 60, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Hovering - On Aggro - Land'),
(-324613, 0, 1, 0, 7, 0, 100, 0, 0, 0, 0, 0, 60, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Hovering - On Evade - Take Off'),
(-324622, 0, 0, 0, 4, 0, 100, 0, 0, 0, 0, 0, 60, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Hovering - On Aggro - Land'),
(-324622, 0, 1, 0, 7, 0, 100, 0, 0, 0, 0, 0, 60, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Hovering - On Evade - Take Off'),
(-324675, 0, 0, 0, 4, 0, 100, 0, 0, 0, 0, 0, 60, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Hovering - On Aggro - Land'),
(-324675, 0, 1, 0, 7, 0, 100, 0, 0, 0, 0, 0, 60, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Hovering - On Evade - Take Off'),
(-324679, 0, 0, 0, 4, 0, 100, 0, 0, 0, 0, 0, 60, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Hovering - On Aggro - Land'),
(-324679, 0, 1, 0, 7, 0, 100, 0, 0, 0, 0, 0, 60, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Hovering - On Evade - Take Off'),
(-324700, 0, 0, 0, 4, 0, 100, 0, 0, 0, 0, 0, 60, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Hovering - On Aggro - Land'),
(-324700, 0, 1, 0, 7, 0, 100, 0, 0, 0, 0, 0, 60, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Hovering - On Evade - Take Off'),
(-325617, 0, 0, 0, 4, 0, 100, 0, 0, 0, 0, 0, 60, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Hovering - On Aggro - Land'),
(-325617, 0, 1, 0, 7, 0, 100, 0, 0, 0, 0, 0, 60, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Hovering - On Evade - Take Off'),
(-325621, 0, 0, 0, 4, 0, 100, 0, 0, 0, 0, 0, 60, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Hovering - On Aggro - Land'),
(-325621, 0, 1, 0, 7, 0, 100, 0, 0, 0, 0, 0, 60, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Hovering - On Evade - Take Off'),
(-325629, 0, 0, 0, 4, 0, 100, 0, 0, 0, 0, 0, 60, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Hovering - On Aggro - Land'),
(-325629, 0, 1, 0, 7, 0, 100, 0, 0, 0, 0, 0, 60, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Hovering - On Evade - Take Off'),
(-325631, 0, 0, 0, 4, 0, 100, 0, 0, 0, 0, 0, 60, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Hovering - On Aggro - Land'),
(-325631, 0, 1, 0, 7, 0, 100, 0, 0, 0, 0, 0, 60, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Hovering - On Evade - Take Off'),
(-325649, 0, 0, 0, 4, 0, 100, 0, 0, 0, 0, 0, 60, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Hovering - On Aggro - Land'),
(-325649, 0, 1, 0, 7, 0, 100, 0, 0, 0, 0, 0, 60, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Hovering - On Evade - Take Off'),
(-325662, 0, 0, 0, 4, 0, 100, 0, 0, 0, 0, 0, 60, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Hovering - On Aggro - Land'),
(-325662, 0, 1, 0, 7, 0, 100, 0, 0, 0, 0, 0, 60, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Hovering - On Evade - Take Off'),
(-325683, 0, 0, 0, 4, 0, 100, 0, 0, 0, 0, 0, 60, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Hovering - On Aggro - Land'),
(-325683, 0, 1, 0, 7, 0, 100, 0, 0, 0, 0, 0, 60, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Hovering - On Evade - Take Off'),
(-325692, 0, 0, 0, 4, 0, 100, 0, 0, 0, 0, 0, 60, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Hovering - On Aggro - Land'),
(-325692, 0, 1, 0, 7, 0, 100, 0, 0, 0, 0, 0, 60, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Hovering - On Evade - Take Off'),
(-325704, 0, 0, 0, 4, 0, 100, 0, 0, 0, 0, 0, 60, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Hovering - On Aggro - Land'),
(-325704, 0, 1, 0, 7, 0, 100, 0, 0, 0, 0, 0, 60, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Hovering - On Evade - Take Off'),
(-326246, 0, 0, 0, 4, 0, 100, 0, 0, 0, 0, 0, 60, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Hovering - On Aggro - Land'),
(-326246, 0, 1, 0, 7, 0, 100, 0, 0, 0, 0, 0, 60, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Hovering - On Evade - Take Off'),
(-326337, 0, 0, 0, 4, 0, 100, 0, 0, 0, 0, 0, 60, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Hovering - On Aggro - Land'),
(-326337, 0, 1, 0, 7, 0, 100, 0, 0, 0, 0, 0, 60, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Hovering - On Evade - Take Off'),
(-326144, 0, 0, 0, 4, 0, 100, 0, 0, 0, 0, 0, 60, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Hovering - On Aggro - Land'),
(-326144, 0, 1, 0, 7, 0, 100, 0, 0, 0, 0, 0, 60, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Hovering - On Evade - Take Off'),
(-326194, 0, 0, 0, 4, 0, 100, 0, 0, 0, 0, 0, 60, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Hovering - On Aggro - Land'),
(-326194, 0, 1, 0, 7, 0, 100, 0, 0, 0, 0, 0, 60, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Hovering - On Evade - Take Off'),
(-326204, 0, 0, 0, 4, 0, 100, 0, 0, 0, 0, 0, 60, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Hovering - On Aggro - Land'),
(-326204, 0, 1, 0, 7, 0, 100, 0, 0, 0, 0, 0, 60, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Hovering - On Evade - Take Off'),
(-326219, 0, 0, 0, 4, 0, 100, 0, 0, 0, 0, 0, 60, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Hovering - On Aggro - Land'),
(-326219, 0, 1, 0, 7, 0, 100, 0, 0, 0, 0, 0, 60, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Hovering - On Evade - Take Off');
