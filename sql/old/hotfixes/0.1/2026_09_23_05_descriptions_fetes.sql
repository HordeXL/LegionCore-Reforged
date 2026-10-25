-- Holiday descriptions never reached the client.
--
-- `sHolidayDescriptionsStore` was commented out in `DB2Stores.cpp`: the core did not know the
-- table at all, so it announced none of its hotfixes - and a holiday's body stayed empty, ours as
-- well as Blizzard's. The store is enabled again core-side; this file only bumps the counter so
-- the client asks for everything anew.
--
-- Nothing else to fix: row 9000802 already exists and its table hash is right.
UPDATE `world_legion`.`version` SET `hotfix_cache_id` = 206;
