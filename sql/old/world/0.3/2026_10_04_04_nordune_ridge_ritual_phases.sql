-- Nordune Ridge (Mount Hyjal), "A Ritual of Flame": the pre-ritual troops back in their phase.
--
-- The scene exists in three phases: 430 before the ritual (Hamuul, Malfurion, Saynna Stormrunner, Omnuron),
-- 433 during it (the same leaders plus ritualists, assault troopers and the Charred Invaders attacking them) and
-- 431 after it. The ritualists, troopers and event bunnies of the before-ritual layout (guids 1800000-1800048, next
-- to the phase 430 leaders 1800016-1800019) had no PhaseId: always visible, they
-- doubled the phase 433 troops during the ritual and fought invaders they did not share a phase with.
UPDATE `creature` SET `PhaseId` = '430'
WHERE `map` = 1 AND `guid` BETWEEN 1800000 AND 1800048 AND `PhaseId` = ''
  AND `id` IN (44775, 46464, 52846, 52847, 52848, 52849);
