-- The Defense of Karabor is accepted by hand and offered through a dungeon finder proposal; each scenario of map 1277 is tied to its dungeon finder entry
UPDATE `quest_template` SET `Flags` = `Flags` & ~0x80000 WHERE `ID` = 33256;
UPDATE `scenario_data` SET `LfgDungeonID` = 818 WHERE `ScenarioID` = 449 AND `MapID` = 1277;
UPDATE `scenario_data` SET `LfgDungeonID` = 819 WHERE `ScenarioID` = 450 AND `MapID` = 1277;
