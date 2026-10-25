-- .pvpseason: ratings saved per PvP season
DELETE FROM `command` WHERE `name` IN ('pvpseason', 'pvpseason info', 'pvpseason reset', 'pvpseason restore', 'pvpseason cancel');
INSERT INTO `command` (`name`, `security`, `help`) VALUES
('pvpseason', 3, 'Syntax: .pvpseason $subcommand\nType .pvpseason to see the list of possible subcommands or .help pvpseason $subcommand to see info on subcommands'),
('pvpseason info', 3, 'Syntax: .pvpseason info\n\nShow the current PvP season, whether its top rating steps are open, the saved seasons and what the next start will do.'),
('pvpseason reset', 3, 'Syntax: .pvpseason reset\n\nAt the next start, save the ratings of the current PvP season, then reset them. .pvpseason restore brings them back.'),
('pvpseason restore', 3, 'Syntax: .pvpseason restore\n\nAt the next start, put the ratings of the current PvP season back to their save. What was played since the save is lost.'),
('pvpseason cancel', 3, 'Syntax: .pvpseason cancel\n\nCancel the reset or restore asked for the next start.');
