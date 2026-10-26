-- Ji Firepaw and Shang Xi's balloon at the Orgrimmar gate: only Horde pandaren who have not turned in Joining the Horde see them
DELETE FROM `phase_definitions` WHERE (`zoneId`=14 AND `entry`=60) OR (`zoneId`=1637 AND `entry`=60);
INSERT INTO `phase_definitions` (`zoneId`,`entry`,`phasemask`,`phaseId`,`PreloadMapID`,`VisibleMapID`,`UiWorldMapAreaID`,`flags`,`comment`) VALUES
(14,60,0,'1802',0,0,0,0,'Pandaren arrival at the Orgrimmar gate'),
(1637,60,0,'1802',0,0,0,0,'Pandaren arrival at the Orgrimmar gate');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=23 AND `SourceGroup` IN (14,1637) AND `SourceEntry`=60;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(23,14,60,0,0,16,0,33554432,0,0,0,0,'','Pandaren arrival - Horde pandaren'),
(23,14,60,0,0,8,0,31012,0,0,1,0,'','Pandaren arrival - Joining the Horde not rewarded'),
(23,1637,60,0,0,16,0,33554432,0,0,0,0,'','Pandaren arrival - Horde pandaren'),
(23,1637,60,0,0,8,0,31012,0,0,1,0,'','Pandaren arrival - Joining the Horde not rewarded');

UPDATE `creature` SET `PhaseId`='1802' WHERE `guid` IN (189104,189105);
