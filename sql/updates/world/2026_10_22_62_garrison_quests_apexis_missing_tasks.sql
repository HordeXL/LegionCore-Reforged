-- Garrison Apexis assaults: adds the missing Alliance Magnarok bonus objective and the daily Gorian Proving Grounds tasks
DELETE FROM `quest_template` WHERE `ID` IN (37625, 38204, 38205);
DELETE FROM `quest_template_addon` WHERE `ID` IN (37625, 38204, 38205);
DELETE FROM `quest_template_locale` WHERE `ID` IN (37625, 38204, 38205);
DELETE FROM `quest_objectives` WHERE `QuestID` IN (37625, 38204, 38205);
DELETE FROM `quest_objectives_locale` WHERE `QuestId` IN (37625, 38204, 38205);

DROP TEMPORARY TABLE IF EXISTS `tmp_apexis_quest`;
CREATE TEMPORARY TABLE `tmp_apexis_quest` AS SELECT * FROM `quest_template` WHERE `ID` IN (37626, 36820, 36821);
-- the Horde Magnarok bonus objective, for the Alliance
UPDATE `tmp_apexis_quest` SET `ID` = 37625, `AllowableRaces` = 824181837 WHERE `ID` = 37626;
-- the daily tasks reward nothing themselves: they credit the assault quest, handed in at the garrison
UPDATE `tmp_apexis_quest` SET `ID` = 38204, `Flags` = `Flags` | 0x1000, `RewardXPDifficulty` = 0, `RewardMoney` = 0, `RewardMoneyDifficulty` = 0, `RewardBonusMoney` = 0,
    `RewardFactionID1` = 0, `RewardFactionValue1` = 0, `RewardFactionOverride1` = 0, `RewardCurrencyID1` = 0, `RewardCurrencyQty1` = 0,
    `LogDescription` = '', `QuestDescription` = '', `QuestCompletionLog` = '' WHERE `ID` = 36820;
UPDATE `tmp_apexis_quest` SET `ID` = 38205, `Flags` = `Flags` | 0x1000, `RewardXPDifficulty` = 0, `RewardMoney` = 0, `RewardMoneyDifficulty` = 0, `RewardBonusMoney` = 0,
    `RewardFactionID1` = 0, `RewardFactionValue1` = 0, `RewardFactionOverride1` = 0, `RewardCurrencyID1` = 0, `RewardCurrencyQty1` = 0,
    `LogDescription` = '', `QuestDescription` = '', `QuestCompletionLog` = '' WHERE `ID` = 36821;
INSERT INTO `quest_template` SELECT * FROM `tmp_apexis_quest`;
DROP TEMPORARY TABLE `tmp_apexis_quest`;

INSERT INTO `quest_template_addon` (`ID`, `SpecialFlags`) VALUES (37625, 0), (38204, 1), (38205, 1);

INSERT INTO `quest_template_locale` (`ID`, `locale`, `LogTitle`, `LogDescription`, `QuestDescription`, `AreaDescription`, `PortraitGiverText`, `PortraitGiverName`, `PortraitTurnInText`, `PortraitTurnInName`, `QuestCompletionLog`, `VerifiedBuild`)
SELECT 37625, `locale`, `LogTitle`, `LogDescription`, `QuestDescription`, `AreaDescription`, `PortraitGiverText`, `PortraitGiverName`, `PortraitTurnInText`, `PortraitTurnInName`, `QuestCompletionLog`, `VerifiedBuild` FROM `quest_template_locale` WHERE `ID` = 37626;
INSERT INTO `quest_template_locale` (`ID`, `locale`, `LogTitle`, `LogDescription`, `QuestDescription`, `AreaDescription`, `PortraitGiverText`, `PortraitGiverName`, `PortraitTurnInText`, `PortraitTurnInName`, `QuestCompletionLog`, `VerifiedBuild`)
SELECT `ID` + 1384, `locale`, `LogTitle`, '', '', '', '', '', '', '', '', `VerifiedBuild` FROM `quest_template_locale` WHERE `ID` IN (36820, 36821);

INSERT INTO `quest_objectives` (`ID`, `QuestID`, `Type`, `StorageIndex`, `ObjectID`, `Amount`, `Flags`, `Flags2`, `TaskStep`, `Description`, `VerifiedBuild`, `Bugged`) VALUES
(276549, 37625, 15, -1, 0, 1, 0, 0, 0, 'Magnarok Assaulted', 26365, 0),
(276704, 37625, 0, 0, 87333, 34, 92, 0, 3, 'Cragstomper', 26365, 0),
(276678, 37625, 0, 1, 87510, 34, 92, 0, 3, 'Collect', 26365, 0),
(276550, 37625, 0, 8, 87507, 500, 92, 0, 0.2, 'Minus Mobs Killed', 26365, 0),
(276551, 37625, 0, 9, 87513, 100, 92, 0, 1, 'Normal Mobs Killed', 26365, 0),
(276552, 37625, 0, 10, 87514, 50, 92, 0, 2, 'High HP Normal Mobs Killed', 26365, 0),
(276553, 37625, 3, 11, 87383, 1000, 92, 0, 0.1, 'Collect (Minor)', 26365, 0),
(276554, 37625, 0, 13, 87512, 25, 92, 0, 4, 'Elite Killed', 26365, 0),
(276555, 37625, 0, 14, 87511, 7, 92, 0, 15, 'Miniboss/Event Killed', 26365, 0),
(276556, 37625, 0, 15, 87742, 5, 92, 0, 20, '5man Boss Killed', 26365, 0),
(277506, 38204, 15, -1, 0, 1, 0, 0, 0, 'Dominate the Gorian Proving Grounds', 26365, 0),
(277507, 38204, 0, 0, 88200, 25, 92, 0, 4, 'Defeat Minus Enemies', 26365, 0),
(277508, 38204, 0, 1, 88201, 13, 92, 0, 8, 'Defeat Tier 1 Enemies', 26365, 0),
(277509, 38204, 0, 2, 88202, 9, 92, 0, 12, 'Defeat - Elite', 26365, 0),
(277512, 38204, 2, 3, 237669, 100000, 92, 0, 0, 'Ogre Cage Tracker', 26365, 0),
(277511, 38204, 0, 4, 88204, 2, 92, 0, 60, 'Defeat - Vignette', 26365, 0),
(277513, 38204, 0, 5, 88931, 25, 92, 0, 4, 'Release the Slaves', 26365, 0),
(277510, 38204, 0, 7, 88203, 4, 92, 0, 30, 'Defeat - Vignette / Rare Elite', 26365, 0),
(277514, 38205, 15, -1, 0, 1, 0, 0, 0, 'Dominate the Gorian Proving Grounds', 26365, 0),
(277515, 38205, 0, 0, 88200, 25, 92, 0, 4, 'Defeat Minus Enemies', 26365, 0),
(277516, 38205, 0, 1, 88201, 13, 92, 0, 8, 'Defeat Tier 1 Enemies', 26365, 0),
(277517, 38205, 0, 2, 88202, 9, 92, 0, 12, 'Defeat - Elite', 26365, 0),
(277520, 38205, 2, 3, 237669, 100000, 92, 0, 0, 'Ogre Cage Tracking', 26365, 0),
(277519, 38205, 0, 4, 88204, 2, 92, 0, 60, 'Defeat - Vignette Mob', 26365, 0),
(277521, 38205, 0, 5, 88931, 25, 92, 0, 4, 'Release the Slaves', 26365, 0),
(277518, 38205, 0, 7, 88203, 4, 92, 0, 30, 'Defeat - Vignette / Rare Elite', 26365, 0);

INSERT INTO `quest_objectives_locale` (`ID`, `locale`, `QuestId`, `StorageIndex`, `Description`, `VerifiedBuild`) VALUES
(276549, 'frFR', 37625, -1, 'Magnarok attaqué', 1),
(276704, 'frFR', 37625, 0, 'Martèle-roche', 1),
(276678, 'frFR', 37625, 1, 'Collecter', 1),
(276550, 'frFR', 37625, 8, 'Monstres minus tués', 1),
(276551, 'frFR', 37625, 9, 'Monstres normaux tués', 1),
(276552, 'frFR', 37625, 10, 'Monstres résistants normaux tués', 1),
(276553, 'frFR', 37625, 11, 'Récupérer (Mineur)', 1),
(276554, 'frFR', 37625, 13, 'Elite tué', 1),
(276555, 'frFR', 37625, 14, 'Mini boss / Evènement tué', 1),
(276556, 'frFR', 37625, 15, 'Boss nécessitant un groupe de 5 joueurs tué', 1),
(277506, 'frFR', 38204, -1, 'Dominer l’Ordalie gorienne', 1),
(277507, 'frFR', 38204, 0, 'Vaincre des ennemis minus', 1),
(277508, 'frFR', 38204, 1, 'Vaincre des ennemis de palier 1', 1),
(277509, 'frFR', 38204, 2, 'Vaincre un ennemi d’élite', 1),
(277512, 'frFR', 38204, 3, 'Traqueur de cage ogre', 1),
(277511, 'frFR', 38204, 4, 'Vaincre un ennemi de vignette', 1),
(277513, 'frFR', 38204, 5, 'Libérer les esclaves', 1),
(277510, 'frFR', 38204, 7, 'Vaincre un ennemi de vignette / d’élite rare', 1),
(277514, 'frFR', 38205, -1, 'Dominer l’Ordalie gorienne', 1),
(277515, 'frFR', 38205, 0, 'Vaincre des ennemis minus', 1),
(277516, 'frFR', 38205, 1, 'Vaincre des ennemis de palier 1', 1),
(277517, 'frFR', 38205, 2, 'Vaincre un ennemi d’élite', 1),
(277520, 'frFR', 38205, 3, 'Traqueur de cage ogre', 1),
(277519, 'frFR', 38205, 4, 'Vaincre un ennemi de vignette', 1),
(277521, 'frFR', 38205, 5, 'Libérer les esclaves', 1),
(277518, 'frFR', 38205, 7, 'Vaincre un ennemi de vignette / d’élite rare', 1);
