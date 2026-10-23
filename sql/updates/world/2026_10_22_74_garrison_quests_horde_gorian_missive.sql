-- Garrison quartermasters: Sergeant Grimjaw also sells the Horde Scouting Missive for the Gorian Proving Grounds
DELETE FROM `npc_vendor` WHERE `entry` IN (79774, 88228) AND `item` = 122419;
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`, `money`, `type`, `PlayerConditionID`, `IgnoreFiltering`, `RandomPropertiesSeed`, `RandomPropertiesID`, `BonusListID`, `ItemModifiers`, `Context`, `VerifiedBuild`) VALUES
(79774, 0, 122419, 0, 0, 5809, 0, 1, 0, 0, 0, 0, '', '', 0, 26365),
(88228, 0, 122419, 0, 0, 5809, 0, 1, 0, 0, 0, 0, '', '', 0, 26365);
