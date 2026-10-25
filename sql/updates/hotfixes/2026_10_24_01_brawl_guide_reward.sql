-- Adventure guide, brawls: the reward shown is Soldier's Esteem, the first win of the day, as in the PvP window
DELETE FROM `adventure_journal` WHERE `ID` IN (321,322,323,324,325,326,327,328,329,348);
INSERT INTO `adventure_journal` (`ID`, `Name`, `Description`, `ButtonText`, `RewardDescription`, `ContinueDescription`, `TextureFileDataID`, `ItemID`, `LfgDungeonID`, `QuestID`, `BattleMasterListID`, `BonusPlayerConditionID1`, `BonusPlayerConditionID2`, `CurrencyType`, `WorldMapAreaID`, `Type`, `Flags`, `ButtonActionType`, `PriorityMin`, `PriorityMax`, `BonusValue1`, `BonusValue2`, `CurrencyQuantity`, `PlayerConditionID`, `ItemQuantity`, `VerifiedBuild`) VALUES
(321, 'Brawl: Arathi Blizzard', 'Arathi Basin has been snowed in and covered with a thick fog of war.', 'Start Quest', '', '', 1669485, 143680, 0, 47148, 847, 0, 0, 0, 0, 5, 0, 3, 11, 12, 0, 0, 0, 50364, 0, 26972),
(322, 'Brawl: Warsong Scramble', 'Warsong Gulch goes crazy with three flags in play at once complete with scattered unique power-ups.', 'Start Quest', '', '', 1669485, 143680, 0, 47148, 0, 0, 0, 0, 0, 5, 0, 3, 11, 12, 0, 0, 0, 50413, 0, 26972),
(323, 'Brawl: Hotmogu', 'Kotmogu heats up with movement speed and the ability to pass the Orb to allies.', 'Start Quest', '', '', 1669485, 143680, 0, 47148, 0, 0, 0, 0, 0, 5, 0, 3, 11, 12, 0, 0, 0, 50415, 0, 26972),
(324, 'Brawl: Gravity Lapse', 'Gravity getting you down? Step into the Eye of the Storm and be prepared for a whole new en-lighten-ing experience.', 'Start Quest', '', '', 1669485, 143680, 0, 47148, 0, 0, 0, 0, 0, 5, 0, 3, 11, 12, 0, 0, 0, 50416, 0, 26972),
(325, 'Brawl: Deepwind Dunk', 'Race to claim balls from the maps center and score points on your enemies\' basket.', 'Start Quest', '', '', 1669485, 143680, 0, 47148, 0, 0, 0, 0, 0, 5, 0, 3, 23, 23, 0, 0, 0, 50417, 0, 26972),
(326, 'Brawl: Eye of the Horn', 'No mount? No problem. Grab a goat and head into mounted combat.', 'Start Quest', '', '', 1669485, 143680, 0, 47148, 0, 0, 0, 0, 0, 5, 0, 3, 11, 12, 0, 0, 0, 50418, 0, 26972),
(327, 'Brawl: Packed House', 'Up to 30 players clash in this packed Arena match.', 'Start Quest', '', '', 1669485, 143680, 0, 47148, 0, 0, 0, 0, 0, 5, 0, 3, 11, 12, 0, 0, 0, 50419, 0, 26972),
(328, 'Brawl: Southshore vs Tarren Mill', 'Harken back to the early days in an epic tug-of-war battle.', 'Start Quest', '', '', 1669485, 143680, 0, 47148, 0, 0, 0, 0, 0, 5, 0, 3, 11, 12, 0, 0, 0, 50420, 0, 26972),
(329, 'Brawl: Shado-Pan Showdown', 'Your 5-man arena team gets a sixth addition in the form of a boss. Defeat the enemies first to win!', 'Start Quest', '', '', 1669485, 143680, 0, 47148, 0, 0, 0, 0, 0, 5, 0, 3, 11, 12, 0, 0, 0, 50421, 0, 26972),
(348, 'Brawl: Deep Six', 'Group size shrinks down to an intimate 6v6 in selected battlegrounds', 'Start Quest', '', '', 1669485, 143680, 0, 47148, 0, 0, 0, 0, 0, 5, 0, 3, 11, 12, 0, 0, 0, 51072, 0, 26972);
DELETE FROM `adventure_journal_locale` WHERE `ID` IN (321,322,323,324,325,326,327,328,329,348) AND `locale` = 'frFR';
INSERT INTO `adventure_journal_locale` (`ID`, `locale`, `Name_lang`, `Description_lang`, `ButtonText_lang`, `RewardDescription_lang`, `ContinueDescription_lang`, `VerifiedBuild`) VALUES
(321, 'frFR', 'Choc : Blizzard arathi', 'De fortes chutes de neige se sont abattues sur le bassin Arathi, où s’est aussi levé un épais brouillard de guerre.', 'Commencer la quête', '', '', 26972),
(322, 'frFR', 'Choc : Cohue Chanteguerre', 'Le chaos règne dans le goulet des Chanteguerre, où trois drapeaux sont à capturer et des bonus uniques ont été dispersés.', 'Commencer la quête', '', '', 26972),
(323, 'frFR', 'Choc : Supermogu', 'Découvrez le temple de Kotmogu sous un jour nouveau avec une vitesse de déplacement plus élevée et la possibilité de passer l’orbe à vos alliés.', 'Commencer la quête', '', '', 26972),
(324, 'frFR', 'Choc : Rupture de gravité', 'La gravité vous pèse ? Aventurez-vous dans l’Œil du cyclone et préparez-vous à une expérience des plus… légères.', 'Commencer la quête', '', '', 26972),
(325, 'frFR', 'Choc : Smash de Vent-Caverneux', 'Précipitez-vous au centre de la carte pour récupérer les balles et marquez des points au panier ennemi.', 'Commencer la quête', '', '', 26972),
(326, 'frFR', 'Choc : L’Œil de la corne', 'Pas de monture ? Pas de problème ! Enfourchez une chèvre et chargez au combat !', 'Commencer la quête', '', '', 26972),
(327, 'frFR', 'Choc : Salle comble', 'Jusqu’à 30 personnages-joueurs s’affrontent dans ce match d’arène plein à craquer.', 'Commencer la quête', '', '', 26972),
(328, 'frFR', 'Choc : Moulin-de-Tarren contre Austrivage', 'Évoquez les champs de bataille d’antan avec cet affrontement épique et acharné.', 'Commencer la quête', '', '', 26972),
(329, 'frFR', 'Choc : Confrontation pandashan', 'Votre équipe d’arène de 5 héros obtient un renfort de poids sous la forme d’un boss. Terrassez vos ennemis pour remporter la victoire !', 'Commencer la quête', '', '', 26972),
(348, 'frFR', 'Choc : Comme les 6 doigts de la main', 'Affrontez les autres joueurs en petit comité dans une sélection de champs de bataille à 6c6.', 'Commencer la quête', '', '', 26972);

DELETE FROM `hotfix_data` WHERE `Id` BETWEEN 9100183 AND 9100192;
INSERT INTO `hotfix_data` (`Id`, `TableHash`, `RecordID`, `Timestamp`, `Deleted`) VALUES
(9100183, 2398034583, 321, 0, 0),
(9100184, 2398034583, 322, 0, 0),
(9100185, 2398034583, 323, 0, 0),
(9100186, 2398034583, 324, 0, 0),
(9100187, 2398034583, 325, 0, 0),
(9100188, 2398034583, 326, 0, 0),
(9100189, 2398034583, 327, 0, 0),
(9100190, 2398034583, 328, 0, 0),
(9100191, 2398034583, 329, 0, 0),
(9100192, 2398034583, 348, 0, 0);

UPDATE `world_legion`.`version` SET `hotfix_cache_id` = `hotfix_cache_id` + 1;
