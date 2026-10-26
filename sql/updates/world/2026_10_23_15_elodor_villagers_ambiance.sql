-- Elodor: the villagers, crystalsmiths and artificers lose the daze and the kneeling of the attack; a few villagers work, talk together or dig the garden
UPDATE `creature_template_addon` SET `bytes1` = 0, `auras` = '' WHERE `entry` IN (81151, 81002, 81082) AND `auras` = '166665';
UPDATE `creature_addon` SET `bytes1` = 0, `auras` = '' WHERE `auras` = '166665' AND `guid` IN (SELECT `guid` FROM `creature` WHERE `id` IN (81151, 81002, 81082));
UPDATE `creature` SET `orientation` = 6.0798 WHERE `guid` = 310662;
UPDATE `creature` SET `orientation` = 2.9383 WHERE `guid` = 310664;
UPDATE `creature` SET `MovementType` = 0, `spawndist` = 0 WHERE `guid` IN (310615, 310652, 310662, 310664);
DELETE FROM `creature_addon` WHERE `guid` IN (310615, 310652, 310662, 310664);
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES
(310652, 0, 0, 0, 1, 133, ''),
(310662, 0, 0, 0, 1, 378, ''),
(310664, 0, 0, 0, 1, 378, ''),
(310615, 0, 0, 0, 1, 233, '131188');
