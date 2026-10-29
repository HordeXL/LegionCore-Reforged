-- Quest 26800 "Recruitment": Darnell was never summoned - the spell script mapping pointed at the creature entry
-- instead of the quest spell, so the aura was never bound and the summon from the quest spell did not stick.
-- The script now summons Darnell when the quest is accepted.
DELETE FROM `spell_script_names` WHERE `spell_id` = 49337 AND `ScriptName` = 'spell_summon_darnel_q26800';
