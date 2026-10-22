-- Draenor: the Apexis assault zone quests complete on their own, so the garrison mission specialists and SI:7 agents no longer list them as quests to hand in
DELETE FROM `creature_questender` WHERE `id` IN (78487, 79953, 81492) AND `quest` IN (35977, 36347, 37632, 37634, 36348, 36490, 36491, 37631, 36383, 36489);
