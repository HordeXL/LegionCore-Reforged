-- Timewalking: Archmage Timear (Dalaran) offers the weekly quest of the running expansion during its week only; the raid quest (47523) is never offered.
DELETE FROM `creature_queststarter` WHERE `id` = 111246 AND `quest` IN (44164, 44166, 44167, 45799, 47523);

DELETE FROM `game_event_creature_quest` WHERE `id` = 111246 AND `quest` IN (44164, 44166, 44167, 45799, 47523);
INSERT INTO `game_event_creature_quest` (`eventEntry`, `id`, `quest`) VALUES
(96, 111246, 44164),
(90, 111246, 44166),
(94, 111246, 44167),
(98, 111246, 45799);

DELETE FROM `game_event_seasonal_questrelation` WHERE `questId` IN (44164, 44166, 44167, 45799, 47523);
INSERT INTO `game_event_seasonal_questrelation` (`questId`, `eventEntry`) VALUES
(44164, 96),
(44166, 90),
(44167, 94),
(45799, 98);
