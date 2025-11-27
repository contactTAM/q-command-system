---
description: Upgrade to latest Q-Command System version
---

# Upgrade Q-Command System

**Purpose:** Check current version and guide upgrade to latest Q-Command System.

## Process

### Step 1: Read Current Version

1. Read `GeneratedMDs/SHORTCUTS.md`
2. Find version line: `**Version:** X.X.X`
3. Report to user:

```text
Current Q-Command System version: [version]
Installed at: GeneratedMDs/SHORTCUTS.md
```

### Step 2: Ask for Latest Version

```text
To check for upgrades, I need the latest version.

Option A: Tell me the latest version number (if you know it)
Option B: Paste the header of the new SHORTCUTS.md (first 10 lines)
Option C: Provide path to downloaded SHORTCUTS.md file

Which would you like to do?
```

### Step 3: Compare Versions

- If current >= latest: "You're up to date!" → Stop
- If current < latest: Continue to Step 4

### Step 4: Check for Custom Commands

1. Read current SHORTCUTS.md
2. Identify standard commands (Q-BEGIN, Q-END, etc.)
3. Find any additional `## Q-` sections (custom commands)

```text
=== Upgrade Analysis ===

Current version: [X.X]
Latest version: [Y.Y]

Custom commands found: [N]
[List or "None"]
```

### Step 5: Offer Upgrade Options

```text
How would you like to proceed?

Option 1: Full replacement (if no custom commands)
   - Replace SHORTCUTS.md entirely
   - Fast and clean

Option 2: Guided merge (if you have custom commands)
   - Update standard commands
   - Preserve your custom commands

Option 3: Manual upgrade
   - I'll show what changed
   - You make the edits
```

### Step 6: Execute Upgrade

**Full replacement:**
1. Back up current: `GeneratedMDs/SHORTCUTS-backup-YYYY-MM-DD.md`
2. Replace with new content
3. Verify

**Guided merge:**
1. Back up current
2. Start with new version
3. Append user's custom commands
4. Verify

**Manual:**
1. Show what's new
2. Explain each change
3. Guide user through edits

### Step 7: Report

```text
=== Upgrade Complete ===

Previous: [X.X] (backed up)
New: [Y.Y]

Custom commands preserved: [list or "N/A"]

Next: Run /q-begin to verify everything works.
```

## Error Handling

- If backup fails: Stop and report
- If write fails: Restore from backup
- Never lose custom commands without permission

## When to Use

- New version of Q-Command System released
- Want to check if you're up to date
- Have custom commands and need safe upgrade

## See Also

- [CHANGELOG.md](../CHANGELOG.md) - What changed in each version
- `/q-setup-domain` - Initial setup
