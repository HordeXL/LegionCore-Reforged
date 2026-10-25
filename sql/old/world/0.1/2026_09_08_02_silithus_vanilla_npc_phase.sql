-- ==========================================================================================
-- Vanilla Silithus creatures stop showing inside the Wound.
--
-- Measured on the 3622 spawns of zone 1377: 773 already carry PhaseId 10277, the Wound, and 99
-- more carry the questline sub-phases. The Legion population is therefore in place and correctly
-- phased. The 2747 left carry no phase at all, which in this core means visible everywhere - so
-- the beetles, wasps and scorpids of 2006 walk through the wound alongside them.
--
-- They are given 9491, the phase of old Silithus, which phase_definitions entry 11 already serves.
--
-- Zidormi, 128607, is excluded on purpose: she has two spawns, one on 10277 and one unphased, so
-- she stays reachable from either side. Phasing her would strand a player in whichever version
-- they picked.
--
-- The previous values are kept in creature_phase_backup_silithus, so this is one statement to undo.
-- ==========================================================================================

DROP TABLE IF EXISTS `creature_phase_backup_silithus`;
CREATE TABLE `creature_phase_backup_silithus` AS
SELECT `guid`, `PhaseId` FROM `creature`
WHERE `map` = 1 AND `zoneId` = 1377 AND (`PhaseId` IS NULL OR `PhaseId` = '') AND `id` <> 128607;

UPDATE `creature` SET `PhaseId` = '9491'
WHERE `map` = 1 AND `zoneId` = 1377 AND (`PhaseId` IS NULL OR `PhaseId` = '') AND `id` <> 128607;
