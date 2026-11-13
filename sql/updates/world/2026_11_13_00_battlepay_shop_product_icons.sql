-- BattlePay store: the product tiles had no icon.
--
-- The shop entry carried no display info (battlepay_shop_entry.DisplayInfoID = 0), so the core sent
-- no ProductDisplayInfo at all and the client fell back to its generic question mark tile. The display
-- info rows themselves had no icon either: battlepay_display_info.FileDataID was 0 and no row existed
-- in battlepay_display_info_visuals.
--
-- The icons are the ones of the items the products sell, taken from the client's own Item.db2
-- (ItemEntry::IconFileDataID). The core maps battlepay_display_info.FileDataID to the VisualsId it
-- sends in the display info, which is what the client draws the tile with.
--
-- The shop entries and the product items are bound to the display info of their product as well, so the
-- grid tile carries the same display info as the product page.

-- 1) the icon of the item each product sells
UPDATE `battlepay_display_info` SET `FileDataID` = CASE `DisplayInfoId`
    WHEN 1 THEN 526356
    WHEN 2 THEN 369225
    WHEN 3 THEN 576138
    WHEN 4 THEN 773250
    WHEN 5 THEN 804461
    WHEN 6 THEN 644374
    WHEN 7 THEN 841541
    WHEN 8 THEN 943739
    WHEN 9 THEN 986420
    WHEN 10 THEN 986419
    WHEN 11 THEN 1096090
    WHEN 12 THEN 1616898
    WHEN 21 THEN 134514
    WHEN 22 THEN 328269
    WHEN 23 THEN 254104
    WHEN 25 THEN 254652
    WHEN 26 THEN 574806
    WHEN 27 THEN 666530
    WHEN 28 THEN 656128
    WHEN 29 THEN 874857
    WHEN 30 THEN 132620
    WHEN 31 THEN 1044790
    WHEN 32 THEN 1116250
    WHEN 33 THEN 1129035
    WHEN 34 THEN 1634262
    WHEN 35 THEN 1616893
    WHEN 41 THEN 986421
    WHEN 51 THEN 841140
    WHEN 52 THEN 841875
    WHEN 53 THEN 840662
    ELSE `FileDataID` END
WHERE `DisplayInfoId` IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 21, 22, 23, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 41, 51, 52, 53);

-- 2) the shop entries carry the display info of their product (was 0: no tile art at all)
UPDATE `battlepay_shop_entry` SET `DisplayInfoID` = CASE `EntryID`
    WHEN 1 THEN 1
    WHEN 2 THEN 2
    WHEN 3 THEN 3
    WHEN 4 THEN 4
    WHEN 5 THEN 5
    WHEN 6 THEN 6
    WHEN 7 THEN 7
    WHEN 8 THEN 8
    WHEN 9 THEN 9
    WHEN 10 THEN 10
    WHEN 11 THEN 11
    WHEN 12 THEN 12
    WHEN 21 THEN 21
    WHEN 22 THEN 22
    WHEN 23 THEN 23
    WHEN 25 THEN 25
    WHEN 26 THEN 26
    WHEN 27 THEN 27
    WHEN 28 THEN 28
    WHEN 29 THEN 29
    WHEN 30 THEN 30
    WHEN 31 THEN 31
    WHEN 32 THEN 32
    WHEN 33 THEN 33
    WHEN 34 THEN 34
    WHEN 35 THEN 35
    WHEN 41 THEN 41
    WHEN 51 THEN 51
    WHEN 52 THEN 52
    WHEN 53 THEN 53
    ELSE `DisplayInfoID` END
WHERE `EntryID` IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 21, 22, 23, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 41, 51, 52, 53);

-- 3) the product items carry the display info of their product
UPDATE `battlepay_product_item` SET `DisplayID` = CASE `ProductID`
    WHEN 1 THEN 1
    WHEN 2 THEN 2
    WHEN 3 THEN 3
    WHEN 4 THEN 4
    WHEN 5 THEN 5
    WHEN 6 THEN 6
    WHEN 7 THEN 7
    WHEN 8 THEN 8
    WHEN 9 THEN 9
    WHEN 10 THEN 10
    WHEN 11 THEN 11
    WHEN 12 THEN 12
    WHEN 21 THEN 21
    WHEN 22 THEN 22
    WHEN 23 THEN 23
    WHEN 25 THEN 25
    WHEN 26 THEN 26
    WHEN 27 THEN 27
    WHEN 28 THEN 28
    WHEN 29 THEN 29
    WHEN 30 THEN 30
    WHEN 31 THEN 31
    WHEN 32 THEN 32
    WHEN 33 THEN 33
    WHEN 34 THEN 34
    WHEN 35 THEN 35
    WHEN 41 THEN 41
    WHEN 51 THEN 51
    WHEN 52 THEN 52
    WHEN 53 THEN 53
    ELSE `DisplayID` END
WHERE `ProductID` IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 21, 22, 23, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 41, 51, 52, 53);
