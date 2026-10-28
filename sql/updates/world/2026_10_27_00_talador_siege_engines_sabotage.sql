-- Talador, Archenon siege yard: every Iron Horde Siege Engine stands whole and can only be sabotaged on "Iron Them Out"; once sabotaged it lies wrecked and burning for two and a half minutes
UPDATE `gameobject_template` SET `flags` = 36, `IconName` = 'questinteract', `Data1` = 33736, `Data3` = 150000, `SpellStateVisualID` = 0, `ScriptName` = 'go_talador_iron_horde_siege_engine' WHERE `entry` IN (225757, 225760);
UPDATE `gameobject_template` SET `SpellStateAnimKitID` = 0 WHERE `entry` = 225760;
