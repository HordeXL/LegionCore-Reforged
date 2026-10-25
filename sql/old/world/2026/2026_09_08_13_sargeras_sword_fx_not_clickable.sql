-- The sword's effect stops being something you can click.
--
-- It is a GAMEOBJECT_TYPE_GOOBER, so the client offers it as a target and using it puts it through
-- the activated state and its 3000 ms auto-close - which is why clicking made the effect go away.
-- Nothing about it is meant to be interacted with: it is scenery, and scenery three kilometres tall
-- at that.
--
-- GO_FLAG_NOT_SELECTABLE is 0x10 and the row already carries 0x20, GO_FLAG_NODESPAWN, so the flags
-- go from 32 to 48. Rendering is untouched; only the interaction goes.
UPDATE `gameobject_template` SET `flags` = 48 WHERE `entry` = 281106;
