-- An end date, for announcements with no regular duration.
--
-- Three ways to state how long an announcement lasts, in this order of priority:
--
--   `EndDate` set       -> the length runs from `StartDate` to `EndDate`. `DurationDays` must then
--                          be 0: the two together would contradict each other, and the core keeps
--                          `EndDate` while saying so in its log.
--   `DurationDays` > 0  -> the length is that many days. This is what a repeating announcement
--                          needs (`RepeatDays`), where a single end date makes no sense.
--   both empty          -> no length: the announcement only marks its opening day.
--
-- `EndDate` only applies to a one-off announcement. With `RepeatDays`, only `DurationDays` is
-- read, since every occurrence has the same length.
--
-- Conditional add: this file is replayed on every startup, and an `ALTER` that fails stops the
-- server from starting.
SET @missing := (SELECT COUNT(*) = 0 FROM information_schema.COLUMNS
                 WHERE TABLE_SCHEMA = DATABASE()
                   AND TABLE_NAME = 'custom_calendar_event'
                   AND COLUMN_NAME = 'EndDate');
SET @statement := IF(@missing,
    'ALTER TABLE `custom_calendar_event` ADD COLUMN `EndDate` DATETIME NULL COMMENT ''when it ends, for a one-off event; empty = see DurationDays'' AFTER `StartDate`',
    'DO 0');
PREPARE addColumn FROM @statement;
EXECUTE addColumn;
DEALLOCATE PREPARE addColumn;

-- The comment on `DurationDays` restates the rule.
ALTER TABLE `custom_calendar_event`
  MODIFY COLUMN `DurationDays` SMALLINT UNSIGNED NOT NULL DEFAULT 7
    COMMENT 'length in days: 7 = one week, 14 = two; leave 0 when EndDate is set';
