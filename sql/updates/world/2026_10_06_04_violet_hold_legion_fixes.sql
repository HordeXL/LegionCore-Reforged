-- Assault on Violet Hold (1544)

-- Elite squad creatures, Lord Malgath's shadow beasts, the Portal Keeper's axe and the mythic adds had a sniffed level
-- scaling range of 1-1: they came out at level 1-2 with a few hundred health. Same range as the rest of the waves.
UPDATE `creature_template_scaling` SET `LevelScalingMin` = 105, `LevelScalingMax` = 110
WHERE `Entry` IN (102395, 102397, 102398, 102400, 103561, 103450, 103609, 112732, 112733, 112738);

-- Fel Axe (103450), thrown by the Portal Keeper: a hostile SmartAI creature, it chased the nearest player and its
-- attached damage area followed. On retail it stays planted where it lands.
DELETE FROM `smart_scripts` WHERE `entryorguid` = 103450 AND `source_type` = 0 AND `id` IN (2, 3);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `Difficulties`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(103450, 0, 2, 3, '', 54, 0, 100, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Fel Axe - On summoned - Set passive'),
(103450, 0, 3, 0, '', 61, 0, 100, 0, 0, 0, 0, 0, 0, 103, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Fel Axe - Linked - Root');

-- Lyndras (104529) stays immune behind her Prison Barrier (247005). Opening the barrier (quest 38965, "Open Lyndras'
-- Door") now makes her attackable and she engages; while it stays closed nothing changes. The barrier takes lock
-- 2823 (hotfix): only the Violet Hold Prison Key (135556) opens it.
UPDATE `gameobject_template` SET `AIName` = 'SmartGameObjectAI', `Data1` = 2823 WHERE `entry` = 247005;
DELETE FROM `smart_scripts` WHERE (`entryorguid` = 247005 AND `source_type` = 1) OR (`entryorguid` = 104529 AND `source_type` = 0 AND `id` IN (3, 4));
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `Difficulties`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(247005, 1, 0, 0, '', 70, 0, 100, 0, 2, 0, 0, 0, 0, 45, 1, 1, 0, 0, 0, 0, 19, 104529, 40, 0, 0, 0, 0, 0, 0, 'Prison Barrier - On opened - Set data 1 1 Lyndras'),
(104529, 0, 3, 4, '', 38, 0, 100, 1, 1, 1, 0, 0, 0, 19, 768, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Lyndras - On data 1 1 - Remove immune PC/NPC'),
(104529, 0, 4, 0, '', 61, 0, 100, 0, 0, 0, 0, 0, 0, 49, 0, 0, 0, 0, 0, 0, 21, 40, 0, 0, 0, 0, 0, 0, 0, 'Lyndras - Linked - Attack closest player');
