-- Vendor items that could not be bought: 53 extended costs require a currency missing from the 7.3.5
-- client (392 old Honor Points and 390 old Conquest Points, removed in 7.0) or do not exist in
-- ItemExtendedCost.db2. The client showed no price, then "item not found" (e.g. Garyl 5188,
-- Stone Guard's Herald 15199). These items now sell for 1 gold through npc_vendor.money, used for both
-- the display and the purchase (NPCHandler.cpp, Player::BuyItemFromVendorSlot). 7,996 lines,
-- 3,326 items, 71 vendors.
-- Two items were sold twice by the same vendor with two of these costs: only one line is kept,
-- otherwise the (entry, item, ExtendedCost, type) key would reject the reset to 0. Re-runnable.

DELETE a FROM `npc_vendor` a
JOIN `npc_vendor` b ON b.`entry` = a.`entry` AND b.`item` = a.`item` AND b.`type` = a.`type` AND b.`ExtendedCost` < a.`ExtendedCost`
    AND b.`ExtendedCost` IN (
    2569, 3651, 2543, 423, 2422, 127, 2421, 3390, 3383, 129, 2483, 2577, 2579, 359,
    3165, 3166, 2552, 3164, 2949, 3162, 3172, 3173, 3171, 3167, 3824, 171, 3880, 2967,
    3888, 3885, 3884, 3886, 3883, 4310, 4309, 4311, 4306, 4307, 2956, 2394, 5313, 3917
, 20014, 25031, 25020, 25029, 25021, 25032, 25033, 25109, 25251, 25250, 25117)
WHERE a.`ExtendedCost` IN (
    2569, 3651, 2543, 423, 2422, 127, 2421, 3390, 3383, 129, 2483, 2577, 2579, 359,
    3165, 3166, 2552, 3164, 2949, 3162, 3172, 3173, 3171, 3167, 3824, 171, 3880, 2967,
    3888, 3885, 3884, 3886, 3883, 4310, 4309, 4311, 4306, 4307, 2956, 2394, 5313, 3917
, 20014, 25031, 25020, 25029, 25021, 25032, 25033, 25109, 25251, 25250, 25117);

UPDATE `npc_vendor` SET `ExtendedCost` = 0, `money` = 10000 WHERE `ExtendedCost` IN (
    2569, 3651, 2543, 423, 2422, 127, 2421, 3390, 3383, 129, 2483, 2577, 2579, 359,
    3165, 3166, 2552, 3164, 2949, 3162, 3172, 3173, 3171, 3167, 3824, 171, 3880, 2967,
    3888, 3885, 3884, 3886, 3883, 4310, 4309, 4311, 4306, 4307, 2956, 2394, 5313, 3917
, 20014, 25031, 25020, 25029, 25021, 25032, 25033, 25109, 25251, 25250, 25117);
