-- Talador, Shattrath harbor: the Iron Horde corpses floating in the water spawn dead, with no health left, and can no longer be attacked
UPDATE `creature_template` SET `RegenHealth` = 0, `unit_flags` = `unit_flags` | 0x2 | 0x100 | 0x200 WHERE `entry` IN (88875, 88876, 88877, 88878, 88879);
UPDATE `creature` SET `curhealth` = 0 WHERE `id` IN (88875, 88876, 88877, 88878, 88879);
