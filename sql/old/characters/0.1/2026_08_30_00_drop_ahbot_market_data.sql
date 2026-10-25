-- ---------------------------------------------------------------------------------------------
-- Drop the auction house bot's market data.
--
-- The bot has been removed from the core, so nothing reads or writes this table any more. It is
-- also dropped from the base schema, and from the wipe list in CharacterDatabaseCleaner -- a
-- TRUNCATE on a table that no longer exists would fail the ResetCharacterDB pass.
-- ---------------------------------------------------------------------------------------------

DROP TABLE IF EXISTS `ahbot_market_data`;
