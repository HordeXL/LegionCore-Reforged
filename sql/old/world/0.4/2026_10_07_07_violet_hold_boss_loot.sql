-- Assault on Violet Hold boss loot, checked against the Adventure Guide (JournalEncounterItem, 7.3.5):
-- the two final bosses missed four pieces each, and three bosses could drop a piece of another boss.
DELETE FROM `creature_loot_template` WHERE `Entry` = 102387 AND `Item` IN (134357, 134371, 134390, 134393);
DELETE FROM `creature_loot_template` WHERE `Entry` = 102446 AND `Item` IN (134360, 134368, 134389, 134395);
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Currency`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Shared`) VALUES
(102387, 134357, 0, 0, 0, 0, 4, 0, 1, 1, 0),   -- Sael'orn: Portalguard Waistplate
(102387, 134371, 0, 0, 0, 0, 4, 0, 1, 1, 0),   -- Felbat Leather Gloves
(102387, 134390, 0, 0, 0, 0, 4, 0, 1, 1, 0),   -- Mardum Chain Vest
(102387, 134393, 0, 0, 0, 0, 4, 0, 1, 1, 0),   -- Netherwhisper Gloves
(102446, 134360, 0, 0, 0, 0, 4, 0, 1, 1, 0),   -- Fel Lord Betrug: Portalguard Shoulderplates
(102446, 134368, 0, 0, 0, 0, 4, 0, 1, 1, 0),   -- Felbat Leather Wristwraps
(102446, 134389, 0, 0, 0, 0, 4, 0, 1, 1, 0),   -- Mardum Chain Pauldrons
(102446, 134395, 0, 0, 0, 0, 4, 0, 1, 1, 0);   -- Netherwhisper Robes
-- Another boss's pieces in the gear pool
DELETE FROM `creature_loot_template` WHERE (`Entry` = 102246 AND `Item` = 137465) OR (`Entry` = 102387 AND `Item` = 137464)
    OR (`Entry` = 102446 AND `Item` = 137436);
