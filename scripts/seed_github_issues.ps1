# Explicit opt-in task creator. Default is PREVIEW only. Never stores credentials.
param([switch]$Create)
$ErrorActionPreference = 'Stop'
$RepoRoot = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
$Csv = Join-Path $RepoRoot 'docs/tasks.csv'
$Tasks = Import-Csv -LiteralPath $Csv -Encoding UTF8
if (-not $Create) {
  Write-Host "PREVIEW: $($Tasks.Count) GitHub issues would be created. No remote changes." -ForegroundColor Cyan
  $Tasks | Format-Table task_id, phase, title -AutoSize
  Write-Host 'After GitHub repo is connected and gh is authenticated, run: .\scripts\seed_github_issues.ps1 -Create'
  exit 0
}
if (-not (Get-Command gh -ErrorAction SilentlyContinue)) { throw 'GitHub CLI (gh) is missing. Install from https://cli.github.com/ then run gh auth login.' }
& gh auth status
if ($LASTEXITCODE -ne 0) { throw 'Run gh auth login first.' }
Push-Location $RepoRoot
try {
  $repo = (& gh repo view --json nameWithOwner --jq '.nameWithOwner').Trim()
  if ($LASTEXITCODE -ne 0 -or -not $repo) { throw 'No GitHub repository is connected to this folder.' }
  Write-Host "Target repository: $repo" -ForegroundColor Yellow
  $existingJson = & gh issue list --state all --limit 300 --json title
  if ($LASTEXITCODE -ne 0) { throw 'Cannot read existing issues.' }
  $existingTitles = @($existingJson | ConvertFrom-Json | ForEach-Object { $_.title })
  foreach ($t in $Tasks) {
    $title = "$($t.task_id) | $($t.title)"
    if ($existingTitles -contains $title) { Write-Host "SKIP existing: $title"; continue }
    $body = @"
**Phase:** $($t.phase)

**Deliverable:** $($t.deliverable)

**Definition of done:** $($t.done_criteria)

- [ ] Implementation complete
- [ ] Output/metrics/log evidence provided
- [ ] Reviewed and merged into main
"@
    & gh issue create --title $title --body $body
    if ($LASTEXITCODE -ne 0) { throw "Creation failed: $title" }
  }
} finally { Pop-Location }
