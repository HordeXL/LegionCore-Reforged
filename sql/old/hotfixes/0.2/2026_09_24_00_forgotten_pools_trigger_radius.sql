-- Quest 870 "The Forgotten Pools": area trigger 216 was a 9 yd sphere in the middle of the lake, while
-- the map draws an area about 210 yd wide. Radius raised to 40 yd so the quest completes at the shore.
-- The client decides on its own, from its DB2, when to send the trigger, hence a client hotfix; the
-- server reads the same table for its distance check. The record is copied field by field from
-- AreaTrigger.db2 (a hotfix replaces the whole record), only Radius changes.
-- TableHash read at offset 20 of AreaTrigger.db2. Re-runnable.

DELETE FROM `area_trigger` WHERE `ID` = 216;
INSERT INTO `area_trigger` (`PosX`, `PosY`, `PosZ`, `Radius`, `BoxLength`, `BoxWidth`, `BoxHeight`, `BoxYaw`, `ContinentID`, `PhaseID`, `PhaseGroupID`, `ShapeID`, `AreaTriggerActionSetID`, `PhaseUseFlags`, `ShapeType`, `Flags`, `ID`, `VerifiedBuild`) VALUES
(90.1003, -1943.44, 79.4727, 40, 0, 0, 0, 0, 1, 0, 0, 0, 193, 0, 0, 0, 216, 0);

DELETE FROM `hotfix_data` WHERE `TableHash` = 441483745 AND `RecordID` = 216;
INSERT INTO `hotfix_data` (`Id`, `TableHash`, `RecordID`, `Timestamp`, `Deleted`) VALUES (9000784, 441483745, 216, 0, 0);

UPDATE `world_legion`.`version` SET `hotfix_cache_id` = 214;
