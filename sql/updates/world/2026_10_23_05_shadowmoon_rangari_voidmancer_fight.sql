-- Shadowmoon Valley: the Rangari Scouts and the Shadowmoon Voidmancers standing together fight each other, neither falling under 85% health
DELETE FROM `creature_action` WHERE (`entry` = 80162 AND `target` = 74344) OR (`entry` = 74344 AND `target` = 80162);
INSERT INTO `creature_action` (`entry`, `target`, `type`, `spellId`, `action`) VALUES
(80162, 74344, 0, 0, 0),
(74344, 80162, 0, 0, 0);
