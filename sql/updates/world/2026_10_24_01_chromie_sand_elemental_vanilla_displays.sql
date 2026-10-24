-- The two custom creatures pointed at display rows 50016/50017 that only exist in newer-client data
-- (they were carried by the poisoned creature_display_info hotfix dump, see the hotfixes update
-- 2026_10_24_01_remove_newer_client_display_model_hotfixes); on a 7.3.5 client they had no model at all.
-- Give them the displays their vanilla counterparts use: Chromie 10008, Sand Elemental 47677.

UPDATE `creature_template_wdb` SET `Displayid1` = 10008 WHERE `Entry` = 2600001;
UPDATE `creature_template_wdb` SET `Displayid1` = 47677 WHERE `Entry` = 2600002;
