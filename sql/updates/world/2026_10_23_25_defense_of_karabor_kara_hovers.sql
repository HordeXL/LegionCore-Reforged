-- K'ara hovers above Karabor Harbor during the Defense of Karabor instead of falling
DELETE FROM `creature_template_movement` WHERE `CreatureId` = 79664;
INSERT INTO `creature_template_movement` (`CreatureId`, `Ground`, `Swim`, `Flight`, `Rooted`, `Random`) VALUES
(79664, 0, 0, 1, 1, 0);
