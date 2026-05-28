# .claude — Memory Backup

Claude Code memory files for jharari, backed up to GitHub.

## Structure

```
projects/
  tennis/           ← memory for C:\Users\jharari\Documents\GitHub\tennis
  product-prototypes/ ← memory for C:\Users\jharari\Documents\GitHub\product-prototypes
```

## How it works

The `projects/<name>/` directories are NTFS junction points from:
```
C:\Users\jharari\.claude\projects\<encoded-path>\memory\
  → C:\Users\jharari\Documents\GitHub\.claude\projects\<name>\
```

So when Claude Code writes a memory file, it lands directly in this repo.
A `PostToolUse` hook in `~/.claude/settings.json` then auto-commits and pushes.

## Auto-sync

Handled by `sync.ps1` — called by Claude Code after every Write tool use.
Only fires for `.md` files in `.claude`-related paths; no-ops otherwise.

## Manual sync

```powershell
cd C:\Users\jharari\Documents\GitHub\.claude
git add -A && git commit -m "manual sync" && git push
```
