-- Headless Horseman: his Draenor rings drop from level 90 to 99, his Legion rings from level 100, as often as each other
UPDATE `creature_loot_template` SET `Chance` = 5.5 WHERE `Entry` = 23682 AND `Item` IN (117362, 117363, 117364, 117365, 143901, 143902, 143903, 143904);
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 1 AND `SourceGroup` = 23682 AND `SourceEntry` IN (117362, 117363, 117364, 117365, 143901, 143902, 143903, 143904);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(1, 23682, 117362, 0, 0, 27, 0, 90, 3, 0, 0, 0, '', 'Headless Horseman - Draenor ring from level 90'),
(1, 23682, 117362, 0, 0, 27, 0, 99, 4, 0, 0, 0, '', 'Headless Horseman - Draenor ring up to level 99'),
(1, 23682, 117363, 0, 0, 27, 0, 90, 3, 0, 0, 0, '', 'Headless Horseman - Draenor ring from level 90'),
(1, 23682, 117363, 0, 0, 27, 0, 99, 4, 0, 0, 0, '', 'Headless Horseman - Draenor ring up to level 99'),
(1, 23682, 117364, 0, 0, 27, 0, 90, 3, 0, 0, 0, '', 'Headless Horseman - Draenor ring from level 90'),
(1, 23682, 117364, 0, 0, 27, 0, 99, 4, 0, 0, 0, '', 'Headless Horseman - Draenor ring up to level 99'),
(1, 23682, 117365, 0, 0, 27, 0, 90, 3, 0, 0, 0, '', 'Headless Horseman - Draenor ring from level 90'),
(1, 23682, 117365, 0, 0, 27, 0, 99, 4, 0, 0, 0, '', 'Headless Horseman - Draenor ring up to level 99'),
(1, 23682, 143901, 0, 0, 27, 0, 100, 3, 0, 0, 0, '', 'Headless Horseman - Legion ring from level 100'),
(1, 23682, 143902, 0, 0, 27, 0, 100, 3, 0, 0, 0, '', 'Headless Horseman - Legion ring from level 100'),
(1, 23682, 143903, 0, 0, 27, 0, 100, 3, 0, 0, 0, '', 'Headless Horseman - Legion ring from level 100'),
(1, 23682, 143904, 0, 0, 27, 0, 100, 3, 0, 0, 0, '', 'Headless Horseman - Legion ring from level 100');
