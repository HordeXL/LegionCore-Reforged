-- Zidormi has to stand in both timelines.
--
-- Her spawn carries PhaseId 10277, the Wound. A player who accepts the trip to the past moves to
-- 9491, where she is no longer drawn - and she is the only way back, so the past was a one-way
-- door. A creature with no PhaseId is phase-neutral and visible to everyone, which is what a
-- timeline keeper needs to be.
UPDATE `creature` SET `PhaseId` = '' WHERE `guid` = 12936348 AND `id` = 128607;
