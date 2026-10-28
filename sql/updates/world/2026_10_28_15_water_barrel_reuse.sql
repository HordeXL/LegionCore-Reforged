-- Hallow's End water barrels hand out a bucket on every click instead of locking for a minute and despawning
UPDATE `gameobject_template` SET `Data3` = 1000, `flags` = `flags` | 0x20 WHERE `entry` = 186234;
