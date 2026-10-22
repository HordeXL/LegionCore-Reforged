-- Goldshire Hallow's End camp: the adults get back their 7.3.5 levels, the children stay at 1
UPDATE `creature_template` SET `minlevel` = 31, `maxlevel` = 31 WHERE `entry` IN (51934, 52548);
UPDATE `creature_template` SET `minlevel` = 40, `maxlevel` = 40 WHERE `entry` IN (51665, 52064);
UPDATE `creature_template` SET `minlevel` = 10, `maxlevel` = 10 WHERE `entry` = 53869;
UPDATE `creature_template` SET `minlevel` = 80, `maxlevel` = 80 WHERE `entry` = 51699;
UPDATE `creature_template` SET `minlevel` = 85, `maxlevel` = 85 WHERE `entry` = 51701;
