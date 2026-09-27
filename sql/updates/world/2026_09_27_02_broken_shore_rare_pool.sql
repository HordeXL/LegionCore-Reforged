-- Broken Shore rares: a pool keeps 3 of the 22 up at a time, as on retail (a few rares at once, not all of them). When
-- one dies, a random one of the pool comes out once the respawn delay is over: 20 minutes instead of 3.
DELETE FROM `pool_creature` WHERE `pool_entry` = 600000;
DELETE FROM `pool_template` WHERE `entry` = 600000;
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`) VALUES (600000, 3, 'Broken Shore - rares, 3 up at a time');
INSERT INTO `pool_creature` (`guid`, `pool_entry`, `chance`, `description`)
SELECT `guid`, 600000, 0, CONCAT('Broken Shore rare ', `id`) FROM `creature` WHERE `map` = 1220 AND `id` IN (116166, 116953, 117086, 117089, 117090, 117091, 117094, 117095, 117096, 117103, 117140, 117141, 118993, 119718, 120998, 121016, 121029, 121037, 121046, 121107, 121112, 121134);
UPDATE `creature` SET `spawntimesecs` = 1200 WHERE `map` = 1220 AND `id` IN (116166, 116953, 117086, 117089, 117090, 117091, 117094, 117095, 117096, 117103, 117140, 117141, 118993, 119718, 120998, 121016, 121029, 121037, 121046, 121107, 121112, 121134);
