-- Lorlathil (taxi node 1673, Val'sharah) is no longer known from the start: LegionCore added it for its
-- alpha test, it does not exist on retail and was removed from PlayerTaxi::InitTaxiNodesForLevel. The
-- saved mask still held it, since LoadTaxiMask reloads it on every login: this clears that single bit
-- (byte 209, bit 0) without touching any other flight path. Re-runnable.

UPDATE `characters`
SET `taximask` = CONCAT(
        SUBSTRING_INDEX(`taximask`, ' ', 209), ' ',
        CAST(SUBSTRING_INDEX(SUBSTRING_INDEX(`taximask`, ' ', 210), ' ', -1) AS UNSIGNED) & ~1,
        SUBSTRING(`taximask`, LENGTH(SUBSTRING_INDEX(`taximask`, ' ', 210)) + 1))
WHERE CAST(SUBSTRING_INDEX(SUBSTRING_INDEX(`taximask`, ' ', 210), ' ', -1) AS UNSIGNED) & 1;
