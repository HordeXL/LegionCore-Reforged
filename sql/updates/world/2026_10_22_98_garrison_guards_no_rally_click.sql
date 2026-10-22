-- Garrison footmen and grunts: no right-click Rally, it has no use outside of any quest or event
DELETE FROM `npc_spellclick_spells` WHERE `npc_entry` IN (77370, 79781) AND `spell_id` = 165551;
