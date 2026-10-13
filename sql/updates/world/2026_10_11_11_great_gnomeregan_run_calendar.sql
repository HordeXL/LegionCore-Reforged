-- Great Gnomeregan Run: calendar announcements repeated in months, and the race's entry, shown when the realm departs from Blizzard's dates.
SET @col := (SELECT COUNT(*) FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'custom_calendar_event' AND COLUMN_NAME = 'RepeatMonths');
SET @sql := IF(@col = 0, 'ALTER TABLE `custom_calendar_event` ADD COLUMN `RepeatMonths` smallint unsigned NOT NULL DEFAULT 0 AFTER `RepeatDays`', 'SELECT 1');
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

DELETE FROM `custom_calendar_event` WHERE `HolidayID` = 696;
INSERT INTO `custom_calendar_event` (`HolidayID`, `HolidayNameID`, `HolidayDescriptionID`, `Name`, `NameLocalized`, `Description`, `DescriptionLocalized`, `StartDate`, `EndDate`, `DurationDays`, `RepeatDays`, `RepeatMonths`, `Texture1`, `Texture2`, `Texture3`, `Enabled`, `GameEventID`, `Notes`) VALUES
(696, 266, 244, 'The Great Gnomeregan Run', 'Le Grand Prix de Gnomeregan',
 'Join the Gnomes as they celebrate their unrelenting moxie!  Race across the Eastern Kingdoms, from Gnomeregan down to Booty Bay!',
 'Mêlez-vous aux Gnomes qui fêtent leur détermination inébranlable ! Participez à la course entre Gnomeregan et Baie-du-Butin, à travers les royaumes de l’Est !',
 NULL, NULL, 7, 0, 3, 1671627, 1671626, 1671625, 0, 0, 'Dates written at startup by GreatGnomereganRun::PrepareCalendar');
