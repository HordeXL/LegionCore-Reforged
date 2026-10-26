-- SpellFlyoutItem has a parent field, the flyout it belongs to (3rd field of the client layout), that the hotfix
-- table did not have: the statement was one column short and the loader dropped the whole table without a word.
ALTER TABLE `spell_flyout_item` ADD COLUMN `SpellFlyoutID` tinyint unsigned NOT NULL DEFAULT 0 AFTER `Slot`;
