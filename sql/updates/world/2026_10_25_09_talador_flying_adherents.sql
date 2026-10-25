-- Talador: the Adherent Squallbringers spawned in the air keep flying instead of falling to the ground
UPDATE `creature_template_addon` SET `bytes1` = 50331648 WHERE `entry` = 75290;
UPDATE `creature_addon` SET `bytes1` = 50331648 WHERE `guid` IN (329039, 329041, 329676, 329702, 330043);
