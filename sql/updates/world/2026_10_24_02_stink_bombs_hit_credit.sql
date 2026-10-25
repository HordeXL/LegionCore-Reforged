-- Hallow's End, "Stink Bombs Away!": a stink bomb only counts when it lands on someone
DELETE FROM `spell_script_names` WHERE `spell_id` = 96117;
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (96117, 'spell_hallows_end_stink_bomb_credit');
