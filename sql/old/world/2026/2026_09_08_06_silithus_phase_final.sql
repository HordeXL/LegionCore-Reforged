-- Final polarity: the buff is the past, its absence is the present.
--
-- 255152 reads "Silithus before the world was wounded", so carrying it means standing in the older
-- zone and dropping it means coming back to the present, where the sword is planted. Everything
-- follows from that one sentence, including the sky: the broken sky sits on map 1817, the Wound's
-- terrain, so it comes and goes with the sword rather than needing a rule of its own.
--
--   phase 10, the Wound        while the player does NOT carry 255152
--   phase 11, old Silithus     while the player does
--
-- Custom.SilithusWound.Default then reads plainly: 1 leaves a new arrival with nothing, so the
-- sword is planted, and 0 hands them the marker, so they arrive before it fell.
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 23 AND `SourceGroup` = 1377 AND `SourceEntry` IN (10, 11);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`,
                          `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`,
                          `ConditionValue3`, `NegativeCondition`, `Comment`) VALUES
(23, 1377, 10, 0, 0, 1, 0, 255152, 0, 0, 1, 'Silithus - the Wound while the player is not travelling to the past'),
(23, 1377, 11, 0, 0, 1, 0, 255152, 0, 0, 0, 'Silithus - the old zone while the player carries the timeline aura');
