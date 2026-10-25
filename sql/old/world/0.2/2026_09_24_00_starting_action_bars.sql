-- Starting action bars: playercreateinfo_action predated Legion.
-- On first load the core drops every button whose spell the character does not know
-- (Player::IsActionButtonDataValid): Frostfire Bolt, the old Lightning Bolt, Heroic Strike, racials of
-- another class... left bars empty. Spells derived from the 7.3.5 DB2 the way the core grants them:
-- starting skills plus the recommended specialization, spell level <= starting level.
-- Allied races (27+) are left untouched, as are macros and items (type <> 0). Re-runnable.

DELETE FROM `playercreateinfo_action` WHERE `race` = 1 AND `class` = 1 AND `type` = 0;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`) VALUES
(1, 1, 0, 6603, 0),
(1, 1, 1, 1464, 0),
(1, 1, 9, 59752, 0),
(1, 1, 93, 59752, 0);
DELETE FROM `playercreateinfo_action` WHERE `race` = 1 AND `class` = 3 AND `type` = 0;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`) VALUES
(1, 3, 0, 193455, 0),
(1, 3, 1, 883, 0),
(1, 3, 9, 59752, 0),
(1, 3, 11, 982, 0);
DELETE FROM `playercreateinfo_action` WHERE `race` = 1 AND `class` = 6 AND `type` = 0;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`) VALUES
(1, 6, 0, 6603, 0),
(1, 6, 1, 49576, 0),
(1, 6, 2, 55090, 0),
(1, 6, 3, 85948, 0),
(1, 6, 4, 46584, 0),
(1, 6, 5, 47541, 0),
(1, 6, 6, 77575, 0),
(1, 6, 11, 59752, 0);
DELETE FROM `playercreateinfo_action` WHERE `race` = 1 AND `class` = 8 AND `type` = 0;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`) VALUES
(1, 8, 0, 116, 0),
(1, 8, 9, 59752, 0);
DELETE FROM `playercreateinfo_action` WHERE `race` = 1 AND `class` = 9 AND `type` = 0;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`) VALUES
(1, 9, 0, 232670, 0),
(1, 9, 9, 59752, 0);
DELETE FROM `playercreateinfo_action` WHERE `race` = 1 AND `class` = 10 AND `type` = 0;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`) VALUES
(1, 10, 0, 100780, 0),
(1, 10, 9, 59752, 0),
(1, 10, 72, 100780, 0),
(1, 10, 81, 59752, 0);
DELETE FROM `playercreateinfo_action` WHERE `race` = 2 AND `class` = 1 AND `type` = 0;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`) VALUES
(2, 1, 0, 6603, 0),
(2, 1, 1, 1464, 0),
(2, 1, 9, 20572, 0),
(2, 1, 81, 20572, 0),
(2, 1, 84, 6603, 0),
(2, 1, 96, 6603, 0),
(2, 1, 108, 6603, 0);
DELETE FROM `playercreateinfo_action` WHERE `race` = 2 AND `class` = 3 AND `type` = 0;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`) VALUES
(2, 3, 0, 193455, 0),
(2, 3, 1, 883, 0),
(2, 3, 9, 20572, 0),
(2, 3, 11, 982, 0);
DELETE FROM `playercreateinfo_action` WHERE `race` = 2 AND `class` = 6 AND `type` = 0;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`) VALUES
(2, 6, 0, 6603, 0),
(2, 6, 1, 49576, 0),
(2, 6, 2, 55090, 0),
(2, 6, 3, 85948, 0),
(2, 6, 4, 46584, 0),
(2, 6, 5, 47541, 0),
(2, 6, 6, 77575, 0),
(2, 6, 10, 20572, 0);
DELETE FROM `playercreateinfo_action` WHERE `race` = 2 AND `class` = 7 AND `type` = 0;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`) VALUES
(2, 7, 0, 188196, 0),
(2, 7, 9, 33697, 0);
DELETE FROM `playercreateinfo_action` WHERE `race` = 2 AND `class` = 8 AND `type` = 0;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`) VALUES
(2, 8, 0, 116, 0),
(2, 8, 9, 33702, 0);
DELETE FROM `playercreateinfo_action` WHERE `race` = 2 AND `class` = 9 AND `type` = 0;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`) VALUES
(2, 9, 0, 232670, 0),
(2, 9, 9, 33702, 0);
DELETE FROM `playercreateinfo_action` WHERE `race` = 2 AND `class` = 10 AND `type` = 0;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`) VALUES
(2, 10, 0, 100780, 0),
(2, 10, 9, 33697, 0),
(2, 10, 72, 100780, 0),
(2, 10, 81, 33697, 0);
DELETE FROM `playercreateinfo_action` WHERE `race` = 3 AND `class` = 1 AND `type` = 0;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`) VALUES
(3, 1, 0, 6603, 0),
(3, 1, 1, 1464, 0),
(3, 1, 9, 20594, 0),
(3, 1, 81, 20594, 0),
(3, 1, 84, 6603, 0),
(3, 1, 96, 6603, 0),
(3, 1, 108, 6603, 0);
DELETE FROM `playercreateinfo_action` WHERE `race` = 3 AND `class` = 3 AND `type` = 0;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`) VALUES
(3, 3, 0, 193455, 0),
(3, 3, 1, 883, 0),
(3, 3, 9, 20594, 0),
(3, 3, 11, 982, 0),
(3, 3, 75, 20594, 0);
DELETE FROM `playercreateinfo_action` WHERE `race` = 3 AND `class` = 6 AND `type` = 0;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`) VALUES
(3, 6, 0, 6603, 0),
(3, 6, 1, 49576, 0),
(3, 6, 2, 55090, 0),
(3, 6, 3, 85948, 0),
(3, 6, 4, 46584, 0),
(3, 6, 5, 47541, 0),
(3, 6, 6, 77575, 0),
(3, 6, 9, 20594, 0);
DELETE FROM `playercreateinfo_action` WHERE `race` = 3 AND `class` = 7 AND `type` = 0;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`) VALUES
(3, 7, 0, 6603, 0),
(3, 7, 1, 188196, 0),
(3, 7, 9, 20594, 0);
DELETE FROM `playercreateinfo_action` WHERE `race` = 3 AND `class` = 8 AND `type` = 0;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`) VALUES
(3, 8, 0, 116, 0),
(3, 8, 9, 20594, 0);
DELETE FROM `playercreateinfo_action` WHERE `race` = 3 AND `class` = 9 AND `type` = 0;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`) VALUES
(3, 9, 0, 232670, 0),
(3, 9, 9, 20594, 0);
DELETE FROM `playercreateinfo_action` WHERE `race` = 3 AND `class` = 10 AND `type` = 0;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`) VALUES
(3, 10, 0, 100780, 0),
(3, 10, 9, 20594, 0),
(3, 10, 72, 100780, 0),
(3, 10, 81, 20594, 0);
DELETE FROM `playercreateinfo_action` WHERE `race` = 4 AND `class` = 1 AND `type` = 0;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`) VALUES
(4, 1, 0, 1464, 0),
(4, 1, 9, 58984, 0),
(4, 1, 81, 58984, 0),
(4, 1, 84, 6603, 0),
(4, 1, 96, 6603, 0),
(4, 1, 108, 6603, 0);
DELETE FROM `playercreateinfo_action` WHERE `race` = 4 AND `class` = 3 AND `type` = 0;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`) VALUES
(4, 3, 0, 193455, 0),
(4, 3, 1, 883, 0),
(4, 3, 9, 58984, 0),
(4, 3, 11, 982, 0),
(4, 3, 81, 58984, 0);
DELETE FROM `playercreateinfo_action` WHERE `race` = 4 AND `class` = 6 AND `type` = 0;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`) VALUES
(4, 6, 0, 6603, 0),
(4, 6, 1, 49576, 0),
(4, 6, 2, 55090, 0),
(4, 6, 3, 85948, 0),
(4, 6, 4, 46584, 0),
(4, 6, 5, 47541, 0),
(4, 6, 6, 77575, 0),
(4, 6, 10, 58984, 0),
(4, 6, 83, 58984, 0);
DELETE FROM `playercreateinfo_action` WHERE `race` = 4 AND `class` = 8 AND `type` = 0;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`) VALUES
(4, 8, 0, 116, 0),
(4, 8, 9, 58984, 0);
DELETE FROM `playercreateinfo_action` WHERE `race` = 4 AND `class` = 10 AND `type` = 0;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`) VALUES
(4, 10, 0, 100780, 0),
(4, 10, 9, 58984, 0),
(4, 10, 72, 100780, 0),
(4, 10, 81, 58984, 0);
DELETE FROM `playercreateinfo_action` WHERE `race` = 4 AND `class` = 11 AND `type` = 0;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`) VALUES
(4, 11, 0, 190984, 0),
(4, 11, 9, 58984, 0),
(4, 11, 72, 6603, 0),
(4, 11, 74, 58984, 0),
(4, 11, 84, 6603, 0),
(4, 11, 96, 6603, 0),
(4, 11, 108, 6603, 0);
DELETE FROM `playercreateinfo_action` WHERE `race` = 4 AND `class` = 12 AND `type` = 0;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`) VALUES
(4, 12, 0, 195072, 0),
(4, 12, 1, 162243, 0),
(4, 12, 2, 162794, 0),
(4, 12, 9, 58984, 0),
(4, 12, 10, 188501, 0);
DELETE FROM `playercreateinfo_action` WHERE `race` = 5 AND `class` = 1 AND `type` = 0;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`) VALUES
(5, 1, 0, 6603, 0),
(5, 1, 1, 1464, 0),
(5, 1, 9, 20577, 0),
(5, 1, 81, 20577, 0),
(5, 1, 84, 6603, 0),
(5, 1, 96, 6603, 0),
(5, 1, 108, 6603, 0);
DELETE FROM `playercreateinfo_action` WHERE `race` = 5 AND `class` = 3 AND `type` = 0;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`) VALUES
(5, 3, 0, 193455, 0),
(5, 3, 1, 883, 0),
(5, 3, 9, 20577, 0),
(5, 3, 11, 982, 0);
DELETE FROM `playercreateinfo_action` WHERE `race` = 5 AND `class` = 6 AND `type` = 0;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`) VALUES
(5, 6, 0, 6603, 0),
(5, 6, 1, 49576, 0),
(5, 6, 2, 55090, 0),
(5, 6, 3, 85948, 0),
(5, 6, 4, 46584, 0),
(5, 6, 5, 47541, 0),
(5, 6, 6, 77575, 0),
(5, 6, 10, 20577, 0);
DELETE FROM `playercreateinfo_action` WHERE `race` = 5 AND `class` = 8 AND `type` = 0;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`) VALUES
(5, 8, 0, 116, 0),
(5, 8, 9, 20577, 0);
DELETE FROM `playercreateinfo_action` WHERE `race` = 5 AND `class` = 9 AND `type` = 0;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`) VALUES
(5, 9, 0, 232670, 0),
(5, 9, 9, 20577, 0);
DELETE FROM `playercreateinfo_action` WHERE `race` = 5 AND `class` = 10 AND `type` = 0;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`) VALUES
(5, 10, 0, 100780, 0),
(5, 10, 9, 20577, 0),
(5, 10, 72, 100780, 0),
(5, 10, 81, 20577, 0);
DELETE FROM `playercreateinfo_action` WHERE `race` = 6 AND `class` = 1 AND `type` = 0;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`) VALUES
(6, 1, 0, 6603, 0),
(6, 1, 1, 1464, 0),
(6, 1, 9, 20549, 0),
(6, 1, 81, 20549, 0),
(6, 1, 84, 6603, 0),
(6, 1, 96, 6603, 0),
(6, 1, 108, 6603, 0);
DELETE FROM `playercreateinfo_action` WHERE `race` = 6 AND `class` = 3 AND `type` = 0;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`) VALUES
(6, 3, 0, 193455, 0),
(6, 3, 1, 883, 0),
(6, 3, 9, 20549, 0),
(6, 3, 11, 982, 0),
(6, 3, 75, 20549, 0);
DELETE FROM `playercreateinfo_action` WHERE `race` = 6 AND `class` = 6 AND `type` = 0;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`) VALUES
(6, 6, 0, 6603, 0),
(6, 6, 1, 49576, 0),
(6, 6, 2, 55090, 0),
(6, 6, 3, 85948, 0),
(6, 6, 4, 46584, 0),
(6, 6, 5, 47541, 0),
(6, 6, 6, 77575, 0),
(6, 6, 10, 20549, 0),
(6, 6, 75, 20549, 0);
DELETE FROM `playercreateinfo_action` WHERE `race` = 6 AND `class` = 7 AND `type` = 0;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`) VALUES
(6, 7, 0, 188196, 0),
(6, 7, 9, 20549, 0),
(6, 7, 75, 20549, 0);
DELETE FROM `playercreateinfo_action` WHERE `race` = 6 AND `class` = 10 AND `type` = 0;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`) VALUES
(6, 10, 0, 100780, 0),
(6, 10, 9, 20549, 0),
(6, 10, 72, 100780, 0),
(6, 10, 81, 20549, 0);
DELETE FROM `playercreateinfo_action` WHERE `race` = 6 AND `class` = 11 AND `type` = 0;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`) VALUES
(6, 11, 0, 190984, 0),
(6, 11, 9, 20549, 0),
(6, 11, 72, 6603, 0),
(6, 11, 75, 20549, 0),
(6, 11, 84, 6603, 0),
(6, 11, 96, 6603, 0),
(6, 11, 108, 6603, 0);
DELETE FROM `playercreateinfo_action` WHERE `race` = 7 AND `class` = 1 AND `type` = 0;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`) VALUES
(7, 1, 0, 6603, 0),
(7, 1, 1, 1464, 0),
(7, 1, 9, 20589, 0),
(7, 1, 84, 6603, 0),
(7, 1, 96, 6603, 0),
(7, 1, 108, 6603, 0);
DELETE FROM `playercreateinfo_action` WHERE `race` = 7 AND `class` = 3 AND `type` = 0;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`) VALUES
(7, 3, 0, 193455, 0),
(7, 3, 1, 883, 0),
(7, 3, 9, 20589, 0);
DELETE FROM `playercreateinfo_action` WHERE `race` = 7 AND `class` = 4 AND `type` = 0;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`) VALUES
(7, 4, 0, 1752, 0),
(7, 4, 9, 20589, 0);
DELETE FROM `playercreateinfo_action` WHERE `race` = 7 AND `class` = 5 AND `type` = 0;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`) VALUES
(7, 5, 0, 585, 0),
(7, 5, 9, 20589, 0);
DELETE FROM `playercreateinfo_action` WHERE `race` = 7 AND `class` = 6 AND `type` = 0;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`) VALUES
(7, 6, 0, 6603, 0),
(7, 6, 1, 49576, 0),
(7, 6, 2, 55090, 0),
(7, 6, 3, 85948, 0),
(7, 6, 4, 46584, 0),
(7, 6, 5, 47541, 0),
(7, 6, 6, 77575, 0),
(7, 6, 10, 20589, 0),
(7, 6, 72, 6603, 0),
(7, 6, 84, 6603, 0),
(7, 6, 96, 6603, 0),
(7, 6, 108, 6603, 0);
DELETE FROM `playercreateinfo_action` WHERE `race` = 7 AND `class` = 8 AND `type` = 0;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`) VALUES
(7, 8, 0, 116, 0),
(7, 8, 9, 20589, 0);
DELETE FROM `playercreateinfo_action` WHERE `race` = 7 AND `class` = 9 AND `type` = 0;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`) VALUES
(7, 9, 0, 232670, 0),
(7, 9, 9, 20589, 0);
DELETE FROM `playercreateinfo_action` WHERE `race` = 7 AND `class` = 10 AND `type` = 0;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`) VALUES
(7, 10, 0, 100780, 0),
(7, 10, 9, 20589, 0),
(7, 10, 72, 100780, 0),
(7, 10, 81, 20589, 0);
DELETE FROM `playercreateinfo_action` WHERE `race` = 8 AND `class` = 1 AND `type` = 0;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`) VALUES
(8, 1, 0, 6603, 0),
(8, 1, 1, 1464, 0),
(8, 1, 9, 26297, 0),
(8, 1, 81, 26297, 0),
(8, 1, 84, 6603, 0),
(8, 1, 96, 6603, 0),
(8, 1, 108, 6603, 0);
DELETE FROM `playercreateinfo_action` WHERE `race` = 8 AND `class` = 3 AND `type` = 0;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`) VALUES
(8, 3, 0, 193455, 0),
(8, 3, 1, 883, 0),
(8, 3, 9, 26297, 0),
(8, 3, 11, 982, 0);
DELETE FROM `playercreateinfo_action` WHERE `race` = 8 AND `class` = 6 AND `type` = 0;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`) VALUES
(8, 6, 0, 6603, 0),
(8, 6, 1, 49576, 0),
(8, 6, 2, 55090, 0),
(8, 6, 3, 85948, 0),
(8, 6, 4, 46584, 0),
(8, 6, 5, 47541, 0),
(8, 6, 6, 77575, 0),
(8, 6, 10, 26297, 0);
DELETE FROM `playercreateinfo_action` WHERE `race` = 8 AND `class` = 7 AND `type` = 0;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`) VALUES
(8, 7, 0, 188196, 0),
(8, 7, 9, 26297, 0);
DELETE FROM `playercreateinfo_action` WHERE `race` = 8 AND `class` = 8 AND `type` = 0;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`) VALUES
(8, 8, 0, 116, 0),
(8, 8, 9, 26297, 0);
DELETE FROM `playercreateinfo_action` WHERE `race` = 8 AND `class` = 9 AND `type` = 0;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`) VALUES
(8, 9, 0, 232670, 0),
(8, 9, 9, 26297, 0);
DELETE FROM `playercreateinfo_action` WHERE `race` = 8 AND `class` = 10 AND `type` = 0;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`) VALUES
(8, 10, 0, 100780, 0),
(8, 10, 9, 26297, 0),
(8, 10, 72, 100780, 0),
(8, 10, 81, 26297, 0);
DELETE FROM `playercreateinfo_action` WHERE `race` = 8 AND `class` = 11 AND `type` = 0;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`) VALUES
(8, 11, 0, 190984, 0),
(8, 11, 9, 26297, 0),
(8, 11, 72, 6603, 0),
(8, 11, 84, 6603, 0),
(8, 11, 96, 6603, 0);
DELETE FROM `playercreateinfo_action` WHERE `race` = 9 AND `class` = 1 AND `type` = 0;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`) VALUES
(9, 1, 0, 6603, 0),
(9, 1, 1, 1464, 0),
(9, 1, 9, 69041, 0),
(9, 1, 81, 69070, 0),
(9, 1, 82, 69041, 0);
DELETE FROM `playercreateinfo_action` WHERE `race` = 9 AND `class` = 3 AND `type` = 0;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`) VALUES
(9, 3, 0, 193455, 0),
(9, 3, 1, 883, 0),
(9, 3, 8, 982, 0),
(9, 3, 9, 69070, 0),
(9, 3, 10, 69041, 0);
DELETE FROM `playercreateinfo_action` WHERE `race` = 9 AND `class` = 6 AND `type` = 0;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`) VALUES
(9, 6, 0, 6603, 0),
(9, 6, 1, 49576, 0),
(9, 6, 2, 55090, 0),
(9, 6, 3, 85948, 0),
(9, 6, 4, 46584, 0),
(9, 6, 5, 47541, 0),
(9, 6, 6, 77575, 0),
(9, 6, 9, 69070, 0),
(9, 6, 10, 69041, 0),
(9, 6, 11, 69046, 0);
DELETE FROM `playercreateinfo_action` WHERE `race` = 9 AND `class` = 7 AND `type` = 0;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`) VALUES
(9, 7, 0, 188196, 0),
(9, 7, 9, 69070, 0),
(9, 7, 10, 69041, 0);
DELETE FROM `playercreateinfo_action` WHERE `race` = 9 AND `class` = 8 AND `type` = 0;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`) VALUES
(9, 8, 0, 116, 0),
(9, 8, 9, 69070, 0),
(9, 8, 10, 69041, 0);
DELETE FROM `playercreateinfo_action` WHERE `race` = 9 AND `class` = 9 AND `type` = 0;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`) VALUES
(9, 9, 0, 232670, 0),
(9, 9, 9, 69070, 0),
(9, 9, 10, 69041, 0);
DELETE FROM `playercreateinfo_action` WHERE `race` = 10 AND `class` = 1 AND `type` = 0;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`) VALUES
(10, 1, 0, 1464, 0),
(10, 1, 9, 69179, 0),
(10, 1, 81, 69179, 0);
DELETE FROM `playercreateinfo_action` WHERE `race` = 10 AND `class` = 2 AND `type` = 0;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`) VALUES
(10, 2, 0, 35395, 0),
(10, 2, 9, 155145, 0);
DELETE FROM `playercreateinfo_action` WHERE `race` = 10 AND `class` = 3 AND `type` = 0;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`) VALUES
(10, 3, 0, 193455, 0),
(10, 3, 1, 883, 0),
(10, 3, 9, 80483, 0),
(10, 3, 11, 982, 0);
DELETE FROM `playercreateinfo_action` WHERE `race` = 10 AND `class` = 5 AND `type` = 0;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`) VALUES
(10, 5, 0, 585, 0),
(10, 5, 9, 232633, 0);
DELETE FROM `playercreateinfo_action` WHERE `race` = 10 AND `class` = 6 AND `type` = 0;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`) VALUES
(10, 6, 0, 6603, 0),
(10, 6, 1, 49576, 0),
(10, 6, 2, 55090, 0),
(10, 6, 3, 85948, 0),
(10, 6, 4, 46584, 0),
(10, 6, 5, 47541, 0),
(10, 6, 6, 50613, 0),
(10, 6, 7, 77575, 0);
DELETE FROM `playercreateinfo_action` WHERE `race` = 10 AND `class` = 8 AND `type` = 0;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`) VALUES
(10, 8, 0, 116, 0),
(10, 8, 9, 28730, 0);
DELETE FROM `playercreateinfo_action` WHERE `race` = 10 AND `class` = 9 AND `type` = 0;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`) VALUES
(10, 9, 0, 232670, 0),
(10, 9, 9, 28730, 0);
DELETE FROM `playercreateinfo_action` WHERE `race` = 10 AND `class` = 10 AND `type` = 0;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`) VALUES
(10, 10, 0, 100780, 0),
(10, 10, 9, 129597, 0),
(10, 10, 72, 100780, 0),
(10, 10, 81, 129597, 0);
DELETE FROM `playercreateinfo_action` WHERE `race` = 10 AND `class` = 12 AND `type` = 0;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`) VALUES
(10, 12, 0, 162243, 0),
(10, 12, 9, 202719, 0);
DELETE FROM `playercreateinfo_action` WHERE `race` = 11 AND `class` = 1 AND `type` = 0;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`) VALUES
(11, 1, 0, 6603, 0),
(11, 1, 1, 1464, 0),
(11, 1, 9, 28880, 0),
(11, 1, 81, 28880, 0),
(11, 1, 84, 6603, 0),
(11, 1, 96, 6603, 0),
(11, 1, 108, 6603, 0);
DELETE FROM `playercreateinfo_action` WHERE `race` = 11 AND `class` = 3 AND `type` = 0;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`) VALUES
(11, 3, 0, 193455, 0),
(11, 3, 1, 883, 0),
(11, 3, 9, 59543, 0),
(11, 3, 11, 982, 0),
(11, 3, 72, 6603, 0),
(11, 3, 74, 75, 0);
DELETE FROM `playercreateinfo_action` WHERE `race` = 11 AND `class` = 6 AND `type` = 0;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`) VALUES
(11, 6, 0, 6603, 0),
(11, 6, 1, 49576, 0),
(11, 6, 2, 55090, 0),
(11, 6, 3, 85948, 0),
(11, 6, 4, 46584, 0),
(11, 6, 5, 47541, 0),
(11, 6, 6, 77575, 0),
(11, 6, 10, 59545, 0);
DELETE FROM `playercreateinfo_action` WHERE `race` = 11 AND `class` = 7 AND `type` = 0;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`) VALUES
(11, 7, 0, 188196, 0),
(11, 7, 9, 59547, 0);
DELETE FROM `playercreateinfo_action` WHERE `race` = 11 AND `class` = 8 AND `type` = 0;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`) VALUES
(11, 8, 0, 116, 0),
(11, 8, 9, 59548, 0);
DELETE FROM `playercreateinfo_action` WHERE `race` = 11 AND `class` = 10 AND `type` = 0;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`) VALUES
(11, 10, 0, 100780, 0),
(11, 10, 9, 121093, 0),
(11, 10, 72, 100780, 0),
(11, 10, 81, 121093, 0);
DELETE FROM `playercreateinfo_action` WHERE `race` = 22 AND `class` = 1 AND `type` = 0;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`) VALUES
(22, 1, 0, 6603, 0),
(22, 1, 1, 1464, 0);
DELETE FROM `playercreateinfo_action` WHERE `race` = 22 AND `class` = 3 AND `type` = 0;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`) VALUES
(22, 3, 0, 193455, 0),
(22, 3, 1, 883, 0),
(22, 3, 11, 982, 0);
DELETE FROM `playercreateinfo_action` WHERE `race` = 22 AND `class` = 6 AND `type` = 0;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`) VALUES
(22, 6, 0, 6603, 0),
(22, 6, 1, 49576, 0),
(22, 6, 2, 55090, 0),
(22, 6, 3, 85948, 0),
(22, 6, 4, 46584, 0),
(22, 6, 5, 47541, 0),
(22, 6, 6, 77575, 0),
(22, 6, 9, 68992, 0),
(22, 6, 10, 68996, 0),
(22, 6, 11, 87840, 0);
DELETE FROM `playercreateinfo_action` WHERE `race` = 22 AND `class` = 8 AND `type` = 0;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`) VALUES
(22, 8, 0, 116, 0);
DELETE FROM `playercreateinfo_action` WHERE `race` = 22 AND `class` = 9 AND `type` = 0;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`) VALUES
(22, 9, 0, 232670, 0);
DELETE FROM `playercreateinfo_action` WHERE `race` = 22 AND `class` = 11 AND `type` = 0;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`) VALUES
(22, 11, 0, 190984, 0),
(22, 11, 72, 6603, 0),
(22, 11, 84, 6603, 0),
(22, 11, 96, 6603, 0);
DELETE FROM `playercreateinfo_action` WHERE `race` = 24 AND `class` = 1 AND `type` = 0;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`) VALUES
(24, 1, 0, 88163, 0),
(24, 1, 1, 1464, 0),
(24, 1, 9, 107079, 0);
DELETE FROM `playercreateinfo_action` WHERE `race` = 24 AND `class` = 3 AND `type` = 0;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`) VALUES
(24, 3, 0, 193455, 0),
(24, 3, 1, 883, 0),
(24, 3, 9, 107079, 0),
(24, 3, 11, 982, 0),
(24, 3, 72, 6603, 0),
(24, 3, 74, 75, 0);
DELETE FROM `playercreateinfo_action` WHERE `race` = 24 AND `class` = 7 AND `type` = 0;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`) VALUES
(24, 7, 0, 6603, 0),
(24, 7, 1, 188196, 0),
(24, 7, 9, 107079, 0);
DELETE FROM `playercreateinfo_action` WHERE `race` = 24 AND `class` = 8 AND `type` = 0;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`) VALUES
(24, 8, 0, 116, 0),
(24, 8, 9, 107079, 0);
DELETE FROM `playercreateinfo_action` WHERE `race` = 24 AND `class` = 10 AND `type` = 0;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`) VALUES
(24, 10, 0, 100780, 0),
(24, 10, 9, 107079, 0),
(24, 10, 72, 100780, 0),
(24, 10, 81, 107079, 0);
DELETE FROM `playercreateinfo_action` WHERE `race` = 25 AND `class` = 1 AND `type` = 0;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`) VALUES
(25, 1, 0, 1464, 0),
(25, 1, 9, 107079, 0);
DELETE FROM `playercreateinfo_action` WHERE `race` = 25 AND `class` = 3 AND `type` = 0;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`) VALUES
(25, 3, 0, 193455, 0),
(25, 3, 1, 883, 0),
(25, 3, 9, 107079, 0);
DELETE FROM `playercreateinfo_action` WHERE `race` = 25 AND `class` = 4 AND `type` = 0;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`) VALUES
(25, 4, 0, 1752, 0),
(25, 4, 9, 107079, 0);
DELETE FROM `playercreateinfo_action` WHERE `race` = 25 AND `class` = 5 AND `type` = 0;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`) VALUES
(25, 5, 9, 107079, 0);
DELETE FROM `playercreateinfo_action` WHERE `race` = 25 AND `class` = 7 AND `type` = 0;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`) VALUES
(25, 7, 0, 188196, 0),
(25, 7, 9, 107079, 0);
DELETE FROM `playercreateinfo_action` WHERE `race` = 25 AND `class` = 8 AND `type` = 0;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`) VALUES
(25, 8, 0, 116, 0),
(25, 8, 9, 107079, 0);
DELETE FROM `playercreateinfo_action` WHERE `race` = 25 AND `class` = 10 AND `type` = 0;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`) VALUES
(25, 10, 9, 107079, 0);
DELETE FROM `playercreateinfo_action` WHERE `race` = 26 AND `class` = 1 AND `type` = 0;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`) VALUES
(26, 1, 0, 1464, 0),
(26, 1, 9, 107079, 0);
DELETE FROM `playercreateinfo_action` WHERE `race` = 26 AND `class` = 3 AND `type` = 0;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`) VALUES
(26, 3, 0, 193455, 0),
(26, 3, 1, 883, 0),
(26, 3, 9, 107079, 0);
DELETE FROM `playercreateinfo_action` WHERE `race` = 26 AND `class` = 4 AND `type` = 0;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`) VALUES
(26, 4, 0, 1752, 0),
(26, 4, 9, 107079, 0);
DELETE FROM `playercreateinfo_action` WHERE `race` = 26 AND `class` = 5 AND `type` = 0;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`) VALUES
(26, 5, 9, 107079, 0);
DELETE FROM `playercreateinfo_action` WHERE `race` = 26 AND `class` = 7 AND `type` = 0;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`) VALUES
(26, 7, 0, 188196, 0),
(26, 7, 9, 107079, 0);
DELETE FROM `playercreateinfo_action` WHERE `race` = 26 AND `class` = 8 AND `type` = 0;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`) VALUES
(26, 8, 0, 116, 0),
(26, 8, 9, 107079, 0);
DELETE FROM `playercreateinfo_action` WHERE `race` = 26 AND `class` = 10 AND `type` = 0;
INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`) VALUES
(26, 10, 9, 107079, 0);
