-- Wings Over Mount Hyjal (25985) is given by Tiala Whitemane (40833) and handed in to Choluna (41005), per Wowhead;
-- Choluna was set as its giver too.
DELETE FROM `creature_queststarter` WHERE `quest` = 25985;
INSERT INTO `creature_queststarter` (`id`, `quest`) VALUES (40833, 25985);
