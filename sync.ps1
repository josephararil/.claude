# sync.ps1 — Auto-syncs Claude memory files to GitHub after each write
# Called by PostToolUse hook in ~/.claude/settings.json

$stdin_text = [System.Console]::In.ReadToEnd()
if (-not $stdin_text) { exit 0 }

try {
    $p = $stdin_text | ConvertFrom-Json -ErrorAction Stop
} catch {
    exit 0
}

# Only act on Write tool calls
if ($p.tool_name -ne "Write") { exit 0 }

$fp = $p.tool_input.file_path

# Only sync .md files in .claude-related paths
if ($fp -notlike "*.md") { exit 0 }
if ($fp -notlike "*\.claude*") { exit 0 }

$repo = "C:\Users\jharari\Documents\GitHub\claude-memory"
if (-not (Test-Path $repo)) { exit 0 }

Push-Location $repo
try {
    git add -A 2>&1 | Out-Null
    $ts = Get-Date -Format "yyyy-MM-dd HH:mm"
    git commit -m "memory: $ts" --quiet 2>&1 | Out-Null
    git push --quiet 2>&1 | Out-Null
} catch {
    # Swallow errors — never block Claude Code
}
Pop-Location
exit 0
