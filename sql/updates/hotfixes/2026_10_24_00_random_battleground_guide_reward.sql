-- Adventure guide, Random Battleground: the reward shown is Soldier's Esteem, the first win of the day, not an old season's necklace
DELETE FROM `adventure_journal` WHERE `ID` = 27;
INSERT INTO `adventure_journal` (`ID`, `Name`, `Description`, `ButtonText`, `RewardDescription`, `ContinueDescription`, `TextureFileDataID`, `ItemID`, `LfgDungeonID`, `QuestID`, `BattleMasterListID`, `BonusPlayerConditionID1`, `BonusPlayerConditionID2`, `CurrencyType`, `WorldMapAreaID`, `Type`, `Flags`, `ButtonActionType`, `PriorityMin`, `PriorityMax`, `BonusValue1`, `BonusValue2`, `CurrencyQuantity`, `PlayerConditionID`, `ItemQuantity`, `VerifiedBuild`) VALUES
(27, 'Random Battleground', 'Battle other players inside a Random Battleground!', 'Join the Fight!', '', '', 132269, 143680, 0, 0, 32, 33559, 0, 0, 0, 5, 0, 8, 6, 7, 4, 0, 0, 34154, 0, 26972);
DELETE FROM `adventure_journal_locale` WHERE `ID` = 27 AND `locale` = 'frFR';
INSERT INTO `adventure_journal_locale` (`ID`, `locale`, `Name_lang`, `Description_lang`, `ButtonText_lang`, `RewardDescription_lang`, `ContinueDescription_lang`, `VerifiedBuild`) VALUES
(27, 'frFR', 'Champ de bataille aléatoire', 'Affrontez d’autres personnages-joueurs dans un champ de bataille aléatoire !', 'Rejoindre le combat !', '', '', 26972);

DELETE FROM `hotfix_data` WHERE `Id` = 9100182;
INSERT INTO `hotfix_data` (`Id`, `TableHash`, `RecordID`, `Timestamp`, `Deleted`) VALUES
(9100182, 2398034583, 27, 0, 0);

UPDATE `world_legion`.`version` SET `hotfix_cache_id` = `hotfix_cache_id` + 1;
