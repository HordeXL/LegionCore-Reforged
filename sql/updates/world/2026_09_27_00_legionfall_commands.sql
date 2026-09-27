-- .legionfall: Legionfall buildings of the Broken Shore
DELETE FROM `command` WHERE `name` IN ('legionfall', 'legionfall info', 'legionfall state', 'legionfall progress');
INSERT INTO `command` (`name`, `security`, `help`) VALUES
('legionfall', 3, 'Syntax: .legionfall $subcommand\nType .legionfall to see the list of possible subcommands or .help legionfall $subcommand to see info on subcommands'),
('legionfall info', 3, 'Syntax: .legionfall info\n\nShow the stage, progress, number of constructions and next change of each Legionfall building.'),
('legionfall state', 3, 'Syntax: .legionfall state $building $state\n\nSet a building (mage, command, nether) to a stage (building, active, attack, destroyed).'),
('legionfall progress', 3, 'Syntax: .legionfall progress $building $percent\n\nSet the construction progress of a building under construction, from 0 to 100; 100 builds it.');
