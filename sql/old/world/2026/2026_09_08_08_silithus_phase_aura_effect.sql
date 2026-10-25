-- The phase condition was reading an effect the aura does not have.
--
-- CONDITION_AURA is not "has this aura": ConditionMgr answers it with HasAuraEffect(spellId,
-- effIndex), so the effect index in ConditionValue2 has to be one the spell really carries. It was
-- left at 0, and 255152 has no aura on effect 0.
--
-- The server log settles it. Zidormi is reached, the marker is applied and read back:
--
--   Zidormi: hello par Stormheim, option 1, aura 0, zone 1377
--   Zidormi: choix 1001 par Stormheim
--   PhaseMgr::Recalculate enable id: 10 zone 1377     <- still the Wound
--   Zidormi: hello par Stormheim, option 1, aura 1, zone 1377
--
-- HasAura is true on the second line while the phase stayed on 10, so HasAuraEffect(255152, 0) is
-- false. Which index does carry it is not readable offline - SpellEffect.db2 keeps the spell id in
-- its relationship block and the record itself bitpacked - so the three indices an aura of this
-- shape can use are covered. Different ElseGroups are OR'd, one ElseGroup is AND'd, which gives
-- "carries it on any of the three" and its exact negation.
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 23 AND `SourceGroup` = 1377 AND `SourceEntry` IN (10, 11);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`,
                          `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`,
                          `ConditionValue3`, `NegativeCondition`, `Comment`) VALUES
(23, 1377, 10, 0, 0, 1, 0, 255152, 0, 0, 1, 'Silithus - the Wound while the player carries no timeline marker'),
(23, 1377, 10, 0, 0, 1, 0, 255152, 1, 0, 1, 'Silithus - the Wound while the player carries no timeline marker'),
(23, 1377, 10, 0, 0, 1, 0, 255152, 2, 0, 1, 'Silithus - the Wound while the player carries no timeline marker'),
(23, 1377, 11, 0, 0, 1, 0, 255152, 0, 0, 0, 'Silithus - the old zone while the player carries the timeline marker'),
(23, 1377, 11, 0, 1, 1, 0, 255152, 1, 0, 0, 'Silithus - the old zone while the player carries the timeline marker'),
(23, 1377, 11, 0, 2, 1, 0, 255152, 2, 0, 0, 'Silithus - the old zone while the player carries the timeline marker');
