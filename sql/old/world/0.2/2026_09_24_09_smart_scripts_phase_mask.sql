-- event_phase_mask holds 12 phase bits (SMART_EVENT_PHASE_ALL = 4095); tinyint could not express phases 9-12
ALTER TABLE `smart_scripts` MODIFY `event_phase_mask` smallint unsigned NOT NULL DEFAULT 0;
