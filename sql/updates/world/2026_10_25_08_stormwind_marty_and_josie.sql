-- Stormwind: Marty and Josie are removed from the Trade District canal
DELETE FROM `creature` WHERE `guid` IN (266078, 266079);
DELETE FROM `creature_addon` WHERE `guid` IN (266078, 266079);
