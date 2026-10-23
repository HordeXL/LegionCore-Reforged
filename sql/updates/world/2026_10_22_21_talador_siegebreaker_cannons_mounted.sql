-- Talador, Shattrath: the siegebreaker cannons board their salvaged artillery again, the destroy cannon click stays for players only
DELETE FROM `npc_spellclick_spells` WHERE `npc_entry` = 84754 AND `spell_id` = 46598;
INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `cast_flags`, `user_type`, `add_npc_flag`) VALUES
(84754, 46598, 1, 0, 0);
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 18 AND `SourceGroup` = 84754 AND `SourceEntry` IN (46598, 169474);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(18, 84754, 46598, 0, 0, 31, 0, 3, 84755, 0, 0, 0, '', 'Salvaged Iron Horde Artillery - only its siegebreaker cannons board it'),
(18, 84754, 169474, 0, 0, 31, 0, 4, 0, 0, 0, 0, '', 'Salvaged Iron Horde Artillery - only players destroy the cannon');
