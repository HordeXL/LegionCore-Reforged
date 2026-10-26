-- Grand Challenger's Bounty (252064), the weekly Mythic+ chest, had no French name.
DELETE FROM `locales_gameobject` WHERE `entry` = 252064;
INSERT INTO `locales_gameobject` (`entry`, `name_loc2`) VALUES
(252064, 'Butin du grand challenger');
