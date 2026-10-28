-- Creature visibility range, like gameobject_template.VisibilityDistance (needed by the Talador and Shattrath updates)
SET @col = (SELECT COUNT(*) FROM information_schema.COLUMNS
    WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'creature_template' AND COLUMN_NAME = 'VisibilityDistance');
SET @query = IF(@col = 0,
    "ALTER TABLE `creature_template` ADD COLUMN `VisibilityDistance` FLOAT NOT NULL DEFAULT 0 COMMENT 'Yards. 0 = normal range. Makes the creature active.'",
    'SELECT 1');
PREPARE add_col FROM @query;
EXECUTE add_col;
DEALLOCATE PREPARE add_col;
