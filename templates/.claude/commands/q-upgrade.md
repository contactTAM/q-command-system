---
description: Upgrade to latest Q-Command System version
version: 2.1.2
---

# Upgrade Q-Command System

**Purpose:** Efficiently check and upgrade to the latest Q-Command System version.

**Efficiency:** This command uses a script-based approach that reduces token usage by ~85% compared to individual file fetches.

---

## MANDATORY PRE-FLIGHT CHECKLIST

**STOP. Before proceeding, confirm:**

- [ ] 1. I will check versions BEFORE making changes
- [ ] 2. I will get explicit user permission before upgrading
- [ ] 3. I will use the upgrade SCRIPT (not individual WebFetch calls)
- [ ] 4. I will verify the upgrade completed successfully

---

## Step 1: Check Local Version

### 1.1 Read Local Version Info

```bash
cat .q-system/version.yaml 2>/dev/null || cat .q-system/version 2>/dev/null || echo "No version file found"
```

- [ ] Command executed
- [ ] Local version identified: ____________________

**Parse the version:**
- If `version.yaml`: Look for `q_system.version`
- If `version` file: Single line with version number
- If neither: Assume pre-2.1 installation

### 1.2 Check for releases.yaml (if exists locally)

```bash
cat .q-system/releases.yaml 2>/dev/null | head -5 || echo "No local releases.yaml"
```

**VERIFICATION GATE 1:**
```
Local installation:
- Version: [version or "unknown"]
- Version file type: [version.yaml / version / none]
```

---

## Step 2: Fetch Remote Version Info

### 2.1 Fetch releases.yaml (Small File - Efficient)

Use WebFetch to get:
```
https://raw.githubusercontent.com/contactTAM/q-command-system/main/templates/releases.yaml
```

- [ ] Fetch attempted
- [ ] Latest version identified: ____________________
- [ ] Commands changed since local version: ____________________

### 2.2 Parse Release Information

From `releases.yaml`, identify:
- `current_version`: The latest available version
- Find releases between local version and current version
- Aggregate `commands_changed` from all intermediate releases
- Note any `breaking_changes` or `migration_notes`

**VERIFICATION GATE 2:**
```
Version comparison:
- Local version:  [local]
- Latest version: [remote]
- Status: [Up to date / Upgrade available]
- Commands changed: [list or "all"]
```

---

## Step 3: Display Upgrade Information

**If already up to date:**

```
=== Q-Command System Version Check ===

Your version:   [version]
Latest version: [version]

Status: Up to date!

No upgrade needed.
```

**STOP HERE if up to date.**

**If upgrade available:**

```
=== Q-Command System Upgrade Available ===

Current version: [local]
Latest version:  [remote]

Changes since your version:

[Version X.Y.Z] - [date]
  - [highlight 1]
  - [highlight 2]

[Version A.B.C] - [date]
  - [highlight 1]
  - [highlight 2]

Commands to update: [N] ([list or "all 14"])
Breaking changes: [Yes/No]
```

---

## Step 4: Show Upgrade Plan

**Determine upgrade mode:**

- **Full upgrade**: If `commands_changed: [all]` in any release, or upgrading from pre-2.1
- **Differential upgrade**: If only specific commands changed

```
=== Upgrade Plan ===

Mode: [Full / Differential]

Will update:
- Commands: [list or "all 14 commands"]
- .q-system/version.yaml
- .q-system/releases.yaml (for future upgrades)

Will preserve:
- .q-system/session-notes/*
- .q-system/transcripts/*
- .q-system/checkpoints/*
- .q-system/config.md
- CLAUDE.md

Backup will be created at:
- .claude/commands-backup-YYYY-MM-DD/
```

---

## Step 5: Get Explicit Permission

**MANDATORY - Ask user:**

```
Proceed with upgrade from [current] to [latest]?

This will run a script that:
1. Creates backup of current commands
2. Downloads [N] command files via curl
3. Updates version.yaml and releases.yaml

Your session files and CLAUDE.md will NOT be touched.

Type 'yes' to proceed, 'no' to cancel:
```

- [ ] Permission requested
- [ ] User responded: ____________________

**If user says 'no':** Report "Upgrade cancelled" and exit.

---

## Step 6: Execute Upgrade (EFFICIENT)

**CRITICAL: Use the script for efficiency. Do NOT use individual WebFetch calls.**

### 6.1 Full Upgrade (All Commands)

```bash
curl -sL https://raw.githubusercontent.com/contactTAM/q-command-system/main/scripts/upgrade.sh | bash
```

### 6.2 Differential Upgrade (Specific Commands)

```bash
curl -sL https://raw.githubusercontent.com/contactTAM/q-command-system/main/scripts/upgrade.sh | bash -s -- [command1] [command2] [command3]
```

**Example for v2.1.0 → v2.1.1:**
```bash
curl -sL https://raw.githubusercontent.com/contactTAM/q-command-system/main/scripts/upgrade.sh | bash -s -- q-begin q-checkpoint q-end q-save q-setup q-upgrade
```

- [ ] Upgrade script executed
- [ ] Script output shows success

**VERIFICATION GATE 3:**
```
Script execution:
- Exit status: [0 = success]
- Commands updated: [N]
- Backup created: [path]
```

---

## Step 7: Update Upgrade History

**Append to `.q-system/version.yaml` upgrade_history:**

Read current version.yaml, then update the `upgrade_history` section:

```yaml
upgrade_history:
  - from: "[OLD_VERSION]"
    to: "[NEW_VERSION]"
    date: "[ISO 8601 TIMESTAMP]"
    mode: "[full/differential]"
    commands_updated:
      - [list of commands]
```

- [ ] Upgrade history appended

---

## Step 8: Verify Upgrade

```bash
cat .q-system/version.yaml | head -10
head -5 .claude/commands/q-end.md
```

- [ ] version.yaml shows new version
- [ ] Command files have new version in frontmatter

**VERIFICATION GATE 4:**
```
Verification:
- version.yaml version: [version]
- Command version headers: [match/mismatch]
- Backup exists: [yes/no]
```

---

## Step 9: Final Report

**MANDATORY output format:**

```
=== Upgrade Complete ===

Previous version: [old]
New version:      [new]
Mode:             [Full/Differential]

Updated:
- Commands: [N] files
- version.yaml
- releases.yaml

Backup created:
- .claude/commands-backup-YYYY-MM-DD/

Preserved (untouched):
- .q-system/session-notes/
- .q-system/transcripts/
- .q-system/checkpoints/
- .q-system/config.md
- CLAUDE.md

Key changes in this version:
[From releases.yaml highlights]

IMPORTANT: Restart Claude Code to load new commands.
(Close terminal and run 'claude' again)

Run /q-begin to verify everything works!
```

---

## Error Handling

**If script execution fails:**

1. Check the error message from curl/bash
2. Verify internet connectivity
3. Try running the script URL directly in browser
4. If persistent, fall back to manual upgrade:
   - Download files manually from GitHub
   - Copy to .claude/commands/

**If backup fails:**

1. ABORT upgrade immediately
2. Report: "Backup failed - upgrade aborted for safety"
3. Do NOT proceed without backup

---

## Rollback Instructions

If upgrade causes issues:

```bash
# Remove new commands
rm -rf .claude/commands

# Restore from backup
mv .claude/commands-backup-YYYY-MM-DD .claude/commands

# Restart Claude Code
```

---

## Efficiency Notes

**Why this approach is efficient:**

| Method | Operations | Tokens |
|--------|------------|--------|
| Old: Individual WebFetch | 16 fetches + 14 writes | High |
| New: Script-based | 1 WebFetch + 1 Bash | ~85% less |

The upgrade script uses native `curl` which is:
- Faster (parallel-capable)
- More reliable (no Claude overhead)
- Token-efficient (single operation)

---

## FINAL CHECKLIST

Before reporting "Upgrade Complete":

- [ ] User gave explicit permission
- [ ] Upgrade script executed successfully
- [ ] Upgrade history updated in version.yaml
- [ ] New version verified in files
- [ ] User told to restart Claude Code

**If any item is unchecked, address it before completing.**
