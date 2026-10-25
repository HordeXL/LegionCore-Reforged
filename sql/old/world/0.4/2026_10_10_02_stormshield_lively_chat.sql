-- Conversation style per group (0 calm, 1 lively: pointing then laughing, laughs and applause); Lieutenant Howell and Jesse Long chat with gusto.
ALTER TABLE `creature_idle_chat` ADD COLUMN `style` TINYINT UNSIGNED NOT NULL DEFAULT 0 AFTER `laugh_max`;

DELETE FROM `creature_idle_chat` WHERE `guid` IN (257237, 257238);
INSERT INTO `creature_idle_chat` (`guid`, `group_id`, `laugh_min`, `laugh_max`, `style`) VALUES
(257237, 257237, 0, 0, 1),
(257238, 257237, 0, 0, 1);
