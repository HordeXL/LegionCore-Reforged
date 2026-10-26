-- Stormwind City Guard (guid 266108): stands at the end of each stretch of his patrol.
-- His addon row carried the sit stand state (bytes1 = 1): hidden while he walks, it showed again at
-- every stop, so he sat down on the road each time he paused. None of the other patrolling guards has it.
UPDATE `creature_addon` SET `bytes1` = 0 WHERE `guid` = 266108;
