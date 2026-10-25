-- =====================================================================================
-- Refonte de la Connaissance des armes prodigieuses - systeme "launch" (7.0)
--
-- 1) Livre de connaissance (+1 rang) : l'objet 146745 "Notes de recherche prodigieuse"
--    devient lootable en raid Legion et dans le coffre de fin de Mythique+ / le coffre
--    de victoire JcJ. Sa consommation donne +1 rang (sort 235765, corrige cote C++).
--    Le butin est verrouille par le config `Artifact.Knowledge.BookLoot.Enable`
--    (desactive par defaut) et limite a 1 exemplaire par joueur et par semaine.
--
-- 2) Quete de rattrapage pour les rerolls : porte la Connaissance a 10 d'un coup.
--    Disponible uniquement si le compte possede deja un personnage niveau max ayant
--    au moins 25 rangs de Connaissance (condition 21, nouvelle).
-- =====================================================================================

SET @BOOK_ITEM        := 146745;   -- Notes de recherche prodigieuse (+1 rang)
SET @BOOK_REF         := 3169990;  -- reference_loot_template dediee (point de reglage unique du taux)
SET @QUEST_CATCHUP    := 316999;   -- Quete de rattrapage (voir custom_artifact_knowledge.cpp)
SET @MP_CHEST_LOOTID  := 33135;    -- Grand Challenger's Bounty (GO 252064, Data1)
SET @PVP_CHEST_A      := 151557;   -- Coffre de victoire JcJ Alliance
SET @PVP_CHEST_H      := 151558;   -- Coffre de victoire JcJ Horde

-- -------------------------------------------------------------------------------------
-- 1a. Reference de butin partagee : un seul endroit ou regler la presence du livre
-- -------------------------------------------------------------------------------------
DELETE FROM `reference_loot_template` WHERE `Entry` = @BOOK_REF;
INSERT INTO `reference_loot_template` (`Entry`, `Item`, `Currency`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(@BOOK_REF, @BOOK_ITEM, 0, 0, 100, 0, 1, 0, 1, 1, 'Livre de connaissance (custom)');

-- -------------------------------------------------------------------------------------
-- 1b. Boss de raid Legion (Emeraude 1520, Nighthold 1530, Epreuve 1648, Tombeau 1676,
--     Antorus 1712) : 1% de chance, butin personnel sans jet (chaque joueur present
--     ramasse sa propre copie). La restriction au raid du palier courant est faite en C++
--     (LootMgr::IsCurrentTierRaidMap), pilotee par Game.Patch.
--     Pour ajuster le taux plus tard : UPDATE creature_loot_template SET Chance = X
--     WHERE Reference = 3169990;
-- -------------------------------------------------------------------------------------
DELETE FROM `creature_loot_template` WHERE `Reference` = @BOOK_REF;
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Currency`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Shared`, `Comment`)
SELECT DISTINCT ie.`creditEntry`, 0, 0, @BOOK_REF, 1, 0, 1, 0, 1, 1, 0, 'Livre de connaissance (custom)'
FROM `instance_encounters` ie
JOIN `creature` c ON c.`id` = ie.`creditEntry`
WHERE ie.`creditType` = 0 AND c.`map` IN (1520, 1530, 1648, 1676, 1712);

-- -------------------------------------------------------------------------------------
-- 1c. Coffre de fin de donjon Mythique+ : 1%
-- -------------------------------------------------------------------------------------
DELETE FROM `gameobject_loot_template` WHERE `Entry` = @MP_CHEST_LOOTID AND `Item` = @BOOK_ITEM;
INSERT INTO `gameobject_loot_template` (`Entry`, `Item`, `Currency`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(@MP_CHEST_LOOTID, @BOOK_ITEM, 0, 0, 1, 0, 1, 0, 1, 1, 'Livre de connaissance (custom)');

-- -------------------------------------------------------------------------------------
-- 1d. Coffres violets de victoire JcJ : 10%
-- -------------------------------------------------------------------------------------
DELETE FROM `item_loot_template` WHERE `Entry` IN (@PVP_CHEST_A, @PVP_CHEST_H) AND `Item` = @BOOK_ITEM;
INSERT INTO `item_loot_template` (`Entry`, `Item`, `Currency`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(@PVP_CHEST_A, @BOOK_ITEM, 0, 0, 5, 0, 1, 0, 1, 1, 'Livre de connaissance (custom)'),
(@PVP_CHEST_H, @BOOK_ITEM, 0, 0, 5, 0, 1, 0, 1, 1, 'Livre de connaissance (custom)');

-- -------------------------------------------------------------------------------------
-- 2a. Quete de rattrapage
-- -------------------------------------------------------------------------------------
DELETE FROM `quest_template` WHERE `ID` = @QUEST_CATCHUP;
INSERT INTO `quest_template` (`ID`, `QuestType`, `QuestLevel`, `QuestMaxScalingLevel`, `MinLevel`, `QuestSortID`, `QuestInfoID`, `Flags`, `FlagsEx`, `Expansion`, `LogTitle`, `LogDescription`, `QuestDescription`, `QuestCompletionLog`) VALUES
(@QUEST_CATCHUP, 2, 110, 110, 110, 0, 0, 0, 0, 6, 'Archives de l\'Ordre',
 'Parle a l\'archiviste de ton ordre pour consulter les travaux de recherche deja accomplis par tes compagnons.',
 'Les recherches menees par les autres champions de ton ordre n\'ont pas ete perdues. Leurs notes, leurs essais et leurs erreurs sont consignes ici. Prends le temps de les etudier : tu rattraperas en quelques jours ce qui a demande des mois a d\'autres.',
 'Etudie les archives de ton ordre.');

DELETE FROM `quest_template_addon` WHERE `ID` = @QUEST_CATCHUP;
INSERT INTO `quest_template_addon` (`ID`, `MaxLevel`, `AllowableClasses`, `SpecialFlags`) VALUES
(@QUEST_CATCHUP, 0, 0, 0);

-- Donneur/rendeur : les PNJ de commandes de recherche des hotels des ordres (tous les 12 ordres).
-- Chaque PNJ n'est accessible que dans son propre hotel des ordres : la restriction de classe est
-- donc naturellement assuree.
DELETE FROM `creature_queststarter` WHERE `quest` = @QUEST_CATCHUP;
INSERT INTO `creature_queststarter` (`id`, `quest`)
SELECT DISTINCT `NpcEntry`, @QUEST_CATCHUP FROM `garrison_shipment` WHERE `classReq` > 0;

DELETE FROM `creature_questender` WHERE `quest` = @QUEST_CATCHUP;
INSERT INTO `creature_questender` (`id`, `quest`)
SELECT DISTINCT `NpcEntry`, @QUEST_CATCHUP FROM `garrison_shipment` WHERE `classReq` > 0;

-- -------------------------------------------------------------------------------------
-- 2b. Conditions de disponibilite de la quete
--     - condition 21 (nouvelle) : un personnage niveau max du compte doit avoir >= 25 rangs
--     - condition 50 (monnaie)  : le personnage courant doit avoir moins de 10 rangs
--     Appliquees a la fois sur l'acceptation (19) et sur l'affichage du point d'exclamation (20).
-- -------------------------------------------------------------------------------------
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (19, 20) AND `SourceEntry` = @QUEST_CATCHUP;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(19, 0, @QUEST_CATCHUP, 0, 0, 21, 0, 25, 0,  0, 0, 0, '', 'Rattrapage : compte avec un perso niveau max a Connaissance >= 25'),
(19, 0, @QUEST_CATCHUP, 0, 0, 50, 0, 1171, 0, 10, 0, 0, '', 'Rattrapage : personnage courant en dessous de 10 rangs'),
(20, 0, @QUEST_CATCHUP, 0, 0, 21, 0, 25, 0,  0, 0, 0, '', 'Rattrapage : compte avec un perso niveau max a Connaissance >= 25'),
(20, 0, @QUEST_CATCHUP, 0, 0, 50, 0, 1171, 0, 10, 0, 0, '', 'Rattrapage : personnage courant en dessous de 10 rangs');
