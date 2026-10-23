-- Draenor shipyard: the fleets and the crews of the two bays spawn again, in the phase of the players who built the shipyard
UPDATE `gameobject` SET `spawnMask` = 1, `PhaseId` = '10230' WHERE `guid` IN (118373, 118374, 118375, 118376, 118377) AND `map` = 1116;
UPDATE `gameobject` SET `spawnMask` = 1, `PhaseId` = '10231' WHERE `guid` IN (125322, 125323, 125324, 125325, 125326) AND `map` = 1116;
UPDATE `creature` SET `spawnMask` = 1, `PhaseId` = '10230' WHERE `map` = 1116 AND `zoneId` = 6719 AND `id` IN (94301, 94307, 94308, 94309, 94315, 94316, 95084, 95085, 95086, 95087, 95088, 95089, 95090, 95091, 95092, 95093, 95856, 96102, 96727, 96728);
UPDATE `creature` SET `spawnMask` = 1, `PhaseId` = '10231' WHERE `map` = 1116 AND `zoneId` = 6720 AND `id` IN (94301, 94307, 94308, 94309, 94315, 94316, 95084, 95085, 95086, 95087, 95088, 95089, 95090, 95091, 95092, 95093, 95856, 96102, 96727, 96728);
