---
description: Save mid-session progress snapshot
---

# Checkpoint

**Purpose:** Save progress mid-session as insurance against auto-compact or crashes.

## Step 1: Generate Timestamp

```bash
CHECKPOINT_TIME=$(date +"%Y-%m-%d-%H%M")
echo "Checkpoint time: $CHECKPOINT_TIME"
```

## Step 2: Create Checkpoint Directory

```bash
mkdir -p .q-system/checkpoints
```

## Step 3: Determine Participant Name

Use the same name as other session files, or ask user if unknown.

## Step 4: Create Checkpoint File

Create `.q-system/checkpoints/${CHECKPOINT_TIME}-[Name].md` with:

```markdown
# Checkpoint: [CHECKPOINT_TIME]

**Session started:** [original start time if known]
**Checkpoint time:** [current time]
**Participant:** [Name]

## Accomplishments So Far

- [Bullet list of work completed]

## Files Created/Modified

- [List of files]

## Key Decisions

- [Important decisions made]

## Current Status

[What you're working on right now]

## Next Steps

- [What remains to be done]
```

## Step 5: Verify and Report

**VERIFY:** File exists in `.q-system/checkpoints/`

Report:
```
Checkpoint saved at [HH:MM]

Location: .q-system/checkpoints/[filename]
Progress preserved (insurance against auto-compact)

Continue working - /q-end will merge checkpoint + final work.
```

---

**When to use:**
- Every 90 minutes in long sessions
- After completing major milestone
- When context usage feels high
- Before risky operations
