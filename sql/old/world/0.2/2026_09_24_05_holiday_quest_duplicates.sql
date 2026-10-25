-- Holiday (and rotating archaeology) quests offered twice, and all year round: 171 creature-quest and
-- 171 gameobject-quest pairs were linked both permanently (*_queststarter) and by their event
-- (game_event_*_quest). GameEventMgr::UpdateEventQuests adds the pair when the event starts even if it
-- already exists (quest shown twice, e.g. "Brewfest!" from the Orc Commoner 19175 during Brewfest), and
-- removes only one when it ends (quest still offered outside the holiday).
-- As on retail, these quests are now offered by their event only. Re-runnable.

DELETE s FROM `creature_queststarter` s
JOIN `game_event_creature_quest` e ON e.`id` = s.`id` AND e.`quest` = s.`quest`;
DELETE s FROM `gameobject_queststarter` s
JOIN `game_event_gameobject_quest` e ON e.`id` = s.`id` AND e.`quest` = s.`quest`;
