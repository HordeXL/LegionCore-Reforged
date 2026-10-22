-- Spires of Arak: the Veil Akraz Outcast corpses spawn with no health left instead of a full health bar
UPDATE `creature_template` SET `RegenHealth` = 0 WHERE `entry` = 80320;
UPDATE `creature` SET `curhealth` = 0 WHERE `id` = 80320;
