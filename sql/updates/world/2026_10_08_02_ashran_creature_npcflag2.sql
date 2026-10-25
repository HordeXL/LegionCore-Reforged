-- Ashran creatures: clear the npcflag2 values that are no flags at all (minimap icons of Argus teleporters).
UPDATE `creature_template` SET `npcflag2` = 0 WHERE `npcflag2` > 8191;
