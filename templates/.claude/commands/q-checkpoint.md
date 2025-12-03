---
description: Save mid-session progress snapshot
version: 2.1.2
---

# Checkpoint

**Purpose:** Save progress mid-session as insurance against auto-compact or crashes.

---

## MANDATORY PRE-FLIGHT CHECKLIST

**STOP. Before proceeding, confirm:**

- [ ] 1. I will generate and USE the timestamp
- [ ] 2. I will document ALL work done since session start or last checkpoint
- [ ] 3. I will VERIFY the file was created

---

## Step 1: Generate Timestamp

**EXECUTE this exact command:**

```bash
CHECKPOINT_TIME=$(date +"%Y-%m-%d-%H%M") && echo "CHECKPOINT_TIME: $CHECKPOINT_TIME"
```

- [ ] Command executed
- [ ] Timestamp captured: ____________________
- [ ] Format verified: YYYY-MM-DD-HHMM

**STORE this timestamp. Use it for the checkpoint filename.**

---

## Step 2: Create Checkpoint Directory

```bash
mkdir -p .q-system/checkpoints
```

- [ ] Directory exists or created

---

## Step 3: Determine Participant Name

- [ ] Name known from session: ____________________
- [ ] OR ask user: "What name should I use for the checkpoint file?"

**Participant name: ____________________**

---

## Step 4: Gather All Work Since Last Save Point

**MANDATORY: Review and document ALL of the following:**

### 4.1 Accomplishments

- [ ] List every task completed
- [ ] List every file created
- [ ] List every file modified
- [ ] List every bug fixed

### 4.2 Decisions Made

- [ ] List every decision made
- [ ] Note rationale for each

### 4.3 Current State

- [ ] What are you working on RIGHT NOW?
- [ ] What is partially complete?
- [ ] What remains to be done?

**VERIFICATION GATE 1:**
```
Work to document:
- Accomplishments: [N] items
- Files changed: [N] files
- Decisions: [N] decisions
- Current task: [description]
```

---

## Step 5: Create Checkpoint File

**Filename:** `.q-system/checkpoints/${CHECKPOINT_TIME}-[Name].md`

**MANDATORY content structure:**

```markdown
# Checkpoint: [CHECKPOINT_TIME]-[Name]

**Session started:** [time if known]
**Checkpoint time:** [CHECKPOINT_TIME]
**Participant:** [Name]

---

## Accomplishments So Far

- [Accomplishment 1]
- [Accomplishment 2]
- [Continue for ALL accomplishments]

---

## Files Changed

**Created:**
- [file1]
- [file2]

**Modified:**
- [file1]
- [file2]

---

## Key Decisions

| Decision | Rationale |
|----------|-----------|
| [decision] | [why] |

---

## Current Status

**Working on:** [what you're doing right now]
**Partially complete:** [what's in progress]

---

## Next Steps

- [ ] [Next task 1]
- [ ] [Next task 2]
- [ ] [Continue for remaining work]
```

- [ ] File created with ALL sections filled in
- [ ] No placeholder text remaining

---

## Step 6: VERIFY Checkpoint

**EXECUTE:**

```bash
ls -la .q-system/checkpoints/${CHECKPOINT_TIME}* && wc -l .q-system/checkpoints/${CHECKPOINT_TIME}*
```

- [ ] File exists
- [ ] File has substantial content (>30 lines)
- [ ] Filename matches timestamp

**VERIFICATION GATE 2:**
```
Checkpoint created: .q-system/checkpoints/[filename]
- Lines: [N]
- Timestamp matches: [YES]
```

---

## Step 7: Report to User

**MANDATORY output format:**

```
=== Checkpoint Saved ===

Time: [HH:MM]
File: .q-system/checkpoints/[filename]
Lines: [N]

Progress preserved:
- Accomplishments: [N] items documented
- Files tracked: [N] files
- Decisions logged: [N] decisions

Insurance status: PROTECTED
(If auto-compact occurs, /q-end will incorporate this checkpoint)

Continue working - checkpoint is your safety net.

---
More Qs: the-ai-masters.com/q-marketplace
```

---

## Error Handling

**If file creation fails:**

1. Report the specific error
2. Attempt alternative location
3. If all fails, display checkpoint content in chat for manual save

---

## FINAL CHECKLIST

Before reporting "Checkpoint Saved":

- [ ] Timestamp generated and used correctly
- [ ] All work since last save point documented
- [ ] File verified to exist with content
- [ ] User notified with file location

**If any item is unchecked, go back and complete it.**

---

## When to Use /q-checkpoint

**Proactively use when:**
- 60+ minutes since session start (without checkpoint)
- 60+ minutes since last checkpoint
- Completing a major milestone
- Context usage feels high (>70%)
- Before risky operations
- Before taking a break

**The checkpoint is your insurance policy. Use it liberally.**
