---
description: Create session transcript manually
version: 2.1.2
---

# Dump Session Transcript

**Purpose:** Create a session transcript without the full /q-end workflow.

## Step 1: Check for Continued Sessions

1. Look for: "This session is being continued from a previous conversation"
2. If present, the conversation summary contains work before auto-compact
3. You MUST document the ENTIRE session (summary + current context)

## Step 2: Determine Session Start Time

- **Regular session:** Use current session start time
- **Continued session:** Use ORIGINAL session start time from summary

## Step 3: Generate Timestamp

```bash
TIMESTAMP=$(date +"%Y-%m-%d-%H%M")
```

## Step 4: Create Transcript Directory

```bash
mkdir -p .q-system/transcripts
```

## Step 5: Determine Participant Name

Use known name or ask user.

## Step 6: Create Transcript File

Create `.q-system/transcripts/${TIMESTAMP}-[Name].md`:

```markdown
# Session Transcript: [TIMESTAMP]

**Date:** [YYYY-MM-DD]
**Participant:** [Name]
**Duration:** [X hours Y minutes]
**Type:** [Regular / Continued from auto-compact]

---

## Session Flow

### [Time] - [Topic/Task]

[Description of what was discussed/done]

### [Time] - [Topic/Task]

[Description of what was discussed/done]

[Continue chronologically...]

---

## Summary

### Accomplishments
- [Bullet list]

### Files Changed
- Created: [list]
- Modified: [list]

### Key Decisions
- [Decision]: [Rationale]

### Metrics
- Duration: [X hours Y minutes]
- Files changed: [N]
- Commits: [N]
```

## Step 7: Verify and Report

**VERIFY:** File exists and has substantial content (>50 lines for real sessions)

```
Transcript created: .q-system/transcripts/[filename]
  - Duration: [X hours Y minutes]
  - [N] lines documented
```

---

**Difference from /q-end:**
- /q-dump: Only creates transcript
- /q-end: Creates transcript + session notes + commits
