# Sync skills from template repo to local agent directories
# For users who have both Claude Code and Codex installed

$ErrorActionPreference = "Stop"

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$repoRoot  = Split-Path -Parent $scriptDir

$targets = @{
    en = @(
        @{ Source = "templates\en\claude\CLAUDE.md"; Dest = "$env:USERPROFILE\.claude\CLAUDE.md" }
        @{ Source = "templates\en\codex\AGENTS.md";  Dest = "$env:USERPROFILE\.codex\AGENTS.md" }
    )
    zh = @(
        @{ Source = "templates\zh\claude\CLAUDE.md"; Dest = "$env:USERPROFILE\.claude\CLAUDE.md" }
        @{ Source = "templates\zh\codex\AGENTS.md";  Dest = "$env:USERPROFILE\.codex\AGENTS.md" }
    )
}

Write-Host "Agent Skill Router - Sync All"
Write-Host "-----------------------------"
Write-Host "Available: en, zh"
Write-Host ""

$lang = Read-Host "Enter language (en/zh)"

if (-not $targets.ContainsKey($lang)) {
    Write-Host "[Error] Invalid language: $lang"
    exit 1
}

foreach ($t in $targets[$lang]) {
    $src  = Join-Path $repoRoot $t.Source
    $destDir = Split-Path -Parent $t.Dest
    New-Item -ItemType Directory -Force -Path $destDir | Out-Null
    Copy-Item -Path $src -Destination $t.Dest -Force
    Write-Host "[OK] $($t.Source) -> $($t.Dest)"
}

# Copy shared skills
$sharedSrc  = Join-Path $repoRoot "templates\$lang\shared"
$sharedDest = Join-Path $env:USERPROFILE ".agents\skills\shared"
Get-ChildItem -Path $sharedSrc -Recurse -File | ForEach-Object {
    $relative = $_.FullName.Substring($sharedSrc.Length + 1)
    $dest = Join-Path $sharedDest $relative
    $destDir = Split-Path -Parent $dest
    New-Item -ItemType Directory -Force -Path $destDir | Out-Null
    Copy-Item -Path $_.FullName -Destination $dest -Force
}
Write-Host "[OK] Shared skills synced"
Write-Host "Sync complete."
