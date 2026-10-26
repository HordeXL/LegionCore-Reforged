-- Stormshield officer 257424: his patrol now stops only 6 seconds near Aruajo Neto, long enough for a few words.
UPDATE `waypoint_data` SET `delay` = 6000 WHERE `id` = 257424 AND `point` = 12;
