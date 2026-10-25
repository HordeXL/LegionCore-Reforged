-- ---------------------------------------------------------------------------------------------
-- Artifact research notes: push the ItemEffect records to the client.
--
-- 2026_08_29_00 added the missing ItemEffect rows, but only the SERVER read them: without an
-- entry in `hotfix_data` the client is never told the record exists, keeps the ItemEffect.db2
-- shipped with 7.3.5 (where Blizzard stripped these items) and therefore draws no "Use:" line on
-- the tooltip. With no use line the client never sends CMSG_USE_ITEM, so the item stays dead in
-- the bag no matter what the server knows.
--
-- TableHash 1073915313 (0x4002A5B1) is the ItemEffect.db2 table hash, read from the file header
-- of the client data this server ships. RecordID matches `item_effect`.`ID`.
-- ---------------------------------------------------------------------------------------------

DELETE FROM `hotfix_data` WHERE `Id` IN (9000216, 9000217);
INSERT INTO `hotfix_data` (`Id`, `TableHash`, `RecordID`, `Timestamp`, `Deleted`) VALUES
(9000216, 1073915313, 79044, 0, 0),
(9000217, 1073915313, 79045, 0, 0);
