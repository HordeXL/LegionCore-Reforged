-- Shadowmoon Valley: the Shadowmoon Void Priestesses channel the same spell as the Shadowmoon Channellers into the ritual stone
UPDATE `smart_scripts` SET `action_param1` = 159514 WHERE `entryorguid` = 82196 AND `source_type` = 0 AND `id` = 0;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 13 AND `SourceEntry` = 122499;
