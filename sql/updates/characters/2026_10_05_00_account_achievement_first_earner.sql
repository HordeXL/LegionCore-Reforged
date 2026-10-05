-- An achievement earned again by another character of the account rewrote the account row with that character
-- and that day: the account lost who earned it first, and when. Put back the earliest character row.
UPDATE `account_achievement` a
JOIN (SELECT c.`account`, ca.`achievement`, MIN(ca.`date`) AS `first_date`
      FROM `character_achievement` ca
      JOIN `characters` c ON c.`guid` = ca.`guid`
      GROUP BY c.`account`, ca.`achievement`) m ON m.`account` = a.`account` AND m.`achievement` = a.`achievement`
JOIN `character_achievement` f ON f.`achievement` = a.`achievement` AND f.`date` = m.`first_date`
JOIN `characters` fc ON fc.`guid` = f.`guid` AND fc.`account` = a.`account`
SET a.`first_guid` = f.`guid`, a.`date` = m.`first_date`
WHERE m.`first_date` < a.`date`;
