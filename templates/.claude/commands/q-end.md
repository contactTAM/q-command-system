---
description: Complete session with documentation and commit
---

# End Session

**Purpose:** Complete session documentation and commit all changes.

Execute these steps in order with verification:

## Step 1: Check for Continued Sessions

1. Look for message: "This session is being continued from a previous conversation"
2. If present, read conversation summary - it contains work before auto-compact
3. Check for checkpoint files from today in `.q-system/checkpoints/`
4. You MUST document ENTIRE session (summary + checkpoints + current work)

## Step 2: Generate Timestamp

```bash
TIMESTAMP=$(date +"%Y-%m-%d-%H%M")
echo "Timestamp: $TIMESTAMP"
```

Store this timestamp for consistent file naming.

## Step 3: Determine Participant Name

Ask user if not known: "What name should I use for the session files? (e.g., Gabriel, Guy, Fraser)"

## Step 4: Create Session Transcript

1. Create directory: `mkdir -p .q-system/transcripts`
2. Create file: `.q-system/transcripts/${TIMESTAMP}-[Name].md`
3. Document complete session:
   - Session date and duration
   - Chronological flow of work
   - Major accomplishments
   - Files created/modified
   - Key decisions made
4. **VERIFY:** File exists and has content

Report: "Transcript created: .q-system/transcripts/[filename]"

## Step 5: Create Session Notes

1. Create directory: `mkdir -p .q-system/session-notes`
2. Create file: `.q-system/session-notes/${TIMESTAMP}-[Name].md`
3. Include:
   - Summary (2-3 sentences)
   - Key Accomplishments (bullet list)
   - Decisions Made (table: Decision | Rationale)
   - Files Changed (Created / Modified lists)
   - Next Actions (checklist)
4. **VERIFY:** File exists and has content

Report: "Session notes created: .q-system/session-notes/[filename]"

## Step 6: Commit All Changes

1. Stage: `git add .`
2. Commit with message:
   ```
   [Brief summary of session work]

   - Point 1
   - Point 2
   - Point 3

   Co-Authored-By: Claude <noreply@anthropic.com>
   ```
3. **VERIFY:** `git status` shows clean working tree

Report: "Committed: [hash] - [message summary]"

## Step 7: Final Report

```
=== Session Complete ===

Transcript: .q-system/transcripts/[filename]
Session Notes: .q-system/session-notes/[filename]
Git: Committed ([N] files changed)

Ready to push! Run: git push
```

---

**Error Handling:** If any step fails, report the specific error, complete what's possible, and provide manual steps for failed items.
