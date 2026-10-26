-- Ashran battleground template (start locations on map 1191, outside the random queue) and hotfix cache bump.
DELETE FROM `battleground_template` WHERE `id` = 901;
INSERT INTO `battleground_template` (`id`, `AllianceStartLoc`, `HordeStartLoc`, `Weight`, `ScriptName`, `MinPlayersPerTeam`, `Comment`) VALUES
(901, 4742, 4743, 0, '', 25, 'Ashran');

UPDATE `version` SET `hotfix_cache_id` = 484;
