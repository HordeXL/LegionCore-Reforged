-- Garrison invasions: score, summary and warning messages, and the mail carrying a reward bag that did not fit
DELETE FROM `trinity_string` WHERE `entry` BETWEEN 12107 AND 12113;
INSERT INTO `trinity_string` (`entry`, `content_default`, `content_loc2`) VALUES
(12107, 'Invasion score: %u points.', 'Score de l''invasion : %u points.'),
(12108, 'Invasion repelled with %u points: %u invaders slain, %u townsfolk saved, %u spies caught, %u of %u assaulted buildings intact, %u of %u defenders alive.', 'Invasion repoussée avec %u points : %u envahisseurs tués, %u habitants sauvés, %u espions arrêtés, %u bâtiments intacts sur %u attaqués, %u défenseurs sur %u en vie.'),
(12109, 'The garrison was left undefended: the invasion is over.', 'Le fief a été laissé sans défense : l''invasion est terminée.'),
(12110, 'A building has been damaged by the invaders!', 'Un bâtiment a été endommagé par les envahisseurs !'),
(12111, 'A spy got away with your supplies.', 'Un espion s''est enfui avec vos provisions.'),
(12112, 'Garrison invasion reward', 'Récompense de l''invasion du fief'),
(12113, 'Your bags were full: here is your reward for repelling the invasion of your garrison.', 'Vos sacs étaient pleins : voici votre récompense pour avoir repoussé l''invasion de votre fief.');
