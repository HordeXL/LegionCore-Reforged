-- Normal and heroic 5-player dungeons no longer lock players out (only raids and mythic dungeons do, as in Legion):
-- the permanent binds already given by a boss kill there kept the dungeon finder refusing the dungeon until the reset.
UPDATE `character_instance` SET `permanent` = 0 WHERE `difficulty` IN (1, 2);
UPDATE `group_instance` SET `permanent` = 0 WHERE `difficulty` IN (1, 2);
