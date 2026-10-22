-- Garrison invasions: sergeant and townsfolk scripts, level 100 stats for the unspawned invaders, start options moved into the script
UPDATE `creature_template` SET `AIName` = '', `ScriptName` = 'npc_garrison_invasion_sergeant' WHERE `entry` IN (78564, 79774, 88223, 88228);
DELETE FROM `smart_scripts` WHERE `entryorguid` = 79774 AND `source_type` = 0;
DELETE FROM `gossip_menu_option` WHERE (`MenuID` = 16672 AND `OptionID` IN (1, 5)) OR (`MenuID` = 17271 AND `OptionID` = 3) OR (`MenuID` = 17274 AND `OptionID` = 1);

UPDATE `creature_template` SET `minlevel` = 100, `maxlevel` = 100, `exp` = 5, `npcflag` = 1, `ScriptName` = 'npc_garrison_invasion_townsfolk' WHERE `entry` IN (86089, 86098);

UPDATE `creature_template` SET `minlevel` = 100, `maxlevel` = 100, `exp` = 5, `HealthScalingExpansion` = 5 WHERE `entry` IN
(89241, 89239, 85940, 89231, 90841,
 89207, 89208, 89211, 89228, 89210, 89256, 89205, 91012, 86796,
 85937, 85938, 85936, 89170, 85939, 89244, 89214, 90995,
 84310, 84313, 89268, 84311, 84312, 84309, 90946,
 83737, 82336, 89143, 82779, 80980, 82686, 89187, 90943,
 88604, 88605, 89186, 85470, 88609, 89178, 85469, 89277, 90802, 89167,
 87025, 87040);
UPDATE `creature_template` SET `faction` = 16 WHERE `faction` = 35 AND `entry` IN
(89241, 89239, 85940, 89231, 90841, 91012, 89214, 90995,
 84310, 84313, 89268, 84311, 84312, 84309, 90946,
 83737, 82336, 89143, 82779, 80980, 82686, 89187, 90943,
 89277, 89178, 90802);
UPDATE `creature_template` SET `baseattacktime` = 2000 WHERE `baseattacktime` = 0 AND `entry` IN
(90841, 91012, 89214, 90995, 84310, 84313, 89268, 84311, 84312, 84309, 90946,
 83737, 82336, 89143, 82779, 80980, 82686, 89187, 90943, 89277, 89178, 90802);
UPDATE `creature_template` SET `rangeattacktime` = 2000 WHERE `rangeattacktime` = 0 AND `entry` IN
(90841, 91012, 89214, 90995, 84310, 84313, 89268, 84311, 84312, 84309, 90946,
 83737, 82336, 89143, 82779, 80980, 82686, 89187, 90943, 89277, 89178, 90802);
UPDATE `creature_template` SET `dmg_multiplier` = 2 WHERE `entry` IN (90841, 91012, 90995, 90946, 90943, 90802);
