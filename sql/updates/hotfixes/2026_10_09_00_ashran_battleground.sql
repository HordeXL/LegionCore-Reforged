-- Ashran as an epic battleground: its list entry, level bracket and battleground map type and name.
DELETE FROM `battlemaster_list` WHERE `ID` = 901;
INSERT INTO `battlemaster_list` (`ID`, `Name`, `GameType`, `ShortDescription`, `LongDescription`, `IconFileDataID`, `MapID1`, `HolidayWorldState`, `RequiredPlayer_Condition_ID`, `InstanceType`, `GroupsAllowed`, `MaxGroupSize`, `MinLevel`, `MaxLevel`, `RatedPlayers`, `MinPlayers`, `MaxPlayers`, `Flags`) VALUES
(901, 'Ashran', 'Epic Battleground', 'Lead your faction to victory in the lands of Ashran.', 'Two armies fight over Ashran, from the Horde base to the Alliance one. Hold the strategic points, bring down the enemy leaders and win the battle.', 0, 1191, 0, 0, 3, 1, 5, 100, 110, 25, 25, 40, 8);

DELETE FROM `pvp_difficulty` WHERE `ID` = 1160;
INSERT INTO `pvp_difficulty` (`ID`, `RangeIndex`, `MinLevel`, `MaxLevel`, `MapID`) VALUES
(1160, 10, 100, 110, 1191);

DELETE FROM `hotfix_data` WHERE `Id` = 9009182;
INSERT INTO `hotfix_data` (`Id`, `TableHash`, `RecordID`, `Timestamp`, `Deleted`) VALUES
(9009182, 1435332686, 901, 0, 0);

DELETE FROM `map` WHERE `ID` = 1191;
INSERT INTO `map` (`ID`, `Directory`, `MapName`, `MapDescription0`, `MapDescription1`, `PvpShortDescription`, `PvpLongDescription`, `Flags1`, `Flags2`, `MinimapIconScale`, `CorpsePosX`, `CorpsePosY`, `AreaTableID`, `LoadingScreenID`, `CorpseMapID`, `TimeOfDayOverride`, `ParentMapID`, `CosmeticParentMapID`, `WindSettingsID`, `InstanceType`, `MapType`, `ExpansionID`, `MaxPlayers`, `TimeOffset`) VALUES
(1191, 'Ashran', 'Ashran', '', '', '', '', 411057757, 88, 1, 0, 0, 0, 360, -1, 65535, -1, 1116, 0, 3, 1, 5, 0, 0);
DELETE FROM `hotfix_data` WHERE `Id` = 9009183;
INSERT INTO `hotfix_data` (`Id`, `TableHash`, `RecordID`, `Timestamp`, `Deleted`) VALUES
(9009183, 3179597154, 1191, 0, 0);
