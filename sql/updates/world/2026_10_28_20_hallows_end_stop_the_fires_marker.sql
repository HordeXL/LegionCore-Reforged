-- "Stop the Fires!" only shows its quest marker while the Shade of the Horseman is burning the village, as the matron only offers it then
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 20 AND `SourceEntry` IN (11131, 11219);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(20, 0, 11131, 0, 0, 29, 0, 23543, 150, 0, 0, 0, '', 'Stop the Fires! (Alliance) - marker only while the Shade of the Horseman is near'),
(20, 0, 11219, 0, 0, 29, 0, 23543, 150, 0, 0, 0, '', 'Stop the Fires! (Horde) - marker only while the Shade of the Horseman is near');
