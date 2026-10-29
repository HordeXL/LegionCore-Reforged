# zhCN 区域名中文化（AreaTable）

服务端频道名（`[1. 综合 - 杜隆塔尔]`）里的区域名不是客户端给的，而是服务端用
`AreaTable.db2` 拼出来的，所以客户端 CASC 一个字节都不用改。

## 原理

`Player::UpdateLocalChannels()`（`src/server/game/Entities/Player/Player.cpp`）里：

| 片段 | 来源 | 语言索引 |
|---|---|---|
| `综合` / `本地防务` 前缀 | `ChatChannels.db2` 的 `Name`（`综合 - %s`） | 玩家客户端语言 |
| `Durotar` 区域名 | `AreaTable.db2` 的 `ZoneName` | 服务端 `DBC.Locale` |

`AreaTable.db2` 每行有两个字符串列：

- `ZoneName`：服务端拼频道名、`.lookup area`、`.gps`/`.go` 提示
- `AreaName`：客户端区域文字、`/who`、反作弊日志

这份 7.3.5.26972 zhCN 数据里 `AreaName` 基本都有中文，但 `ZoneName` 几乎全是英文内部名
（`Durotar`、`ElwynnForest`、`ValleyofTrials`，无空格形式）。

## 三个动作

1. **配置**（`worldserver.conf`）
   ```ini
   DBC.Locale = 4            # zhCN，服务端改读 ClientData\dbc\zhCN
   HotfixCacheVersion = 20261030   # 改动 hotfix 内容后必须提升，客户端才会重拉
   ```

2. **DB2 补丁** `patch_areatable_zhcn.ps1`
   - 阶段1：9 个起始区 / 6 个同盟区的英文内部名 → 中文（原地替换，等长或更短，不改文件结构）
   - 阶段2：把每行的 `ZoneName` 偏移指向自己的 `AreaName`（中文时），一次覆盖 5,760 行
   - 幂等，可反复执行；文件大小不变，只动字符串池/记录里的 4 字节偏移

3. **热修下发**（`sql/updates/hotfixes/2026_10_29_00_areatable_zhcn_start_zones.sql`）
   客户端区域文字来自它自己的 DB2，只有 `hotfix_data` 里登记过的行才会被下发覆盖，
   所以 9 个起始区各登记一条（TableHash `1918102339` = AreaTable）。

## 重新提取 DB2 之后

```powershell
powershell -ExecutionPolicy Bypass -File .\patch_areatable_zhcn.ps1
```
然后重启 worldserver；`hotfix_data` 已在库里，不用重插。

## 验证

- `.lookup area 杜隆` → 中文
- 进游戏换区 → `[1. 综合 - 杜隆塔尔]`
- `SELECT COUNT(*) FROM hotfixes.hotfix_data WHERE TableHash = 1918102339;` → 14

## 边界

- `AreaTable` 共 5,853 行，其中 5,766 行（98.5%）已中文；剩下 87 行全是
  `[TEMP]`、`UNUSED`、`zzOld`、`DevArea`、`GM Island`、`[PH]` 之类开发/废弃区，
  玩家不可达，保持英文便于 GM 排查。`K3`、`Elunaria (cin)` 这类专名/过场也保持原样。
- `trinity_string.content_loc4` 为空的 49 行不用补：`ObjectMgr::GetTrinityString`
  在本地化串为空时会回退到 `DEFAULT_LOCALE`（英文），不会显示空白。

## 回滚

- 删热修：`DELETE FROM hotfixes.hotfix_data WHERE Id BETWEEN 920001 AND 920009;`
- 配置改回 `DBC.Locale = 0` / `HotfixCacheVersion = 0`
- DB2 恢复：`AreaTable.db2.bak-20261029`（原始英文版）
