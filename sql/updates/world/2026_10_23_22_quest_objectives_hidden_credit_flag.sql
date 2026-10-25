-- Five quest objectives lose the 0x10 flag the core reads as "not required" (TrinityCore 12.1 has it on none of them), so their quests no longer complete on accept
UPDATE `quest_objectives` SET `Flags` = 0 WHERE `ID` IN (252432, 255427, 271920, 272349) AND `Flags` = 16;
UPDATE `quest_objectives` SET `Flags` = 1 WHERE `ID` = 271042 AND `Flags` = 16;
