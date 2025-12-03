---
description: Complete session with documentation and commit
version: 2.1.2
---

# End Session

**Purpose:** Complete session documentation and commit all changes.

---

## MANDATORY PRE-FLIGHT CHECKLIST

**STOP. Before proceeding, execute each item in order:**

- [ ] 1. Read this ENTIRE command file top to bottom
- [ ] 2. Confirm you understand all 7 steps
- [ ] 3. You will NOT skip any step
- [ ] 4. You will VERIFY each step before proceeding to the next

**DO NOT PROCEED until you have mentally confirmed all 4 items.**

---

## Step 1: MANDATORY - Gather ALL Prior Work

**CRITICAL: This step is NON-NEGOTIABLE. Execute ALL sub-items.**

### 1.1 Check for Continued Session

```bash
# Look for auto-compact continuation message in conversation
```

- [ ] Search conversation for: "This session is being continued from a previous conversation"
- [ ] If found: The conversation summary contains work BEFORE auto-compact - you MUST include this

### 1.2 MANDATORY: Read ALL Checkpoints From Today

```bash
ls -la .q-system/checkpoints/*$(date +%Y-%m-%d)* 2>/dev/null || echo "No checkpoints today"
```

**EXECUTE the command above. Then:**

- [ ] For EACH checkpoint file found: READ IT COMPLETELY
- [ ] Note accomplishments from each checkpoint
- [ ] Note files changed in each checkpoint
- [ ] Note decisions made in each checkpoint

**If checkpoints exist and you did not read them: STOP and read them NOW.**

### 1.3 Compile Complete Work List

- [ ] Work from conversation summary (if continued session)
- [ ] Work from ALL checkpoints (list each)
- [ ] Work from current conversation (after checkpoints)

**VERIFICATION GATE 1:**
```
I have gathered work from:
- [ ] Conversation summary: [YES/NO/N/A]
- [ ] Checkpoint files read: [list count or "none"]
- [ ] Current conversation: [YES]

TOTAL accomplishments to document: [NUMBER]
```

**DO NOT PROCEED to Step 2 until you have completed this verification.**

---

## Step 2: Generate Timestamp

**EXECUTE this exact command:**

```bash
TIMESTAMP=$(date +"%Y-%m-%d-%H%M") && echo "TIMESTAMP: $TIMESTAMP"
```

- [ ] Command executed
- [ ] Timestamp captured: ____________________
- [ ] Format verified: YYYY-MM-DD-HHMM

**STORE this timestamp. Use it for ALL files in this session.**

---

## Step 3: Determine Participant Name

- [ ] Name already known from conversation: ____________________
- [ ] OR ask user: "What name should I use for the session files?"

**Participant name: ____________________**

---

## Step 4: Create Session Transcript

### 4.1 Create Directory

```bash
mkdir -p .q-system/transcripts
```

- [ ] Directory exists or created

### 4.2 Create Transcript File

**Filename:** `.q-system/transcripts/${TIMESTAMP}-[Name].md`

**MANDATORY content structure:**

```markdown
# Session Transcript: [TIMESTAMP]

**Date:** [YYYY-MM-DD]
**Participant:** [Name]
**Duration:** [X hours Y minutes]
**Type:** [Regular / Continued from auto-compact]
**Checkpoints incorporated:** [N] checkpoint(s)

---

## Prior Work (from checkpoints/summary)

[If continued session or checkpoints exist, document that work FIRST]

### From checkpoint [time]:
- [accomplishments]

### From checkpoint [time]:
- [accomplishments]

---

## Current Session Work

### [Time] - [Topic/Task]
[Description]

### [Time] - [Topic/Task]
[Description]

---

## Summary

### All Accomplishments (Complete List)
- [EVERY accomplishment from ALL sources]

### Files Changed
- Created: [complete list]
- Modified: [complete list]

### Key Decisions
| Decision | Rationale |
|----------|-----------|
| [decision] | [why] |
```

### 4.3 VERIFY Transcript

```bash
ls -la .q-system/transcripts/${TIMESTAMP}* && wc -l .q-system/transcripts/${TIMESTAMP}*
```

- [ ] File exists
- [ ] File has substantial content (>50 lines for real sessions)
- [ ] File includes ALL checkpoint work
- [ ] File includes current session work

**VERIFICATION GATE 2:**
```
Transcript created: .q-system/transcripts/[filename]
- Lines: [N]
- Includes checkpoint work: [YES/NO/N/A]
- Includes current work: [YES]
```

---

## Step 5: Create Session Notes

### 5.1 Create Directory

```bash
mkdir -p .q-system/session-notes
```

### 5.2 Create Session Notes File

**Filename:** `.q-system/session-notes/${TIMESTAMP}-[Name].md`

**MANDATORY content structure:**

```markdown
# Session Notes: [TIMESTAMP]-[Name]

**Summary:** [2-3 sentence summary of ENTIRE session including checkpoint work]

---

## Key Accomplishments

- [Accomplishment 1]
- [Accomplishment 2]
- [Continue for ALL accomplishments]

---

## Decisions Made

| Decision | Rationale |
|----------|-----------|
| [decision] | [why] |

---

## Files Changed

**Created:**
- [file1]
- [file2]

**Modified:**
- [file1]
- [file2]

---

## Next Actions

- [ ] [Action 1]
- [ ] [Action 2]
```

### 5.3 VERIFY Session Notes

```bash
ls -la .q-system/session-notes/${TIMESTAMP}* && wc -l .q-system/session-notes/${TIMESTAMP}*
```

- [ ] File exists
- [ ] File has content (>20 lines)

**VERIFICATION GATE 3:**
```
Session notes created: .q-system/session-notes/[filename]
- Lines: [N]
```

---

## Step 6: Commit All Changes

### 6.1 Stage Changes

```bash
git add .
```

### 6.2 Create Commit

**MANDATORY commit format:**

```bash
git commit -m "$(cat <<'EOF'
[Brief summary - what was accomplished]

- [Point 1]
- [Point 2]
- [Point 3]

Session files:
- .q-system/transcripts/[filename]
- .q-system/session-notes/[filename]

Co-Authored-By: Claude <noreply@anthropic.com>
EOF
)"
```

### 6.3 VERIFY Commit

```bash
git status
```

- [ ] Working tree is clean
- [ ] Commit was created

**VERIFICATION GATE 4:**
```
Committed: [hash]
Working tree: [clean/dirty]
```

---

## Step 7: Final Report

**MANDATORY output format:**

```
=== Session Complete ===

Timestamp: [TIMESTAMP]
Participant: [Name]

Documentation:
- Transcript: .q-system/transcripts/[filename] ([N] lines)
- Session Notes: .q-system/session-notes/[filename] ([N] lines)

Sources incorporated:
- Checkpoints: [N] files
- Conversation summary: [YES/NO]

Git:
- Committed: [hash]
- Files changed: [N]

VERIFICATION CHECKLIST:
[X] All checkpoints read and incorporated
[X] Transcript created with complete history
[X] Session notes created
[X] Changes committed
[X] Working tree clean

Ready to push! Run: git push

---

Did this Q help you get real work done?
- Share it: See SHARE.md for copy/paste templates
- More Qs: the-ai-masters.com/q-marketplace
- Custom Q built for you: the-ai-masters.com
```

---

## Error Handling

**If any step fails:**

1. Report the specific error immediately
2. Do NOT silently skip the step
3. Attempt to complete remaining steps
4. In final report, clearly mark which steps failed
5. Provide manual instructions for failed steps

**Example failure report:**
```
=== Session Complete (WITH ERRORS) ===

FAILED STEPS:
- Step 4: Transcript creation failed - [error message]
  Manual fix: [instructions]

COMPLETED STEPS:
- Step 5: Session notes created
- Step 6: Commit created

Some documentation may be incomplete. Run /q-verify to check.
```

---

## FINAL REMINDER

**Before reporting "Session Complete":**

- [ ] Did I read ALL checkpoints from today? (Step 1.2)
- [ ] Did I use the SAME timestamp for all files? (Step 2)
- [ ] Does the transcript include ALL work sources? (Step 4)
- [ ] Is the commit message descriptive? (Step 6)
- [ ] Did I verify each step? (Gates 1-4)

**If any answer is NO, go back and fix it before reporting.**
