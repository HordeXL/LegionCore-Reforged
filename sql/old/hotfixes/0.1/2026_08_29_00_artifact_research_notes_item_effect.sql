-- ---------------------------------------------------------------------------------------------
-- Notes de recherche prodigieuse : effet d'utilisation manquant.
--
-- Les objets 139390 (livre par la commande de recherche de l'hotel des ordres) et 146745 (notes
-- de recherche, egalement utilise comme livre de connaissance en butin) n'ont AUCUNE entree dans
-- ItemEffect.db2 : un clic droit dessus ne declenche rien. Le sort 235765 "Artifact Knowledge
-- Research", pourtant scripte cote serveur, n'etait donc jamais lance et la boucle
-- "recuperer ses notes puis les consommer" n'a jamais fonctionne.
--
-- Verifie en jeu avec .debug itemeffect 139390 et .debug itemeffect 146745 : 0 effet dans les
-- deux cas.
--
-- TriggerType = 0 : declenchement a l'utilisation.
-- Charges     = 0 : pas de destruction automatique. C'est le script du sort qui detruit l'objet,
--                   et seulement si le rang de Connaissance a reellement ete accorde, pour ne pas
--                   gaspiller un livre lorsque le joueur est deja au plafond du palier.
-- ---------------------------------------------------------------------------------------------

DELETE FROM `item_effect` WHERE `ID` IN (79044, 79045);
INSERT INTO `item_effect` (`ID`, `SpellID`, `CoolDownMSec`, `CategoryCoolDownMSec`, `Charges`, `SpellCategoryID`, `ChrSpecializationID`, `LegacySlotIndex`, `TriggerType`, `ItemID`, `VerifiedBuild`) VALUES
(79044, 235765, 0, 0, 0, 0, 0, 0, 0, 139390, 0),
(79045, 235765, 0, 0, 0, 0, 0, 0, 0, 146745, 0);
