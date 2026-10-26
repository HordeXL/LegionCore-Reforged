-- Teleport location in front of Exarch Akama, who sends the player into the Defense of Karabor scenario
DELETE FROM `game_tele` WHERE `name` = 'DefenseOfKarabor';
INSERT INTO `game_tele` (`id`, `position_x`, `position_y`, `position_z`, `orientation`, `map`, `name`) VALUES
(2005, 976.79, -2919.18, 99.4, 5.782, 1116, 'DefenseOfKarabor');
