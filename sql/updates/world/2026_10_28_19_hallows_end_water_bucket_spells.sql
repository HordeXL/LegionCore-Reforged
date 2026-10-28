-- Hallow's End water buckets: the bucket shows its throw button, and a throw from that button takes the bucket from the bag
DELETE FROM `spell_script_names` WHERE `spell_id` IN (42144, 42349, 42340) AND `ScriptName` IN ('spell_hallows_end_create_water_bucket', 'spell_hallows_end_throw_bucket');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(42144, 'spell_hallows_end_create_water_bucket'),
(42349, 'spell_hallows_end_create_water_bucket'),
(42340, 'spell_hallows_end_throw_bucket');
