-- Scripts of the Grimrail Depot: bosses, trash, spells and area triggers
UPDATE `creature_template` SET `ScriptName` = 'boss_rocketspark' WHERE `entry` = 77803;
UPDATE `creature_template` SET `ScriptName` = 'grimrail_depot_rocketspark_mob_borka' WHERE `entry` = 77816;
UPDATE `creature_template` SET `ScriptName` = 'boss_nitrogg_thundertower' WHERE `entry` = 79545;
UPDATE `creature_template` SET `ScriptName` = 'grimrail_depot_nitrogg_thundertower_mob_iron_turret' WHERE `entry` = 79548;
UPDATE `creature_template` SET `ScriptName` = 'grimrail_depot_nitrogg_thundertower_mob_assault_turret' WHERE `entry` = 82721;
UPDATE `creature_template` SET `ScriptName` = 'grimrail_depot_nitrogg_thundertower_mob_gromkar_boomer' WHERE `entry` = 79720;
UPDATE `creature_template` SET `ScriptName` = 'grimrail_depot_nitrogg_thundertower_mob_gromkar_grenadier' WHERE `entry` = 79739;
UPDATE `creature_template` SET `ScriptName` = 'grimrail_depot_nitrogg_thundertower_mob_iron_infantry' WHERE `entry` = 79888;
UPDATE `creature_template` SET `ScriptName` = 'boss_skylord_torva' WHERE `entry` = 80005;
UPDATE `creature_template` SET `ScriptName` = 'grimrail_depot_skylord_tovra_creature_rkuna' WHERE `entry` = 80004;
UPDATE `creature_template` SET `ScriptName` = 'grimrail_depot_mob_grimrail_bombadier' WHERE `entry` = 81407;
UPDATE `creature_template` SET `ScriptName` = 'grimrail_depot_mob_grimrail_laborer' WHERE `entry` = 81235;
UPDATE `creature_template` SET `ScriptName` = 'grimrail_depot_mob_grimrail_overseer' WHERE `entry` = 81212;
UPDATE `creature_template` SET `ScriptName` = 'grimrail_depot_mob_grimrail_scout' WHERE `entry` = 82590;
UPDATE `creature_template` SET `ScriptName` = 'grimrail_depot_mob_grimrail_technician' WHERE `entry` = 81236;
UPDATE `creature_template` SET `ScriptName` = 'grimrail_depot_mob_gromkar_capitan' WHERE `entry` = 82597;
UPDATE `creature_template` SET `ScriptName` = 'grimrail_depot_mob_gromkar_cinderseer' WHERE `entry` = 88163;
UPDATE `creature_template` SET `ScriptName` = 'grimrail_depot_mob_gromkar_farseer' WHERE `entry` = 82579;
UPDATE `creature_template` SET `ScriptName` = 'grimrail_depot_mob_gromkar_gunner' WHERE `entry` = 77483;
UPDATE `creature_template` SET `ScriptName` = 'grimrail_depot_mob_gromkar_hulk' WHERE `entry` = 80938;
UPDATE `creature_template` SET `ScriptName` = 'grimrail_depot_iron_star' WHERE `entry` = 81293;
UPDATE `creature_template` SET `ScriptName` = 'grimrail_depot_mob_board_to_grimrail' WHERE `entry` = 86013;

DELETE FROM `spell_script_names` WHERE `spell_id` IN (162500, 162407, 161091, 160681, 163550, 166565, 166346, 164168, 166676, 166397, 163966);
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(162500, 'grimrail_depot_rocketspark_spell_vx18_target_eliminator'),
(162407, 'grimrail_depot_rocketspark_spell_x21_01a_missile_barrage'),
(161091, 'grimrail_depot_rocketspark_spell_new_plan'),
(160681, 'grimrail_depot_nitrogg_thundertower_spell_suppressive_fire'),
(163550, 'grimrail_depot_nitrogg_thundertower_spell_blackrock_bomb'),
(166565, 'grimrail_depot_nitrogg_thundertower_slag_blast'),
(166346, 'grimrail_depot_skylord_tovra_spell_thunder_zone'),
(164168, 'grimrail_depot_spell_dash_dummy'),
(166676, 'grimrail_depot_spell_sharpnel_blast'),
(166397, 'grimrail_depot_spell_arcane_blitz'),
(163966, 'grimrail_depot_spell_activating');

DELETE FROM `areatrigger_scripts` WHERE `entry` IN (6864, 6905, 6907, 7374, 8053, 7352);
INSERT INTO `areatrigger_scripts` (`entry`, `ScriptName`) VALUES
(6864, 'grimrail_depot_skylord_tovra_at_diffused_energy'),
(6905, 'grimrail_depot_skylord_tovra_at_spinning_spear'),
(6907, 'grimrail_depot_skylord_torva_at_freezing_snare'),
(7374, 'grimrail_depot_nitrogg_thundertower_at_slagblast'),
(8053, 'grimrail_depot_at_flametongue'),
(7352, 'grimrail_depot_at_thunder_zone');
