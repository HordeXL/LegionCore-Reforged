-- ---------------------------------------------------------------------------------------------
-- Give spell 235765 its name and description back.
--
-- Patch 7.3 stripped the spell from Spell.db2 along with emptying the items that cast it. Its
-- mechanics survive in SpellMisc and SpellEffect, which is why the item works, but with no text
-- the client cannot draw the "Use:" line -- it had nothing to write there.
--
-- English lives in `spell`, French in `spell_locale`; any other locale falls back to English.
-- The hotfix_data row is what makes the client accept a record its own DB2 does not contain.
-- ---------------------------------------------------------------------------------------------

DELETE FROM `spell` WHERE `ID` = 235765;
INSERT INTO `spell` (`ID`, `Name`, `NameSubtext`, `Description`, `AuraDescription`, `VerifiedBuild`) VALUES
(235765, 'Artifact Research Notes', '', 'Grants you 1 rank of Artifact Knowledge.', '', 0);

DELETE FROM `spell_locale` WHERE `ID` = 235765 AND `locale` = 'frFR';
INSERT INTO `spell_locale` (`ID`, `locale`, `Name_lang`, `NameSubtext_lang`, `Description_lang`, `AuraDescription_lang`, `VerifiedBuild`) VALUES
(235765, 'frFR', 'Notes de recherche prodigieuse', '', 'Vous octroie 1 rang de connaissance d''arme prodigieuse.', '', 0);

DELETE FROM `hotfix_data` WHERE `Id` = 9000218;
INSERT INTO `hotfix_data` (`Id`, `TableHash`, `RecordID`, `Timestamp`, `Deleted`) VALUES
(9000218, 3776013982, 235765, 0, 0);
