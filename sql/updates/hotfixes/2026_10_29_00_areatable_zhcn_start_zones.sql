-- AreaTable zhCN: 自定义起始区名字热修下发（配合 ClientData/dbc/zhCN/AreaTable.db2 的中文补丁）
-- 目的：让客户端的区域文字也显示中文，无需修改 45GB 的 CASC 客户端数据。
-- 依赖：AreaTable.db2 的 zhCN 槽已写入中文（见 patch_areatable_zhcn.ps1），且 DBC.Locale = 4。
-- TableHash 1918102339 = 7.3.5.26972 AreaTable 的 TableHash。
-- 改名后必须同时提升世界配置里的 HotfixCacheVersion，客户端才会重新拉取这些行。

DELETE FROM `hotfix_data` WHERE `TableHash` = 1918102339 AND `Id` BETWEEN 920001 AND 920009;

INSERT INTO `hotfix_data` (`Id`, `TableHash`, `RecordID`, `Timestamp`, `Deleted`) VALUES
(920001, 1918102339, 6451, 0, 0), -- ValleyofTrialsStart  / 试炼谷
(920002, 1918102339, 6450, 0, 0), -- ShadowglenStart      / 暗影谷
(920003, 1918102339, 6452, 0, 0), -- CampNaracheStart     / 纳拉其营地
(920004, 1918102339, 6453, 0, 0), -- EchoIslesStart       / 回音群岛
(920005, 1918102339, 6454, 0, 0), -- DeathknellStart      / 丧钟镇
(920006, 1918102339, 6455, 0, 0), -- SunstriderIsleStart  / 逐日岛
(920007, 1918102339, 6456, 0, 0), -- AmmenValeStart       / 埃门谷
(920008, 1918102339, 6457, 0, 0), -- NewTinkertownStart   / 新工匠镇
(920009, 1918102339, 5454, 0, 0); -- AllianceStart        / 联盟
