---
description: Verify session files were created correctly
version: 2.1.2
---

# Verify Session Files

**Purpose:** Check that /q-end, /q-checkpoint, or /q-save worked correctly.

## Step 1: Check Transcripts

```bash
ls -la .q-system/transcripts/*$(date +%Y-%m-%d)* 2>/dev/null
```

For each file found:
- Show filename
- Show creation time
- Show line count: `wc -l [file]`

## Step 2: Check Session Notes

```bash
ls -la .q-system/session-notes/*$(date +%Y-%m-%d)* 2>/dev/null
```

For each file found:
- Show filename
- Show creation time
- Show line count

## Step 3: Check Checkpoints

```bash
ls -la .q-system/checkpoints/*$(date +%Y-%m-%d)* 2>/dev/null
```

List all checkpoints from today with times.

## Step 4: Check Git Status

```bash
git status
git log -1 --format="%h %s (%cr)"
```

Show:
- Clean working tree or uncommitted changes
- Last commit hash, message, and time

## Step 5: Report

```
=== Verification Report ===

Transcripts:
[Found/None] .q-system/transcripts/[filename]
  - Created: [time]
  - Size: [N] lines

Session Notes:
[Found/None] .q-system/session-notes/[filename]
  - Created: [time]
  - Size: [N] lines

Checkpoints:
[N] checkpoint(s) from today:
  - [filename] ([time])

Git:
- Working tree: [clean/dirty]
- Last commit: [hash] "[message]" ([time])
- Ahead of origin: [N] commit(s)

Status: [All Clear / Issues Detected]

[If issues, list what's missing or problematic]
```

---

**When to use:**
- After /q-end to confirm it worked
- After /q-checkpoint to verify save
- After /q-save to see what was captured
- When resuming to see what exists from previous work
