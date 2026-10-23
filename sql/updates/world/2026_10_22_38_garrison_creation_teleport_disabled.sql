-- Lunarfall: the garrison creation no longer casts its teleport, which had no destination and left the client on an empty loading screen
DELETE FROM `disables` WHERE `sourceType` = 0 AND `entry` = 160121;
INSERT INTO `disables` (`sourceType`, `entry`, `flags`, `params_0`, `params_1`, `comment`) VALUES
(0, 160121, 1, '', '', 'Shadowmoon Garrison Teleport 001: no destination, unknown loading screen');
