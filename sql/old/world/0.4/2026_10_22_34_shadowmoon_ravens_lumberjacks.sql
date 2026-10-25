-- Shadowmoon Valley: the Lunarfall ravens on the ground walk instead of flapping in place, and the lumberjacks face their tree and chop with the axe in hand
UPDATE `creature_template_addon` SET `auras` = '' WHERE `entry` = 82037;
UPDATE `creature_addon` SET `auras` = '' WHERE `guid` = 351717;
UPDATE `smart_scripts` SET `action_param2` = 3 WHERE `entryorguid` = 79254 AND `source_type` = 0 AND `id` = 0 AND `action_type` = 29;
UPDATE `smart_scripts` SET `action_type` = 17, `action_param1` = 234 WHERE `entryorguid` = 79254 AND `source_type` = 0 AND `id` = 2;
DELETE FROM `creature_template_addon` WHERE `entry` = 79254;
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES
(79254, 0, 0, 0, 1, 0, '');
