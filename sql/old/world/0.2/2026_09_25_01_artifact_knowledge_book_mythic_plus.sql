-- The Knowledge book was put in loot 33135, the weekly Mythic+ chest (Grand Challenger's Bounty). That
-- chest swaps its loot for the one of an end-of-run cache when opened, so the row was never read. The
-- book now drops in code, from the end-of-run cache and from the weekly chest
-- (LootTemplate::ProcessChallengeChest and LootTemplate::ProcessOploteChest).
DELETE FROM `gameobject_loot_template` WHERE `Entry` = 33135 AND `Item` = 146745;
