-- Assault on Violet Hold: takes back 2026_10_07_00. The intro portals (102281) are invisible triggers like the wave
-- portals (102279): their only visible model is an Infernal, the open portal is the visual of Portal Periodic (201901),
-- which the instance script now puts on them (instance_violet_hold_legion.cpp, UpdateIntro).
UPDATE `creature_template` SET `flags_extra` = `flags_extra` | 128 WHERE `entry` = 102281;
