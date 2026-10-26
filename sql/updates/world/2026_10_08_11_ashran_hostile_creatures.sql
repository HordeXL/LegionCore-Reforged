-- Ashran: creatures hostile to both factions that were friendly or neutral.
UPDATE `creature_template` SET `faction` = 14 WHERE `entry` IN (84097, 85763, 87359, 87362, 91921);
