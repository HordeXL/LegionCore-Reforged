-- Talador: Kalaam's "As the Smoke Rises" is offered to the Alliance at Fort Wrynn and to the Horde at Vol'jin's Pride only
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (19, 20) AND `SourceEntry` = 34685;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(19, 0, 34685, 0, 0, 6, 0, 469, 0, 0, 0, 0, '', 'As the Smoke Rises - Alliance at Fort Wrynn'),
(19, 0, 34685, 0, 0, 23, 0, 7097, 0, 0, 0, 0, '', 'As the Smoke Rises - Alliance at Fort Wrynn'),
(19, 0, 34685, 0, 1, 6, 0, 67, 0, 0, 0, 0, '', 'As the Smoke Rises - Horde at Vol''jin''s Pride'),
(19, 0, 34685, 0, 1, 23, 0, 7098, 0, 0, 0, 0, '', 'As the Smoke Rises - Horde at Vol''jin''s Pride');
