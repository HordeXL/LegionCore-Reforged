# patch_areatable_zhcn.ps1
# AreaTable.db2 中文化补丁：
#   阶段1 - 起始区/同盟种族区的英文内部名 -> 中文（原地替换，等长或更短）
#   阶段2 - 把 ZoneName 指向 AreaName（AreaName 是中文时），让服务端频道名、.lookup area 显示中文
# 用法: powershell -ExecutionPolicy Bypass -File .\patch_areatable_zhcn.ps1 [-Path <db2>]
# 幂等：已处理过的文件会全部跳过。
param(
    [string]$Path = "$PSScriptRoot\ClientData\dbc\zhCN\AreaTable.db2"
)

$map = [ordered]@{
    'AllianceStart'                     = '联盟'
    'ValleyofTrialsStart'               = '试炼谷'
    'ShadowglenStart'                   = '暗影谷'
    'CampNaracheStart'                  = '纳拉其营地'
    'EchoIslesStart'                    = '回音群岛'
    'DeathknellStart'                   = '丧钟镇'
    'SunstriderIsleStart'               = '逐日岛'
    'AmmenValeStart'                    = '埃门谷'
    'NewTinkertownStart'                = '新工匠镇'
    'Allied - Highmountain Tauren Unlock' = '同盟：高岭牛头人'
    'Allied - Lightforged Draenei Unlock' = '同盟：光铸德莱尼'
    'Allied - Orgrimmar'                = '奥格瑞玛'
    'Allied - Stormwind'                = '暴风城'
    'Allied - Void Elf Unlock'          = '同盟：虚空精灵'
    'Allied - Nightborne Unlock'        = '同盟：夜之子'
}

if (-not (Test-Path $Path)) { throw "not found: $Path" }
$bytes = [System.IO.File]::ReadAllBytes($Path)
$latin = [System.Text.Encoding]::GetEncoding(28591).GetString($bytes)
$size0 = $bytes.Length
$bak = $Path + '.bak'
if (-not (Test-Path $bak)) { Copy-Item $Path $bak }

# ---- 阶段1：英文 -> 中文 ----
$applied = 0; $skipped = 0; $failed = 0
foreach ($en in $map.Keys) {
    $zh = $map[$en]
    $i = $latin.IndexOf($en, [System.StringComparison]::Ordinal)
    if ($i -lt 0) { Write-Host ("skip   {0} (已替换或未找到)" -f $en); $skipped++; continue }
    $zhBytes = [System.Text.Encoding]::UTF8.GetBytes($zh)
    if ($zhBytes.Length -gt $en.Length) { Write-Host ("fail   {0}: 中文 {1} 字节 > 原 {2} 字节" -f $en, $zhBytes.Length, $en.Length); $failed++; continue }
    [Array]::Copy($zhBytes, 0, $bytes, $i, $zhBytes.Length)
    $bytes[$i + $zhBytes.Length] = 0
    for ($k = $i + $zhBytes.Length + 1; $k -lt $i + $en.Length; $k++) { $bytes[$k] = 0 }
    Write-Host ("name   {0} -> {1} @{2}" -f $en, $zh, $i)
    $applied++
}

# ---- 阶段2：ZoneName 指向 AreaName ----
$recordCount = [BitConverter]::ToUInt32($bytes, 4)
$fieldCount  = [BitConverter]::ToUInt32($bytes, 8)
$recordSize  = [BitConverter]::ToUInt32($bytes, 12)
$strSize     = [BitConverter]::ToUInt32($bytes, 16)
$recStart    = 84 + $fieldCount * 4
$strStart    = $recStart + $recordCount * $recordSize

function Get-Db2String([int]$off) {
    if ($off -ge $strSize) { return '' }
    $end = $strStart + $off
    while ($bytes[$end] -ne 0) { $end++ }
    return [System.Text.Encoding]::UTF8.GetString($bytes, $strStart + $off, $end - $strStart - $off)
}

$aligned = 0
for ($r = 0; $r -lt $recordCount; $r++) {
    $o = $recStart + $r * $recordSize
    $zoff = [BitConverter]::ToUInt32($bytes, $o)
    $aoff = [BitConverter]::ToUInt32($bytes, $o + 4)
    if ($zoff -eq $aoff) { continue }
    if ((Get-Db2String $aoff) -notmatch '[\u4e00-\u9fff]') { continue }
    [Array]::Copy([BitConverter]::GetBytes($aoff), 0, $bytes, $o, 4)
    $aligned++
}
Write-Host ("align  ZoneName->AreaName: {0} 条" -f $aligned)

if ($applied -gt 0 -or $aligned -gt 0) { [System.IO.File]::WriteAllBytes($Path, $bytes) }
if ((Get-Item $Path).Length -ne $size0) { throw "文件大小变化，已中止 (请用 $bak 还原)" }
Write-Host ("done: renamed={0} skipped={1} failed={2} aligned={3} size={4}" -f $applied, $skipped, $failed, $aligned, $size0)
if ($failed -gt 0) { exit 1 }
