-- Objects of the Draenor dungeons also spawn in Mythic, like their creatures
UPDATE `gameobject` SET `spawnMask` = `spawnMask` | 8388608 WHERE `map` IN (1175, 1176, 1195, 1209, 1279) AND `spawnMask` = 262;
UPDATE `gameobject` SET `spawnMask` = `spawnMask` | 8388608 WHERE `map` = 1358 AND `spawnMask` = 524550;
