# Install Chinese templates for Claude Code
# Copies CLAUDE.md and shared skills to the Claude skills directory

$ErrorActionPreference = "Stop"

$scriptDir    = Split-Path -Parent $MyInvocation.MyCommand.Path
$repoRoot     = Split-Path -Parent $scriptDir
$sourceClaude = Join-Path $repoRoot "templates\zh\claude\CLAUDE.md"
$sourceShared = Join-Path $repoRoot "templates\zh\shared"
$targetRoot   = Join-Path $env:USERPROFILE ".claude\skills"
$targetShared = Join-Path $targetRoot "shared"

# Ensure target directories exist
New-Item -ItemType Directory -Force -Path $targetRoot | Out-Null
New-Item -ItemType Directory -Force -Path $targetShared | Out-Null

# Copy CLAUDE.md
Copy-Item -Path $sourceClaude -Destination (Join-Path $env:USERPROFILE ".claude\CLAUDE.md") -Force
Write-Host "[OK] CLAUDE.md"

# Copy shared skill files
Get-ChildItem -Path $sourceShared -Recurse -File | ForEach-Object {
    $relative = $_.FullName.Substring($sourceShared.Length + 1)
    $dest = Join-Path $targetShared $relative
    $destDir = Split-Path -Parent $dest
    New-Item -ItemType Directory -Force -Path $destDir | Out-Null
    Copy-Item -Path $_.FullName -Destination $dest -Force
}
Write-Host "[OK] shared skills $targetShared"
Write-Host ""
