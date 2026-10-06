-- The Infernal of Summon Infernal (1122 -> 111685 -> creature 89) never burned anything: Immolation (19483, periodic
-- trigger of 20153) is the aura it carries in 7.3.5 and nothing applied it.
DELETE FROM `creature_template_addon` WHERE `entry` = 89;
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES
(89, 0, 0, 0, 0, 0, '19483');
