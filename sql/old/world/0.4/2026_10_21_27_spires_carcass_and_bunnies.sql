-- Spires of Arak: the roasting raven carcass at Toom's camp shows its death pose, and stray fel-glowing generic bunnies are cleaned up
UPDATE `gameobject` SET `AiID` = 7052, `rotation0` = 0, `rotation1` = 0, `rotation2` = 0.159845, `rotation3` = 0.987142 WHERE `guid` = 122535;
UPDATE `creature_template_addon` SET `auras` = '' WHERE `entry` = 54638 AND `auras` = '251467';
DELETE FROM `creature_addon` WHERE `guid` IN (325664, 325679);
DELETE FROM `creature` WHERE `guid` IN (325664, 325679);
