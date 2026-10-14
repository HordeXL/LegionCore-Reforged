-- Reputation: repeatable paragon caches, Legion quests without reputation, faction pairs for faction change, cap of the reputation given by creatures, a hozen's oversized gain removed.

-- Paragon caches: one quest per filled bar, so repeatable
DELETE FROM `quest_template_addon` WHERE `ID` IN (48976, 48977);
INSERT INTO `quest_template_addon` (`ID`) VALUES (48976), (48977);
UPDATE `quest_template_addon` SET `SpecialFlags` = `SpecialFlags` | 1 WHERE `ID` IN (46743, 46745, 46746, 46747, 46748, 46749, 46777, 48976, 48977);

-- Faction ID stored in place of the amount
UPDATE `quest_template` SET `RewardFactionID1` = `RewardFactionValue1`, `RewardFactionValue1` = 5 WHERE `ID` IN (41272, 41297, 41313) AND `RewardFactionID1` = 0;
UPDATE `quest_template` SET `RewardFactionID1` = `RewardFactionValue1`, `RewardFactionValue1` = 3 WHERE `ID` IN (40312, 41288, 41315, 41327, 41345, 41427, 41950, 42094) AND `RewardFactionID1` = 0;

-- Zero amount while the quest gives reputation
UPDATE `quest_template` SET `RewardFactionValue1` = 2 WHERE `ID` IN (40010, 41762) AND `RewardFactionValue1` = 0 AND `RewardFactionOverride1` = 0;
UPDATE `quest_template` SET `RewardFactionValue1` = 3 WHERE `ID` IN (41834, 41989, 42744) AND `RewardFactionValue1` = 0 AND `RewardFactionOverride1` = 0;
UPDATE `quest_template` SET `RewardFactionValue1` = 5, `RewardFactionOverride1` = 20000 WHERE `ID` = 41028 AND `RewardFactionValue1` = 0 AND `RewardFactionOverride1` = 0;
UPDATE `quest_template` SET `RewardFactionValue1` = 3, `RewardFactionOverride1` = 5000 WHERE `ID` = 41149 AND `RewardFactionValue1` = 0 AND `RewardFactionOverride1` = 0;

-- Faction change: the missing equivalent Alliance / Horde reputations
DELETE FROM `player_factionchange_reputations` WHERE `alliance_id` IN (589, 1134, 1174, 1177, 1242, 1353, 1376, 1387, 1419, 1682, 1691, 1710, 1731, 1733, 1738, 1847, 2011);
INSERT INTO `player_factionchange_reputations` (`alliance_id`, `horde_id`) VALUES
(589, 1137), (1134, 1133), (1174, 1172), (1177, 1178), (1242, 1228), (1353, 1352), (1376, 1375), (1387, 1388), (1419, 1374),
(1682, 1681), (1691, 1690), (1710, 1708), (1731, 1445), (1733, 1739), (1738, 1740), (1847, 1848), (2011, 2010);

-- Cap at 0: no reputation possible; the reference database's one, otherwise exalted
DROP TEMPORARY TABLE IF EXISTS `tmp_onkill_caps`;
CREATE TEMPORARY TABLE `tmp_onkill_caps` (`creature_id` INT UNSIGNED, `RewFaction` INT, `MaxStanding` TINYINT UNSIGNED);
INSERT INTO `tmp_onkill_caps` VALUES (4624,87,5)
,(16507,946,7)
,(16594,946,7)
,(16700,946,7)
,(16704,946,7)
,(16807,946,7)
,(16808,946,7)
,(16809,946,7)
,(17083,946,7)
,(17136,978,7)
,(17137,978,7)
,(17138,978,7)
,(17301,946,7)
,(17306,946,4)
,(17308,946,4)
,(17377,946,4)
,(17380,946,4)
,(17381,946,4)
,(17462,946,7)
,(17537,946,4)
,(17669,946,7)
,(17671,946,7)
,(17695,946,7)
,(18037,978,7)
,(18064,978,7)
,(18202,978,7)
,(18203,978,7)
,(18207,978,7)
,(18211,978,7)
,(18238,978,7)
,(20923,946,7)
,(18065,978,7)
,(72275,1269,7)
,(58411,1269,6)
,(65170,1269,7)
,(72280,1269,7)
,(63447,1269,7)
,(59378,1269,7)
,(63044,1269,6)
,(58928,1269,7)
,(65132,1269,7)
,(58927,1269,7)
,(65134,1269,7)
,(65131,1269,7)
,(65133,1269,7)
,(63641,1269,7)
,(58455,1269,7)
,(63605,1269,7)
,(58456,1269,7)
,(15335,609,7)
,(15324,609,7)
,(15338,609,7)
,(15386,609,7)
,(15325,609,7)
,(15336,609,7)
,(15327,609,7)
,(15320,609,7)
,(15323,609,7)
,(15318,609,7)
,(15319,609,7)
,(15385,609,7)
,(15390,609,7)
,(15392,609,7)
,(15391,609,7)
,(15389,609,7)
,(4624,21,5)
,(16507,947,7)
,(16699,947,7)
,(16700,947,7)
,(16807,947,7)
,(16808,947,7)
,(16809,947,7)
,(17083,947,7)
,(17135,941,7)
,(17136,941,7)
,(17137,941,7)
,(17146,941,7)
,(17147,941,7)
,(17148,941,7)
,(17306,947,4)
,(17307,947,4)
,(17308,947,4)
,(17377,947,4)
,(17380,947,4)
,(17381,947,4)
,(17462,947,7)
,(17465,947,7)
,(17537,947,4)
,(17671,947,7)
,(18037,941,7)
,(18203,941,7)
,(18207,941,7)
,(18211,941,7)
,(18402,941,7)
,(20923,947,7)
,(18204,941,7)
,(18065,941,7);
UPDATE `creature_onkill_reputation` o JOIN `tmp_onkill_caps` t ON t.`creature_id` = o.`creature_id` AND t.`RewFaction` = o.`RewFaction` SET o.`MaxStanding` = t.`MaxStanding` WHERE o.`MaxStanding` = 0;
UPDATE `creature_onkill_reputation` SET `MaxStanding` = 7 WHERE `MaxStanding` = 0 AND `RewFaction` <> 0;
DROP TEMPORARY TABLE `tmp_onkill_caps`;

-- Dook Ookem gave almost a whole exalted bar at once to the Forest Hozen, with no reference: no more reputation
DELETE FROM `creature_onkill_reputation` WHERE `creature_id` = 55622 AND `RewFaction` = 1228;
