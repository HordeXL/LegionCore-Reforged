-- A visibility distance an object can carry on its own.
--
-- MaxVisible is a yes-or-no flag and everything wearing it gets the same GLOBAL_VISIBILITY_DISTANCE,
-- a thousand yards. Raising that constant to reach four kilometres would have moved everything else
-- with it, and it is not a short list: 782 gameobjects on map 870, 588 creatures on map 0, and every
-- world boss, since Creature::UpdateEntry sets MaxVisible for rank 3 as well. So the distance
-- becomes a property of the object rather than of the server.
--
-- The core side is three small additions: a float on WorldObject with a setter, read by
-- GetVisibilityRange, GetSightRange and GetGridActivationRange before any other rule, and filled
-- from this column when a gameobject is created. Zero keeps the old behaviour exactly, so every
-- other row is untouched.
--
-- 4375 yards is four kilometres - a yard is 0.9144 m. Only the sword's effect gets it: gameobject
-- 281106, display 47481, model world/expansion06/doodads/legion/7fx_sargerassword_fx.m2, whose
-- bounding box is 2360 by 2450 by 3200. MaxVisible stays on it too and is still needed: it is what
-- puts the object in Map::m_MaxVisibleList, which VisibleNotifier::AddMaxVisible walks outside the
-- grid traversal - without it the object would never be offered at a distance no loaded cell covers.

ALTER TABLE `gameobject_template`
  ADD COLUMN `VisibilityDistance` FLOAT NOT NULL DEFAULT 0
  COMMENT 'Yards. 0 = normal range. Overrides MaxVisible for this entry only.';

UPDATE `gameobject_template` SET `VisibilityDistance` = 4375 WHERE `entry` = 281106;
