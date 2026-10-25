-- Patrolling creatures standing still: about 18,000 spawns have MovementType 2 and their path stored in
-- waypoint_data under their own guid (waypoint_data.id = creature.guid), but no creature_addon row. The
-- core only takes a path from the addon (Creature::LoadCreaturesAddon, m_path_id) and has no fallback on
-- the guid, so WaypointMovementGenerator found no path and the creature never moved.
--
-- Only closed loops are linked: the core can only loop a path (going back along it is commented out in
-- WaypointMovementGenerator), so on an open path the creature walks straight from the last point back to
-- the first one, through walls and buildings. A path counts as a loop when its last point lies within
-- 5 yd of its first one. It must also have at least 2 points, all recorded for the same creature, and a
-- point within 20 yd of the spawn. Skipped: formation members (their leader drives them), creatures with
-- a C++ script, spawns driven by a SmartAI waypoint action, and path ids already used by another addon.
-- A spawn addon replaces the template addon instead of merging with it, so the template addon values
-- (mount, stand state, sheath, emote, auras) are copied; without any addon the core draws the melee
-- weapon, hence bytes2 = 1 when there is no template addon. Re-runnable.

DROP TEMPORARY TABLE IF EXISTS `wp_path`;
CREATE TEMPORARY TABLE `wp_path` (PRIMARY KEY (`id`)) AS
SELECT w.`id`, COUNT(*) AS `pts`, SUM(w.`entry` = c.`id`) AS `pts_same`,
       MIN(w.`point`) AS `first_point`, MAX(w.`point`) AS `last_point`,
       MIN(SQRT(POW(w.`position_x` - c.`position_x`, 2) + POW(w.`position_y` - c.`position_y`, 2) + POW(w.`position_z` - c.`position_z`, 2))) AS `dist`
FROM `waypoint_data` w
JOIN `creature` c ON c.`guid` = w.`id`
GROUP BY w.`id`;

DROP TEMPORARY TABLE IF EXISTS `wp_loop`;
CREATE TEMPORARY TABLE `wp_loop` (PRIMARY KEY (`id`)) AS
SELECT p.`id`
FROM `wp_path` p
JOIN `waypoint_data` w0 ON w0.`id` = p.`id` AND w0.`point` = p.`first_point`
JOIN `waypoint_data` wn ON wn.`id` = p.`id` AND wn.`point` = p.`last_point`
WHERE SQRT(POW(w0.`position_x` - wn.`position_x`, 2) + POW(w0.`position_y` - wn.`position_y`, 2)) < 5;

DROP TEMPORARY TABLE IF EXISTS `wp_smart_entry`;
CREATE TEMPORARY TABLE `wp_smart_entry` (PRIMARY KEY (`k`)) AS
SELECT DISTINCT `entryorguid` AS `k` FROM `smart_scripts` WHERE `source_type` = 0 AND `action_type` = 53;
DROP TEMPORARY TABLE IF EXISTS `wp_smart_guid`;
CREATE TEMPORARY TABLE `wp_smart_guid` (PRIMARY KEY (`k`)) AS SELECT `k` FROM `wp_smart_entry`;

DROP TEMPORARY TABLE IF EXISTS `wp_taken`;
CREATE TEMPORARY TABLE `wp_taken` (PRIMARY KEY (`p`)) AS
SELECT DISTINCT `path_id` AS `p` FROM `creature_addon` WHERE `path_id` <> 0
UNION SELECT DISTINCT `path_id` FROM `creature_template_addon` WHERE `path_id` <> 0;

INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`)
SELECT c.`guid`, c.`guid`,
       IFNULL(ta.`mount`, 0), IFNULL(ta.`bytes1`, 0), IFNULL(ta.`bytes2`, 1), IFNULL(ta.`emote`, 0), IFNULL(ta.`auras`, '')
FROM `creature` c
JOIN `wp_path` p ON p.`id` = c.`guid`
JOIN `wp_loop` l ON l.`id` = c.`guid`
LEFT JOIN `creature_addon` a ON a.`guid` = c.`guid`
LEFT JOIN `creature_template_addon` ta ON ta.`entry` = c.`id`
LEFT JOIN `creature_formations` f ON f.`memberGUID` = c.`guid` AND f.`leaderGUID` <> c.`guid`
LEFT JOIN `wp_taken` t ON t.`p` = c.`guid`
LEFT JOIN `wp_smart_entry` se ON se.`k` = c.`id`
LEFT JOIN `wp_smart_guid` sg ON sg.`k` = -CAST(c.`guid` AS SIGNED)
LEFT JOIN `creature_template` ct ON ct.`entry` = c.`id`
WHERE c.`MovementType` = 2
  AND a.`guid` IS NULL
  AND p.`pts_same` >= 2 AND p.`pts_same` = p.`pts` AND p.`dist` < 20
  AND f.`memberGUID` IS NULL
  AND t.`p` IS NULL
  AND se.`k` IS NULL AND sg.`k` IS NULL
  AND IFNULL(ct.`ScriptName`, '') = '';

DROP TEMPORARY TABLE `wp_path`;
DROP TEMPORARY TABLE `wp_loop`;
DROP TEMPORARY TABLE `wp_smart_entry`;
DROP TEMPORARY TABLE `wp_smart_guid`;
DROP TEMPORARY TABLE `wp_taken`;
