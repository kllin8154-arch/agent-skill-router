# Install English templates for Codex
# Copies AGENTS.md and shared skills to the Codex skills directory

$ErrorActionPreference = "Stop"

$scriptDir   = Split-Path -Parent $MyInvocation.MyCommand.Path
$repoRoot    = Split-Path -Parent $scriptDir
$sourceAgents = Join-Path $repoRoot "templates\en\codex\AGENTS.md"
$sourceShared = Join-Path $repoRoot "templates\en\shared"
$targetRoot   = Join-Path $env:USERPROFILE ".codex\skills"
$targetShared = Join-Path $targetRoot "shared"

# Ensure target directories exist
New-Item -ItemType Directory -Force -Path $targetRoot | Out-Null
New-Item -ItemType Directory -Force -Path $targetShared | Out-Null

# Copy AGENTS.md
Copy-Item -Path $sourceAgents -Destination (Join-Path $env:USERPROFILE ".codex\AGENTS.md") -Force
Write-Host "[OK] Copied AGENTS.md"

# Copy shared skill files
Get-ChildItem -Path $sourceShared -Recurse -File | ForEach-Object {
    $relative = $_.FullName.Substring($sourceShared.Length + 1)
    $dest = Join-Path $targetShared $relative
    $destDir = Split-Path -Parent $dest
    New-Item -ItemType Directory -Force -Path $destDir | Out-Null
    Copy-Item -Path $_.FullName -Destination $dest -Force
}
Write-Host "[OK] Copied shared skills to $targetShared"

Write-Host "Installation complete."
