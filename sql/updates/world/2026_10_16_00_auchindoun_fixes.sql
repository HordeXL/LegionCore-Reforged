-- Auchindoun : phases du donjon (Teron'gor, Légion, Sargerei après la porte, défunts, barrières), porte de Tuulani, trackers invisibles en vol, entrée de Talador (deux cristaux défensifs retirés, défenseurs à 1 PV, âmes-prêtres à genoux, lueurs démoniaques de l'entrée retirées, Liadrin et Maladaar en garde, animations et patrouilles du camp de Talador, papillons de Talador sur leurs trajets, artificière 81624 au travail, quatre défenseurs blessés au sol, forestier à l'arc, défunts du donjon inoffensifs, défenseur qui parle à Tuulani, sorts de Nyami remis dans le bon ordre, fin de la scène de Tuulani, sol sanctifié et fissures de Kaathar, captifs, défunts et exécutions du couloir, barrière est visible dès l'arrivée, magus sargerei sans bombe des arcanes, gardienne qui reprend la salle après Nyami, sol de la section 227633 visible de loin, zone de protection du Réceptacle d'âme de Nyami, salves des magus auchenaï vers le ciel, captifs qui restent en l'air, annonces des sorts de Kaathar, Nyami et Azzakel dans la langue du joueur, rayon de Nyami vers Kaathar, créatures et sorts manquants d'Azzakel, Teron'gor et la médiatrice sargerei, arrivée de Teron'gor après Azzakel, démons des trois démonistes de Teron'gor, boules d'arcane qui virevoltent, transporteurs d'âmes, coffre de fin caché, démonistes tournés vers le centre).
UPDATE `creature` SET `phaseMask` = 2 WHERE `map` = 1182 AND `id` IN (77734, 77889, 77890, 78437, 77743, 77756, 77762, 77752, 77808, 79507, 79510, 79511, 87073, 87074, 76293, 76294, 76297, 88658, 76263, 76466, 76595, 77042, 77080, 77935, 78093, 78095, 77960, 77962);
UPDATE `gameobject` SET `phaseMask` = 2 WHERE `map` = 1182 AND `id` IN (230399, 230400, 231679);
UPDATE `gameobject` SET `phaseMask` = 1 WHERE `map` = 1182 AND `id` = 231680;
DELETE FROM `creature` WHERE `guid` BETWEEN 10530400 AND 10530499;
DROP TEMPORARY TABLE IF EXISTS `tmp_auchindoun_gate`;
CREATE TEMPORARY TABLE `tmp_auchindoun_gate` LIKE `creature`;
INSERT INTO `tmp_auchindoun_gate` SELECT * FROM `creature` WHERE `guid` = 10530083;
UPDATE `tmp_auchindoun_gate` SET `guid` = 10530400, `position_x` = 1657.6, `position_y` = 3011.6, `position_z` = 37.1;
INSERT INTO `creature` SELECT * FROM `tmp_auchindoun_gate`;
UPDATE `tmp_auchindoun_gate` SET `guid` = 10530401, `position_x` = 1657.6, `position_y` = 3011.6, `position_z` = 41.1;
INSERT INTO `creature` SELECT * FROM `tmp_auchindoun_gate`;
UPDATE `tmp_auchindoun_gate` SET `guid` = 10530402, `position_x` = 1657.6, `position_y` = 3011.6, `position_z` = 45.1;
INSERT INTO `creature` SELECT * FROM `tmp_auchindoun_gate`;
UPDATE `tmp_auchindoun_gate` SET `guid` = 10530403, `position_x` = 1665.1, `position_y` = 3011.6, `position_z` = 37.1;
INSERT INTO `creature` SELECT * FROM `tmp_auchindoun_gate`;
UPDATE `tmp_auchindoun_gate` SET `guid` = 10530404, `position_x` = 1665.1, `position_y` = 3011.6, `position_z` = 41.1;
INSERT INTO `creature` SELECT * FROM `tmp_auchindoun_gate`;
UPDATE `tmp_auchindoun_gate` SET `guid` = 10530405, `position_x` = 1665.1, `position_y` = 3011.6, `position_z` = 45.1;
INSERT INTO `creature` SELECT * FROM `tmp_auchindoun_gate`;
UPDATE `tmp_auchindoun_gate` SET `guid` = 10530406, `position_x` = 1672.6, `position_y` = 3011.6, `position_z` = 37.1;
INSERT INTO `creature` SELECT * FROM `tmp_auchindoun_gate`;
UPDATE `tmp_auchindoun_gate` SET `guid` = 10530407, `position_x` = 1672.6, `position_y` = 3011.6, `position_z` = 41.1;
INSERT INTO `creature` SELECT * FROM `tmp_auchindoun_gate`;
UPDATE `tmp_auchindoun_gate` SET `guid` = 10530408, `position_x` = 1672.6, `position_y` = 3011.6, `position_z` = 45.1;
INSERT INTO `creature` SELECT * FROM `tmp_auchindoun_gate`;
DROP TEMPORARY TABLE `tmp_auchindoun_gate`;
UPDATE `creature_template` SET `RegenHealth` = 0 WHERE `entry` = 78450;
UPDATE `creature` SET `curhealth` = 1 WHERE `id` = 78450;
DELETE FROM `gameobject` WHERE `guid` IN (139753, 139756);
UPDATE `creature_template_addon` SET `bytes1` = 262151 WHERE `entry` = 78450;
UPDATE `creature_template_wdb` SET `Displayid1` = `Displayid2` WHERE `Entry` IN (76887, 79417, 87219);
UPDATE `creature_template_wdb` SET `Displayid1` = 16946 WHERE `Entry` = 81585;
DELETE FROM `creature_template_movement` WHERE `CreatureId` = 79417;
INSERT INTO `creature_template_movement` (`CreatureId`, `Ground`, `Swim`, `Flight`, `Rooted`, `Random`, `InteractionPauseTimer`) VALUES (79417, 1, 0, 1, 0, 0, 0);
UPDATE `creature_template` SET `unit_flags` = `unit_flags` & ~33554432, `unit_flags2` = `unit_flags2` & ~1 WHERE `entry` = 78453;
UPDATE `creature_template_addon` SET `auras` = '51361', `bytes1` = 8 WHERE `entry` = 78453;
DELETE FROM `gameobject` WHERE `id` = 231875 AND `map` = 1116;
UPDATE `creature_template_addon` SET `emote` = 333 WHERE `entry` = 77580;
UPDATE `creature_template_addon` SET `emote` = 375 WHERE `entry` = 77581;
UPDATE `creature_template_addon` SET `auras` = '99203 145362 53563' WHERE `entry` = 78450;
UPDATE `creature_template_addon` SET `bytes1` = 0 WHERE `entry` = 79428;
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (79418, 81945);
UPDATE `creature_template` SET `AIName` = '', `ScriptName` = 'npc_talador_camp_salute' WHERE `entry` IN (79430, 79427, 79431, 79428);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (79418, 81945, 79430) AND `source_type` = 0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `target_type`, `target_param1`, `target_param2`, `comment`) VALUES
(79418, 0, 0, 0, 1, 0, 100, 0, 2000, 4000, 3000, 5000, 5, 36, 0, 1, 0, 0, 'Sunsworn Knight - Out of combat - Attack the training dummy'),
(81945, 0, 0, 0, 1, 0, 100, 0, 2000, 3000, 3000, 4500, 5, 435, 0, 1, 0, 0, 'Sunsworn Ranger - Out of combat - Shoot the bow');
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES (331790, 0, 0, 0, 1, 173, '') ON DUPLICATE KEY UPDATE `emote` = 173;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES (331742, 0, 0, 0, 1, 333, '') ON DUPLICATE KEY UPDATE `emote` = 333;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES (331743, 0, 0, 0, 1, 333, '') ON DUPLICATE KEY UPDATE `emote` = 333;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES (331752, 0, 0, 0, 1, 333, '') ON DUPLICATE KEY UPDATE `emote` = 333;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES (331755, 0, 0, 0, 1, 375, '') ON DUPLICATE KEY UPDATE `emote` = 375;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES (331756, 0, 0, 0, 1, 375, '') ON DUPLICATE KEY UPDATE `emote` = 375;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES (331680, 0, 0, 0, 1, 333, '') ON DUPLICATE KEY UPDATE `emote` = 333, `auras` = '';
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES (331681, 0, 0, 0, 1, 333, '') ON DUPLICATE KEY UPDATE `emote` = 333, `auras` = '';
DELETE FROM `waypoint_data` WHERE `id` IN (331818, 331777, 331757, 331833);
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `delay_chance`, `move_type`, `speed`, `action`, `action_chance`, `entry`) VALUES
(331818, 1, 1456.4, 3285.7, 133.8, 0, 3000, 0, 0, 0, 0, 0, 0),
(331818, 2, 1462.4, 3285.7, 133.8, 0, 3000, 0, 0, 0, 0, 0, 0),
(331818, 3, 1462.4, 3290.7, 133.8, 0, 3000, 0, 0, 0, 0, 0, 0),
(331818, 4, 1456.4, 3290.7, 133.8, 0, 3000, 0, 0, 0, 0, 0, 0),
(331777, 1, 1480.5, 3287.6, 133.8, 0, 3000, 0, 0, 0, 0, 0, 0),
(331777, 2, 1486.5, 3287.6, 133.8, 0, 3000, 0, 0, 0, 0, 0, 0),
(331777, 3, 1486.5, 3292.6, 133.8, 0, 3000, 0, 0, 0, 0, 0, 0),
(331777, 4, 1480.5, 3292.6, 133.8, 0, 3000, 0, 0, 0, 0, 0, 0),
(331757, 1, 1756.1, 3248.5, 133.8, 0, 3000, 0, 0, 0, 0, 0, 0),
(331757, 2, 1762.1, 3248.5, 133.8, 0, 3000, 0, 0, 0, 0, 0, 0),
(331757, 3, 1762.1, 3253.5, 133.8, 0, 3000, 0, 0, 0, 0, 0, 0),
(331757, 4, 1756.1, 3253.5, 133.8, 0, 3000, 0, 0, 0, 0, 0, 0),
(331833, 1, 1405.1, 3218.9, 133.7, 0, 3000, 0, 0, 0, 0, 0, 0),
(331833, 2, 1411.1, 3218.9, 133.7, 0, 3000, 0, 0, 0, 0, 0, 0),
(331833, 3, 1411.1, 3223.9, 133.7, 0, 3000, 0, 0, 0, 0, 0, 0),
(331833, 4, 1405.1, 3223.9, 133.7, 0, 3000, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES (331818, 331818, 0, 0, 1, 0, '') ON DUPLICATE KEY UPDATE `path_id` = 331818;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES (331777, 331777, 0, 0, 1, 0, '') ON DUPLICATE KEY UPDATE `path_id` = 331777;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES (331757, 331757, 0, 0, 1, 0, '') ON DUPLICATE KEY UPDATE `path_id` = 331757;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES (331833, 331833, 0, 0, 1, 0, '') ON DUPLICATE KEY UPDATE `path_id` = 331833;
UPDATE `creature` SET `MovementType` = 2, `spawndist` = 0 WHERE `guid` IN (331818, 331777, 331757, 331833);
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) SELECT c.`guid`, c.`guid`, 0, 0, 1, 0, '' FROM `creature` c WHERE c.`id` = 79595 AND c.`map` = 1116 AND EXISTS (SELECT 1 FROM `waypoint_data` w WHERE w.`id` = c.`guid`) ON DUPLICATE KEY UPDATE `path_id` = VALUES(`path_id`);
DELETE FROM `waypoint_data` WHERE `id` = 331016;
DELETE FROM `waypoint_scripts` WHERE `id` = 331016;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `delay_chance`, `move_type`, `speed`, `action`, `action_chance`, `entry`) VALUES
(331016, 1, 1898.85, 2772.07, 133.7, 0.3, 4000, 0, 0, 0, 0, 0, 0),
(331016, 2, 1925.0, 2789.0, 133.0, 1.11, 9000, 0, 0, 0, 331016, 100, 0),
(331016, 3, 1908.5, 2782.5, 133.7, 2.31, 6000, 0, 0, 0, 0, 0, 0);
INSERT INTO `waypoint_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`, `guid`) VALUES
(331016, 0, 1, 173, 1, 0, 0, 0, 0, 0, 3310161),
(331016, 8500, 1, 0, 1, 0, 0, 0, 0, 0, 3310162);
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES (331016, 331016, 0, 0, 1, 0, '') ON DUPLICATE KEY UPDATE `path_id` = 331016;
UPDATE `creature` SET `MovementType` = 2, `spawndist` = 0 WHERE `guid` = 331016;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES (330979, 0, 0, 7, 1, 0, ''), (330981, 0, 0, 7, 1, 0, ''), (330985, 0, 0, 7, 1, 0, ''), (330999, 0, 0, 7, 1, 0, '') ON DUPLICATE KEY UPDATE `bytes1` = 7;
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 79421;
DELETE FROM `smart_scripts` WHERE `entryorguid` = 79421 AND `source_type` = 0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `target_type`, `target_param1`, `target_param2`, `comment`) VALUES (79421, 0, 0, 0, 1, 0, 100, 0, 2000, 3000, 3000, 4500, 5, 435, 0, 1, 0, 0, 'Sunsworn Ranger - Out of combat - Shoot the bow');
UPDATE `creature_template` SET `faction` = 35, `unit_flags` = `unit_flags` | 2 WHERE `entry` IN (76293, 76294, 76297);
UPDATE `creature_template` SET `ScriptName` = 'auchindoun_mob_barrier_keeper' WHERE `entry` = 77947;
UPDATE `creature` SET `position_x` = 1648, `position_y` = 2966.5, `position_z` = 35.2, `orientation` = 3.98 WHERE `guid` = 10530210;
UPDATE `spell_script_names` SET `ScriptName` = 'auchindoun_nyami_spell_torn_spirits' WHERE `spell_id` = 153994;
UPDATE `spell_script_names` SET `ScriptName` = 'auchindoun_nyami_spell_soul_vessel' WHERE `spell_id` = 154187;
UPDATE `spell_scene` SET `ScriptName` = 'auchindoun_scene_tuulani_reach_nyami' WHERE `MiscValue` = 913;
UPDATE `creature_template_addon` SET `auras` = '' WHERE `entry` = 77963;
UPDATE `gameobject` SET `phaseMask` = 1 WHERE `map` = 1182 AND `id` = 230511;
UPDATE `gameobject_template` SET `MaxVisible` = 0, `VisibilityDistance` = 500 WHERE `entry` = 230511;
UPDATE `gameobject_template` SET `MaxVisible` = 0, `VisibilityDistance` = 0 WHERE `entry` = 230399;
DELETE FROM `creature_template` WHERE `entry` IN (537324, 543536);
DELETE FROM `creature_template_wdb` WHERE `Entry` IN (537324, 543536);
DROP TEMPORARY TABLE IF EXISTS `tmp_kaathar_trigger`;
CREATE TEMPORARY TABLE `tmp_kaathar_trigger` SELECT * FROM `creature_template` WHERE `entry` = 79417;
UPDATE `tmp_kaathar_trigger` SET `entry` = 537324, `faction` = 16, `ScriptName` = 'auchindoun_kaathar_mob_hallowed_ground';
INSERT INTO `creature_template` SELECT * FROM `tmp_kaathar_trigger`;
UPDATE `tmp_kaathar_trigger` SET `entry` = 543536, `ScriptName` = 'auchindoun_kaathar_mob_spawn_fissures';
INSERT INTO `creature_template` SELECT * FROM `tmp_kaathar_trigger`;
DROP TEMPORARY TABLE `tmp_kaathar_trigger`;
DROP TEMPORARY TABLE IF EXISTS `tmp_kaathar_trigger_wdb`;
CREATE TEMPORARY TABLE `tmp_kaathar_trigger_wdb` SELECT * FROM `creature_template_wdb` WHERE `Entry` = 79417;
UPDATE `tmp_kaathar_trigger_wdb` SET `Entry` = 537324, `Name1` = 'Hallowed Ground';
INSERT INTO `creature_template_wdb` SELECT * FROM `tmp_kaathar_trigger_wdb`;
UPDATE `tmp_kaathar_trigger_wdb` SET `Entry` = 543536, `Name1` = 'Sanctified Fissure';
INSERT INTO `creature_template_wdb` SELECT * FROM `tmp_kaathar_trigger_wdb`;
DROP TEMPORARY TABLE `tmp_kaathar_trigger_wdb`;
DELETE FROM `areatrigger_actions` WHERE `entry` IN (2646, 2647) AND `customEntry` = 5207;
INSERT INTO `areatrigger_actions` (`entry`, `customEntry`, `id`, `moment`, `actionType`, `targetFlags`, `spellId`, `comment`) VALUES
(2646, 5207, 0, 1, 0, 10, 153430, 'Kaathar - Sanctified Ground on enter'),
(2646, 5207, 1, 42, 1, 10, 153430, 'Kaathar - Sanctified Ground on leave'),
(2647, 5207, 0, 1, 0, 10, 153430, 'Kaathar - Sanctified Ground on enter'),
(2647, 5207, 1, 42, 1, 10, 153430, 'Kaathar - Sanctified Ground on leave');
UPDATE `creature` SET `phaseMask` = 2 WHERE `map` = 1182 AND `id` = 77961;
UPDATE `creature_template_addon` SET `auras` = '157234 77564' WHERE `entry` = 77961;
UPDATE `creature_template_addon` SET `bytes1` = 7 WHERE `entry` IN (77960, 77962, 78093, 78095);
UPDATE `creature_template` SET `unit_flags` = `unit_flags` | 33554432 WHERE `entry` IN (77960, 77962, 78093, 78095);
UPDATE `creature` SET `phaseMask` = 2 WHERE `guid` IN (10530175, 10530188);
UPDATE `creature` SET `unit_flags` = 33587968 WHERE `guid` = 10530188;
DELETE FROM `creature_addon` WHERE `guid` IN (10530175, 10530176, 10530188);
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES
(10530175, 0, 0, 50331648, 0, 0, '157234 77564'),
(10530176, 0, 0, 50331648, 0, 0, '157234 77564'),
(10530188, 0, 0, 7, 0, 0, '');
UPDATE `smart_scripts` SET `action_param1` = 154235, `comment` = 'Cast Arcane Bolt' WHERE `entryorguid` = 87074 AND `source_type` = 0 AND `id` = 0 AND `action_param1` = 157794;
DELETE FROM `creature_text` WHERE `CreatureID` = 77704 AND `GroupID` BETWEEN 34 AND 37;
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextID`, `MinTimer`, `MaxTimer`, `SpellID`, `comment`) VALUES
(77704, 34, 0, 'Auchenai, secure this chamber.', 14, 0, 100, 0, 0, 43234, 0, 0, 0, 0, 'Auchindoun'),
(77704, 35, 0, 'The barrier protecting Auchindoun is asunder.', 12, 0, 100, 0, 0, 43235, 0, 0, 0, 0, 'Auchindoun'),
(77704, 36, 0, 'A foul force has penetrated these sacred chambers.', 12, 0, 100, 0, 0, 43236, 0, 0, 0, 0, 'Auchindoun'),
(77704, 37, 0, 'Scout ahead while we establish a foothold.', 12, 0, 100, 0, 0, 43237, 0, 0, 0, 0, 'Auchindoun');
UPDATE `gameobject_template` SET `MaxVisible` = 0, `VisibilityDistance` = 500 WHERE `entry` = 227633;
DELETE FROM `world_visible_distance` WHERE `type` = 0 AND `id` = 1182;
INSERT INTO `world_visible_distance` (`type`, `id`, `distance`, `comment`) VALUES (0, 1182, 330, 'Auchindoun');
DELETE FROM `creature_template` WHERE `entry` = 342652;
DELETE FROM `creature_template_wdb` WHERE `Entry` = 342652;
DROP TEMPORARY TABLE IF EXISTS `tmp_nyami_bubble`;
CREATE TEMPORARY TABLE `tmp_nyami_bubble` SELECT * FROM `creature_template` WHERE `entry` = 79417;
UPDATE `tmp_nyami_bubble` SET `entry` = 342652, `faction` = 35, `ScriptName` = 'auchindoun_nyami_mob_bubble';
INSERT INTO `creature_template` SELECT * FROM `tmp_nyami_bubble`;
DROP TEMPORARY TABLE `tmp_nyami_bubble`;
DROP TEMPORARY TABLE IF EXISTS `tmp_nyami_bubble_wdb`;
CREATE TEMPORARY TABLE `tmp_nyami_bubble_wdb` SELECT * FROM `creature_template_wdb` WHERE `Entry` = 79417;
UPDATE `tmp_nyami_bubble_wdb` SET `Entry` = 342652, `Name1` = 'Soul Vessel Shelter';
INSERT INTO `creature_template_wdb` SELECT * FROM `tmp_nyami_bubble_wdb`;
DROP TEMPORARY TABLE `tmp_nyami_bubble_wdb`;
DELETE FROM `areatrigger_actions` WHERE `entry` = 3514 AND `customEntry` = 8137;
INSERT INTO `areatrigger_actions` (`entry`, `customEntry`, `id`, `moment`, `actionType`, `targetFlags`, `spellId`, `comment`) VALUES
(3514, 8137, 0, 1, 0, 8, 177550, 'Nyami - Soul Vessel shelter on enter'),
(3514, 8137, 1, 42, 1, 8, 177550, 'Nyami - Soul Vessel shelter on leave');
DELETE FROM `spell_script_names` WHERE `spell_id` = 157653;
DELETE FROM `creature_template_movement` WHERE `CreatureId` IN (76572, 77961, 77962, 77963);
INSERT INTO `creature_template_movement` (`CreatureId`, `Ground`, `Swim`, `Flight`, `Rooted`, `Random`) VALUES
(76572, 1, 0, 1, 0, 0),
(77961, 1, 0, 1, 0, 0),
(77962, 1, 0, 1, 0, 0),
(77963, 1, 0, 1, 0, 0);
DELETE FROM `creature_text` WHERE (`CreatureID` = 75839 AND `GroupID` IN (30, 31, 32)) OR (`CreatureID` = 76177 AND `GroupID` = 10) OR (`CreatureID` = 75927 AND `GroupID` IN (50, 51));
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextID`, `MinTimer`, `MaxTimer`, `SpellID`, `comment`) VALUES
(75839, 30, 0, '%s hurls his Holy Shield at $n!', 41, 0, 100, 0, 0, 0, 85067, 0, 0, 0, 'Auchindoun'),
(75839, 31, 0, '%s readies Consecrated Light. Hide!', 41, 0, 100, 0, 0, 0, 83892, 0, 0, 0, 'Auchindoun'),
(75839, 32, 0, '%s casts |cFFF00000|Hspell:157465|h[Fate]|h|r!', 41, 0, 100, 0, 0, 0, 0, 0, 0, 0, 'Auchindoun'),
(76177, 10, 0, '%s begins to cast |cFFF00000|Hspell:155327|h[Soul Vessel]|h|r!', 41, 0, 100, 0, 0, 0, 0, 0, 0, 0, 'Auchindoun'),
(75927, 50, 0, '%s casts |cFFF00000|Hspell:153764|h[Claws of Argus]|h|r!', 41, 0, 100, 0, 0, 0, 0, 0, 0, 0, 'Auchindoun'),
(75927, 51, 0, '%s casts |cFFF00000|Hspell:153392|h[Curtain of Flame]|h|r on $n!', 41, 0, 100, 0, 0, 0, 0, 0, 0, 0, 'Auchindoun');
DELETE FROM `creature_text_locale` WHERE `Locale` = 'frFR' AND ((`CreatureID` = 75839 AND `GroupID` = 32) OR (`CreatureID` = 76177 AND `GroupID` = 10) OR (`CreatureID` = 75927 AND `GroupID` IN (50, 51)));
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(75839, 32, 0, 'frFR', '%s lance |cFFF00000|Hspell:157465|h[Destin]|h|r !'),
(76177, 10, 0, 'frFR', '%s commence à lancer |cFFF00000|Hspell:155327|h[Réceptacle d’âme]|h|r !'),
(75927, 50, 0, 'frFR', '%s lance |cFFF00000|Hspell:153764|h[Griffes d’Argus]|h|r !'),
(75927, 51, 0, 'frFR', '%s lance |cFFF00000|Hspell:153392|h[Rideau de feu]|h|r sur $n !');
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 13 AND `SourceEntry` = 158565;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(13, 1, 158565, 0, 0, 31, 0, 3, 75839, 0, 0, 0, '', 'Holy Beam - Nyami wakes Vigilant Kaathar');
DELETE FROM `spell_script_names` WHERE `spell_id` = 153000;
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (153000, 'auchindoun_kaathar_spell_holy_shield_landing');
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 77704 AND `GroupID` BETWEEN 34 AND 37 AND `Locale` = 'frFR';
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(77704, 34, 0, 'frFR', 'Auchenaï, protégez cette salle.'),
(77704, 35, 0, 'frFR', 'La barrière protectrice d’Auchindoun s’atténue.'),
(77704, 36, 0, 'frFR', 'Une puissance corrompue s’est introduite dans ces chambres sacrées.'),
(77704, 37, 0, 'frFR', 'Allez examiner les lieux le temps que nous prenions position.');
UPDATE `creature_template` SET `ScriptName` = 'auchindoun_mob_felborne_abyssal' WHERE `entry` = 79508;
UPDATE `creature_template_wdb` SET `Displayid1` = 11686, `Displayid2` = 0, `Displayid3` = 0, `Displayid4` = 0 WHERE `Entry` = 87218;
DELETE FROM `creature_template` WHERE `entry` IN (326526, 326527, 326528, 213593);
DELETE FROM `creature_template_wdb` WHERE `Entry` IN (326526, 326527, 326528, 213593);
DROP TEMPORARY TABLE IF EXISTS `tmp_azzakel_trigger`;
CREATE TEMPORARY TABLE `tmp_azzakel_trigger` SELECT * FROM `creature_template` WHERE `entry` = 79417;
UPDATE `tmp_azzakel_trigger` SET `entry` = 326526, `faction` = 14, `ScriptName` = 'auchindoun_azzakel_mob_fel_pool';
INSERT INTO `creature_template` SELECT * FROM `tmp_azzakel_trigger`;
UPDATE `tmp_azzakel_trigger` SET `entry` = 326527, `ScriptName` = 'auchindoun_azzakel_mob_fel_spark_trigger';
INSERT INTO `creature_template` SELECT * FROM `tmp_azzakel_trigger`;
UPDATE `tmp_azzakel_trigger` SET `entry` = 326528, `ScriptName` = '';
INSERT INTO `creature_template` SELECT * FROM `tmp_azzakel_trigger`;
DROP TEMPORARY TABLE `tmp_azzakel_trigger`;
DROP TEMPORARY TABLE IF EXISTS `tmp_azzakel_trigger_wdb`;
CREATE TEMPORARY TABLE `tmp_azzakel_trigger_wdb` SELECT * FROM `creature_template_wdb` WHERE `Entry` = 79417;
UPDATE `tmp_azzakel_trigger_wdb` SET `Entry` = 326526, `Name1` = 'Fel Pool';
INSERT INTO `creature_template_wdb` SELECT * FROM `tmp_azzakel_trigger_wdb`;
UPDATE `tmp_azzakel_trigger_wdb` SET `Entry` = 326527, `Name1` = 'Fel Spark';
INSERT INTO `creature_template_wdb` SELECT * FROM `tmp_azzakel_trigger_wdb`;
UPDATE `tmp_azzakel_trigger_wdb` SET `Entry` = 326528, `Name1` = 'Fel Spark Trail';
INSERT INTO `creature_template_wdb` SELECT * FROM `tmp_azzakel_trigger_wdb`;
DROP TEMPORARY TABLE `tmp_azzakel_trigger_wdb`;
DROP TEMPORARY TABLE IF EXISTS `tmp_teronogor_abyssal`;
CREATE TEMPORARY TABLE `tmp_teronogor_abyssal` SELECT * FROM `creature_template` WHERE `entry` = 77905;
UPDATE `tmp_teronogor_abyssal` SET `entry` = 213593, `ScriptName` = 'auchindoun_teronogor_mob_abyssal';
INSERT INTO `creature_template` SELECT * FROM `tmp_teronogor_abyssal`;
DROP TEMPORARY TABLE `tmp_teronogor_abyssal`;
DROP TEMPORARY TABLE IF EXISTS `tmp_teronogor_abyssal_wdb`;
CREATE TEMPORARY TABLE `tmp_teronogor_abyssal_wdb` SELECT * FROM `creature_template_wdb` WHERE `Entry` = 77905;
UPDATE `tmp_teronogor_abyssal_wdb` SET `Entry` = 213593;
INSERT INTO `creature_template_wdb` SELECT * FROM `tmp_teronogor_abyssal_wdb`;
DROP TEMPORARY TABLE `tmp_teronogor_abyssal_wdb`;
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 88658;
DELETE FROM `smart_scripts` WHERE `entryorguid` = 88658 AND `source_type` = 0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `Difficulties`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(88658, 0, 0, 0, '', 0, 0, 100, 0, 6000, 9000, 12000, 15000, 0, 11, 165744, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Sargerei Arbiter - Divine Storm');
UPDATE `spell_scene` SET `ScriptName` = 'auchindoun_scene_teronogor_arrival' WHERE `MiscValue` = 914;
DELETE FROM `creature` WHERE `guid` IN (10530409, 10530410, 10530411);
DROP TEMPORARY TABLE IF EXISTS `tmp_warlock_demons`;
CREATE TEMPORARY TABLE `tmp_warlock_demons` SELECT * FROM `creature` WHERE `guid` IN (10530332, 10530334, 10530331);
UPDATE `tmp_warlock_demons` SET `guid` = 10530409, `id` = 78735, `position_x` = `position_x` + 3 * COS(`orientation` - PI() / 2), `position_y` = `position_y` + 3 * SIN(`orientation` - PI() / 2) WHERE `guid` = 10530332;
UPDATE `tmp_warlock_demons` SET `guid` = 10530410, `id` = 78734, `position_x` = `position_x` + 3 * COS(`orientation` - PI() / 2), `position_y` = `position_y` + 3 * SIN(`orientation` - PI() / 2) WHERE `guid` = 10530334;
UPDATE `tmp_warlock_demons` SET `guid` = 10530411, `id` = 78728, `position_x` = `position_x` + 3 * COS(`orientation` - PI() / 2), `position_y` = `position_y` + 3 * SIN(`orientation` - PI() / 2) WHERE `guid` = 10530331;
UPDATE `tmp_warlock_demons` SET `modelid` = 0, `equipment_id` = 0, `currentwaypoint` = 0, `MovementType` = 0, `spawndist` = 0, `curhealth` = 0, `curmana` = 0;
INSERT INTO `creature` SELECT * FROM `tmp_warlock_demons`;
DROP TEMPORARY TABLE `tmp_warlock_demons`;
UPDATE `creature_template` SET `faction` = 16 WHERE `entry` IN (78728, 78734, 78735);
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 78734;
DELETE FROM `smart_scripts` WHERE `entryorguid` = 78734 AND `source_type` = 0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `Difficulties`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(78734, 0, 0, 0, '', 0, 0, 100, 0, 2000, 3000, 4000, 6000, 0, 11, 154221, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 'Zipteq - Felblast'),
(78734, 0, 1, 0, '', 0, 0, 100, 0, 12000, 15000, 18000, 22000, 0, 11, 159017, 0, 0, 0, 0, 0, 19, 78437, 40, 0, 0, 0, 0, 0, 0, 'Zipteq - Cauterize Master');
DELETE FROM `areatrigger_template_circle` WHERE `entry` = 1569 AND `spellId` = 154174;
INSERT INTO `areatrigger_template_circle` (`entry`, `spellId`, `Radius`, `Speed`, `HasTarget`, `HasCenterPoint`, `IsReverse`, `IsActive`, `RandRevers`, `IsDinamicRadius`) VALUES (1569, 154174, 4, 3, 1, 0, 0, 1, 0, 0);
UPDATE `gameobject_template` SET `ScriptName` = '' WHERE `entry` = 231736;
UPDATE `gameobject_template` SET `ScriptName` = 'auchindoun_teronogor_gameobject_soul_transporter_01' WHERE `entry` = 231737;
UPDATE `gameobject_template` SET `ScriptName` = 'auchindoun_teronogor_gameobject_soul_transporter_02' WHERE `entry` = 231739;
UPDATE `gameobject_template` SET `ScriptName` = 'auchindoun_teronogor_gameobject_soul_transporter_03' WHERE `entry` = 231740;
UPDATE `gameobject_template` SET `ScriptName` = 'auchindoun_teronogor_gameobject_soul_transporter_04' WHERE `entry` = 231741;
UPDATE `gameobject` SET `phaseMask` = 2 WHERE `guid` = 25800025 AND `id` = 231241;
UPDATE `creature` SET `orientation` = 5.47531 WHERE `guid` IN (10530332, 10530409);
UPDATE `creature` SET `orientation` = 3.90078 WHERE `guid` IN (10530334, 10530410);
UPDATE `creature` SET `orientation` = 2.34130 WHERE `guid` IN (10530331, 10530411);
UPDATE `creature` SET `position_x` = 1840.11, `position_y` = 3029.89 WHERE `guid` = 10530409;
UPDATE `creature` SET `position_x` = 1988.54, `position_y` = 3024.68 WHERE `guid` = 10530410;
UPDATE `creature` SET `position_x` = 1983.25, `position_y` = 2877.31 WHERE `guid` = 10530411;
