-- ---------------------------------------------------------------------------------------------
-- Bag filters (equipment, consumables, trade goods, junk) and bag sorting settings.
--
-- The client sends the chosen filter through CMSG_CHANGE_BAG_SLOT_FLAG, but the opcode was not
-- handled: the choice was dropped on arrival. It is now applied to the player fields, and kept
-- here between sessions.
--
-- Flags are stored as a space-separated list, one number per bag: four for the equipped bags,
-- seven for the bank. That is the convention already used elsewhere in the core for short
-- arrays. bagSettings holds the settings the client reads back from a single packed field.
-- ---------------------------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `character_bag_slot_flags` (
  `guid`         BIGINT UNSIGNED NOT NULL,
  `bagFlags`     VARCHAR(64)     NOT NULL DEFAULT '' COMMENT '4 values, the equipped bags',
  `bankBagFlags` VARCHAR(128)    NOT NULL DEFAULT '' COMMENT '7 values, the bank bags',
  `bagSettings`  INT UNSIGNED    NOT NULL DEFAULT 0  COMMENT 'sorting settings, bit 0: ignore the backpack',
  PRIMARY KEY (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Per-character bag filters';
