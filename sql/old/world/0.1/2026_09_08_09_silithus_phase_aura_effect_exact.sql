-- The timeline marker lives on effect 1, and now the condition says so.
--
-- Update 08 covered indices 0, 1 and 2 because the index was not readable offline. The probe added
-- to the Zidormi trace answered it on the next test:
--
--   Zidormi: hello par Stormheim, option 1, aura 0, effets 00000, zone 1377
--   Zidormi: hello par Stormheim, option 1, aura 1, effets 01000, zone 1377
--
-- The five digits are HasAuraEffect(255152, 0..4). Only the second turns on, so effect 1 carries
-- the aura and the other two rows were dead weight.
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 23 AND `SourceGroup` = 1377 AND `SourceEntry` IN (10, 11);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`,
                          `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`,
                          `ConditionValue3`, `NegativeCondition`, `Comment`) VALUES
(23, 1377, 10, 0, 0, 1, 0, 255152, 1, 0, 1, 'Silithus - the Wound while the player carries no timeline marker'),
(23, 1377, 11, 0, 0, 1, 0, 255152, 1, 0, 0, 'Silithus - the old zone while the player carries the timeline marker');
