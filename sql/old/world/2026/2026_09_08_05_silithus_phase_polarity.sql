-- The sword shows with the buff, not without it.
--
-- Earlier passes followed the aura's own wording - 255152 says "Silithus before the world was
-- wounded" - and made the Wound the state you get by NOT carrying it. The wanted behaviour is the
-- opposite: the buff is what brings the Wound. It is treated as a marker rather than as a piece
-- of lore, which also lets Custom.SilithusWound.Default work by simply handing it out on arrival.
--
--   phase 10, the Wound        while the player carries 255152
--   phase 11, old Silithus     while the player does not
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 23 AND `SourceGroup` = 1377 AND `SourceEntry` IN (10, 11);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`,
                          `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`,
                          `ConditionValue3`, `NegativeCondition`, `Comment`) VALUES
(23, 1377, 10, 0, 0, 1, 0, 255152, 0, 0, 0, 'Silithus - the Wound while the player carries the timeline aura'),
(23, 1377, 11, 0, 0, 1, 0, 255152, 0, 0, 1, 'Silithus - the old zone while the player does not');
