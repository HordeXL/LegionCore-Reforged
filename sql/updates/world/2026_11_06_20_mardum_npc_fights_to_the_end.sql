-- Mardum: the ambient fights go to the end, the No NPC Damage Below 45-90% aura (151597) is taken off the creatures of Mardum
--
-- Note: written without REGEXP_REPLACE (MySQL 8) because the server ships MySQL 5.7;
-- the padded-string REPLACE removes the aura token the same way.

UPDATE `creature_template_addon` SET `auras` = TRIM(BOTH ' ' FROM REPLACE(REPLACE(CONCAT(' ', `auras`, ' '), ' 151597 ', ' '), '  ', ' ')) WHERE `entry` IN (SELECT `id` FROM `creature` WHERE `map` = 1481) AND CONCAT(' ', `auras`, ' ') LIKE '% 151597 %';
UPDATE `creature_addon` SET `auras` = TRIM(BOTH ' ' FROM REPLACE(REPLACE(CONCAT(' ', `auras`, ' '), ' 151597 ', ' '), '  ', ' ')) WHERE `guid` IN (SELECT `guid` FROM `creature` WHERE `map` = 1481) AND CONCAT(' ', `auras`, ' ') LIKE '% 151597 %';
