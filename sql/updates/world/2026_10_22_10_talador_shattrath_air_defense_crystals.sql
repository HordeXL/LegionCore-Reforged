-- Talador, Shattrath: the Iron Horde siegebreaker cannons shell the air defense crystals, each crystal lasers the shells down just before they reach it, and the artillery pieces open fire one after the other, and the crystals and the artillery are seen from 900 yards so that every shell shows

UPDATE `creature_template` SET `VisibilityDistance` = 900, `MaxVisible` = 1 WHERE `entry` IN (84752, 84754, 84755);

-- invisible impact points on the shields, facing the cannons
DELETE FROM `creature_template` WHERE `entry` BETWEEN 900120 AND 900127;
DELETE FROM `creature_template_wdb` WHERE `Entry` BETWEEN 900120 AND 900127;
DELETE FROM `smart_scripts` WHERE `entryorguid` BETWEEN 900120 AND 900127 AND `source_type` = 0;
DELETE FROM `creature_template` WHERE `entry` = 900200;
DROP TEMPORARY TABLE IF EXISTS `tmp_ct`;
CREATE TEMPORARY TABLE `tmp_ct` AS SELECT * FROM `creature_template` WHERE `entry` = 79067;
UPDATE `tmp_ct` SET `entry` = 900200, `AIName` = 'SmartAI', `ScriptName` = '', `VisibilityDistance` = 450;
INSERT INTO `creature_template` SELECT * FROM `tmp_ct`;
DROP TEMPORARY TABLE `tmp_ct`;
DELETE FROM `creature_template_wdb` WHERE `Entry` = 900200;
DROP TEMPORARY TABLE IF EXISTS `tmp_wdb`;
CREATE TEMPORARY TABLE `tmp_wdb` AS SELECT * FROM `creature_template_wdb` WHERE `Entry` = 79067;
UPDATE `tmp_wdb` SET `Entry` = 900200, `Name1` = 'Air Defense Shield';
INSERT INTO `creature_template_wdb` SELECT * FROM `tmp_wdb`;
DROP TEMPORARY TABLE `tmp_wdb`;
DELETE FROM `creature_template` WHERE `entry` = 900201;
DROP TEMPORARY TABLE IF EXISTS `tmp_ct`;
CREATE TEMPORARY TABLE `tmp_ct` AS SELECT * FROM `creature_template` WHERE `entry` = 79067;
UPDATE `tmp_ct` SET `entry` = 900201, `AIName` = 'SmartAI', `ScriptName` = '', `VisibilityDistance` = 450;
INSERT INTO `creature_template` SELECT * FROM `tmp_ct`;
DROP TEMPORARY TABLE `tmp_ct`;
DELETE FROM `creature_template_wdb` WHERE `Entry` = 900201;
DROP TEMPORARY TABLE IF EXISTS `tmp_wdb`;
CREATE TEMPORARY TABLE `tmp_wdb` AS SELECT * FROM `creature_template_wdb` WHERE `Entry` = 79067;
UPDATE `tmp_wdb` SET `Entry` = 900201, `Name1` = 'Air Defense Shield';
INSERT INTO `creature_template_wdb` SELECT * FROM `tmp_wdb`;
DROP TEMPORARY TABLE `tmp_wdb`;
DELETE FROM `creature_template` WHERE `entry` = 900202;
DROP TEMPORARY TABLE IF EXISTS `tmp_ct`;
CREATE TEMPORARY TABLE `tmp_ct` AS SELECT * FROM `creature_template` WHERE `entry` = 79067;
UPDATE `tmp_ct` SET `entry` = 900202, `AIName` = 'SmartAI', `ScriptName` = '', `VisibilityDistance` = 450;
INSERT INTO `creature_template` SELECT * FROM `tmp_ct`;
DROP TEMPORARY TABLE `tmp_ct`;
DELETE FROM `creature_template_wdb` WHERE `Entry` = 900202;
DROP TEMPORARY TABLE IF EXISTS `tmp_wdb`;
CREATE TEMPORARY TABLE `tmp_wdb` AS SELECT * FROM `creature_template_wdb` WHERE `Entry` = 79067;
UPDATE `tmp_wdb` SET `Entry` = 900202, `Name1` = 'Air Defense Shield';
INSERT INTO `creature_template_wdb` SELECT * FROM `tmp_wdb`;
DROP TEMPORARY TABLE `tmp_wdb`;
DELETE FROM `creature_template` WHERE `entry` = 900203;
DROP TEMPORARY TABLE IF EXISTS `tmp_ct`;
CREATE TEMPORARY TABLE `tmp_ct` AS SELECT * FROM `creature_template` WHERE `entry` = 79067;
UPDATE `tmp_ct` SET `entry` = 900203, `AIName` = 'SmartAI', `ScriptName` = '', `VisibilityDistance` = 450;
INSERT INTO `creature_template` SELECT * FROM `tmp_ct`;
DROP TEMPORARY TABLE `tmp_ct`;
DELETE FROM `creature_template_wdb` WHERE `Entry` = 900203;
DROP TEMPORARY TABLE IF EXISTS `tmp_wdb`;
CREATE TEMPORARY TABLE `tmp_wdb` AS SELECT * FROM `creature_template_wdb` WHERE `Entry` = 79067;
UPDATE `tmp_wdb` SET `Entry` = 900203, `Name1` = 'Air Defense Shield';
INSERT INTO `creature_template_wdb` SELECT * FROM `tmp_wdb`;
DROP TEMPORARY TABLE `tmp_wdb`;
DELETE FROM `creature_template` WHERE `entry` = 900204;
DROP TEMPORARY TABLE IF EXISTS `tmp_ct`;
CREATE TEMPORARY TABLE `tmp_ct` AS SELECT * FROM `creature_template` WHERE `entry` = 79067;
UPDATE `tmp_ct` SET `entry` = 900204, `AIName` = 'SmartAI', `ScriptName` = '', `VisibilityDistance` = 450;
INSERT INTO `creature_template` SELECT * FROM `tmp_ct`;
DROP TEMPORARY TABLE `tmp_ct`;
DELETE FROM `creature_template_wdb` WHERE `Entry` = 900204;
DROP TEMPORARY TABLE IF EXISTS `tmp_wdb`;
CREATE TEMPORARY TABLE `tmp_wdb` AS SELECT * FROM `creature_template_wdb` WHERE `Entry` = 79067;
UPDATE `tmp_wdb` SET `Entry` = 900204, `Name1` = 'Air Defense Shield';
INSERT INTO `creature_template_wdb` SELECT * FROM `tmp_wdb`;
DROP TEMPORARY TABLE `tmp_wdb`;
DELETE FROM `creature_template` WHERE `entry` = 900205;
DROP TEMPORARY TABLE IF EXISTS `tmp_ct`;
CREATE TEMPORARY TABLE `tmp_ct` AS SELECT * FROM `creature_template` WHERE `entry` = 79067;
UPDATE `tmp_ct` SET `entry` = 900205, `AIName` = 'SmartAI', `ScriptName` = '', `VisibilityDistance` = 450;
INSERT INTO `creature_template` SELECT * FROM `tmp_ct`;
DROP TEMPORARY TABLE `tmp_ct`;
DELETE FROM `creature_template_wdb` WHERE `Entry` = 900205;
DROP TEMPORARY TABLE IF EXISTS `tmp_wdb`;
CREATE TEMPORARY TABLE `tmp_wdb` AS SELECT * FROM `creature_template_wdb` WHERE `Entry` = 79067;
UPDATE `tmp_wdb` SET `Entry` = 900205, `Name1` = 'Air Defense Shield';
INSERT INTO `creature_template_wdb` SELECT * FROM `tmp_wdb`;
DROP TEMPORARY TABLE `tmp_wdb`;
DELETE FROM `creature_template` WHERE `entry` = 900206;
DROP TEMPORARY TABLE IF EXISTS `tmp_ct`;
CREATE TEMPORARY TABLE `tmp_ct` AS SELECT * FROM `creature_template` WHERE `entry` = 79067;
UPDATE `tmp_ct` SET `entry` = 900206, `AIName` = 'SmartAI', `ScriptName` = '', `VisibilityDistance` = 450;
INSERT INTO `creature_template` SELECT * FROM `tmp_ct`;
DROP TEMPORARY TABLE `tmp_ct`;
DELETE FROM `creature_template_wdb` WHERE `Entry` = 900206;
DROP TEMPORARY TABLE IF EXISTS `tmp_wdb`;
CREATE TEMPORARY TABLE `tmp_wdb` AS SELECT * FROM `creature_template_wdb` WHERE `Entry` = 79067;
UPDATE `tmp_wdb` SET `Entry` = 900206, `Name1` = 'Air Defense Shield';
INSERT INTO `creature_template_wdb` SELECT * FROM `tmp_wdb`;
DROP TEMPORARY TABLE `tmp_wdb`;
DELETE FROM `creature_template` WHERE `entry` = 900207;
DROP TEMPORARY TABLE IF EXISTS `tmp_ct`;
CREATE TEMPORARY TABLE `tmp_ct` AS SELECT * FROM `creature_template` WHERE `entry` = 79067;
UPDATE `tmp_ct` SET `entry` = 900207, `AIName` = 'SmartAI', `ScriptName` = '', `VisibilityDistance` = 450;
INSERT INTO `creature_template` SELECT * FROM `tmp_ct`;
DROP TEMPORARY TABLE `tmp_ct`;
DELETE FROM `creature_template_wdb` WHERE `Entry` = 900207;
DROP TEMPORARY TABLE IF EXISTS `tmp_wdb`;
CREATE TEMPORARY TABLE `tmp_wdb` AS SELECT * FROM `creature_template_wdb` WHERE `Entry` = 79067;
UPDATE `tmp_wdb` SET `Entry` = 900207, `Name1` = 'Air Defense Shield';
INSERT INTO `creature_template_wdb` SELECT * FROM `tmp_wdb`;
DROP TEMPORARY TABLE `tmp_wdb`;
DELETE FROM `creature_template` WHERE `entry` = 900208;
DROP TEMPORARY TABLE IF EXISTS `tmp_ct`;
CREATE TEMPORARY TABLE `tmp_ct` AS SELECT * FROM `creature_template` WHERE `entry` = 79067;
UPDATE `tmp_ct` SET `entry` = 900208, `AIName` = 'SmartAI', `ScriptName` = '', `VisibilityDistance` = 450;
INSERT INTO `creature_template` SELECT * FROM `tmp_ct`;
DROP TEMPORARY TABLE `tmp_ct`;
DELETE FROM `creature_template_wdb` WHERE `Entry` = 900208;
DROP TEMPORARY TABLE IF EXISTS `tmp_wdb`;
CREATE TEMPORARY TABLE `tmp_wdb` AS SELECT * FROM `creature_template_wdb` WHERE `Entry` = 79067;
UPDATE `tmp_wdb` SET `Entry` = 900208, `Name1` = 'Air Defense Shield';
INSERT INTO `creature_template_wdb` SELECT * FROM `tmp_wdb`;
DROP TEMPORARY TABLE `tmp_wdb`;
DELETE FROM `creature_template` WHERE `entry` = 900209;
DROP TEMPORARY TABLE IF EXISTS `tmp_ct`;
CREATE TEMPORARY TABLE `tmp_ct` AS SELECT * FROM `creature_template` WHERE `entry` = 79067;
UPDATE `tmp_ct` SET `entry` = 900209, `AIName` = 'SmartAI', `ScriptName` = '', `VisibilityDistance` = 450;
INSERT INTO `creature_template` SELECT * FROM `tmp_ct`;
DROP TEMPORARY TABLE `tmp_ct`;
DELETE FROM `creature_template_wdb` WHERE `Entry` = 900209;
DROP TEMPORARY TABLE IF EXISTS `tmp_wdb`;
CREATE TEMPORARY TABLE `tmp_wdb` AS SELECT * FROM `creature_template_wdb` WHERE `Entry` = 79067;
UPDATE `tmp_wdb` SET `Entry` = 900209, `Name1` = 'Air Defense Shield';
INSERT INTO `creature_template_wdb` SELECT * FROM `tmp_wdb`;
DROP TEMPORARY TABLE `tmp_wdb`;
DELETE FROM `creature_template` WHERE `entry` = 900210;
DROP TEMPORARY TABLE IF EXISTS `tmp_ct`;
CREATE TEMPORARY TABLE `tmp_ct` AS SELECT * FROM `creature_template` WHERE `entry` = 79067;
UPDATE `tmp_ct` SET `entry` = 900210, `AIName` = 'SmartAI', `ScriptName` = '', `VisibilityDistance` = 450;
INSERT INTO `creature_template` SELECT * FROM `tmp_ct`;
DROP TEMPORARY TABLE `tmp_ct`;
DELETE FROM `creature_template_wdb` WHERE `Entry` = 900210;
DROP TEMPORARY TABLE IF EXISTS `tmp_wdb`;
CREATE TEMPORARY TABLE `tmp_wdb` AS SELECT * FROM `creature_template_wdb` WHERE `Entry` = 79067;
UPDATE `tmp_wdb` SET `Entry` = 900210, `Name1` = 'Air Defense Shield';
INSERT INTO `creature_template_wdb` SELECT * FROM `tmp_wdb`;
DROP TEMPORARY TABLE `tmp_wdb`;
DELETE FROM `creature_template` WHERE `entry` = 900211;
DROP TEMPORARY TABLE IF EXISTS `tmp_ct`;
CREATE TEMPORARY TABLE `tmp_ct` AS SELECT * FROM `creature_template` WHERE `entry` = 79067;
UPDATE `tmp_ct` SET `entry` = 900211, `AIName` = 'SmartAI', `ScriptName` = '', `VisibilityDistance` = 450;
INSERT INTO `creature_template` SELECT * FROM `tmp_ct`;
DROP TEMPORARY TABLE `tmp_ct`;
DELETE FROM `creature_template_wdb` WHERE `Entry` = 900211;
DROP TEMPORARY TABLE IF EXISTS `tmp_wdb`;
CREATE TEMPORARY TABLE `tmp_wdb` AS SELECT * FROM `creature_template_wdb` WHERE `Entry` = 79067;
UPDATE `tmp_wdb` SET `Entry` = 900211, `Name1` = 'Air Defense Shield';
INSERT INTO `creature_template_wdb` SELECT * FROM `tmp_wdb`;
DROP TEMPORARY TABLE `tmp_wdb`;
DELETE FROM `creature_template` WHERE `entry` = 900212;
DROP TEMPORARY TABLE IF EXISTS `tmp_ct`;
CREATE TEMPORARY TABLE `tmp_ct` AS SELECT * FROM `creature_template` WHERE `entry` = 79067;
UPDATE `tmp_ct` SET `entry` = 900212, `AIName` = 'SmartAI', `ScriptName` = '', `VisibilityDistance` = 450;
INSERT INTO `creature_template` SELECT * FROM `tmp_ct`;
DROP TEMPORARY TABLE `tmp_ct`;
DELETE FROM `creature_template_wdb` WHERE `Entry` = 900212;
DROP TEMPORARY TABLE IF EXISTS `tmp_wdb`;
CREATE TEMPORARY TABLE `tmp_wdb` AS SELECT * FROM `creature_template_wdb` WHERE `Entry` = 79067;
UPDATE `tmp_wdb` SET `Entry` = 900212, `Name1` = 'Air Defense Shield';
INSERT INTO `creature_template_wdb` SELECT * FROM `tmp_wdb`;
DROP TEMPORARY TABLE `tmp_wdb`;
DELETE FROM `creature_template` WHERE `entry` = 900213;
DROP TEMPORARY TABLE IF EXISTS `tmp_ct`;
CREATE TEMPORARY TABLE `tmp_ct` AS SELECT * FROM `creature_template` WHERE `entry` = 79067;
UPDATE `tmp_ct` SET `entry` = 900213, `AIName` = 'SmartAI', `ScriptName` = '', `VisibilityDistance` = 450;
INSERT INTO `creature_template` SELECT * FROM `tmp_ct`;
DROP TEMPORARY TABLE `tmp_ct`;
DELETE FROM `creature_template_wdb` WHERE `Entry` = 900213;
DROP TEMPORARY TABLE IF EXISTS `tmp_wdb`;
CREATE TEMPORARY TABLE `tmp_wdb` AS SELECT * FROM `creature_template_wdb` WHERE `Entry` = 79067;
UPDATE `tmp_wdb` SET `Entry` = 900213, `Name1` = 'Air Defense Shield';
INSERT INTO `creature_template_wdb` SELECT * FROM `tmp_wdb`;
DROP TEMPORARY TABLE `tmp_wdb`;
DELETE FROM `creature_template` WHERE `entry` = 900214;
DROP TEMPORARY TABLE IF EXISTS `tmp_ct`;
CREATE TEMPORARY TABLE `tmp_ct` AS SELECT * FROM `creature_template` WHERE `entry` = 79067;
UPDATE `tmp_ct` SET `entry` = 900214, `AIName` = 'SmartAI', `ScriptName` = '', `VisibilityDistance` = 450;
INSERT INTO `creature_template` SELECT * FROM `tmp_ct`;
DROP TEMPORARY TABLE `tmp_ct`;
DELETE FROM `creature_template_wdb` WHERE `Entry` = 900214;
DROP TEMPORARY TABLE IF EXISTS `tmp_wdb`;
CREATE TEMPORARY TABLE `tmp_wdb` AS SELECT * FROM `creature_template_wdb` WHERE `Entry` = 79067;
UPDATE `tmp_wdb` SET `Entry` = 900214, `Name1` = 'Air Defense Shield';
INSERT INTO `creature_template_wdb` SELECT * FROM `tmp_wdb`;
DROP TEMPORARY TABLE `tmp_wdb`;
DELETE FROM `creature_template` WHERE `entry` = 900215;
DROP TEMPORARY TABLE IF EXISTS `tmp_ct`;
CREATE TEMPORARY TABLE `tmp_ct` AS SELECT * FROM `creature_template` WHERE `entry` = 79067;
UPDATE `tmp_ct` SET `entry` = 900215, `AIName` = 'SmartAI', `ScriptName` = '', `VisibilityDistance` = 450;
INSERT INTO `creature_template` SELECT * FROM `tmp_ct`;
DROP TEMPORARY TABLE `tmp_ct`;
DELETE FROM `creature_template_wdb` WHERE `Entry` = 900215;
DROP TEMPORARY TABLE IF EXISTS `tmp_wdb`;
CREATE TEMPORARY TABLE `tmp_wdb` AS SELECT * FROM `creature_template_wdb` WHERE `Entry` = 79067;
UPDATE `tmp_wdb` SET `Entry` = 900215, `Name1` = 'Air Defense Shield';
INSERT INTO `creature_template_wdb` SELECT * FROM `tmp_wdb`;
DROP TEMPORARY TABLE `tmp_wdb`;
DELETE FROM `creature_template` WHERE `entry` = 900216;
DROP TEMPORARY TABLE IF EXISTS `tmp_ct`;
CREATE TEMPORARY TABLE `tmp_ct` AS SELECT * FROM `creature_template` WHERE `entry` = 79067;
UPDATE `tmp_ct` SET `entry` = 900216, `AIName` = 'SmartAI', `ScriptName` = '', `VisibilityDistance` = 450;
INSERT INTO `creature_template` SELECT * FROM `tmp_ct`;
DROP TEMPORARY TABLE `tmp_ct`;
DELETE FROM `creature_template_wdb` WHERE `Entry` = 900216;
DROP TEMPORARY TABLE IF EXISTS `tmp_wdb`;
CREATE TEMPORARY TABLE `tmp_wdb` AS SELECT * FROM `creature_template_wdb` WHERE `Entry` = 79067;
UPDATE `tmp_wdb` SET `Entry` = 900216, `Name1` = 'Air Defense Shield';
INSERT INTO `creature_template_wdb` SELECT * FROM `tmp_wdb`;
DROP TEMPORARY TABLE `tmp_wdb`;
DELETE FROM `creature_template` WHERE `entry` = 900217;
DROP TEMPORARY TABLE IF EXISTS `tmp_ct`;
CREATE TEMPORARY TABLE `tmp_ct` AS SELECT * FROM `creature_template` WHERE `entry` = 79067;
UPDATE `tmp_ct` SET `entry` = 900217, `AIName` = 'SmartAI', `ScriptName` = '', `VisibilityDistance` = 450;
INSERT INTO `creature_template` SELECT * FROM `tmp_ct`;
DROP TEMPORARY TABLE `tmp_ct`;
DELETE FROM `creature_template_wdb` WHERE `Entry` = 900217;
DROP TEMPORARY TABLE IF EXISTS `tmp_wdb`;
CREATE TEMPORARY TABLE `tmp_wdb` AS SELECT * FROM `creature_template_wdb` WHERE `Entry` = 79067;
UPDATE `tmp_wdb` SET `Entry` = 900217, `Name1` = 'Air Defense Shield';
INSERT INTO `creature_template_wdb` SELECT * FROM `tmp_wdb`;
DROP TEMPORARY TABLE `tmp_wdb`;
DELETE FROM `creature_template` WHERE `entry` = 900218;
DROP TEMPORARY TABLE IF EXISTS `tmp_ct`;
CREATE TEMPORARY TABLE `tmp_ct` AS SELECT * FROM `creature_template` WHERE `entry` = 79067;
UPDATE `tmp_ct` SET `entry` = 900218, `AIName` = 'SmartAI', `ScriptName` = '', `VisibilityDistance` = 450;
INSERT INTO `creature_template` SELECT * FROM `tmp_ct`;
DROP TEMPORARY TABLE `tmp_ct`;
DELETE FROM `creature_template_wdb` WHERE `Entry` = 900218;
DROP TEMPORARY TABLE IF EXISTS `tmp_wdb`;
CREATE TEMPORARY TABLE `tmp_wdb` AS SELECT * FROM `creature_template_wdb` WHERE `Entry` = 79067;
UPDATE `tmp_wdb` SET `Entry` = 900218, `Name1` = 'Air Defense Shield';
INSERT INTO `creature_template_wdb` SELECT * FROM `tmp_wdb`;
DROP TEMPORARY TABLE `tmp_wdb`;
DELETE FROM `creature_template` WHERE `entry` = 900219;
DROP TEMPORARY TABLE IF EXISTS `tmp_ct`;
CREATE TEMPORARY TABLE `tmp_ct` AS SELECT * FROM `creature_template` WHERE `entry` = 79067;
UPDATE `tmp_ct` SET `entry` = 900219, `AIName` = 'SmartAI', `ScriptName` = '', `VisibilityDistance` = 450;
INSERT INTO `creature_template` SELECT * FROM `tmp_ct`;
DROP TEMPORARY TABLE `tmp_ct`;
DELETE FROM `creature_template_wdb` WHERE `Entry` = 900219;
DROP TEMPORARY TABLE IF EXISTS `tmp_wdb`;
CREATE TEMPORARY TABLE `tmp_wdb` AS SELECT * FROM `creature_template_wdb` WHERE `Entry` = 79067;
UPDATE `tmp_wdb` SET `Entry` = 900219, `Name1` = 'Air Defense Shield';
INSERT INTO `creature_template_wdb` SELECT * FROM `tmp_wdb`;
DROP TEMPORARY TABLE `tmp_wdb`;
DELETE FROM `creature_template` WHERE `entry` = 900220;
DROP TEMPORARY TABLE IF EXISTS `tmp_ct`;
CREATE TEMPORARY TABLE `tmp_ct` AS SELECT * FROM `creature_template` WHERE `entry` = 79067;
UPDATE `tmp_ct` SET `entry` = 900220, `AIName` = 'SmartAI', `ScriptName` = '', `VisibilityDistance` = 450;
INSERT INTO `creature_template` SELECT * FROM `tmp_ct`;
DROP TEMPORARY TABLE `tmp_ct`;
DELETE FROM `creature_template_wdb` WHERE `Entry` = 900220;
DROP TEMPORARY TABLE IF EXISTS `tmp_wdb`;
CREATE TEMPORARY TABLE `tmp_wdb` AS SELECT * FROM `creature_template_wdb` WHERE `Entry` = 79067;
UPDATE `tmp_wdb` SET `Entry` = 900220, `Name1` = 'Air Defense Shield';
INSERT INTO `creature_template_wdb` SELECT * FROM `tmp_wdb`;
DROP TEMPORARY TABLE `tmp_wdb`;
DELETE FROM `creature_template` WHERE `entry` = 900221;
DROP TEMPORARY TABLE IF EXISTS `tmp_ct`;
CREATE TEMPORARY TABLE `tmp_ct` AS SELECT * FROM `creature_template` WHERE `entry` = 79067;
UPDATE `tmp_ct` SET `entry` = 900221, `AIName` = 'SmartAI', `ScriptName` = '', `VisibilityDistance` = 450;
INSERT INTO `creature_template` SELECT * FROM `tmp_ct`;
DROP TEMPORARY TABLE `tmp_ct`;
DELETE FROM `creature_template_wdb` WHERE `Entry` = 900221;
DROP TEMPORARY TABLE IF EXISTS `tmp_wdb`;
CREATE TEMPORARY TABLE `tmp_wdb` AS SELECT * FROM `creature_template_wdb` WHERE `Entry` = 79067;
UPDATE `tmp_wdb` SET `Entry` = 900221, `Name1` = 'Air Defense Shield';
INSERT INTO `creature_template_wdb` SELECT * FROM `tmp_wdb`;
DROP TEMPORARY TABLE `tmp_wdb`;
DELETE FROM `creature_template` WHERE `entry` = 900222;
DROP TEMPORARY TABLE IF EXISTS `tmp_ct`;
CREATE TEMPORARY TABLE `tmp_ct` AS SELECT * FROM `creature_template` WHERE `entry` = 79067;
UPDATE `tmp_ct` SET `entry` = 900222, `AIName` = 'SmartAI', `ScriptName` = '', `VisibilityDistance` = 450;
INSERT INTO `creature_template` SELECT * FROM `tmp_ct`;
DROP TEMPORARY TABLE `tmp_ct`;
DELETE FROM `creature_template_wdb` WHERE `Entry` = 900222;
DROP TEMPORARY TABLE IF EXISTS `tmp_wdb`;
CREATE TEMPORARY TABLE `tmp_wdb` AS SELECT * FROM `creature_template_wdb` WHERE `Entry` = 79067;
UPDATE `tmp_wdb` SET `Entry` = 900222, `Name1` = 'Air Defense Shield';
INSERT INTO `creature_template_wdb` SELECT * FROM `tmp_wdb`;
DROP TEMPORARY TABLE `tmp_wdb`;
DELETE FROM `creature_template` WHERE `entry` = 900223;
DROP TEMPORARY TABLE IF EXISTS `tmp_ct`;
CREATE TEMPORARY TABLE `tmp_ct` AS SELECT * FROM `creature_template` WHERE `entry` = 79067;
UPDATE `tmp_ct` SET `entry` = 900223, `AIName` = 'SmartAI', `ScriptName` = '', `VisibilityDistance` = 450;
INSERT INTO `creature_template` SELECT * FROM `tmp_ct`;
DROP TEMPORARY TABLE `tmp_ct`;
DELETE FROM `creature_template_wdb` WHERE `Entry` = 900223;
DROP TEMPORARY TABLE IF EXISTS `tmp_wdb`;
CREATE TEMPORARY TABLE `tmp_wdb` AS SELECT * FROM `creature_template_wdb` WHERE `Entry` = 79067;
UPDATE `tmp_wdb` SET `Entry` = 900223, `Name1` = 'Air Defense Shield';
INSERT INTO `creature_template_wdb` SELECT * FROM `tmp_wdb`;
DROP TEMPORARY TABLE `tmp_wdb`;
DELETE FROM `creature_template` WHERE `entry` = 900224;
DROP TEMPORARY TABLE IF EXISTS `tmp_ct`;
CREATE TEMPORARY TABLE `tmp_ct` AS SELECT * FROM `creature_template` WHERE `entry` = 79067;
UPDATE `tmp_ct` SET `entry` = 900224, `AIName` = 'SmartAI', `ScriptName` = '', `VisibilityDistance` = 450;
INSERT INTO `creature_template` SELECT * FROM `tmp_ct`;
DROP TEMPORARY TABLE `tmp_ct`;
DELETE FROM `creature_template_wdb` WHERE `Entry` = 900224;
DROP TEMPORARY TABLE IF EXISTS `tmp_wdb`;
CREATE TEMPORARY TABLE `tmp_wdb` AS SELECT * FROM `creature_template_wdb` WHERE `Entry` = 79067;
UPDATE `tmp_wdb` SET `Entry` = 900224, `Name1` = 'Air Defense Shield';
INSERT INTO `creature_template_wdb` SELECT * FROM `tmp_wdb`;
DROP TEMPORARY TABLE `tmp_wdb`;
DELETE FROM `creature_template` WHERE `entry` = 900225;
DROP TEMPORARY TABLE IF EXISTS `tmp_ct`;
CREATE TEMPORARY TABLE `tmp_ct` AS SELECT * FROM `creature_template` WHERE `entry` = 79067;
UPDATE `tmp_ct` SET `entry` = 900225, `AIName` = 'SmartAI', `ScriptName` = '', `VisibilityDistance` = 450;
INSERT INTO `creature_template` SELECT * FROM `tmp_ct`;
DROP TEMPORARY TABLE `tmp_ct`;
DELETE FROM `creature_template_wdb` WHERE `Entry` = 900225;
DROP TEMPORARY TABLE IF EXISTS `tmp_wdb`;
CREATE TEMPORARY TABLE `tmp_wdb` AS SELECT * FROM `creature_template_wdb` WHERE `Entry` = 79067;
UPDATE `tmp_wdb` SET `Entry` = 900225, `Name1` = 'Air Defense Shield';
INSERT INTO `creature_template_wdb` SELECT * FROM `tmp_wdb`;
DROP TEMPORARY TABLE `tmp_wdb`;
DELETE FROM `creature_template` WHERE `entry` = 900226;
DROP TEMPORARY TABLE IF EXISTS `tmp_ct`;
CREATE TEMPORARY TABLE `tmp_ct` AS SELECT * FROM `creature_template` WHERE `entry` = 79067;
UPDATE `tmp_ct` SET `entry` = 900226, `AIName` = 'SmartAI', `ScriptName` = '', `VisibilityDistance` = 450;
INSERT INTO `creature_template` SELECT * FROM `tmp_ct`;
DROP TEMPORARY TABLE `tmp_ct`;
DELETE FROM `creature_template_wdb` WHERE `Entry` = 900226;
DROP TEMPORARY TABLE IF EXISTS `tmp_wdb`;
CREATE TEMPORARY TABLE `tmp_wdb` AS SELECT * FROM `creature_template_wdb` WHERE `Entry` = 79067;
UPDATE `tmp_wdb` SET `Entry` = 900226, `Name1` = 'Air Defense Shield';
INSERT INTO `creature_template_wdb` SELECT * FROM `tmp_wdb`;
DROP TEMPORARY TABLE `tmp_wdb`;
DELETE FROM `creature_template` WHERE `entry` = 900227;
DROP TEMPORARY TABLE IF EXISTS `tmp_ct`;
CREATE TEMPORARY TABLE `tmp_ct` AS SELECT * FROM `creature_template` WHERE `entry` = 79067;
UPDATE `tmp_ct` SET `entry` = 900227, `AIName` = 'SmartAI', `ScriptName` = '', `VisibilityDistance` = 450;
INSERT INTO `creature_template` SELECT * FROM `tmp_ct`;
DROP TEMPORARY TABLE `tmp_ct`;
DELETE FROM `creature_template_wdb` WHERE `Entry` = 900227;
DROP TEMPORARY TABLE IF EXISTS `tmp_wdb`;
CREATE TEMPORARY TABLE `tmp_wdb` AS SELECT * FROM `creature_template_wdb` WHERE `Entry` = 79067;
UPDATE `tmp_wdb` SET `Entry` = 900227, `Name1` = 'Air Defense Shield';
INSERT INTO `creature_template_wdb` SELECT * FROM `tmp_wdb`;
DROP TEMPORARY TABLE `tmp_wdb`;
DELETE FROM `creature_template` WHERE `entry` = 900228;
DROP TEMPORARY TABLE IF EXISTS `tmp_ct`;
CREATE TEMPORARY TABLE `tmp_ct` AS SELECT * FROM `creature_template` WHERE `entry` = 79067;
UPDATE `tmp_ct` SET `entry` = 900228, `AIName` = 'SmartAI', `ScriptName` = '', `VisibilityDistance` = 450;
INSERT INTO `creature_template` SELECT * FROM `tmp_ct`;
DROP TEMPORARY TABLE `tmp_ct`;
DELETE FROM `creature_template_wdb` WHERE `Entry` = 900228;
DROP TEMPORARY TABLE IF EXISTS `tmp_wdb`;
CREATE TEMPORARY TABLE `tmp_wdb` AS SELECT * FROM `creature_template_wdb` WHERE `Entry` = 79067;
UPDATE `tmp_wdb` SET `Entry` = 900228, `Name1` = 'Air Defense Shield';
INSERT INTO `creature_template_wdb` SELECT * FROM `tmp_wdb`;
DROP TEMPORARY TABLE `tmp_wdb`;
DELETE FROM `creature_template` WHERE `entry` = 900229;
DROP TEMPORARY TABLE IF EXISTS `tmp_ct`;
CREATE TEMPORARY TABLE `tmp_ct` AS SELECT * FROM `creature_template` WHERE `entry` = 79067;
UPDATE `tmp_ct` SET `entry` = 900229, `AIName` = 'SmartAI', `ScriptName` = '', `VisibilityDistance` = 450;
INSERT INTO `creature_template` SELECT * FROM `tmp_ct`;
DROP TEMPORARY TABLE `tmp_ct`;
DELETE FROM `creature_template_wdb` WHERE `Entry` = 900229;
DROP TEMPORARY TABLE IF EXISTS `tmp_wdb`;
CREATE TEMPORARY TABLE `tmp_wdb` AS SELECT * FROM `creature_template_wdb` WHERE `Entry` = 79067;
UPDATE `tmp_wdb` SET `Entry` = 900229, `Name1` = 'Air Defense Shield';
INSERT INTO `creature_template_wdb` SELECT * FROM `tmp_wdb`;
DROP TEMPORARY TABLE `tmp_wdb`;
DELETE FROM `creature_template` WHERE `entry` = 900230;
DROP TEMPORARY TABLE IF EXISTS `tmp_ct`;
CREATE TEMPORARY TABLE `tmp_ct` AS SELECT * FROM `creature_template` WHERE `entry` = 79067;
UPDATE `tmp_ct` SET `entry` = 900230, `AIName` = 'SmartAI', `ScriptName` = '', `VisibilityDistance` = 450;
INSERT INTO `creature_template` SELECT * FROM `tmp_ct`;
DROP TEMPORARY TABLE `tmp_ct`;
DELETE FROM `creature_template_wdb` WHERE `Entry` = 900230;
DROP TEMPORARY TABLE IF EXISTS `tmp_wdb`;
CREATE TEMPORARY TABLE `tmp_wdb` AS SELECT * FROM `creature_template_wdb` WHERE `Entry` = 79067;
UPDATE `tmp_wdb` SET `Entry` = 900230, `Name1` = 'Air Defense Shield';
INSERT INTO `creature_template_wdb` SELECT * FROM `tmp_wdb`;
DROP TEMPORARY TABLE `tmp_wdb`;
DELETE FROM `creature_template` WHERE `entry` = 900231;
DROP TEMPORARY TABLE IF EXISTS `tmp_ct`;
CREATE TEMPORARY TABLE `tmp_ct` AS SELECT * FROM `creature_template` WHERE `entry` = 79067;
UPDATE `tmp_ct` SET `entry` = 900231, `AIName` = 'SmartAI', `ScriptName` = '', `VisibilityDistance` = 450;
INSERT INTO `creature_template` SELECT * FROM `tmp_ct`;
DROP TEMPORARY TABLE `tmp_ct`;
DELETE FROM `creature_template_wdb` WHERE `Entry` = 900231;
DROP TEMPORARY TABLE IF EXISTS `tmp_wdb`;
CREATE TEMPORARY TABLE `tmp_wdb` AS SELECT * FROM `creature_template_wdb` WHERE `Entry` = 79067;
UPDATE `tmp_wdb` SET `Entry` = 900231, `Name1` = 'Air Defense Shield';
INSERT INTO `creature_template_wdb` SELECT * FROM `tmp_wdb`;
DROP TEMPORARY TABLE `tmp_wdb`;
DELETE FROM `creature_template` WHERE `entry` = 900232;
DROP TEMPORARY TABLE IF EXISTS `tmp_ct`;
CREATE TEMPORARY TABLE `tmp_ct` AS SELECT * FROM `creature_template` WHERE `entry` = 79067;
UPDATE `tmp_ct` SET `entry` = 900232, `AIName` = 'SmartAI', `ScriptName` = '', `VisibilityDistance` = 450;
INSERT INTO `creature_template` SELECT * FROM `tmp_ct`;
DROP TEMPORARY TABLE `tmp_ct`;
DELETE FROM `creature_template_wdb` WHERE `Entry` = 900232;
DROP TEMPORARY TABLE IF EXISTS `tmp_wdb`;
CREATE TEMPORARY TABLE `tmp_wdb` AS SELECT * FROM `creature_template_wdb` WHERE `Entry` = 79067;
UPDATE `tmp_wdb` SET `Entry` = 900232, `Name1` = 'Air Defense Shield';
INSERT INTO `creature_template_wdb` SELECT * FROM `tmp_wdb`;
DROP TEMPORARY TABLE `tmp_wdb`;
DELETE FROM `creature_template` WHERE `entry` = 900233;
DROP TEMPORARY TABLE IF EXISTS `tmp_ct`;
CREATE TEMPORARY TABLE `tmp_ct` AS SELECT * FROM `creature_template` WHERE `entry` = 79067;
UPDATE `tmp_ct` SET `entry` = 900233, `AIName` = 'SmartAI', `ScriptName` = '', `VisibilityDistance` = 450;
INSERT INTO `creature_template` SELECT * FROM `tmp_ct`;
DROP TEMPORARY TABLE `tmp_ct`;
DELETE FROM `creature_template_wdb` WHERE `Entry` = 900233;
DROP TEMPORARY TABLE IF EXISTS `tmp_wdb`;
CREATE TEMPORARY TABLE `tmp_wdb` AS SELECT * FROM `creature_template_wdb` WHERE `Entry` = 79067;
UPDATE `tmp_wdb` SET `Entry` = 900233, `Name1` = 'Air Defense Shield';
INSERT INTO `creature_template_wdb` SELECT * FROM `tmp_wdb`;
DROP TEMPORARY TABLE `tmp_wdb`;
DELETE FROM `creature_template` WHERE `entry` = 900234;
DROP TEMPORARY TABLE IF EXISTS `tmp_ct`;
CREATE TEMPORARY TABLE `tmp_ct` AS SELECT * FROM `creature_template` WHERE `entry` = 79067;
UPDATE `tmp_ct` SET `entry` = 900234, `AIName` = 'SmartAI', `ScriptName` = '', `VisibilityDistance` = 450;
INSERT INTO `creature_template` SELECT * FROM `tmp_ct`;
DROP TEMPORARY TABLE `tmp_ct`;
DELETE FROM `creature_template_wdb` WHERE `Entry` = 900234;
DROP TEMPORARY TABLE IF EXISTS `tmp_wdb`;
CREATE TEMPORARY TABLE `tmp_wdb` AS SELECT * FROM `creature_template_wdb` WHERE `Entry` = 79067;
UPDATE `tmp_wdb` SET `Entry` = 900234, `Name1` = 'Air Defense Shield';
INSERT INTO `creature_template_wdb` SELECT * FROM `tmp_wdb`;
DROP TEMPORARY TABLE `tmp_wdb`;
DELETE FROM `creature_template` WHERE `entry` = 900235;
DROP TEMPORARY TABLE IF EXISTS `tmp_ct`;
CREATE TEMPORARY TABLE `tmp_ct` AS SELECT * FROM `creature_template` WHERE `entry` = 79067;
UPDATE `tmp_ct` SET `entry` = 900235, `AIName` = 'SmartAI', `ScriptName` = '', `VisibilityDistance` = 450;
INSERT INTO `creature_template` SELECT * FROM `tmp_ct`;
DROP TEMPORARY TABLE `tmp_ct`;
DELETE FROM `creature_template_wdb` WHERE `Entry` = 900235;
DROP TEMPORARY TABLE IF EXISTS `tmp_wdb`;
CREATE TEMPORARY TABLE `tmp_wdb` AS SELECT * FROM `creature_template_wdb` WHERE `Entry` = 79067;
UPDATE `tmp_wdb` SET `Entry` = 900235, `Name1` = 'Air Defense Shield';
INSERT INTO `creature_template_wdb` SELECT * FROM `tmp_wdb`;
DROP TEMPORARY TABLE `tmp_wdb`;
DELETE FROM `creature_template` WHERE `entry` = 900236;
DROP TEMPORARY TABLE IF EXISTS `tmp_ct`;
CREATE TEMPORARY TABLE `tmp_ct` AS SELECT * FROM `creature_template` WHERE `entry` = 79067;
UPDATE `tmp_ct` SET `entry` = 900236, `AIName` = 'SmartAI', `ScriptName` = '', `VisibilityDistance` = 450;
INSERT INTO `creature_template` SELECT * FROM `tmp_ct`;
DROP TEMPORARY TABLE `tmp_ct`;
DELETE FROM `creature_template_wdb` WHERE `Entry` = 900236;
DROP TEMPORARY TABLE IF EXISTS `tmp_wdb`;
CREATE TEMPORARY TABLE `tmp_wdb` AS SELECT * FROM `creature_template_wdb` WHERE `Entry` = 79067;
UPDATE `tmp_wdb` SET `Entry` = 900236, `Name1` = 'Air Defense Shield';
INSERT INTO `creature_template_wdb` SELECT * FROM `tmp_wdb`;
DROP TEMPORARY TABLE `tmp_wdb`;
DELETE FROM `creature_template` WHERE `entry` = 900237;
DROP TEMPORARY TABLE IF EXISTS `tmp_ct`;
CREATE TEMPORARY TABLE `tmp_ct` AS SELECT * FROM `creature_template` WHERE `entry` = 79067;
UPDATE `tmp_ct` SET `entry` = 900237, `AIName` = 'SmartAI', `ScriptName` = '', `VisibilityDistance` = 450;
INSERT INTO `creature_template` SELECT * FROM `tmp_ct`;
DROP TEMPORARY TABLE `tmp_ct`;
DELETE FROM `creature_template_wdb` WHERE `Entry` = 900237;
DROP TEMPORARY TABLE IF EXISTS `tmp_wdb`;
CREATE TEMPORARY TABLE `tmp_wdb` AS SELECT * FROM `creature_template_wdb` WHERE `Entry` = 79067;
UPDATE `tmp_wdb` SET `Entry` = 900237, `Name1` = 'Air Defense Shield';
INSERT INTO `creature_template_wdb` SELECT * FROM `tmp_wdb`;
DROP TEMPORARY TABLE `tmp_wdb`;
DELETE FROM `creature_template` WHERE `entry` = 900238;
DROP TEMPORARY TABLE IF EXISTS `tmp_ct`;
CREATE TEMPORARY TABLE `tmp_ct` AS SELECT * FROM `creature_template` WHERE `entry` = 79067;
UPDATE `tmp_ct` SET `entry` = 900238, `AIName` = 'SmartAI', `ScriptName` = '', `VisibilityDistance` = 450;
INSERT INTO `creature_template` SELECT * FROM `tmp_ct`;
DROP TEMPORARY TABLE `tmp_ct`;
DELETE FROM `creature_template_wdb` WHERE `Entry` = 900238;
DROP TEMPORARY TABLE IF EXISTS `tmp_wdb`;
CREATE TEMPORARY TABLE `tmp_wdb` AS SELECT * FROM `creature_template_wdb` WHERE `Entry` = 79067;
UPDATE `tmp_wdb` SET `Entry` = 900238, `Name1` = 'Air Defense Shield';
INSERT INTO `creature_template_wdb` SELECT * FROM `tmp_wdb`;
DROP TEMPORARY TABLE `tmp_wdb`;
DELETE FROM `creature_template` WHERE `entry` = 900239;
DROP TEMPORARY TABLE IF EXISTS `tmp_ct`;
CREATE TEMPORARY TABLE `tmp_ct` AS SELECT * FROM `creature_template` WHERE `entry` = 79067;
UPDATE `tmp_ct` SET `entry` = 900239, `AIName` = 'SmartAI', `ScriptName` = '', `VisibilityDistance` = 450;
INSERT INTO `creature_template` SELECT * FROM `tmp_ct`;
DROP TEMPORARY TABLE `tmp_ct`;
DELETE FROM `creature_template_wdb` WHERE `Entry` = 900239;
DROP TEMPORARY TABLE IF EXISTS `tmp_wdb`;
CREATE TEMPORARY TABLE `tmp_wdb` AS SELECT * FROM `creature_template_wdb` WHERE `Entry` = 79067;
UPDATE `tmp_wdb` SET `Entry` = 900239, `Name1` = 'Air Defense Shield';
INSERT INTO `creature_template_wdb` SELECT * FROM `tmp_wdb`;
DROP TEMPORARY TABLE `tmp_wdb`;
DELETE FROM `creature_template` WHERE `entry` = 900240;
DROP TEMPORARY TABLE IF EXISTS `tmp_ct`;
CREATE TEMPORARY TABLE `tmp_ct` AS SELECT * FROM `creature_template` WHERE `entry` = 79067;
UPDATE `tmp_ct` SET `entry` = 900240, `AIName` = 'SmartAI', `ScriptName` = '', `VisibilityDistance` = 450;
INSERT INTO `creature_template` SELECT * FROM `tmp_ct`;
DROP TEMPORARY TABLE `tmp_ct`;
DELETE FROM `creature_template_wdb` WHERE `Entry` = 900240;
DROP TEMPORARY TABLE IF EXISTS `tmp_wdb`;
CREATE TEMPORARY TABLE `tmp_wdb` AS SELECT * FROM `creature_template_wdb` WHERE `Entry` = 79067;
UPDATE `tmp_wdb` SET `Entry` = 900240, `Name1` = 'Air Defense Shield';
INSERT INTO `creature_template_wdb` SELECT * FROM `tmp_wdb`;
DROP TEMPORARY TABLE `tmp_wdb`;
DELETE FROM `creature_template` WHERE `entry` = 900241;
DROP TEMPORARY TABLE IF EXISTS `tmp_ct`;
CREATE TEMPORARY TABLE `tmp_ct` AS SELECT * FROM `creature_template` WHERE `entry` = 79067;
UPDATE `tmp_ct` SET `entry` = 900241, `AIName` = 'SmartAI', `ScriptName` = '', `VisibilityDistance` = 450;
INSERT INTO `creature_template` SELECT * FROM `tmp_ct`;
DROP TEMPORARY TABLE `tmp_ct`;
DELETE FROM `creature_template_wdb` WHERE `Entry` = 900241;
DROP TEMPORARY TABLE IF EXISTS `tmp_wdb`;
CREATE TEMPORARY TABLE `tmp_wdb` AS SELECT * FROM `creature_template_wdb` WHERE `Entry` = 79067;
UPDATE `tmp_wdb` SET `Entry` = 900241, `Name1` = 'Air Defense Shield';
INSERT INTO `creature_template_wdb` SELECT * FROM `tmp_wdb`;
DROP TEMPORARY TABLE `tmp_wdb`;
DELETE FROM `creature_template` WHERE `entry` = 900242;
DROP TEMPORARY TABLE IF EXISTS `tmp_ct`;
CREATE TEMPORARY TABLE `tmp_ct` AS SELECT * FROM `creature_template` WHERE `entry` = 79067;
UPDATE `tmp_ct` SET `entry` = 900242, `AIName` = 'SmartAI', `ScriptName` = '', `VisibilityDistance` = 450;
INSERT INTO `creature_template` SELECT * FROM `tmp_ct`;
DROP TEMPORARY TABLE `tmp_ct`;
DELETE FROM `creature_template_wdb` WHERE `Entry` = 900242;
DROP TEMPORARY TABLE IF EXISTS `tmp_wdb`;
CREATE TEMPORARY TABLE `tmp_wdb` AS SELECT * FROM `creature_template_wdb` WHERE `Entry` = 79067;
UPDATE `tmp_wdb` SET `Entry` = 900242, `Name1` = 'Air Defense Shield';
INSERT INTO `creature_template_wdb` SELECT * FROM `tmp_wdb`;
DROP TEMPORARY TABLE `tmp_wdb`;
DELETE FROM `creature_template` WHERE `entry` = 900243;
DROP TEMPORARY TABLE IF EXISTS `tmp_ct`;
CREATE TEMPORARY TABLE `tmp_ct` AS SELECT * FROM `creature_template` WHERE `entry` = 79067;
UPDATE `tmp_ct` SET `entry` = 900243, `AIName` = 'SmartAI', `ScriptName` = '', `VisibilityDistance` = 450;
INSERT INTO `creature_template` SELECT * FROM `tmp_ct`;
DROP TEMPORARY TABLE `tmp_ct`;
DELETE FROM `creature_template_wdb` WHERE `Entry` = 900243;
DROP TEMPORARY TABLE IF EXISTS `tmp_wdb`;
CREATE TEMPORARY TABLE `tmp_wdb` AS SELECT * FROM `creature_template_wdb` WHERE `Entry` = 79067;
UPDATE `tmp_wdb` SET `Entry` = 900243, `Name1` = 'Air Defense Shield';
INSERT INTO `creature_template_wdb` SELECT * FROM `tmp_wdb`;
DROP TEMPORARY TABLE `tmp_wdb`;
DELETE FROM `creature_template` WHERE `entry` = 900244;
DROP TEMPORARY TABLE IF EXISTS `tmp_ct`;
CREATE TEMPORARY TABLE `tmp_ct` AS SELECT * FROM `creature_template` WHERE `entry` = 79067;
UPDATE `tmp_ct` SET `entry` = 900244, `AIName` = 'SmartAI', `ScriptName` = '', `VisibilityDistance` = 450;
INSERT INTO `creature_template` SELECT * FROM `tmp_ct`;
DROP TEMPORARY TABLE `tmp_ct`;
DELETE FROM `creature_template_wdb` WHERE `Entry` = 900244;
DROP TEMPORARY TABLE IF EXISTS `tmp_wdb`;
CREATE TEMPORARY TABLE `tmp_wdb` AS SELECT * FROM `creature_template_wdb` WHERE `Entry` = 79067;
UPDATE `tmp_wdb` SET `Entry` = 900244, `Name1` = 'Air Defense Shield';
INSERT INTO `creature_template_wdb` SELECT * FROM `tmp_wdb`;
DROP TEMPORARY TABLE `tmp_wdb`;
DELETE FROM `creature_template` WHERE `entry` = 900245;
DROP TEMPORARY TABLE IF EXISTS `tmp_ct`;
CREATE TEMPORARY TABLE `tmp_ct` AS SELECT * FROM `creature_template` WHERE `entry` = 79067;
UPDATE `tmp_ct` SET `entry` = 900245, `AIName` = 'SmartAI', `ScriptName` = '', `VisibilityDistance` = 450;
INSERT INTO `creature_template` SELECT * FROM `tmp_ct`;
DROP TEMPORARY TABLE `tmp_ct`;
DELETE FROM `creature_template_wdb` WHERE `Entry` = 900245;
DROP TEMPORARY TABLE IF EXISTS `tmp_wdb`;
CREATE TEMPORARY TABLE `tmp_wdb` AS SELECT * FROM `creature_template_wdb` WHERE `Entry` = 79067;
UPDATE `tmp_wdb` SET `Entry` = 900245, `Name1` = 'Air Defense Shield';
INSERT INTO `creature_template_wdb` SELECT * FROM `tmp_wdb`;
DROP TEMPORARY TABLE `tmp_wdb`;
DELETE FROM `creature_template` WHERE `entry` = 900246;
DROP TEMPORARY TABLE IF EXISTS `tmp_ct`;
CREATE TEMPORARY TABLE `tmp_ct` AS SELECT * FROM `creature_template` WHERE `entry` = 79067;
UPDATE `tmp_ct` SET `entry` = 900246, `AIName` = 'SmartAI', `ScriptName` = '', `VisibilityDistance` = 450;
INSERT INTO `creature_template` SELECT * FROM `tmp_ct`;
DROP TEMPORARY TABLE `tmp_ct`;
DELETE FROM `creature_template_wdb` WHERE `Entry` = 900246;
DROP TEMPORARY TABLE IF EXISTS `tmp_wdb`;
CREATE TEMPORARY TABLE `tmp_wdb` AS SELECT * FROM `creature_template_wdb` WHERE `Entry` = 79067;
UPDATE `tmp_wdb` SET `Entry` = 900246, `Name1` = 'Air Defense Shield';
INSERT INTO `creature_template_wdb` SELECT * FROM `tmp_wdb`;
DROP TEMPORARY TABLE `tmp_wdb`;
DELETE FROM `creature_template` WHERE `entry` = 900247;
DROP TEMPORARY TABLE IF EXISTS `tmp_ct`;
CREATE TEMPORARY TABLE `tmp_ct` AS SELECT * FROM `creature_template` WHERE `entry` = 79067;
UPDATE `tmp_ct` SET `entry` = 900247, `AIName` = 'SmartAI', `ScriptName` = '', `VisibilityDistance` = 450;
INSERT INTO `creature_template` SELECT * FROM `tmp_ct`;
DROP TEMPORARY TABLE `tmp_ct`;
DELETE FROM `creature_template_wdb` WHERE `Entry` = 900247;
DROP TEMPORARY TABLE IF EXISTS `tmp_wdb`;
CREATE TEMPORARY TABLE `tmp_wdb` AS SELECT * FROM `creature_template_wdb` WHERE `Entry` = 79067;
UPDATE `tmp_wdb` SET `Entry` = 900247, `Name1` = 'Air Defense Shield';
INSERT INTO `creature_template_wdb` SELECT * FROM `tmp_wdb`;
DROP TEMPORARY TABLE `tmp_wdb`;
DELETE FROM `creature_template` WHERE `entry` = 900248;
DROP TEMPORARY TABLE IF EXISTS `tmp_ct`;
CREATE TEMPORARY TABLE `tmp_ct` AS SELECT * FROM `creature_template` WHERE `entry` = 79067;
UPDATE `tmp_ct` SET `entry` = 900248, `AIName` = 'SmartAI', `ScriptName` = '', `VisibilityDistance` = 450;
INSERT INTO `creature_template` SELECT * FROM `tmp_ct`;
DROP TEMPORARY TABLE `tmp_ct`;
DELETE FROM `creature_template_wdb` WHERE `Entry` = 900248;
DROP TEMPORARY TABLE IF EXISTS `tmp_wdb`;
CREATE TEMPORARY TABLE `tmp_wdb` AS SELECT * FROM `creature_template_wdb` WHERE `Entry` = 79067;
UPDATE `tmp_wdb` SET `Entry` = 900248, `Name1` = 'Air Defense Shield';
INSERT INTO `creature_template_wdb` SELECT * FROM `tmp_wdb`;
DROP TEMPORARY TABLE `tmp_wdb`;
DELETE FROM `creature_template` WHERE `entry` = 900249;
DROP TEMPORARY TABLE IF EXISTS `tmp_ct`;
CREATE TEMPORARY TABLE `tmp_ct` AS SELECT * FROM `creature_template` WHERE `entry` = 79067;
UPDATE `tmp_ct` SET `entry` = 900249, `AIName` = 'SmartAI', `ScriptName` = '', `VisibilityDistance` = 450;
INSERT INTO `creature_template` SELECT * FROM `tmp_ct`;
DROP TEMPORARY TABLE `tmp_ct`;
DELETE FROM `creature_template_wdb` WHERE `Entry` = 900249;
DROP TEMPORARY TABLE IF EXISTS `tmp_wdb`;
CREATE TEMPORARY TABLE `tmp_wdb` AS SELECT * FROM `creature_template_wdb` WHERE `Entry` = 79067;
UPDATE `tmp_wdb` SET `Entry` = 900249, `Name1` = 'Air Defense Shield';
INSERT INTO `creature_template_wdb` SELECT * FROM `tmp_wdb`;
DROP TEMPORARY TABLE `tmp_wdb`;
DELETE FROM `creature_template` WHERE `entry` = 900250;
DROP TEMPORARY TABLE IF EXISTS `tmp_ct`;
CREATE TEMPORARY TABLE `tmp_ct` AS SELECT * FROM `creature_template` WHERE `entry` = 79067;
UPDATE `tmp_ct` SET `entry` = 900250, `AIName` = 'SmartAI', `ScriptName` = '', `VisibilityDistance` = 450;
INSERT INTO `creature_template` SELECT * FROM `tmp_ct`;
DROP TEMPORARY TABLE `tmp_ct`;
DELETE FROM `creature_template_wdb` WHERE `Entry` = 900250;
DROP TEMPORARY TABLE IF EXISTS `tmp_wdb`;
CREATE TEMPORARY TABLE `tmp_wdb` AS SELECT * FROM `creature_template_wdb` WHERE `Entry` = 79067;
UPDATE `tmp_wdb` SET `Entry` = 900250, `Name1` = 'Air Defense Shield';
INSERT INTO `creature_template_wdb` SELECT * FROM `tmp_wdb`;
DROP TEMPORARY TABLE `tmp_wdb`;
DELETE FROM `creature_template` WHERE `entry` = 900251;
DROP TEMPORARY TABLE IF EXISTS `tmp_ct`;
CREATE TEMPORARY TABLE `tmp_ct` AS SELECT * FROM `creature_template` WHERE `entry` = 79067;
UPDATE `tmp_ct` SET `entry` = 900251, `AIName` = 'SmartAI', `ScriptName` = '', `VisibilityDistance` = 450;
INSERT INTO `creature_template` SELECT * FROM `tmp_ct`;
DROP TEMPORARY TABLE `tmp_ct`;
DELETE FROM `creature_template_wdb` WHERE `Entry` = 900251;
DROP TEMPORARY TABLE IF EXISTS `tmp_wdb`;
CREATE TEMPORARY TABLE `tmp_wdb` AS SELECT * FROM `creature_template_wdb` WHERE `Entry` = 79067;
UPDATE `tmp_wdb` SET `Entry` = 900251, `Name1` = 'Air Defense Shield';
INSERT INTO `creature_template_wdb` SELECT * FROM `tmp_wdb`;
DROP TEMPORARY TABLE `tmp_wdb`;
DELETE FROM `creature_template` WHERE `entry` = 900252;
DROP TEMPORARY TABLE IF EXISTS `tmp_ct`;
CREATE TEMPORARY TABLE `tmp_ct` AS SELECT * FROM `creature_template` WHERE `entry` = 79067;
UPDATE `tmp_ct` SET `entry` = 900252, `AIName` = 'SmartAI', `ScriptName` = '', `VisibilityDistance` = 450;
INSERT INTO `creature_template` SELECT * FROM `tmp_ct`;
DROP TEMPORARY TABLE `tmp_ct`;
DELETE FROM `creature_template_wdb` WHERE `Entry` = 900252;
DROP TEMPORARY TABLE IF EXISTS `tmp_wdb`;
CREATE TEMPORARY TABLE `tmp_wdb` AS SELECT * FROM `creature_template_wdb` WHERE `Entry` = 79067;
UPDATE `tmp_wdb` SET `Entry` = 900252, `Name1` = 'Air Defense Shield';
INSERT INTO `creature_template_wdb` SELECT * FROM `tmp_wdb`;
DROP TEMPORARY TABLE `tmp_wdb`;
DELETE FROM `creature_template` WHERE `entry` = 900253;
DROP TEMPORARY TABLE IF EXISTS `tmp_ct`;
CREATE TEMPORARY TABLE `tmp_ct` AS SELECT * FROM `creature_template` WHERE `entry` = 79067;
UPDATE `tmp_ct` SET `entry` = 900253, `AIName` = 'SmartAI', `ScriptName` = '', `VisibilityDistance` = 450;
INSERT INTO `creature_template` SELECT * FROM `tmp_ct`;
DROP TEMPORARY TABLE `tmp_ct`;
DELETE FROM `creature_template_wdb` WHERE `Entry` = 900253;
DROP TEMPORARY TABLE IF EXISTS `tmp_wdb`;
CREATE TEMPORARY TABLE `tmp_wdb` AS SELECT * FROM `creature_template_wdb` WHERE `Entry` = 79067;
UPDATE `tmp_wdb` SET `Entry` = 900253, `Name1` = 'Air Defense Shield';
INSERT INTO `creature_template_wdb` SELECT * FROM `tmp_wdb`;
DROP TEMPORARY TABLE `tmp_wdb`;
DELETE FROM `creature_template` WHERE `entry` = 900254;
DROP TEMPORARY TABLE IF EXISTS `tmp_ct`;
CREATE TEMPORARY TABLE `tmp_ct` AS SELECT * FROM `creature_template` WHERE `entry` = 79067;
UPDATE `tmp_ct` SET `entry` = 900254, `AIName` = 'SmartAI', `ScriptName` = '', `VisibilityDistance` = 450;
INSERT INTO `creature_template` SELECT * FROM `tmp_ct`;
DROP TEMPORARY TABLE `tmp_ct`;
DELETE FROM `creature_template_wdb` WHERE `Entry` = 900254;
DROP TEMPORARY TABLE IF EXISTS `tmp_wdb`;
CREATE TEMPORARY TABLE `tmp_wdb` AS SELECT * FROM `creature_template_wdb` WHERE `Entry` = 79067;
UPDATE `tmp_wdb` SET `Entry` = 900254, `Name1` = 'Air Defense Shield';
INSERT INTO `creature_template_wdb` SELECT * FROM `tmp_wdb`;
DROP TEMPORARY TABLE `tmp_wdb`;
DELETE FROM `creature_template` WHERE `entry` = 900255;
DROP TEMPORARY TABLE IF EXISTS `tmp_ct`;
CREATE TEMPORARY TABLE `tmp_ct` AS SELECT * FROM `creature_template` WHERE `entry` = 79067;
UPDATE `tmp_ct` SET `entry` = 900255, `AIName` = 'SmartAI', `ScriptName` = '', `VisibilityDistance` = 450;
INSERT INTO `creature_template` SELECT * FROM `tmp_ct`;
DROP TEMPORARY TABLE `tmp_ct`;
DELETE FROM `creature_template_wdb` WHERE `Entry` = 900255;
DROP TEMPORARY TABLE IF EXISTS `tmp_wdb`;
CREATE TEMPORARY TABLE `tmp_wdb` AS SELECT * FROM `creature_template_wdb` WHERE `Entry` = 79067;
UPDATE `tmp_wdb` SET `Entry` = 900255, `Name1` = 'Air Defense Shield';
INSERT INTO `creature_template_wdb` SELECT * FROM `tmp_wdb`;
DROP TEMPORARY TABLE `tmp_wdb`;
DELETE FROM `creature_template` WHERE `entry` = 900256;
DROP TEMPORARY TABLE IF EXISTS `tmp_ct`;
CREATE TEMPORARY TABLE `tmp_ct` AS SELECT * FROM `creature_template` WHERE `entry` = 79067;
UPDATE `tmp_ct` SET `entry` = 900256, `AIName` = 'SmartAI', `ScriptName` = '', `VisibilityDistance` = 450;
INSERT INTO `creature_template` SELECT * FROM `tmp_ct`;
DROP TEMPORARY TABLE `tmp_ct`;
DELETE FROM `creature_template_wdb` WHERE `Entry` = 900256;
DROP TEMPORARY TABLE IF EXISTS `tmp_wdb`;
CREATE TEMPORARY TABLE `tmp_wdb` AS SELECT * FROM `creature_template_wdb` WHERE `Entry` = 79067;
UPDATE `tmp_wdb` SET `Entry` = 900256, `Name1` = 'Air Defense Shield';
INSERT INTO `creature_template_wdb` SELECT * FROM `tmp_wdb`;
DROP TEMPORARY TABLE `tmp_wdb`;
DELETE FROM `creature_template` WHERE `entry` = 900257;
DROP TEMPORARY TABLE IF EXISTS `tmp_ct`;
CREATE TEMPORARY TABLE `tmp_ct` AS SELECT * FROM `creature_template` WHERE `entry` = 79067;
UPDATE `tmp_ct` SET `entry` = 900257, `AIName` = 'SmartAI', `ScriptName` = '', `VisibilityDistance` = 450;
INSERT INTO `creature_template` SELECT * FROM `tmp_ct`;
DROP TEMPORARY TABLE `tmp_ct`;
DELETE FROM `creature_template_wdb` WHERE `Entry` = 900257;
DROP TEMPORARY TABLE IF EXISTS `tmp_wdb`;
CREATE TEMPORARY TABLE `tmp_wdb` AS SELECT * FROM `creature_template_wdb` WHERE `Entry` = 79067;
UPDATE `tmp_wdb` SET `Entry` = 900257, `Name1` = 'Air Defense Shield';
INSERT INTO `creature_template_wdb` SELECT * FROM `tmp_wdb`;
DROP TEMPORARY TABLE `tmp_wdb`;
DELETE FROM `creature_template` WHERE `entry` = 900258;
DROP TEMPORARY TABLE IF EXISTS `tmp_ct`;
CREATE TEMPORARY TABLE `tmp_ct` AS SELECT * FROM `creature_template` WHERE `entry` = 79067;
UPDATE `tmp_ct` SET `entry` = 900258, `AIName` = 'SmartAI', `ScriptName` = '', `VisibilityDistance` = 450;
INSERT INTO `creature_template` SELECT * FROM `tmp_ct`;
DROP TEMPORARY TABLE `tmp_ct`;
DELETE FROM `creature_template_wdb` WHERE `Entry` = 900258;
DROP TEMPORARY TABLE IF EXISTS `tmp_wdb`;
CREATE TEMPORARY TABLE `tmp_wdb` AS SELECT * FROM `creature_template_wdb` WHERE `Entry` = 79067;
UPDATE `tmp_wdb` SET `Entry` = 900258, `Name1` = 'Air Defense Shield';
INSERT INTO `creature_template_wdb` SELECT * FROM `tmp_wdb`;
DROP TEMPORARY TABLE `tmp_wdb`;
DELETE FROM `creature_template` WHERE `entry` = 900259;
DROP TEMPORARY TABLE IF EXISTS `tmp_ct`;
CREATE TEMPORARY TABLE `tmp_ct` AS SELECT * FROM `creature_template` WHERE `entry` = 79067;
UPDATE `tmp_ct` SET `entry` = 900259, `AIName` = 'SmartAI', `ScriptName` = '', `VisibilityDistance` = 450;
INSERT INTO `creature_template` SELECT * FROM `tmp_ct`;
DROP TEMPORARY TABLE `tmp_ct`;
DELETE FROM `creature_template_wdb` WHERE `Entry` = 900259;
DROP TEMPORARY TABLE IF EXISTS `tmp_wdb`;
CREATE TEMPORARY TABLE `tmp_wdb` AS SELECT * FROM `creature_template_wdb` WHERE `Entry` = 79067;
UPDATE `tmp_wdb` SET `Entry` = 900259, `Name1` = 'Air Defense Shield';
INSERT INTO `creature_template_wdb` SELECT * FROM `tmp_wdb`;
DROP TEMPORARY TABLE `tmp_wdb`;
DELETE FROM `creature_template` WHERE `entry` = 900260;
DROP TEMPORARY TABLE IF EXISTS `tmp_ct`;
CREATE TEMPORARY TABLE `tmp_ct` AS SELECT * FROM `creature_template` WHERE `entry` = 79067;
UPDATE `tmp_ct` SET `entry` = 900260, `AIName` = 'SmartAI', `ScriptName` = '', `VisibilityDistance` = 450;
INSERT INTO `creature_template` SELECT * FROM `tmp_ct`;
DROP TEMPORARY TABLE `tmp_ct`;
DELETE FROM `creature_template_wdb` WHERE `Entry` = 900260;
DROP TEMPORARY TABLE IF EXISTS `tmp_wdb`;
CREATE TEMPORARY TABLE `tmp_wdb` AS SELECT * FROM `creature_template_wdb` WHERE `Entry` = 79067;
UPDATE `tmp_wdb` SET `Entry` = 900260, `Name1` = 'Air Defense Shield';
INSERT INTO `creature_template_wdb` SELECT * FROM `tmp_wdb`;
DROP TEMPORARY TABLE `tmp_wdb`;
DELETE FROM `creature_template` WHERE `entry` = 900261;
DROP TEMPORARY TABLE IF EXISTS `tmp_ct`;
CREATE TEMPORARY TABLE `tmp_ct` AS SELECT * FROM `creature_template` WHERE `entry` = 79067;
UPDATE `tmp_ct` SET `entry` = 900261, `AIName` = 'SmartAI', `ScriptName` = '', `VisibilityDistance` = 450;
INSERT INTO `creature_template` SELECT * FROM `tmp_ct`;
DROP TEMPORARY TABLE `tmp_ct`;
DELETE FROM `creature_template_wdb` WHERE `Entry` = 900261;
DROP TEMPORARY TABLE IF EXISTS `tmp_wdb`;
CREATE TEMPORARY TABLE `tmp_wdb` AS SELECT * FROM `creature_template_wdb` WHERE `Entry` = 79067;
UPDATE `tmp_wdb` SET `Entry` = 900261, `Name1` = 'Air Defense Shield';
INSERT INTO `creature_template_wdb` SELECT * FROM `tmp_wdb`;
DROP TEMPORARY TABLE `tmp_wdb`;
DELETE FROM `creature_template` WHERE `entry` = 900262;
DROP TEMPORARY TABLE IF EXISTS `tmp_ct`;
CREATE TEMPORARY TABLE `tmp_ct` AS SELECT * FROM `creature_template` WHERE `entry` = 79067;
UPDATE `tmp_ct` SET `entry` = 900262, `AIName` = 'SmartAI', `ScriptName` = '', `VisibilityDistance` = 450;
INSERT INTO `creature_template` SELECT * FROM `tmp_ct`;
DROP TEMPORARY TABLE `tmp_ct`;
DELETE FROM `creature_template_wdb` WHERE `Entry` = 900262;
DROP TEMPORARY TABLE IF EXISTS `tmp_wdb`;
CREATE TEMPORARY TABLE `tmp_wdb` AS SELECT * FROM `creature_template_wdb` WHERE `Entry` = 79067;
UPDATE `tmp_wdb` SET `Entry` = 900262, `Name1` = 'Air Defense Shield';
INSERT INTO `creature_template_wdb` SELECT * FROM `tmp_wdb`;
DROP TEMPORARY TABLE `tmp_wdb`;
DELETE FROM `creature_template` WHERE `entry` = 900263;
DROP TEMPORARY TABLE IF EXISTS `tmp_ct`;
CREATE TEMPORARY TABLE `tmp_ct` AS SELECT * FROM `creature_template` WHERE `entry` = 79067;
UPDATE `tmp_ct` SET `entry` = 900263, `AIName` = 'SmartAI', `ScriptName` = '', `VisibilityDistance` = 450;
INSERT INTO `creature_template` SELECT * FROM `tmp_ct`;
DROP TEMPORARY TABLE `tmp_ct`;
DELETE FROM `creature_template_wdb` WHERE `Entry` = 900263;
DROP TEMPORARY TABLE IF EXISTS `tmp_wdb`;
CREATE TEMPORARY TABLE `tmp_wdb` AS SELECT * FROM `creature_template_wdb` WHERE `Entry` = 79067;
UPDATE `tmp_wdb` SET `Entry` = 900263, `Name1` = 'Air Defense Shield';
INSERT INTO `creature_template_wdb` SELECT * FROM `tmp_wdb`;
DROP TEMPORARY TABLE `tmp_wdb`;
DELETE FROM `creature_template` WHERE `entry` = 900264;
DROP TEMPORARY TABLE IF EXISTS `tmp_ct`;
CREATE TEMPORARY TABLE `tmp_ct` AS SELECT * FROM `creature_template` WHERE `entry` = 79067;
UPDATE `tmp_ct` SET `entry` = 900264, `AIName` = 'SmartAI', `ScriptName` = '', `VisibilityDistance` = 450;
INSERT INTO `creature_template` SELECT * FROM `tmp_ct`;
DROP TEMPORARY TABLE `tmp_ct`;
DELETE FROM `creature_template_wdb` WHERE `Entry` = 900264;
DROP TEMPORARY TABLE IF EXISTS `tmp_wdb`;
CREATE TEMPORARY TABLE `tmp_wdb` AS SELECT * FROM `creature_template_wdb` WHERE `Entry` = 79067;
UPDATE `tmp_wdb` SET `Entry` = 900264, `Name1` = 'Air Defense Shield';
INSERT INTO `creature_template_wdb` SELECT * FROM `tmp_wdb`;
DROP TEMPORARY TABLE `tmp_wdb`;
DELETE FROM `creature_template` WHERE `entry` = 900265;
DROP TEMPORARY TABLE IF EXISTS `tmp_ct`;
CREATE TEMPORARY TABLE `tmp_ct` AS SELECT * FROM `creature_template` WHERE `entry` = 79067;
UPDATE `tmp_ct` SET `entry` = 900265, `AIName` = 'SmartAI', `ScriptName` = '', `VisibilityDistance` = 450;
INSERT INTO `creature_template` SELECT * FROM `tmp_ct`;
DROP TEMPORARY TABLE `tmp_ct`;
DELETE FROM `creature_template_wdb` WHERE `Entry` = 900265;
DROP TEMPORARY TABLE IF EXISTS `tmp_wdb`;
CREATE TEMPORARY TABLE `tmp_wdb` AS SELECT * FROM `creature_template_wdb` WHERE `Entry` = 79067;
UPDATE `tmp_wdb` SET `Entry` = 900265, `Name1` = 'Air Defense Shield';
INSERT INTO `creature_template_wdb` SELECT * FROM `tmp_wdb`;
DROP TEMPORARY TABLE `tmp_wdb`;
DELETE FROM `creature_template` WHERE `entry` = 900266;
DROP TEMPORARY TABLE IF EXISTS `tmp_ct`;
CREATE TEMPORARY TABLE `tmp_ct` AS SELECT * FROM `creature_template` WHERE `entry` = 79067;
UPDATE `tmp_ct` SET `entry` = 900266, `AIName` = 'SmartAI', `ScriptName` = '', `VisibilityDistance` = 450;
INSERT INTO `creature_template` SELECT * FROM `tmp_ct`;
DROP TEMPORARY TABLE `tmp_ct`;
DELETE FROM `creature_template_wdb` WHERE `Entry` = 900266;
DROP TEMPORARY TABLE IF EXISTS `tmp_wdb`;
CREATE TEMPORARY TABLE `tmp_wdb` AS SELECT * FROM `creature_template_wdb` WHERE `Entry` = 79067;
UPDATE `tmp_wdb` SET `Entry` = 900266, `Name1` = 'Air Defense Shield';
INSERT INTO `creature_template_wdb` SELECT * FROM `tmp_wdb`;
DROP TEMPORARY TABLE `tmp_wdb`;
DELETE FROM `creature_template` WHERE `entry` = 900267;
DROP TEMPORARY TABLE IF EXISTS `tmp_ct`;
CREATE TEMPORARY TABLE `tmp_ct` AS SELECT * FROM `creature_template` WHERE `entry` = 79067;
UPDATE `tmp_ct` SET `entry` = 900267, `AIName` = 'SmartAI', `ScriptName` = '', `VisibilityDistance` = 450;
INSERT INTO `creature_template` SELECT * FROM `tmp_ct`;
DROP TEMPORARY TABLE `tmp_ct`;
DELETE FROM `creature_template_wdb` WHERE `Entry` = 900267;
DROP TEMPORARY TABLE IF EXISTS `tmp_wdb`;
CREATE TEMPORARY TABLE `tmp_wdb` AS SELECT * FROM `creature_template_wdb` WHERE `Entry` = 79067;
UPDATE `tmp_wdb` SET `Entry` = 900267, `Name1` = 'Air Defense Shield';
INSERT INTO `creature_template_wdb` SELECT * FROM `tmp_wdb`;
DROP TEMPORARY TABLE `tmp_wdb`;
DELETE FROM `creature_template` WHERE `entry` = 900268;
DROP TEMPORARY TABLE IF EXISTS `tmp_ct`;
CREATE TEMPORARY TABLE `tmp_ct` AS SELECT * FROM `creature_template` WHERE `entry` = 79067;
UPDATE `tmp_ct` SET `entry` = 900268, `AIName` = 'SmartAI', `ScriptName` = '', `VisibilityDistance` = 450;
INSERT INTO `creature_template` SELECT * FROM `tmp_ct`;
DROP TEMPORARY TABLE `tmp_ct`;
DELETE FROM `creature_template_wdb` WHERE `Entry` = 900268;
DROP TEMPORARY TABLE IF EXISTS `tmp_wdb`;
CREATE TEMPORARY TABLE `tmp_wdb` AS SELECT * FROM `creature_template_wdb` WHERE `Entry` = 79067;
UPDATE `tmp_wdb` SET `Entry` = 900268, `Name1` = 'Air Defense Shield';
INSERT INTO `creature_template_wdb` SELECT * FROM `tmp_wdb`;
DROP TEMPORARY TABLE `tmp_wdb`;
DELETE FROM `creature_template` WHERE `entry` = 900269;
DROP TEMPORARY TABLE IF EXISTS `tmp_ct`;
CREATE TEMPORARY TABLE `tmp_ct` AS SELECT * FROM `creature_template` WHERE `entry` = 79067;
UPDATE `tmp_ct` SET `entry` = 900269, `AIName` = 'SmartAI', `ScriptName` = '', `VisibilityDistance` = 450;
INSERT INTO `creature_template` SELECT * FROM `tmp_ct`;
DROP TEMPORARY TABLE `tmp_ct`;
DELETE FROM `creature_template_wdb` WHERE `Entry` = 900269;
DROP TEMPORARY TABLE IF EXISTS `tmp_wdb`;
CREATE TEMPORARY TABLE `tmp_wdb` AS SELECT * FROM `creature_template_wdb` WHERE `Entry` = 79067;
UPDATE `tmp_wdb` SET `Entry` = 900269, `Name1` = 'Air Defense Shield';
INSERT INTO `creature_template_wdb` SELECT * FROM `tmp_wdb`;
DROP TEMPORARY TABLE `tmp_wdb`;
DELETE FROM `creature_template` WHERE `entry` = 900270;
DROP TEMPORARY TABLE IF EXISTS `tmp_ct`;
CREATE TEMPORARY TABLE `tmp_ct` AS SELECT * FROM `creature_template` WHERE `entry` = 79067;
UPDATE `tmp_ct` SET `entry` = 900270, `AIName` = 'SmartAI', `ScriptName` = '', `VisibilityDistance` = 450;
INSERT INTO `creature_template` SELECT * FROM `tmp_ct`;
DROP TEMPORARY TABLE `tmp_ct`;
DELETE FROM `creature_template_wdb` WHERE `Entry` = 900270;
DROP TEMPORARY TABLE IF EXISTS `tmp_wdb`;
CREATE TEMPORARY TABLE `tmp_wdb` AS SELECT * FROM `creature_template_wdb` WHERE `Entry` = 79067;
UPDATE `tmp_wdb` SET `Entry` = 900270, `Name1` = 'Air Defense Shield';
INSERT INTO `creature_template_wdb` SELECT * FROM `tmp_wdb`;
DROP TEMPORARY TABLE `tmp_wdb`;
DELETE FROM `creature_template` WHERE `entry` = 900271;
DROP TEMPORARY TABLE IF EXISTS `tmp_ct`;
CREATE TEMPORARY TABLE `tmp_ct` AS SELECT * FROM `creature_template` WHERE `entry` = 79067;
UPDATE `tmp_ct` SET `entry` = 900271, `AIName` = 'SmartAI', `ScriptName` = '', `VisibilityDistance` = 450;
INSERT INTO `creature_template` SELECT * FROM `tmp_ct`;
DROP TEMPORARY TABLE `tmp_ct`;
DELETE FROM `creature_template_wdb` WHERE `Entry` = 900271;
DROP TEMPORARY TABLE IF EXISTS `tmp_wdb`;
CREATE TEMPORARY TABLE `tmp_wdb` AS SELECT * FROM `creature_template_wdb` WHERE `Entry` = 79067;
UPDATE `tmp_wdb` SET `Entry` = 900271, `Name1` = 'Air Defense Shield';
INSERT INTO `creature_template_wdb` SELECT * FROM `tmp_wdb`;
DROP TEMPORARY TABLE `tmp_wdb`;
DELETE FROM `creature` WHERE `guid` BETWEEN 25900001 AND 25900100;
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `PhaseId`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`) VALUES
(25900001, 900200, 1116, 6662, 7422, 1, 1, '', 2731.98, 2995.48, 280.99, 2.538, 300),
(25900002, 900201, 1116, 6662, 7422, 1, 1, '', 2735.03, 3025.05, 273.99, 3.323, 300),
(25900003, 900202, 1116, 6662, 7422, 1, 1, '', 2716.99, 3050.46, 273.99, 4.196, 300),
(25900004, 900203, 1116, 6662, 7422, 1, 1, '', 2688.06, 3057.30, 280.99, 4.981, 300),
(25900005, 900204, 1116, 6662, 7422, 1, 1, '', 2741.21, 3007.34, 303.64, 2.887, 300),
(25900006, 900205, 1116, 6662, 7422, 1, 1, '', 2734.16, 3043.55, 292.15, 3.759, 300),
(25900007, 900206, 1116, 6662, 7422, 1, 1, '', 2702.29, 3062.11, 303.64, 4.632, 300),
(25900008, 900207, 1116, 6662, 7422, 1, 1, '', 2736.13, 3028.69, 322.18, 3.410, 300),
(25900009, 900208, 1116, 6662, 7422, 1, 1, '', 2720.78, 3050.30, 322.18, 4.108, 300),
(25900010, 900209, 1116, 6662, 7422, 1, 1, '', 2776.83, 2870.96, 266.87, 2.924, 300),
(25900011, 900210, 1116, 6662, 7422, 1, 1, '', 2768.51, 2899.50, 259.87, 3.709, 300),
(25900012, 900211, 1116, 6662, 7422, 1, 1, '', 2742.22, 2916.23, 259.87, 4.582, 300),
(25900013, 900212, 1116, 6662, 7422, 1, 1, '', 2712.85, 2911.67, 266.87, 5.367, 300),
(25900014, 900213, 1116, 6662, 7422, 1, 1, '', 2780.90, 2885.42, 289.52, 3.273, 300),
(25900015, 900214, 1116, 6662, 7422, 1, 1, '', 2760.73, 2916.30, 278.03, 4.146, 300),
(25900016, 900215, 1116, 6662, 7422, 1, 1, '', 2724.22, 2921.49, 289.52, 5.018, 300),
(25900017, 900216, 1116, 6662, 7422, 1, 1, '', 2768.16, 2903.28, 308.06, 3.797, 300),
(25900018, 900217, 1116, 6662, 7422, 1, 1, '', 2745.80, 2917.51, 308.06, 4.495, 300),
(25900019, 900218, 1116, 6662, 7422, 1, 1, '', 2812.12, 2737.08, 302.49, 3.228, 300),
(25900020, 900219, 1116, 6662, 7422, 1, 1, '', 2795.63, 2761.82, 295.49, 4.014, 300),
(25900021, 900220, 1116, 6662, 7422, 1, 1, '', 2765.54, 2769.90, 295.49, 4.886, 300),
(25900022, 900221, 1116, 6662, 7422, 1, 1, '', 2738.88, 2756.75, 302.49, 5.672, 300),
(25900023, 900222, 1116, 6662, 7422, 1, 1, '', 2811.67, 2752.10, 325.14, 3.577, 300),
(25900024, 900223, 1116, 6662, 7422, 1, 1, '', 2783.18, 2775.52, 313.65, 4.450, 300),
(25900025, 900224, 1116, 6662, 7422, 1, 1, '', 2746.79, 2769.53, 325.14, 5.323, 300),
(25900026, 900225, 1116, 6662, 7422, 1, 1, '', 2794.16, 2765.32, 343.68, 4.101, 300),
(25900027, 900226, 1116, 6662, 7422, 1, 1, '', 2768.56, 2772.20, 343.68, 4.799, 300),
(25900028, 900227, 1116, 6662, 7422, 1, 1, '', 2598.23, 3031.72, 250.52, 2.080, 300),
(25900029, 900228, 1116, 6662, 7422, 1, 1, '', 2614.03, 3056.89, 243.52, 2.865, 300),
(25900030, 900229, 1116, 6662, 7422, 1, 1, '', 2609.06, 3087.66, 243.52, 3.738, 300),
(25900031, 900230, 1116, 6662, 7422, 1, 1, '', 2586.14, 3106.58, 250.52, 4.523, 300),
(25900032, 900231, 1116, 6662, 7422, 1, 1, '', 2611.74, 3038.28, 273.17, 2.429, 300),
(25900033, 900232, 1116, 6662, 7422, 1, 1, '', 2621.42, 3073.87, 261.68, 3.302, 300),
(25900034, 900233, 1116, 6662, 7422, 1, 1, '', 2601.03, 3104.61, 273.17, 4.174, 300),
(25900035, 900234, 1116, 6662, 7422, 1, 1, '', 2616.62, 3059.67, 291.71, 2.953, 300),
(25900036, 900235, 1116, 6662, 7422, 1, 1, '', 2612.40, 3085.84, 291.71, 3.651, 300),
(25900037, 900236, 1116, 6662, 7422, 1, 1, '', 2477.56, 2962.35, 279.36, 1.992, 300),
(25900038, 900237, 1116, 6662, 7422, 1, 1, '', 2495.52, 2986.04, 272.36, 2.777, 300),
(25900039, 900238, 1116, 6662, 7422, 1, 1, '', 2493.28, 3017.12, 272.36, 3.650, 300),
(25900040, 900239, 1116, 6662, 7422, 1, 1, '', 2472.11, 3037.99, 279.36, 4.435, 300),
(25900041, 900240, 1116, 6662, 7422, 1, 1, '', 2491.60, 2967.70, 302.02, 2.341, 300),
(25900042, 900241, 1116, 6662, 7422, 1, 1, '', 2504.37, 3002.30, 290.52, 3.214, 300),
(25900043, 900242, 1116, 6662, 7422, 1, 1, '', 2486.77, 3034.71, 302.02, 4.086, 300),
(25900044, 900243, 1116, 6662, 7422, 1, 1, '', 2498.34, 2988.58, 320.55, 2.864, 300),
(25900045, 900244, 1116, 6662, 7422, 1, 1, '', 2496.44, 3015.02, 320.55, 3.563, 300),
(25900046, 900245, 1116, 6662, 7422, 1, 1, '', 2451.26, 2834.46, 279.36, 2.438, 300),
(25900047, 900246, 1116, 6662, 7422, 1, 1, '', 2457.25, 2863.58, 272.36, 3.223, 300),
(25900048, 900247, 1116, 6662, 7422, 1, 1, '', 2441.82, 2890.66, 272.36, 4.096, 300),
(25900049, 900248, 1116, 6662, 7422, 1, 1, '', 2413.72, 2900.36, 279.36, 4.881, 300),
(25900050, 900249, 1116, 6662, 7422, 1, 1, '', 2461.62, 2845.34, 302.02, 2.787, 300),
(25900051, 900250, 1116, 6662, 7422, 1, 1, '', 2458.22, 2882.07, 290.52, 3.659, 300),
(25900052, 900251, 1116, 6662, 7422, 1, 1, '', 2428.37, 2903.72, 302.02, 4.532, 300),
(25900053, 900252, 1116, 6662, 7422, 1, 1, '', 2458.70, 2867.09, 320.55, 3.310, 300),
(25900054, 900253, 1116, 6662, 7422, 1, 1, '', 2445.58, 2890.12, 320.55, 4.008, 300),
(25900055, 900254, 1116, 6662, 7422, 1, 1, '', 2526.93, 2731.74, 313.75, 2.683, 300),
(25900056, 900255, 1116, 6662, 7422, 1, 1, '', 2525.67, 2761.43, 306.75, 3.468, 300),
(25900057, 900256, 1116, 6662, 7422, 1, 1, '', 2504.13, 2783.96, 306.75, 4.341, 300),
(25900058, 900257, 1116, 6662, 7422, 1, 1, '', 2474.52, 2786.54, 313.75, 5.126, 300),
(25900059, 900258, 1116, 6662, 7422, 1, 1, '', 2534.34, 2744.80, 336.41, 3.032, 300),
(25900060, 900259, 1116, 6662, 7422, 1, 1, '', 2522.13, 2779.61, 324.91, 3.905, 300),
(25900061, 900260, 1116, 6662, 7422, 1, 1, '', 2487.90, 2793.36, 336.41, 4.777, 300),
(25900062, 900261, 1116, 6662, 7422, 1, 1, '', 2526.23, 2765.19, 354.94, 3.556, 300),
(25900063, 900262, 1116, 6662, 7422, 1, 1, '', 2507.91, 2784.35, 354.94, 4.254, 300),
(25900064, 900263, 1116, 6662, 7422, 1, 1, '', 2651.35, 2626.20, 313.75, 2.988, 300),
(25900065, 900264, 1116, 6662, 7422, 1, 1, '', 2641.22, 2654.15, 306.75, 3.773, 300),
(25900066, 900265, 1116, 6662, 7422, 1, 1, '', 2613.91, 2669.16, 306.75, 4.646, 300),
(25900067, 900266, 1116, 6662, 7422, 1, 1, '', 2584.89, 2662.73, 313.75, 5.431, 300),
(25900068, 900267, 1116, 6662, 7422, 1, 1, '', 2654.49, 2640.89, 336.41, 3.337, 300),
(25900069, 900268, 1116, 6662, 7422, 1, 1, '', 2632.39, 2670.41, 324.91, 4.210, 300),
(25900070, 900269, 1116, 6662, 7422, 1, 1, '', 2595.61, 2673.26, 336.41, 5.082, 300),
(25900071, 900270, 1116, 6662, 7422, 1, 1, '', 2640.63, 2657.90, 354.94, 3.861, 300),
(25900072, 900271, 1116, 6662, 7422, 1, 1, '', 2617.40, 2670.67, 354.94, 4.559, 300);
DELETE FROM `creature_movement_override` WHERE `SpawnId` BETWEEN 25900001 AND 25900100;
INSERT INTO `creature_movement_override` (`SpawnId`, `Ground`, `Swim`, `Flight`, `Rooted`, `Random`, `InteractionPauseTimer`) VALUES
(25900001, 0, 0, 1, 1, 0, NULL),
(25900002, 0, 0, 1, 1, 0, NULL),
(25900003, 0, 0, 1, 1, 0, NULL),
(25900004, 0, 0, 1, 1, 0, NULL),
(25900005, 0, 0, 1, 1, 0, NULL),
(25900006, 0, 0, 1, 1, 0, NULL),
(25900007, 0, 0, 1, 1, 0, NULL),
(25900008, 0, 0, 1, 1, 0, NULL),
(25900009, 0, 0, 1, 1, 0, NULL),
(25900010, 0, 0, 1, 1, 0, NULL),
(25900011, 0, 0, 1, 1, 0, NULL),
(25900012, 0, 0, 1, 1, 0, NULL),
(25900013, 0, 0, 1, 1, 0, NULL),
(25900014, 0, 0, 1, 1, 0, NULL),
(25900015, 0, 0, 1, 1, 0, NULL),
(25900016, 0, 0, 1, 1, 0, NULL),
(25900017, 0, 0, 1, 1, 0, NULL),
(25900018, 0, 0, 1, 1, 0, NULL),
(25900019, 0, 0, 1, 1, 0, NULL),
(25900020, 0, 0, 1, 1, 0, NULL),
(25900021, 0, 0, 1, 1, 0, NULL),
(25900022, 0, 0, 1, 1, 0, NULL),
(25900023, 0, 0, 1, 1, 0, NULL),
(25900024, 0, 0, 1, 1, 0, NULL),
(25900025, 0, 0, 1, 1, 0, NULL),
(25900026, 0, 0, 1, 1, 0, NULL),
(25900027, 0, 0, 1, 1, 0, NULL),
(25900028, 0, 0, 1, 1, 0, NULL),
(25900029, 0, 0, 1, 1, 0, NULL),
(25900030, 0, 0, 1, 1, 0, NULL),
(25900031, 0, 0, 1, 1, 0, NULL),
(25900032, 0, 0, 1, 1, 0, NULL),
(25900033, 0, 0, 1, 1, 0, NULL),
(25900034, 0, 0, 1, 1, 0, NULL),
(25900035, 0, 0, 1, 1, 0, NULL),
(25900036, 0, 0, 1, 1, 0, NULL),
(25900037, 0, 0, 1, 1, 0, NULL),
(25900038, 0, 0, 1, 1, 0, NULL),
(25900039, 0, 0, 1, 1, 0, NULL),
(25900040, 0, 0, 1, 1, 0, NULL),
(25900041, 0, 0, 1, 1, 0, NULL),
(25900042, 0, 0, 1, 1, 0, NULL),
(25900043, 0, 0, 1, 1, 0, NULL),
(25900044, 0, 0, 1, 1, 0, NULL),
(25900045, 0, 0, 1, 1, 0, NULL),
(25900046, 0, 0, 1, 1, 0, NULL),
(25900047, 0, 0, 1, 1, 0, NULL),
(25900048, 0, 0, 1, 1, 0, NULL),
(25900049, 0, 0, 1, 1, 0, NULL),
(25900050, 0, 0, 1, 1, 0, NULL),
(25900051, 0, 0, 1, 1, 0, NULL),
(25900052, 0, 0, 1, 1, 0, NULL),
(25900053, 0, 0, 1, 1, 0, NULL),
(25900054, 0, 0, 1, 1, 0, NULL),
(25900055, 0, 0, 1, 1, 0, NULL),
(25900056, 0, 0, 1, 1, 0, NULL),
(25900057, 0, 0, 1, 1, 0, NULL),
(25900058, 0, 0, 1, 1, 0, NULL),
(25900059, 0, 0, 1, 1, 0, NULL),
(25900060, 0, 0, 1, 1, 0, NULL),
(25900061, 0, 0, 1, 1, 0, NULL),
(25900062, 0, 0, 1, 1, 0, NULL),
(25900063, 0, 0, 1, 1, 0, NULL),
(25900064, 0, 0, 1, 1, 0, NULL),
(25900065, 0, 0, 1, 1, 0, NULL),
(25900066, 0, 0, 1, 1, 0, NULL),
(25900067, 0, 0, 1, 1, 0, NULL),
(25900068, 0, 0, 1, 1, 0, NULL),
(25900069, 0, 0, 1, 1, 0, NULL),
(25900070, 0, 0, 1, 1, 0, NULL),
(25900071, 0, 0, 1, 1, 0, NULL),
(25900072, 0, 0, 1, 1, 0, NULL);

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (84752, 84754) AND `AIName` = '';
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (84752, 84755, 900200, 900201, 900202, 900203, 900204, 900205, 900206, 900207, 900208, 900209, 900210, 900211, 900212, 900213, 900214, 900215, 900216, 900217, 900218, 900219, 900220, 900221, 900222, 900223, 900224, 900225, 900226, 900227, 900228, 900229, 900230, 900231, 900232, 900233, 900234, 900235, 900236, 900237, 900238, 900239, 900240, 900241, 900242, 900243, 900244, 900245, 900246, 900247, 900248, 900249, 900250, 900251, 900252, 900253, 900254, 900255, 900256, 900257, 900258, 900259, 900260, 900261, 900262, 900263, 900264, 900265, 900266, 900267, 900268, 900269, 900270, 900271, -327312, -327313, -327315, -327316, -327326, -327339, -327340, -327356, -327358, -327359, -327387, -327389, -327390, -327391, -327403, -327405, -327407, -327408, -327432, -327433, -327434, -327435, -327436, -327438, -327343, -327352, -327367, -327392, -327449, -327501, -327506, -327510, -25900001, -25900002, -25900003, -25900004, -25900005, -25900006, -25900007, -25900008, -25900009, -25900010, -25900011, -25900012, -25900013, -25900014, -25900015, -25900016, -25900017, -25900018, -25900019, -25900020, -25900021, -25900022, -25900023, -25900024, -25900025, -25900026, -25900027, -25900028, -25900029, -25900030, -25900031, -25900032, -25900033, -25900034, -25900035, -25900036, -25900037, -25900038, -25900039, -25900040, -25900041, -25900042, -25900043, -25900044, -25900045, -25900046, -25900047, -25900048, -25900049, -25900050, -25900051, -25900052, -25900053, -25900054, -25900055, -25900056, -25900057, -25900058, -25900059, -25900060, -25900061, -25900062, -25900063, -25900064, -25900065, -25900066, -25900067, -25900068, -25900069, -25900070, -25900071, -25900072, -25900073, -25900074, -25900075, -25900076, -25900077, -25900078, -25900079, -25900080, -25900081, -25900082, -25900083, -25900084, -25900085, -25900086, -25900087, -25900088, -25900089, -25900090, -25900091, -25900092, -25900093, -25900094, -25900095, -25900096, -25900097, -25900098, -25900099, -25900100) AND `source_type` = 0;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (8475200, 84754000, 84754001, 84754002, 84754003, 84754004, 84754005, 84754006, 84754007, 84754008, 84754009, 84754010, 84754011, 84754012, 84754013, 84754014, 84754015, 84754016, 84754017, 84754018, 84754019, 84754020, 84754021, 84754022, 84754023) AND `source_type` = 9;
DELETE FROM `smart_scripts` WHERE `entryorguid` BETWEEN 26000001 AND 26000100 AND `source_type` = 9;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(-327312, 0, 0, 0, 1, 0, 100, 0, 1000, 1500, 16000, 24000, 80, 84754000, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Salvaged Iron Horde Artillery - Out of Combat - Shell the crystals it faces'),
(-327326, 0, 0, 0, 1, 0, 100, 0, 2176, 2676, 16000, 24000, 80, 84754004, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Salvaged Iron Horde Artillery - Out of Combat - Shell the crystals it faces'),
(-327356, 0, 0, 0, 1, 0, 100, 0, 3352, 3852, 16000, 24000, 80, 84754007, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Salvaged Iron Horde Artillery - Out of Combat - Shell the crystals it faces'),
(-327358, 0, 0, 0, 1, 0, 100, 0, 4529, 5029, 16000, 24000, 80, 84754008, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Salvaged Iron Horde Artillery - Out of Combat - Shell the crystals it faces'),
(-327359, 0, 0, 0, 1, 0, 100, 0, 5705, 6205, 16000, 24000, 80, 84754009, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Salvaged Iron Horde Artillery - Out of Combat - Shell the crystals it faces'),
(-327387, 0, 0, 0, 1, 0, 100, 0, 6882, 7382, 16000, 24000, 80, 84754010, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Salvaged Iron Horde Artillery - Out of Combat - Shell the crystals it faces'),
(-327389, 0, 0, 0, 1, 0, 100, 0, 8058, 8558, 16000, 24000, 80, 84754011, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Salvaged Iron Horde Artillery - Out of Combat - Shell the crystals it faces'),
(-327390, 0, 0, 0, 1, 0, 100, 0, 9235, 9735, 16000, 24000, 80, 84754012, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Salvaged Iron Horde Artillery - Out of Combat - Shell the crystals it faces'),
(-327391, 0, 0, 0, 1, 0, 100, 0, 10411, 10911, 16000, 24000, 80, 84754013, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Salvaged Iron Horde Artillery - Out of Combat - Shell the crystals it faces'),
(-327403, 0, 0, 0, 1, 0, 100, 0, 11588, 12088, 16000, 24000, 80, 84754014, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Salvaged Iron Horde Artillery - Out of Combat - Shell the crystals it faces'),
(-327407, 0, 0, 0, 1, 0, 100, 0, 12764, 13264, 16000, 24000, 80, 84754016, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Salvaged Iron Horde Artillery - Out of Combat - Shell the crystals it faces'),
(-327408, 0, 0, 0, 1, 0, 100, 0, 13941, 14441, 16000, 24000, 80, 84754017, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Salvaged Iron Horde Artillery - Out of Combat - Shell the crystals it faces'),
(-327432, 0, 0, 0, 1, 0, 100, 0, 15117, 15617, 16000, 24000, 80, 84754018, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Salvaged Iron Horde Artillery - Out of Combat - Shell the crystals it faces'),
(-327433, 0, 0, 0, 1, 0, 100, 0, 16294, 16794, 16000, 24000, 80, 84754019, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Salvaged Iron Horde Artillery - Out of Combat - Shell the crystals it faces'),
(-327434, 0, 0, 0, 1, 0, 100, 0, 17470, 17970, 16000, 24000, 80, 84754020, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Salvaged Iron Horde Artillery - Out of Combat - Shell the crystals it faces'),
(-327435, 0, 0, 0, 1, 0, 100, 0, 18647, 19147, 16000, 24000, 80, 84754021, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Salvaged Iron Horde Artillery - Out of Combat - Shell the crystals it faces'),
(-327436, 0, 0, 0, 1, 0, 100, 0, 19823, 20323, 16000, 24000, 80, 84754022, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Salvaged Iron Horde Artillery - Out of Combat - Shell the crystals it faces'),
(84754000, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 11, 86527, 2, 0, 0, 0, 0, 19, 900207, 600, 0, 0, 0, 0, 0, 'Salvaged Iron Horde Artillery - Shell on its way'),
(84754000, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 11, 120682, 2, 0, 0, 0, 0, 19, 900207, 600, 0, 0, 0, 0, 0, 'Salvaged Iron Horde Artillery - Fire a shell'),
(84754000, 9, 2, 0, 0, 0, 100, 0, 4500, 4500, 0, 0, 11, 86527, 2, 0, 0, 0, 0, 19, 900201, 600, 0, 0, 0, 0, 0, 'Salvaged Iron Horde Artillery - Shell on its way'),
(84754000, 9, 3, 0, 0, 0, 100, 0, 0, 0, 0, 0, 11, 120682, 2, 0, 0, 0, 0, 19, 900201, 600, 0, 0, 0, 0, 0, 'Salvaged Iron Horde Artillery - Fire a shell'),
(84754004, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 11, 86527, 2, 0, 0, 0, 0, 19, 900205, 600, 0, 0, 0, 0, 0, 'Salvaged Iron Horde Artillery - Shell on its way'),
(84754004, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 11, 120682, 2, 0, 0, 0, 0, 19, 900205, 600, 0, 0, 0, 0, 0, 'Salvaged Iron Horde Artillery - Fire a shell'),
(84754004, 9, 2, 0, 0, 0, 100, 0, 4500, 4500, 0, 0, 11, 86527, 2, 0, 0, 0, 0, 19, 900216, 600, 0, 0, 0, 0, 0, 'Salvaged Iron Horde Artillery - Shell on its way'),
(84754004, 9, 3, 0, 0, 0, 100, 0, 0, 0, 0, 0, 11, 120682, 2, 0, 0, 0, 0, 19, 900216, 600, 0, 0, 0, 0, 0, 'Salvaged Iron Horde Artillery - Fire a shell'),
(84754007, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 11, 86527, 2, 0, 0, 0, 0, 19, 900208, 600, 0, 0, 0, 0, 0, 'Salvaged Iron Horde Artillery - Shell on its way'),
(84754007, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 11, 120682, 2, 0, 0, 0, 0, 19, 900208, 600, 0, 0, 0, 0, 0, 'Salvaged Iron Horde Artillery - Fire a shell'),
(84754007, 9, 2, 0, 0, 0, 100, 0, 4500, 4500, 0, 0, 11, 86527, 2, 0, 0, 0, 0, 19, 900214, 600, 0, 0, 0, 0, 0, 'Salvaged Iron Horde Artillery - Shell on its way'),
(84754007, 9, 3, 0, 0, 0, 100, 0, 0, 0, 0, 0, 11, 120682, 2, 0, 0, 0, 0, 19, 900214, 600, 0, 0, 0, 0, 0, 'Salvaged Iron Horde Artillery - Fire a shell'),
(84754008, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 11, 86527, 2, 0, 0, 0, 0, 19, 900202, 600, 0, 0, 0, 0, 0, 'Salvaged Iron Horde Artillery - Shell on its way'),
(84754008, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 11, 120682, 2, 0, 0, 0, 0, 19, 900202, 600, 0, 0, 0, 0, 0, 'Salvaged Iron Horde Artillery - Fire a shell'),
(84754008, 9, 2, 0, 0, 0, 100, 0, 4500, 4500, 0, 0, 11, 86527, 2, 0, 0, 0, 0, 19, 900206, 600, 0, 0, 0, 0, 0, 'Salvaged Iron Horde Artillery - Shell on its way'),
(84754008, 9, 3, 0, 0, 0, 100, 0, 0, 0, 0, 0, 11, 120682, 2, 0, 0, 0, 0, 19, 900206, 600, 0, 0, 0, 0, 0, 'Salvaged Iron Horde Artillery - Fire a shell'),
(84754009, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 11, 86527, 2, 0, 0, 0, 0, 19, 900210, 600, 0, 0, 0, 0, 0, 'Salvaged Iron Horde Artillery - Shell on its way'),
(84754009, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 11, 120682, 2, 0, 0, 0, 0, 19, 900210, 600, 0, 0, 0, 0, 0, 'Salvaged Iron Horde Artillery - Fire a shell'),
(84754009, 9, 2, 0, 0, 0, 100, 0, 4500, 4500, 0, 0, 11, 86527, 2, 0, 0, 0, 0, 19, 900223, 600, 0, 0, 0, 0, 0, 'Salvaged Iron Horde Artillery - Shell on its way'),
(84754009, 9, 3, 0, 0, 0, 100, 0, 0, 0, 0, 0, 11, 120682, 2, 0, 0, 0, 0, 19, 900223, 600, 0, 0, 0, 0, 0, 'Salvaged Iron Horde Artillery - Fire a shell'),
(84754010, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 11, 86527, 2, 0, 0, 0, 0, 19, 900217, 600, 0, 0, 0, 0, 0, 'Salvaged Iron Horde Artillery - Shell on its way'),
(84754010, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 11, 120682, 2, 0, 0, 0, 0, 19, 900217, 600, 0, 0, 0, 0, 0, 'Salvaged Iron Horde Artillery - Fire a shell'),
(84754010, 9, 2, 0, 0, 0, 100, 0, 4500, 4500, 0, 0, 11, 86527, 2, 0, 0, 0, 0, 19, 900211, 600, 0, 0, 0, 0, 0, 'Salvaged Iron Horde Artillery - Shell on its way'),
(84754010, 9, 3, 0, 0, 0, 100, 0, 0, 0, 0, 0, 11, 120682, 2, 0, 0, 0, 0, 19, 900211, 600, 0, 0, 0, 0, 0, 'Salvaged Iron Horde Artillery - Fire a shell'),
(84754011, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 11, 86527, 2, 0, 0, 0, 0, 19, 900215, 600, 0, 0, 0, 0, 0, 'Salvaged Iron Horde Artillery - Shell on its way'),
(84754011, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 11, 120682, 2, 0, 0, 0, 0, 19, 900215, 600, 0, 0, 0, 0, 0, 'Salvaged Iron Horde Artillery - Fire a shell'),
(84754011, 9, 2, 0, 0, 0, 100, 0, 4500, 4500, 0, 0, 11, 86527, 2, 0, 0, 0, 0, 19, 900241, 600, 0, 0, 0, 0, 0, 'Salvaged Iron Horde Artillery - Shell on its way'),
(84754011, 9, 3, 0, 0, 0, 100, 0, 0, 0, 0, 0, 11, 120682, 2, 0, 0, 0, 0, 19, 900241, 600, 0, 0, 0, 0, 0, 'Salvaged Iron Horde Artillery - Fire a shell'),
(84754012, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 11, 86527, 2, 0, 0, 0, 0, 19, 900204, 600, 0, 0, 0, 0, 0, 'Salvaged Iron Horde Artillery - Shell on its way'),
(84754012, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 11, 120682, 2, 0, 0, 0, 0, 19, 900204, 600, 0, 0, 0, 0, 0, 'Salvaged Iron Horde Artillery - Fire a shell'),
(84754012, 9, 2, 0, 0, 0, 100, 0, 4500, 4500, 0, 0, 11, 86527, 2, 0, 0, 0, 0, 19, 900213, 600, 0, 0, 0, 0, 0, 'Salvaged Iron Horde Artillery - Shell on its way'),
(84754012, 9, 3, 0, 0, 0, 100, 0, 0, 0, 0, 0, 11, 120682, 2, 0, 0, 0, 0, 19, 900213, 600, 0, 0, 0, 0, 0, 'Salvaged Iron Horde Artillery - Fire a shell'),
(84754013, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 11, 86527, 2, 0, 0, 0, 0, 19, 900212, 600, 0, 0, 0, 0, 0, 'Salvaged Iron Horde Artillery - Shell on its way'),
(84754013, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 11, 120682, 2, 0, 0, 0, 0, 19, 900212, 600, 0, 0, 0, 0, 0, 'Salvaged Iron Horde Artillery - Fire a shell'),
(84754013, 9, 2, 0, 0, 0, 100, 0, 4500, 4500, 0, 0, 11, 86527, 2, 0, 0, 0, 0, 19, 900217, 600, 0, 0, 0, 0, 0, 'Salvaged Iron Horde Artillery - Shell on its way'),
(84754013, 9, 3, 0, 0, 0, 100, 0, 0, 0, 0, 0, 11, 120682, 2, 0, 0, 0, 0, 19, 900217, 600, 0, 0, 0, 0, 0, 'Salvaged Iron Horde Artillery - Fire a shell'),
(84754014, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 11, 86527, 2, 0, 0, 0, 0, 19, 900203, 600, 0, 0, 0, 0, 0, 'Salvaged Iron Horde Artillery - Shell on its way'),
(84754014, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 11, 120682, 2, 0, 0, 0, 0, 19, 900203, 600, 0, 0, 0, 0, 0, 'Salvaged Iron Horde Artillery - Fire a shell'),
(84754014, 9, 2, 0, 0, 0, 100, 0, 4500, 4500, 0, 0, 11, 86527, 2, 0, 0, 0, 0, 19, 900208, 600, 0, 0, 0, 0, 0, 'Salvaged Iron Horde Artillery - Shell on its way'),
(84754014, 9, 3, 0, 0, 0, 100, 0, 0, 0, 0, 0, 11, 120682, 2, 0, 0, 0, 0, 19, 900208, 600, 0, 0, 0, 0, 0, 'Salvaged Iron Horde Artillery - Fire a shell'),
(84754016, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 11, 86527, 2, 0, 0, 0, 0, 19, 900202, 600, 0, 0, 0, 0, 0, 'Salvaged Iron Horde Artillery - Shell on its way'),
(84754016, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 11, 120682, 2, 0, 0, 0, 0, 19, 900202, 600, 0, 0, 0, 0, 0, 'Salvaged Iron Horde Artillery - Fire a shell'),
(84754016, 9, 2, 0, 0, 0, 100, 0, 4500, 4500, 0, 0, 11, 86527, 2, 0, 0, 0, 0, 19, 900235, 600, 0, 0, 0, 0, 0, 'Salvaged Iron Horde Artillery - Shell on its way'),
(84754016, 9, 3, 0, 0, 0, 100, 0, 0, 0, 0, 0, 11, 120682, 2, 0, 0, 0, 0, 19, 900235, 600, 0, 0, 0, 0, 0, 'Salvaged Iron Horde Artillery - Fire a shell'),
(84754017, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 11, 86527, 2, 0, 0, 0, 0, 19, 900205, 600, 0, 0, 0, 0, 0, 'Salvaged Iron Horde Artillery - Shell on its way'),
(84754017, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 11, 120682, 2, 0, 0, 0, 0, 19, 900205, 600, 0, 0, 0, 0, 0, 'Salvaged Iron Horde Artillery - Fire a shell'),
(84754017, 9, 2, 0, 0, 0, 100, 0, 4500, 4500, 0, 0, 11, 86527, 2, 0, 0, 0, 0, 19, 900207, 600, 0, 0, 0, 0, 0, 'Salvaged Iron Horde Artillery - Shell on its way'),
(84754017, 9, 3, 0, 0, 0, 100, 0, 0, 0, 0, 0, 11, 120682, 2, 0, 0, 0, 0, 19, 900207, 600, 0, 0, 0, 0, 0, 'Salvaged Iron Horde Artillery - Fire a shell'),
(84754018, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 11, 86527, 2, 0, 0, 0, 0, 19, 900206, 600, 0, 0, 0, 0, 0, 'Salvaged Iron Horde Artillery - Shell on its way'),
(84754018, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 11, 120682, 2, 0, 0, 0, 0, 19, 900206, 600, 0, 0, 0, 0, 0, 'Salvaged Iron Horde Artillery - Fire a shell'),
(84754018, 9, 2, 0, 0, 0, 100, 0, 4500, 4500, 0, 0, 11, 86527, 2, 0, 0, 0, 0, 19, 900229, 600, 0, 0, 0, 0, 0, 'Salvaged Iron Horde Artillery - Shell on its way'),
(84754018, 9, 3, 0, 0, 0, 100, 0, 0, 0, 0, 0, 11, 120682, 2, 0, 0, 0, 0, 19, 900229, 600, 0, 0, 0, 0, 0, 'Salvaged Iron Horde Artillery - Fire a shell'),
(84754019, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 11, 86527, 2, 0, 0, 0, 0, 19, 900200, 600, 0, 0, 0, 0, 0, 'Salvaged Iron Horde Artillery - Shell on its way'),
(84754019, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 11, 120682, 2, 0, 0, 0, 0, 19, 900200, 600, 0, 0, 0, 0, 0, 'Salvaged Iron Horde Artillery - Fire a shell'),
(84754019, 9, 2, 0, 0, 0, 100, 0, 4500, 4500, 0, 0, 11, 86527, 2, 0, 0, 0, 0, 19, 900234, 600, 0, 0, 0, 0, 0, 'Salvaged Iron Horde Artillery - Shell on its way'),
(84754019, 9, 3, 0, 0, 0, 100, 0, 0, 0, 0, 0, 11, 120682, 2, 0, 0, 0, 0, 19, 900234, 600, 0, 0, 0, 0, 0, 'Salvaged Iron Horde Artillery - Fire a shell'),
(84754020, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 11, 86527, 2, 0, 0, 0, 0, 19, 900228, 600, 0, 0, 0, 0, 0, 'Salvaged Iron Horde Artillery - Shell on its way'),
(84754020, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 11, 120682, 2, 0, 0, 0, 0, 19, 900228, 600, 0, 0, 0, 0, 0, 'Salvaged Iron Horde Artillery - Fire a shell'),
(84754020, 9, 2, 0, 0, 0, 100, 0, 4500, 4500, 0, 0, 11, 86527, 2, 0, 0, 0, 0, 19, 900244, 600, 0, 0, 0, 0, 0, 'Salvaged Iron Horde Artillery - Shell on its way'),
(84754020, 9, 3, 0, 0, 0, 100, 0, 0, 0, 0, 0, 11, 120682, 2, 0, 0, 0, 0, 19, 900244, 600, 0, 0, 0, 0, 0, 'Salvaged Iron Horde Artillery - Fire a shell'),
(84754021, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 11, 86527, 2, 0, 0, 0, 0, 19, 900201, 600, 0, 0, 0, 0, 0, 'Salvaged Iron Horde Artillery - Shell on its way'),
(84754021, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 11, 120682, 2, 0, 0, 0, 0, 19, 900201, 600, 0, 0, 0, 0, 0, 'Salvaged Iron Horde Artillery - Fire a shell'),
(84754021, 9, 2, 0, 0, 0, 100, 0, 4500, 4500, 0, 0, 11, 86527, 2, 0, 0, 0, 0, 19, 900232, 600, 0, 0, 0, 0, 0, 'Salvaged Iron Horde Artillery - Shell on its way'),
(84754021, 9, 3, 0, 0, 0, 100, 0, 0, 0, 0, 0, 11, 120682, 2, 0, 0, 0, 0, 19, 900232, 600, 0, 0, 0, 0, 0, 'Salvaged Iron Horde Artillery - Fire a shell'),
(84754022, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 11, 86527, 2, 0, 0, 0, 0, 19, 900204, 600, 0, 0, 0, 0, 0, 'Salvaged Iron Horde Artillery - Shell on its way'),
(84754022, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 11, 120682, 2, 0, 0, 0, 0, 19, 900204, 600, 0, 0, 0, 0, 0, 'Salvaged Iron Horde Artillery - Fire a shell'),
(84754022, 9, 2, 0, 0, 0, 100, 0, 4500, 4500, 0, 0, 11, 86527, 2, 0, 0, 0, 0, 19, 900231, 600, 0, 0, 0, 0, 0, 'Salvaged Iron Horde Artillery - Shell on its way'),
(84754022, 9, 3, 0, 0, 0, 100, 0, 0, 0, 0, 0, 11, 120682, 2, 0, 0, 0, 0, 19, 900231, 600, 0, 0, 0, 0, 0, 'Salvaged Iron Horde Artillery - Fire a shell'),
(-25900001, 0, 0, 0, 8, 0, 100, 0, 86527, 0, 0, 0, 80, 26000001, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Air Defense Shield - Shell on its way - Wait for it'),
(-25900002, 0, 0, 0, 8, 0, 100, 0, 86527, 0, 0, 0, 80, 26000002, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Air Defense Shield - Shell on its way - Wait for it'),
(-25900003, 0, 0, 0, 8, 0, 100, 0, 86527, 0, 0, 0, 80, 26000003, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Air Defense Shield - Shell on its way - Wait for it'),
(-25900004, 0, 0, 0, 8, 0, 100, 0, 86527, 0, 0, 0, 80, 26000004, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Air Defense Shield - Shell on its way - Wait for it'),
(-25900005, 0, 0, 0, 8, 0, 100, 0, 86527, 0, 0, 0, 80, 26000005, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Air Defense Shield - Shell on its way - Wait for it'),
(-25900006, 0, 0, 0, 8, 0, 100, 0, 86527, 0, 0, 0, 80, 26000006, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Air Defense Shield - Shell on its way - Wait for it'),
(-25900007, 0, 0, 0, 8, 0, 100, 0, 86527, 0, 0, 0, 80, 26000007, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Air Defense Shield - Shell on its way - Wait for it'),
(-25900008, 0, 0, 0, 8, 0, 100, 0, 86527, 0, 0, 0, 80, 26000008, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Air Defense Shield - Shell on its way - Wait for it'),
(-25900009, 0, 0, 0, 8, 0, 100, 0, 86527, 0, 0, 0, 80, 26000009, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Air Defense Shield - Shell on its way - Wait for it'),
(-25900011, 0, 0, 0, 8, 0, 100, 0, 86527, 0, 0, 0, 80, 26000011, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Air Defense Shield - Shell on its way - Wait for it'),
(-25900012, 0, 0, 0, 8, 0, 100, 0, 86527, 0, 0, 0, 80, 26000012, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Air Defense Shield - Shell on its way - Wait for it'),
(-25900013, 0, 0, 0, 8, 0, 100, 0, 86527, 0, 0, 0, 80, 26000013, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Air Defense Shield - Shell on its way - Wait for it'),
(-25900014, 0, 0, 0, 8, 0, 100, 0, 86527, 0, 0, 0, 80, 26000014, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Air Defense Shield - Shell on its way - Wait for it'),
(-25900015, 0, 0, 0, 8, 0, 100, 0, 86527, 0, 0, 0, 80, 26000015, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Air Defense Shield - Shell on its way - Wait for it'),
(-25900016, 0, 0, 0, 8, 0, 100, 0, 86527, 0, 0, 0, 80, 26000016, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Air Defense Shield - Shell on its way - Wait for it'),
(-25900017, 0, 0, 0, 8, 0, 100, 0, 86527, 0, 0, 0, 80, 26000017, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Air Defense Shield - Shell on its way - Wait for it'),
(-25900018, 0, 0, 0, 8, 0, 100, 0, 86527, 0, 0, 0, 80, 26000018, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Air Defense Shield - Shell on its way - Wait for it'),
(-25900024, 0, 0, 0, 8, 0, 100, 0, 86527, 0, 0, 0, 80, 26000024, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Air Defense Shield - Shell on its way - Wait for it'),
(-25900029, 0, 0, 0, 8, 0, 100, 0, 86527, 0, 0, 0, 80, 26000029, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Air Defense Shield - Shell on its way - Wait for it'),
(-25900030, 0, 0, 0, 8, 0, 100, 0, 86527, 0, 0, 0, 80, 26000030, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Air Defense Shield - Shell on its way - Wait for it'),
(-25900032, 0, 0, 0, 8, 0, 100, 0, 86527, 0, 0, 0, 80, 26000032, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Air Defense Shield - Shell on its way - Wait for it'),
(-25900033, 0, 0, 0, 8, 0, 100, 0, 86527, 0, 0, 0, 80, 26000033, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Air Defense Shield - Shell on its way - Wait for it'),
(-25900035, 0, 0, 0, 8, 0, 100, 0, 86527, 0, 0, 0, 80, 26000035, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Air Defense Shield - Shell on its way - Wait for it'),
(-25900036, 0, 0, 0, 8, 0, 100, 0, 86527, 0, 0, 0, 80, 26000036, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Air Defense Shield - Shell on its way - Wait for it'),
(-25900042, 0, 0, 0, 8, 0, 100, 0, 86527, 0, 0, 0, 80, 26000042, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Air Defense Shield - Shell on its way - Wait for it'),
(-25900045, 0, 0, 0, 8, 0, 100, 0, 86527, 0, 0, 0, 80, 26000045, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Air Defense Shield - Shell on its way - Wait for it'),
(26000001, 9, 0, 0, 0, 0, 100, 0, 2238, 2238, 0, 0, 45, 1, 1, 0, 0, 0, 0, 19, 84752, 60, 0, 0, 0, 0, 0, 'Air Defense Shield - Just before the shell arrives - The crystal shoots it down'),
(26000002, 9, 0, 0, 0, 0, 100, 0, 3917, 3917, 0, 0, 45, 2, 1, 0, 0, 0, 0, 19, 84752, 60, 0, 0, 0, 0, 0, 'Air Defense Shield - Just before the shell arrives - The crystal shoots it down'),
(26000003, 9, 0, 0, 0, 0, 100, 0, 3591, 3591, 0, 0, 45, 3, 1, 0, 0, 0, 0, 19, 84752, 60, 0, 0, 0, 0, 0, 'Air Defense Shield - Just before the shell arrives - The crystal shoots it down'),
(26000004, 9, 0, 0, 0, 0, 100, 0, 3851, 3851, 0, 0, 45, 4, 1, 0, 0, 0, 0, 19, 84752, 60, 0, 0, 0, 0, 0, 'Air Defense Shield - Just before the shell arrives - The crystal shoots it down'),
(26000005, 9, 0, 0, 0, 0, 100, 0, 2520, 2520, 0, 0, 45, 5, 1, 0, 0, 0, 0, 19, 84752, 60, 0, 0, 0, 0, 0, 'Air Defense Shield - Just before the shell arrives - The crystal shoots it down'),
(26000006, 9, 0, 0, 0, 0, 100, 0, 3684, 3684, 0, 0, 45, 6, 1, 0, 0, 0, 0, 19, 84752, 60, 0, 0, 0, 0, 0, 'Air Defense Shield - Just before the shell arrives - The crystal shoots it down'),
(26000007, 9, 0, 0, 0, 0, 100, 0, 3885, 3885, 0, 0, 45, 7, 1, 0, 0, 0, 0, 19, 84752, 60, 0, 0, 0, 0, 0, 'Air Defense Shield - Just before the shell arrives - The crystal shoots it down'),
(26000008, 9, 0, 0, 0, 0, 100, 0, 4291, 4291, 0, 0, 45, 8, 1, 0, 0, 0, 0, 19, 84752, 60, 0, 0, 0, 0, 0, 'Air Defense Shield - Just before the shell arrives - The crystal shoots it down'),
(26000009, 9, 0, 0, 0, 0, 100, 0, 3513, 3513, 0, 0, 45, 9, 1, 0, 0, 0, 0, 19, 84752, 60, 0, 0, 0, 0, 0, 'Air Defense Shield - Just before the shell arrives - The crystal shoots it down'),
(26000011, 9, 0, 0, 0, 0, 100, 0, 2201, 2201, 0, 0, 45, 2, 1, 0, 0, 0, 0, 19, 84752, 60, 0, 0, 0, 0, 0, 'Air Defense Shield - Just before the shell arrives - The crystal shoots it down'),
(26000012, 9, 0, 0, 0, 0, 100, 0, 2015, 2015, 0, 0, 45, 3, 1, 0, 0, 0, 0, 19, 84752, 60, 0, 0, 0, 0, 0, 'Air Defense Shield - Just before the shell arrives - The crystal shoots it down'),
(26000013, 9, 0, 0, 0, 0, 100, 0, 2877, 2877, 0, 0, 45, 4, 1, 0, 0, 0, 0, 19, 84752, 60, 0, 0, 0, 0, 0, 'Air Defense Shield - Just before the shell arrives - The crystal shoots it down'),
(26000014, 9, 0, 0, 0, 0, 100, 0, 2894, 2894, 0, 0, 45, 5, 1, 0, 0, 0, 0, 19, 84752, 60, 0, 0, 0, 0, 0, 'Air Defense Shield - Just before the shell arrives - The crystal shoots it down'),
(26000015, 9, 0, 0, 0, 0, 100, 0, 3723, 3723, 0, 0, 45, 6, 1, 0, 0, 0, 0, 19, 84752, 60, 0, 0, 0, 0, 0, 'Air Defense Shield - Just before the shell arrives - The crystal shoots it down'),
(26000016, 9, 0, 0, 0, 0, 100, 0, 2399, 2399, 0, 0, 45, 7, 1, 0, 0, 0, 0, 19, 84752, 60, 0, 0, 0, 0, 0, 'Air Defense Shield - Just before the shell arrives - The crystal shoots it down'),
(26000017, 9, 0, 0, 0, 0, 100, 0, 4165, 4165, 0, 0, 45, 8, 1, 0, 0, 0, 0, 19, 84752, 60, 0, 0, 0, 0, 0, 'Air Defense Shield - Just before the shell arrives - The crystal shoots it down'),
(26000018, 9, 0, 0, 0, 0, 100, 0, 2512, 2512, 0, 0, 45, 9, 1, 0, 0, 0, 0, 19, 84752, 60, 0, 0, 0, 0, 0, 'Air Defense Shield - Just before the shell arrives - The crystal shoots it down'),
(26000024, 9, 0, 0, 0, 0, 100, 0, 3506, 3506, 0, 0, 45, 6, 1, 0, 0, 0, 0, 19, 84752, 60, 0, 0, 0, 0, 0, 'Air Defense Shield - Just before the shell arrives - The crystal shoots it down'),
(26000029, 9, 0, 0, 0, 0, 100, 0, 2307, 2307, 0, 0, 45, 2, 1, 0, 0, 0, 0, 19, 84752, 60, 0, 0, 0, 0, 0, 'Air Defense Shield - Just before the shell arrives - The crystal shoots it down'),
(26000030, 9, 0, 0, 0, 0, 100, 0, 3024, 3024, 0, 0, 45, 3, 1, 0, 0, 0, 0, 19, 84752, 60, 0, 0, 0, 0, 0, 'Air Defense Shield - Just before the shell arrives - The crystal shoots it down'),
(26000032, 9, 0, 0, 0, 0, 100, 0, 2595, 2595, 0, 0, 45, 5, 1, 0, 0, 0, 0, 19, 84752, 60, 0, 0, 0, 0, 0, 'Air Defense Shield - Just before the shell arrives - The crystal shoots it down'),
(26000033, 9, 0, 0, 0, 0, 100, 0, 2491, 2491, 0, 0, 45, 6, 1, 0, 0, 0, 0, 19, 84752, 60, 0, 0, 0, 0, 0, 'Air Defense Shield - Just before the shell arrives - The crystal shoots it down'),
(26000035, 9, 0, 0, 0, 0, 100, 0, 2814, 2814, 0, 0, 45, 8, 1, 0, 0, 0, 0, 19, 84752, 60, 0, 0, 0, 0, 0, 'Air Defense Shield - Just before the shell arrives - The crystal shoots it down'),
(26000036, 9, 0, 0, 0, 0, 100, 0, 3762, 3762, 0, 0, 45, 9, 1, 0, 0, 0, 0, 19, 84752, 60, 0, 0, 0, 0, 0, 'Air Defense Shield - Just before the shell arrives - The crystal shoots it down'),
(26000042, 9, 0, 0, 0, 0, 100, 0, 3898, 3898, 0, 0, 45, 6, 1, 0, 0, 0, 0, 19, 84752, 60, 0, 0, 0, 0, 0, 'Air Defense Shield - Just before the shell arrives - The crystal shoots it down'),
(26000045, 9, 0, 0, 0, 0, 100, 0, 3931, 3931, 0, 0, 45, 9, 1, 0, 0, 0, 0, 19, 84752, 60, 0, 0, 0, 0, 0, 'Air Defense Shield - Just before the shell arrives - The crystal shoots it down'),
(-327343, 0, 0, 0, 38, 0, 100, 0, 1, 1, 0, 0, 11, 169459, 2, 0, 0, 0, 0, 10, 25900001, 900200, 0, 0, 0, 0, 0, 'Air Defense Crystal - Shell incoming - Laser the shell'),
(-327343, 0, 1, 0, 38, 0, 100, 0, 2, 1, 0, 0, 11, 169459, 2, 0, 0, 0, 0, 10, 25900002, 900201, 0, 0, 0, 0, 0, 'Air Defense Crystal - Shell incoming - Laser the shell'),
(-327343, 0, 2, 0, 38, 0, 100, 0, 3, 1, 0, 0, 11, 169459, 2, 0, 0, 0, 0, 10, 25900003, 900202, 0, 0, 0, 0, 0, 'Air Defense Crystal - Shell incoming - Laser the shell'),
(-327343, 0, 3, 0, 38, 0, 100, 0, 4, 1, 0, 0, 11, 169459, 2, 0, 0, 0, 0, 10, 25900004, 900203, 0, 0, 0, 0, 0, 'Air Defense Crystal - Shell incoming - Laser the shell'),
(-327343, 0, 4, 0, 38, 0, 100, 0, 5, 1, 0, 0, 11, 169459, 2, 0, 0, 0, 0, 10, 25900005, 900204, 0, 0, 0, 0, 0, 'Air Defense Crystal - Shell incoming - Laser the shell'),
(-327343, 0, 5, 0, 38, 0, 100, 0, 6, 1, 0, 0, 11, 169459, 2, 0, 0, 0, 0, 10, 25900006, 900205, 0, 0, 0, 0, 0, 'Air Defense Crystal - Shell incoming - Laser the shell'),
(-327343, 0, 6, 0, 38, 0, 100, 0, 7, 1, 0, 0, 11, 169459, 2, 0, 0, 0, 0, 10, 25900007, 900206, 0, 0, 0, 0, 0, 'Air Defense Crystal - Shell incoming - Laser the shell'),
(-327343, 0, 7, 0, 38, 0, 100, 0, 8, 1, 0, 0, 11, 169459, 2, 0, 0, 0, 0, 10, 25900008, 900207, 0, 0, 0, 0, 0, 'Air Defense Crystal - Shell incoming - Laser the shell'),
(-327343, 0, 8, 0, 38, 0, 100, 0, 9, 1, 0, 0, 11, 169459, 2, 0, 0, 0, 0, 10, 25900009, 900208, 0, 0, 0, 0, 0, 'Air Defense Crystal - Shell incoming - Laser the shell'),
(-327352, 0, 0, 0, 38, 0, 100, 0, 1, 1, 0, 0, 11, 169459, 2, 0, 0, 0, 0, 10, 25900010, 900209, 0, 0, 0, 0, 0, 'Air Defense Crystal - Shell incoming - Laser the shell'),
(-327352, 0, 1, 0, 38, 0, 100, 0, 2, 1, 0, 0, 11, 169459, 2, 0, 0, 0, 0, 10, 25900011, 900210, 0, 0, 0, 0, 0, 'Air Defense Crystal - Shell incoming - Laser the shell'),
(-327352, 0, 2, 0, 38, 0, 100, 0, 3, 1, 0, 0, 11, 169459, 2, 0, 0, 0, 0, 10, 25900012, 900211, 0, 0, 0, 0, 0, 'Air Defense Crystal - Shell incoming - Laser the shell'),
(-327352, 0, 3, 0, 38, 0, 100, 0, 4, 1, 0, 0, 11, 169459, 2, 0, 0, 0, 0, 10, 25900013, 900212, 0, 0, 0, 0, 0, 'Air Defense Crystal - Shell incoming - Laser the shell'),
(-327352, 0, 4, 0, 38, 0, 100, 0, 5, 1, 0, 0, 11, 169459, 2, 0, 0, 0, 0, 10, 25900014, 900213, 0, 0, 0, 0, 0, 'Air Defense Crystal - Shell incoming - Laser the shell'),
(-327352, 0, 5, 0, 38, 0, 100, 0, 6, 1, 0, 0, 11, 169459, 2, 0, 0, 0, 0, 10, 25900015, 900214, 0, 0, 0, 0, 0, 'Air Defense Crystal - Shell incoming - Laser the shell'),
(-327352, 0, 6, 0, 38, 0, 100, 0, 7, 1, 0, 0, 11, 169459, 2, 0, 0, 0, 0, 10, 25900016, 900215, 0, 0, 0, 0, 0, 'Air Defense Crystal - Shell incoming - Laser the shell'),
(-327352, 0, 7, 0, 38, 0, 100, 0, 8, 1, 0, 0, 11, 169459, 2, 0, 0, 0, 0, 10, 25900017, 900216, 0, 0, 0, 0, 0, 'Air Defense Crystal - Shell incoming - Laser the shell'),
(-327352, 0, 8, 0, 38, 0, 100, 0, 9, 1, 0, 0, 11, 169459, 2, 0, 0, 0, 0, 10, 25900018, 900217, 0, 0, 0, 0, 0, 'Air Defense Crystal - Shell incoming - Laser the shell'),
(-327367, 0, 0, 0, 38, 0, 100, 0, 1, 1, 0, 0, 11, 169459, 2, 0, 0, 0, 0, 10, 25900019, 900218, 0, 0, 0, 0, 0, 'Air Defense Crystal - Shell incoming - Laser the shell'),
(-327367, 0, 1, 0, 38, 0, 100, 0, 2, 1, 0, 0, 11, 169459, 2, 0, 0, 0, 0, 10, 25900020, 900219, 0, 0, 0, 0, 0, 'Air Defense Crystal - Shell incoming - Laser the shell'),
(-327367, 0, 2, 0, 38, 0, 100, 0, 3, 1, 0, 0, 11, 169459, 2, 0, 0, 0, 0, 10, 25900021, 900220, 0, 0, 0, 0, 0, 'Air Defense Crystal - Shell incoming - Laser the shell'),
(-327367, 0, 3, 0, 38, 0, 100, 0, 4, 1, 0, 0, 11, 169459, 2, 0, 0, 0, 0, 10, 25900022, 900221, 0, 0, 0, 0, 0, 'Air Defense Crystal - Shell incoming - Laser the shell'),
(-327367, 0, 4, 0, 38, 0, 100, 0, 5, 1, 0, 0, 11, 169459, 2, 0, 0, 0, 0, 10, 25900023, 900222, 0, 0, 0, 0, 0, 'Air Defense Crystal - Shell incoming - Laser the shell'),
(-327367, 0, 5, 0, 38, 0, 100, 0, 6, 1, 0, 0, 11, 169459, 2, 0, 0, 0, 0, 10, 25900024, 900223, 0, 0, 0, 0, 0, 'Air Defense Crystal - Shell incoming - Laser the shell'),
(-327367, 0, 6, 0, 38, 0, 100, 0, 7, 1, 0, 0, 11, 169459, 2, 0, 0, 0, 0, 10, 25900025, 900224, 0, 0, 0, 0, 0, 'Air Defense Crystal - Shell incoming - Laser the shell'),
(-327367, 0, 7, 0, 38, 0, 100, 0, 8, 1, 0, 0, 11, 169459, 2, 0, 0, 0, 0, 10, 25900026, 900225, 0, 0, 0, 0, 0, 'Air Defense Crystal - Shell incoming - Laser the shell'),
(-327367, 0, 8, 0, 38, 0, 100, 0, 9, 1, 0, 0, 11, 169459, 2, 0, 0, 0, 0, 10, 25900027, 900226, 0, 0, 0, 0, 0, 'Air Defense Crystal - Shell incoming - Laser the shell'),
(-327392, 0, 0, 0, 38, 0, 100, 0, 1, 1, 0, 0, 11, 169459, 2, 0, 0, 0, 0, 10, 25900028, 900227, 0, 0, 0, 0, 0, 'Air Defense Crystal - Shell incoming - Laser the shell'),
(-327392, 0, 1, 0, 38, 0, 100, 0, 2, 1, 0, 0, 11, 169459, 2, 0, 0, 0, 0, 10, 25900029, 900228, 0, 0, 0, 0, 0, 'Air Defense Crystal - Shell incoming - Laser the shell'),
(-327392, 0, 2, 0, 38, 0, 100, 0, 3, 1, 0, 0, 11, 169459, 2, 0, 0, 0, 0, 10, 25900030, 900229, 0, 0, 0, 0, 0, 'Air Defense Crystal - Shell incoming - Laser the shell'),
(-327392, 0, 3, 0, 38, 0, 100, 0, 4, 1, 0, 0, 11, 169459, 2, 0, 0, 0, 0, 10, 25900031, 900230, 0, 0, 0, 0, 0, 'Air Defense Crystal - Shell incoming - Laser the shell'),
(-327392, 0, 4, 0, 38, 0, 100, 0, 5, 1, 0, 0, 11, 169459, 2, 0, 0, 0, 0, 10, 25900032, 900231, 0, 0, 0, 0, 0, 'Air Defense Crystal - Shell incoming - Laser the shell'),
(-327392, 0, 5, 0, 38, 0, 100, 0, 6, 1, 0, 0, 11, 169459, 2, 0, 0, 0, 0, 10, 25900033, 900232, 0, 0, 0, 0, 0, 'Air Defense Crystal - Shell incoming - Laser the shell'),
(-327392, 0, 6, 0, 38, 0, 100, 0, 7, 1, 0, 0, 11, 169459, 2, 0, 0, 0, 0, 10, 25900034, 900233, 0, 0, 0, 0, 0, 'Air Defense Crystal - Shell incoming - Laser the shell'),
(-327392, 0, 7, 0, 38, 0, 100, 0, 8, 1, 0, 0, 11, 169459, 2, 0, 0, 0, 0, 10, 25900035, 900234, 0, 0, 0, 0, 0, 'Air Defense Crystal - Shell incoming - Laser the shell'),
(-327392, 0, 8, 0, 38, 0, 100, 0, 9, 1, 0, 0, 11, 169459, 2, 0, 0, 0, 0, 10, 25900036, 900235, 0, 0, 0, 0, 0, 'Air Defense Crystal - Shell incoming - Laser the shell'),
(-327449, 0, 0, 0, 38, 0, 100, 0, 1, 1, 0, 0, 11, 169459, 2, 0, 0, 0, 0, 10, 25900037, 900236, 0, 0, 0, 0, 0, 'Air Defense Crystal - Shell incoming - Laser the shell'),
(-327449, 0, 1, 0, 38, 0, 100, 0, 2, 1, 0, 0, 11, 169459, 2, 0, 0, 0, 0, 10, 25900038, 900237, 0, 0, 0, 0, 0, 'Air Defense Crystal - Shell incoming - Laser the shell'),
(-327449, 0, 2, 0, 38, 0, 100, 0, 3, 1, 0, 0, 11, 169459, 2, 0, 0, 0, 0, 10, 25900039, 900238, 0, 0, 0, 0, 0, 'Air Defense Crystal - Shell incoming - Laser the shell'),
(-327449, 0, 3, 0, 38, 0, 100, 0, 4, 1, 0, 0, 11, 169459, 2, 0, 0, 0, 0, 10, 25900040, 900239, 0, 0, 0, 0, 0, 'Air Defense Crystal - Shell incoming - Laser the shell'),
(-327449, 0, 4, 0, 38, 0, 100, 0, 5, 1, 0, 0, 11, 169459, 2, 0, 0, 0, 0, 10, 25900041, 900240, 0, 0, 0, 0, 0, 'Air Defense Crystal - Shell incoming - Laser the shell'),
(-327449, 0, 5, 0, 38, 0, 100, 0, 6, 1, 0, 0, 11, 169459, 2, 0, 0, 0, 0, 10, 25900042, 900241, 0, 0, 0, 0, 0, 'Air Defense Crystal - Shell incoming - Laser the shell'),
(-327449, 0, 6, 0, 38, 0, 100, 0, 7, 1, 0, 0, 11, 169459, 2, 0, 0, 0, 0, 10, 25900043, 900242, 0, 0, 0, 0, 0, 'Air Defense Crystal - Shell incoming - Laser the shell'),
(-327449, 0, 7, 0, 38, 0, 100, 0, 8, 1, 0, 0, 11, 169459, 2, 0, 0, 0, 0, 10, 25900044, 900243, 0, 0, 0, 0, 0, 'Air Defense Crystal - Shell incoming - Laser the shell'),
(-327449, 0, 8, 0, 38, 0, 100, 0, 9, 1, 0, 0, 11, 169459, 2, 0, 0, 0, 0, 10, 25900045, 900244, 0, 0, 0, 0, 0, 'Air Defense Crystal - Shell incoming - Laser the shell'),
(-327501, 0, 0, 0, 38, 0, 100, 0, 1, 1, 0, 0, 11, 169459, 2, 0, 0, 0, 0, 10, 25900046, 900245, 0, 0, 0, 0, 0, 'Air Defense Crystal - Shell incoming - Laser the shell'),
(-327501, 0, 1, 0, 38, 0, 100, 0, 2, 1, 0, 0, 11, 169459, 2, 0, 0, 0, 0, 10, 25900047, 900246, 0, 0, 0, 0, 0, 'Air Defense Crystal - Shell incoming - Laser the shell'),
(-327501, 0, 2, 0, 38, 0, 100, 0, 3, 1, 0, 0, 11, 169459, 2, 0, 0, 0, 0, 10, 25900048, 900247, 0, 0, 0, 0, 0, 'Air Defense Crystal - Shell incoming - Laser the shell'),
(-327501, 0, 3, 0, 38, 0, 100, 0, 4, 1, 0, 0, 11, 169459, 2, 0, 0, 0, 0, 10, 25900049, 900248, 0, 0, 0, 0, 0, 'Air Defense Crystal - Shell incoming - Laser the shell'),
(-327501, 0, 4, 0, 38, 0, 100, 0, 5, 1, 0, 0, 11, 169459, 2, 0, 0, 0, 0, 10, 25900050, 900249, 0, 0, 0, 0, 0, 'Air Defense Crystal - Shell incoming - Laser the shell'),
(-327501, 0, 5, 0, 38, 0, 100, 0, 6, 1, 0, 0, 11, 169459, 2, 0, 0, 0, 0, 10, 25900051, 900250, 0, 0, 0, 0, 0, 'Air Defense Crystal - Shell incoming - Laser the shell'),
(-327501, 0, 6, 0, 38, 0, 100, 0, 7, 1, 0, 0, 11, 169459, 2, 0, 0, 0, 0, 10, 25900052, 900251, 0, 0, 0, 0, 0, 'Air Defense Crystal - Shell incoming - Laser the shell'),
(-327501, 0, 7, 0, 38, 0, 100, 0, 8, 1, 0, 0, 11, 169459, 2, 0, 0, 0, 0, 10, 25900053, 900252, 0, 0, 0, 0, 0, 'Air Defense Crystal - Shell incoming - Laser the shell'),
(-327501, 0, 8, 0, 38, 0, 100, 0, 9, 1, 0, 0, 11, 169459, 2, 0, 0, 0, 0, 10, 25900054, 900253, 0, 0, 0, 0, 0, 'Air Defense Crystal - Shell incoming - Laser the shell'),
(-327506, 0, 0, 0, 38, 0, 100, 0, 1, 1, 0, 0, 11, 169459, 2, 0, 0, 0, 0, 10, 25900055, 900254, 0, 0, 0, 0, 0, 'Air Defense Crystal - Shell incoming - Laser the shell'),
(-327506, 0, 1, 0, 38, 0, 100, 0, 2, 1, 0, 0, 11, 169459, 2, 0, 0, 0, 0, 10, 25900056, 900255, 0, 0, 0, 0, 0, 'Air Defense Crystal - Shell incoming - Laser the shell'),
(-327506, 0, 2, 0, 38, 0, 100, 0, 3, 1, 0, 0, 11, 169459, 2, 0, 0, 0, 0, 10, 25900057, 900256, 0, 0, 0, 0, 0, 'Air Defense Crystal - Shell incoming - Laser the shell'),
(-327506, 0, 3, 0, 38, 0, 100, 0, 4, 1, 0, 0, 11, 169459, 2, 0, 0, 0, 0, 10, 25900058, 900257, 0, 0, 0, 0, 0, 'Air Defense Crystal - Shell incoming - Laser the shell'),
(-327506, 0, 4, 0, 38, 0, 100, 0, 5, 1, 0, 0, 11, 169459, 2, 0, 0, 0, 0, 10, 25900059, 900258, 0, 0, 0, 0, 0, 'Air Defense Crystal - Shell incoming - Laser the shell'),
(-327506, 0, 5, 0, 38, 0, 100, 0, 6, 1, 0, 0, 11, 169459, 2, 0, 0, 0, 0, 10, 25900060, 900259, 0, 0, 0, 0, 0, 'Air Defense Crystal - Shell incoming - Laser the shell'),
(-327506, 0, 6, 0, 38, 0, 100, 0, 7, 1, 0, 0, 11, 169459, 2, 0, 0, 0, 0, 10, 25900061, 900260, 0, 0, 0, 0, 0, 'Air Defense Crystal - Shell incoming - Laser the shell'),
(-327506, 0, 7, 0, 38, 0, 100, 0, 8, 1, 0, 0, 11, 169459, 2, 0, 0, 0, 0, 10, 25900062, 900261, 0, 0, 0, 0, 0, 'Air Defense Crystal - Shell incoming - Laser the shell'),
(-327506, 0, 8, 0, 38, 0, 100, 0, 9, 1, 0, 0, 11, 169459, 2, 0, 0, 0, 0, 10, 25900063, 900262, 0, 0, 0, 0, 0, 'Air Defense Crystal - Shell incoming - Laser the shell'),
(-327510, 0, 0, 0, 38, 0, 100, 0, 1, 1, 0, 0, 11, 169459, 2, 0, 0, 0, 0, 10, 25900064, 900263, 0, 0, 0, 0, 0, 'Air Defense Crystal - Shell incoming - Laser the shell'),
(-327510, 0, 1, 0, 38, 0, 100, 0, 2, 1, 0, 0, 11, 169459, 2, 0, 0, 0, 0, 10, 25900065, 900264, 0, 0, 0, 0, 0, 'Air Defense Crystal - Shell incoming - Laser the shell'),
(-327510, 0, 2, 0, 38, 0, 100, 0, 3, 1, 0, 0, 11, 169459, 2, 0, 0, 0, 0, 10, 25900066, 900265, 0, 0, 0, 0, 0, 'Air Defense Crystal - Shell incoming - Laser the shell'),
(-327510, 0, 3, 0, 38, 0, 100, 0, 4, 1, 0, 0, 11, 169459, 2, 0, 0, 0, 0, 10, 25900067, 900266, 0, 0, 0, 0, 0, 'Air Defense Crystal - Shell incoming - Laser the shell'),
(-327510, 0, 4, 0, 38, 0, 100, 0, 5, 1, 0, 0, 11, 169459, 2, 0, 0, 0, 0, 10, 25900068, 900267, 0, 0, 0, 0, 0, 'Air Defense Crystal - Shell incoming - Laser the shell'),
(-327510, 0, 5, 0, 38, 0, 100, 0, 6, 1, 0, 0, 11, 169459, 2, 0, 0, 0, 0, 10, 25900069, 900268, 0, 0, 0, 0, 0, 'Air Defense Crystal - Shell incoming - Laser the shell'),
(-327510, 0, 6, 0, 38, 0, 100, 0, 7, 1, 0, 0, 11, 169459, 2, 0, 0, 0, 0, 10, 25900070, 900269, 0, 0, 0, 0, 0, 'Air Defense Crystal - Shell incoming - Laser the shell'),
(-327510, 0, 7, 0, 38, 0, 100, 0, 8, 1, 0, 0, 11, 169459, 2, 0, 0, 0, 0, 10, 25900071, 900270, 0, 0, 0, 0, 0, 'Air Defense Crystal - Shell incoming - Laser the shell'),
(-327510, 0, 8, 0, 38, 0, 100, 0, 9, 1, 0, 0, 11, 169459, 2, 0, 0, 0, 0, 10, 25900072, 900271, 0, 0, 0, 0, 0, 'Air Defense Crystal - Shell incoming - Laser the shell');
