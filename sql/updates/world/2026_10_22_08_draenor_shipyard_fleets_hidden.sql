-- Draenor: the garrison shipyard fleets and their crews no longer spawn in Eventide Bay and on Southwind Shore, the shipyard is not in the game
UPDATE `gameobject` SET `spawnMask` = 0 WHERE `guid` IN (118373, 118374, 118375, 118376, 118377, 125322, 125323, 125324, 125325, 125326) AND `map` = 1116;
UPDATE `creature` SET `spawnMask` = 0 WHERE `map` = 1116 AND `id` IN (94301, 94307, 94308, 94309, 94315, 94316, 95084, 95085, 95086, 95087, 95088, 95089, 95090, 95091, 95092, 95093, 95856, 96102, 96727, 96728);
