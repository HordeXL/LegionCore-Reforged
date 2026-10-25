-- Healing training dummy (87321): alive at 1 hp, takes no damage and slowly loses what it was healed.
UPDATE `creature_template` SET `ScriptName` = 'npc_training_dummy_healing', `AIName` = '', `RegenHealth` = 0 WHERE `entry` = 87321;
