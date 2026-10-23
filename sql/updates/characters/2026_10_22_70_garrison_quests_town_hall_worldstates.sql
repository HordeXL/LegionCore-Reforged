-- Garrison Town Hall dailies: the realm-wide draws exist before the conditions reading them are loaded
INSERT IGNORE INTO `worldstates` (`entry`, `value`, `comment`) VALUES
(20203, 0, 'Town Hall daily rotation: stamp'),
(20204, 1, 'Town Hall daily rotation: dungeon'),
(20205, 1, 'Town Hall daily rotation: bounty'),
(20206, 1, 'Town Hall daily rotation: relic'),
(20207, 1, 'Town Hall daily rotation: raid'),
(20208, 1, 'Town Hall daily rotation: trader'),
(20209, 0, 'Town Hall daily rotation: weekstamp');
