-- Treasure chests: their currency rewards always drop instead of never
UPDATE `gameobject_loot_template` SET `Chance` = 100 WHERE `Chance` = 0 AND `GroupId` = 0 AND `Reference` = 0 AND `Currency` > 0 AND `Item` = 0;
