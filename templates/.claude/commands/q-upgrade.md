---
description: Upgrade to latest Q-Command System version
---

# Upgrade Q-Command System

**Purpose:** Check current version and upgrade to the latest Q-Command System.

## Process

### Step 1: Check Current Version

1. Count files in `.claude/commands/` that start with `q-`
2. Check if key files exist (q-begin.md, q-end.md, etc.)
3. Report to user:

```text
Current Q-Command System installation:
- Location: .claude/commands/
- Command files found: [N]
- Key commands: [present/missing]
```

### Step 2: Fetch Latest Version Info

Fetch the README from the Q-Command System repo:
```
https://raw.githubusercontent.com/contactTAM/q-command-system/main/README.md
```

Look for version information and command count.

### Step 3: Compare and Report

```text
=== Upgrade Analysis ===

Your installation: [N] command files
Latest version: [N] command files

Status: [Up to date / Upgrade available]
```

### Step 4: If Upgrade Available

Ask user:
```text
Would you like to upgrade?

This will:
- Fetch latest command files from GitHub
- Replace your .claude/commands/q-*.md files
- Preserve any custom (non q-*) commands you've added

Proceed? [yes/no]
```

### Step 5: Execute Upgrade

If user confirms:

1. **Backup existing** (optional):
   ```bash
   cp -r .claude/commands .claude/commands-backup-YYYY-MM-DD
   ```

2. **Fetch and install each command file** from:
   ```
   https://raw.githubusercontent.com/contactTAM/q-command-system/main/templates/.claude/commands/
   ```

   Files to fetch:
   - q-begin.md
   - q-end.md
   - q-checkpoint.md
   - q-status.md
   - q-save.md
   - q-verify.md
   - q-commit.md
   - q-compact.md
   - q-dump.md
   - q-learnings.md
   - q-pare.md
   - q-prompts.md
   - q-setup-domain.md
   - q-reconfigure-domain.md
   - q-upgrade.md

3. **Verify** all files were written correctly

### Step 6: Report Success

```text
=== Upgrade Complete ===

Updated: .claude/commands/ (15 files)
Backup: .claude/commands-backup-YYYY-MM-DD/ (if created)

Changes in this version:
[List key changes from CHANGELOG if available]

Run /q-begin to verify everything works.
```

## Error Handling

- If fetch fails: Report which file failed, continue with others
- If write fails: Report error, suggest manual installation
- Never delete user's custom commands (non q-* files)

## When to Use

- Periodically check for updates
- After seeing announcement of new version
- If commands seem outdated or missing features

## See Also

- [CHANGELOG.md](https://github.com/contactTAM/q-command-system/blob/main/CHANGELOG.md) - Version history
- `/q-setup-domain` - Initial domain configuration
