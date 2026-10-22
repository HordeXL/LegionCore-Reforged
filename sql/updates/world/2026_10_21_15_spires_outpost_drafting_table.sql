-- Spires of Arak: the outpost drafting table only opens once "Orders, Commander?" has been taken (or later, to switch buildings), and its choice reads in French
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 17 AND `SourceEntry` = 165001;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(17, 0, 165001, 0, 0, 9, 0, 35286, 0, 0, 0, 0, '', 'Drafting Table - Orders, Commander? (Alliance) taken'),
(17, 0, 165001, 0, 1, 8, 0, 35286, 0, 0, 0, 0, '', 'Drafting Table - Orders, Commander? (Alliance) rewarded'),
(17, 0, 165001, 0, 2, 9, 0, 35277, 0, 0, 0, 0, '', 'Drafting Table - Orders, Commander? (Horde) taken'),
(17, 0, 165001, 0, 3, 8, 0, 35277, 0, 0, 0, 0, '', 'Drafting Table - Orders, Commander? (Horde) rewarded');

DELETE FROM `playerchoice_locale` WHERE `ChoiceId` = 58 AND `locale` = 'frFR';
INSERT INTO `playerchoice_locale` (`ChoiceId`, `locale`, `Question`, `VerifiedBuild`) VALUES
(58, 'frFR', 'Quel bâtiment devons-nous construire à l''avant-poste ?', 0);
DELETE FROM `playerchoice_response_locale` WHERE `ChoiceId` = 58 AND `locale` = 'frFR';
INSERT INTO `playerchoice_response_locale` (`ChoiceId`, `ResponseId`, `locale`, `Header`, `Answer`, `Description`, `Confirmation`, `VerifiedBuild`) VALUES
(58, 133, 'frFR', '', 'Brasserie Stoktron', 'La brasserie Stoktron logera des troupes supplémentaires et remontera le moral de vos forces.\n\nUne fois pleinement opérationnelle, la brasserie Stoktron donne accès à |cFFFF0000|Hspell:168487|h[Comme à la maison]|h|r dans les flèches d''Arak.', '', 0),
(58, 134, 'frFR', '', 'Repaire des contrebandiers', 'Le repaire des contrebandiers ouvrira des routes commerciales avec d''autres forces et donnera accès à des fournitures et matériaux rares.\n\nUne fois pleinement opérationnel, le repaire des contrebandiers donne accès à |cFFFF0000|Hspell:170108|h[Course du contrebandier !]|h|r dans les flèches d''Arak.', '', 0);
