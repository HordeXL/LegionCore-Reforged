-- Traitors! (27922): the Neferset Frond gave the credit on the spot while Siamat spoke. Blizzard later remade the
-- moment as a scene (4.0 [UTR] Uldum Traitors, package 2381) which the 7.3.5 client does not have; the frond now
-- fades the screen to black over Siamat's lines before the credit (go_uldum_neferset_frond, zone_uldum.cpp).
UPDATE `gameobject_template` SET `AIName` = '', `ScriptName` = 'go_uldum_neferset_frond' WHERE `entry` = 206579;
DELETE FROM `smart_scripts` WHERE `entryorguid` = 206579 AND `source_type` = 1;
-- The camera tried before stays as Blizzard left it.
UPDATE `creature_template` SET `VehicleId` = 0, `ScriptName` = '', `unit_flags` = 0 WHERE `entry` = 47473;
DELETE FROM `creature_template_movement` WHERE `CreatureId` = 47473;
DELETE FROM `spell_target_position` WHERE `id` = 88510;
