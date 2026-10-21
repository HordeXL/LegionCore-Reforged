-- Spires of Arak: Ka'alu's phase (3484) only shows while "When All Is Aligned" is in progress
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 23 AND `SourceGroup` = 6722 AND `SourceEntry` = 62;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(23, 6722, 62, 0, 0, 9, 0, 35704, 0, 0, 0, 0, '', 'Phase 3484 - When All Is Aligned in progress');
