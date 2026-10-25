-- Conditions of event object smart scripts were never applied.
--
-- ConditionMgr files CONDITION_SOURCE_TYPE_SMART_EVENT (22) by (SourceEntry, SourceId) and SmartScript asks for
-- (entryorguid, source_type). Event object scripts have source_type 13 (SMART_SCRIPT_TYPE_EVENTOBJECT), but all
-- of their conditions were written with SourceId 10 (SMART_SCRIPT_TYPE_SCENE), so the lookup never found them and
-- every event object fired for everyone. Example: event object 342 at the Shrine of Aviana, meant for players on
-- quest 46318, started scenario 1306 and teleported any passer-by into the Shrine of Aviana Defense scenario (map
-- 1730), with no way out.
--
-- 312 rows, all of them keyed to an entry that has an event object script and no scene script.
UPDATE `conditions` c
SET c.`SourceId` = 13
WHERE c.`SourceTypeOrReferenceId` = 22 AND c.`SourceId` = 10
  AND EXISTS (SELECT 1 FROM `smart_scripts` s WHERE s.`entryorguid` = c.`SourceEntry` AND s.`source_type` = 13)
  AND NOT EXISTS (SELECT 1 FROM `smart_scripts` t WHERE t.`entryorguid` = c.`SourceEntry` AND t.`source_type` = 10);
