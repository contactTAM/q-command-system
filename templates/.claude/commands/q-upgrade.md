---
description: Upgrade to latest Q-Command System version
---

# Upgrade Q-Command System

**Purpose:** Check current version, compare with latest, and upgrade with changelog-driven guidance.

## Step 1: Check Current Version

Read the local version file:

```bash
cat .q-system/version 2>/dev/null || echo "unknown"
```

**If version file missing:** Assume pre-2.1 installation (version file added in 2.1)

## Step 2: Fetch Latest Version

Fetch the latest version from GitHub:

```
https://raw.githubusercontent.com/contactTAM/q-command-system/main/templates/.q-system/version
```

## Step 3: Compare Versions

Display comparison:

```
=== Q-Command System Version Check ===

Your version:   [local version or "unknown (pre-2.1)"]
Latest version: [fetched version]

Status: [Up to date / Upgrade available]
```

**If up to date:** Report success and exit.

**If upgrade available:** Continue to Step 4.

## Step 4: Fetch and Show Changelog

Fetch the CHANGELOG from GitHub:

```
https://raw.githubusercontent.com/contactTAM/q-command-system/main/CHANGELOG.md
```

Parse and show relevant changes between current version and latest:

```
=== Changes Since Your Version ===

## [2.1.0] - 2025-11-30
- [Summary of changes]
- [New features]
- [Breaking changes if any]

[Additional versions if multiple upgrades needed]
```

## Step 5: Show Upgrade Plan

Based on changelog, show what will be updated:

```
=== Upgrade Plan ===

Files to update:
- .claude/commands/*.md (14 command files)
- .q-system/version
- .q-system/docs/* (documentation)

Files preserved (never touched):
- .q-system/session-notes/*
- .q-system/transcripts/*
- .q-system/checkpoints/*
- .q-system/config.md (your preferences)
- CLAUDE.md (your customizations)

Backup will be created at:
- .claude/commands-backup-YYYY-MM-DD/
```

## Step 6: Get Permission

Ask explicit permission:

```
Proceed with upgrade?

This will:
1. Backup your current commands to .claude/commands-backup-YYYY-MM-DD/
2. Fetch latest command files from GitHub
3. Update .q-system/version
4. Update documentation in .q-system/docs/

Your session files and customizations will NOT be touched.

Type 'yes' to proceed, 'no' to cancel:
```

## Step 7: Execute Upgrade

If user confirms:

### 7a. Create Backup

```bash
cp -r .claude/commands .claude/commands-backup-$(date +%Y-%m-%d)
```

### 7b. Fetch All Command Files

Fetch each file from:
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
- q-setup.md
- q-upgrade.md

### 7c. Update Version File

Fetch and write:
```
https://raw.githubusercontent.com/contactTAM/q-command-system/main/templates/.q-system/version
```

### 7d. Update Documentation (Optional)

Ask if user wants to update docs:

```
Update documentation in .q-system/docs/?
(Your existing docs may have local notes - this will replace them)

[yes/no]:
```

If yes, fetch:
- .q-system/docs/features.md
- .q-system/docs/workflow.md
- .q-system/docs/context-management.md
- .q-system/docs/install/*.md

### 7e. Verify

Confirm all files were written successfully.

## Step 8: Report Success

```
=== Upgrade Complete ===

Previous version: [old]
New version: [new]

Updated:
- .claude/commands/ (14 files)
- .q-system/version
- .q-system/docs/ (if selected)

Backup created:
- .claude/commands-backup-YYYY-MM-DD/

Preserved (untouched):
- .q-system/session-notes/
- .q-system/transcripts/
- .q-system/checkpoints/
- .q-system/config.md
- CLAUDE.md

Key changes in this version:
[Summary from changelog]

IMPORTANT: Restart Claude Code to load the new commands.
(Close terminal and run 'claude' again)

Run /q-begin to verify everything works!
```

## Error Handling

- **If fetch fails:** Report which file failed, offer to retry or skip
- **If write fails:** Report error, suggest checking permissions
- **If backup fails:** Abort upgrade, don't overwrite without backup
- **Never delete:** User's custom commands (non q-* files) are preserved

## Rollback

If upgrade causes issues, user can restore:

```bash
rm -rf .claude/commands
mv .claude/commands-backup-YYYY-MM-DD .claude/commands
```

## When to Use

- Check for updates periodically (monthly recommended)
- After seeing announcement of new version
- When commands seem outdated or missing features
- When docs reference features you don't have

## See Also

- [CHANGELOG.md](https://github.com/contactTAM/q-command-system/blob/main/CHANGELOG.md) - Version history
- `/q-setup` - Configure Q-Command System
- `/q-status` - Check current session state
