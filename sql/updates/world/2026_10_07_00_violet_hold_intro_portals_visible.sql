-- Assault on Violet Hold: the three intro portals (102281) carried the trigger flag (128), which shows players an
-- invisible model; they are real portals the demons pour out of before the event starts. Civilian (2) stays.
UPDATE `creature_template` SET `flags_extra` = `flags_extra` & ~128 WHERE `entry` = 102281;
