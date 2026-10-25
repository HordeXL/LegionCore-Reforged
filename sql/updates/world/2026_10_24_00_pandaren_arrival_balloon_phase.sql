-- Shang Xi's balloon and Aysa at the Stormwind gate: only Alliance pandaren who have not turned in Joining the Alliance see them
DELETE FROM `phase_definitions` WHERE (`zoneId`=12 AND `entry`=60) OR (`zoneId`=1519 AND `entry`=1300);
INSERT INTO `phase_definitions` (`zoneId`,`entry`,`phasemask`,`phaseId`,`PreloadMapID`,`VisibleMapID`,`UiWorldMapAreaID`,`flags`,`comment`) VALUES
(12,60,0,'1801',0,0,0,0,'Pandaren arrival at the Stormwind gate'),
(1519,1300,0,'1801',0,0,0,0,'Pandaren arrival at the Stormwind gate');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=23 AND ((`SourceGroup`=12 AND `SourceEntry`=60) OR (`SourceGroup`=1519 AND `SourceEntry`=1300));
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(23,12,60,0,0,16,0,16777216,0,0,0,0,'','Pandaren arrival - Alliance pandaren'),
(23,12,60,0,0,8,0,30987,0,0,1,0,'','Pandaren arrival - Joining the Alliance not rewarded'),
(23,1519,1300,0,0,16,0,16777216,0,0,0,0,'','Pandaren arrival - Alliance pandaren'),
(23,1519,1300,0,0,8,0,30987,0,0,1,0,'','Pandaren arrival - Joining the Alliance not rewarded');

UPDATE `creature` SET `PhaseId`='1801' WHERE `guid` IN (189101,338298);
