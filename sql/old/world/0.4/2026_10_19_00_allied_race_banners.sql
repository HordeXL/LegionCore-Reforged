-- Allied race banners of the embassies open the race presentation when clicked; machine-translated English names fixed.
UPDATE `gameobject_template` SET `ScriptName` = 'go_allied_race_banner' WHERE `entry` IN (273286, 273293, 273853, 273855);
UPDATE `gameobject_template` SET `name` = 'Nightborne' WHERE `entry` = 273293;
UPDATE `gameobject_template` SET `name` = 'Void Elf' WHERE `entry` = 273853;
UPDATE `gameobject_template` SET `name` = 'Lightforged Draenei' WHERE `entry` = 273855;
