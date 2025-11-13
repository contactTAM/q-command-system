# SHORTCUTS.md

This file contains custom shortcut commands for this repository.

**Last Updated:** 2025-11-13
**Version:** 2.0 (Robust context-aware system)

---

## FILE NAMING CONVENTIONS

All generated files follow consistent naming to prevent collisions when multiple team members work on the same day:

**Format:** `YYYY-MM-DD-HHmm-[PersonName].md`
- `YYYY-MM-DD`: Date (sortable)
- `HHmm`: 24-hour time (no colon, underscore removed for consistency)
- `[PersonName]`: Gabriel, Guy, Fraser, or Brian

**Examples:**
- `2025-11-13-0913-Gabriel.md` (Gabriel's session starting at 9:13 AM)
- `2025-11-13-1200-Guy.md` (Guy's session starting at 12:00 PM)
- `2025-11-13-1430-Fraser.md` (Fraser's session starting at 2:30 PM)

**Benefits:**
- Sortable by date and time
- No file name collisions
- Clear who worked when
- Multiple people can work same day

---

## DIRECTORY STRUCTURE

```
GeneratedMDs/
  transcripts/
    2025-11-13-0913-Gabriel.md    ← Session transcripts
    2025-11-13-1200-Guy.md

  checkpoints/
    2025-11-13-1130-Gabriel.md    ← Mid-session checkpoints
    2025-11-13-1345-Guy.md

  session-notes/
    2025-11-13-0913-Gabriel.md    ← Session summaries
    2025-11-13-1200-Guy.md

  SHORTCUTS.md                     ← This file (metadata at root)
```

**Why this structure:**
- All generated files organized by type
- Easy to find files by person or date
- Clear separation of concerns
- Consistent naming across all types

---

## Q-COMMIT

When the user types `Q-COMMIT`:

1. Save all unsaved changes anywhere in the codebase
2. Stage all changes (`git add .`)
3. Commit all changes to local git with a concise message and point-form highlights of changes
4. Include co-author attribution: `Co-Authored-By: Claude <noreply@anthropic.com>`
5. Do NOT push to remote unless explicitly requested

Example commit message format:
```
Brief summary of changes

- Point 1: description
- Point 2: description
- Point 3: description

Co-Authored-By: Claude <noreply@anthropic.com>
```

**Verification:**
- After commit, verify with `git status` (should show clean working tree)
- Report commit hash and message to user

---

## Q-DUMP

When the user types `Q-DUMP`:

**STEP 1: Check for Continued Sessions (CRITICAL)**

1. Look for message: "This session is being continued from a previous conversation"
2. If present, this is a **continued session** - conversation history was auto-compacted
3. The conversation summary contains ALL work from before auto-compact
4. You MUST document the ENTIRE session (summary + current context) as ONE unified session

**STEP 2: Determine Session Start Time**

- **Regular session:** Use current session start time
- **Continued session:** Use original session start time from conversation summary
- Example: If session started 7:00 AM, auto-compacted at 8:30 AM, continued until 9:15 AM → Use 7:00 AM as start time

**STEP 3: Create Session Transcript File**

1. Create subdirectory if needed: `GeneratedMDs/transcripts/` (use Bash: `mkdir -p`)
2. **File naming format: `GeneratedMDs/transcripts/YYYY-MM-DD-HHmm-[PersonName].md`**
   - Example: `GeneratedMDs/transcripts/2025-11-13-0913-Gabriel.md`
   - Use ORIGINAL session start time (not continuation time)
   - Use actual participant's name (Gabriel, Guy, Fraser, Brian)
   - 24-hour time format with NO colon (0913, not 09:13)
   - ALWAYS follow this exact format

**STEP 4: Document Complete Session**

**For CONTINUED sessions:**
- Read conversation summary thoroughly
- Document ALL accomplishments from summary
- Add accomplishments from current context
- Include ALL files created/modified throughout entire session
- Calculate total session duration (start to now)
- Treat as ONE unified session, not "previous + current"

**For REGULAR sessions:**
- Document current conversation in chronological order
- Each user command/prompt
- Concise summary of actions taken or answers provided

**STEP 5: Content Requirements**

- Major accomplishments (all, including from summary if continued)
- Files created/modified (complete list)
- Key decisions made (throughout entire session)
- Conversation flow summary
- Session metrics (duration, deliverables, etc.)
- Format as clear development log/transcript
- Reference code effects, don't include full code blocks

**STEP 6: Verification**

- ✅ VERIFY: File exists at correct path
- ✅ VERIFY: File has content >100 lines (for substantial sessions)
- Report to user: "✅ Transcript created: GeneratedMDs/transcripts/[filename]"

**WARNING:** If you document only current context in a continued session, you will lose all major work from before auto-compact. This is a CRITICAL failure. Always check for continuation first.

---

## Q-LEARNINGS

When the user types `Q-LEARNINGS`:

1. Summarize in the chat (not in a file) the key learnings discovered during the current session
2. Focus on insights, decisions, best practices, or important discoveries made
3. Present as a concise bulleted list
4. Include both technical and workflow/process learnings

---

## Q-BEGIN

When the user types `Q-BEGIN`:

1. Read `CLAUDE.md` for quick context refresh
2. Review the most recent session notes from `GeneratedMDs/session-notes/`
   - Look for files matching current user's name: `*-[PersonName].md`
   - Sort by date/time, read most recent
3. Review current status from `work-plan/work-plan.md`:
   - Check blocker status
   - Review recent progress
   - Identify pending tasks
4. Provide a brief summary:
   - What was accomplished last session
   - Current blocker status
   - Open questions or decisions needed
5. Ask the user: "What would you like to work on today?"
6. Set up TodoWrite if the work involves multiple tasks

**Purpose:** Start each session with full context and clear direction.

---

## Q-END

When the user types `Q-END`:

**CRITICAL: This is a multi-step operation with verification. Execute each step completely before proceeding.**

**STEP 1: Check for Continued Sessions**

1. Look for message: "This session is being continued from a previous conversation"
2. If present, read conversation summary thoroughly - it contains all work before auto-compact
3. Check for any Q-CHECKPOINT files from this session - merge that information too
4. You MUST document ENTIRE session (summary + checkpoints + current context) as ONE unified session

**STEP 2: Create Session Transcript**

1. Create subdirectory if needed: `mkdir -p "GeneratedMDs/transcripts"`
2. Determine session start time and participant name
3. Create file: `GeneratedMDs/transcripts/YYYY-MM-DD-HHmm-[PersonName].md`
   - Use ORIGINAL session start time (if continued)
   - Document ALL work including from summary and checkpoints
4. Write complete transcript following Q-DUMP specifications
5. ✅ VERIFY: File exists and has substantial content
6. Report to user: "✅ Transcript created: [filename]"

**STEP 3: Create Session Notes**

1. Create subdirectory if needed: `mkdir -p "GeneratedMDs/session-notes"`
2. Create file: `GeneratedMDs/session-notes/YYYY-MM-DD-HHmm-[PersonName].md`
3. Write session summary including:
   - Key accomplishments (ALL from entire session)
   - Decisions made (ALL)
   - Files created/modified (ALL)
   - Blocker status updates
   - Open questions
   - Next steps
4. ✅ VERIFY: File exists and has content
5. Report to user: "✅ Session notes created: [filename]"

**STEP 4: Update Work Plan** (if applicable)

1. Check if blockers changed or milestones completed
2. If yes: Update `work-plan/work-plan.md`
   - Update blocker status
   - Add completed milestones
   - Document new decisions or action items
   - Add to Recent Progress section if significant work done
3. ✅ VERIFY: Changes saved (if updated)
4. Report to user: "✅ Work plan updated" or "ℹ️ Work plan unchanged"

**STEP 5: Commit All Changes**

1. Stage all changes: `git add .`
2. Commit with descriptive message + bullets
3. Include: `Co-Authored-By: Claude <noreply@anthropic.com>`
4. ✅ VERIFY: `git status` shows clean working tree
5. Report commit hash and message to user: "✅ Changes committed: [message]"

**STEP 6: Final Report**

1. Show user summary of what was created:
   ```
   ✅ Session Complete!

   Transcript: GeneratedMDs/transcripts/[filename]
   Session Notes: GeneratedMDs/session-notes/[filename]
   Work Plan: [Updated/Unchanged]
   Git: Committed ([N] files changed)

   Ready to push! Run `git push` when ready.
   ```

**ERROR HANDLING:**

If any step fails:
1. Report specific error to user immediately
2. Don't continue silently
3. Complete what is possible
4. Report clearly what succeeded vs what failed
5. Provide manual steps for failed items

**Purpose:** Systematically wrap up session with all documentation updated and changes committed locally.

**Note:** User maintains control - `git push` is always manual.

---

## Q-SAVE

When the user types `Q-SAVE`:

**Purpose:** Lightweight session wrap-up when context is constrained or quick exit needed.

**What it does:**

1. Create basic transcript in `GeneratedMDs/transcripts/YYYY-MM-DD-HHmm-[PersonName].md`
   - Lightweight version (key accomplishments + files changed)
   - Skip detailed chronology
2. Commit all changes (Q-COMMIT)
3. Report to user:
   ```
   ✅ Quick Save Complete!

   Transcript: GeneratedMDs/transcripts/[filename]
   Git: Committed

   Note: Skipped session notes and work plan updates.
   Run Q-VERIFY to see what was saved.
   ```

**What it skips:**
- Detailed session notes (user can add later if needed)
- Work plan updates (user can do manually)

**When to use:**
- Context usage >90%
- Need to wrap up quickly
- Don't need comprehensive documentation
- Emergency exit scenario

---

## Q-CHECKPOINT

When the user types `Q-CHECKPOINT`:

**Purpose:** Create mid-session progress snapshot as insurance against auto-compact information loss.

**When to use:**
- Context usage getting high (conversation slowing, responses taking longer)
- After completing major milestone mid-session
- Before starting next big chunk of work
- User wants insurance that work won't be lost if auto-compact happens

**What to do:**

**STEP 1: Create checkpoint directory if needed**
```bash
mkdir -p "GeneratedMDs/checkpoints"
```

**STEP 2: Create checkpoint file**
- Format: `GeneratedMDs/checkpoints/YYYY-MM-DD-HHmm-[PersonName].md`
- Example: `GeneratedMDs/checkpoints/2025-11-13-1130-Gabriel.md`
- Use current time for checkpoint (NOT session start time)

**STEP 3: Document in checkpoint file**
- Session start time (when session originally began)
- Checkpoint time (current time)
- Accomplishments so far (bullet list)
- Files created/modified (list)
- Key decisions made
- Current status/next steps
- Estimated context usage (if known)

**STEP 4: Keep it lightweight**
- High-level summaries, not full details
- Focus on "what" not "how"
- Typically 100-200 lines, not 500+

**STEP 5: Verification**
- ✅ VERIFY: File exists in GeneratedMDs/checkpoints/
- ✅ VERIFY: File has content
- Report to user:
  ```
  ✅ Checkpoint saved at [HH:MM]

  Location: GeneratedMDs/checkpoints/[filename]
  Session progress preserved (insurance against auto-compact)

  Continue working - Q-END will merge checkpoint + final work.
  ```

**How Q-END uses checkpoints:**
- Checks for checkpoint files from same session (same date, same person)
- Merges checkpoint info + current context = complete session notes
- Provides insurance if auto-compact summary is incomplete

**Benefits:**
- User control over when to save progress
- Insurance against information loss
- Works even if auto-compact summary fails
- Minimal overhead (lightweight, fast)

**Example workflow:**
```
User: Q-BEGIN          → Start session at 9:00 AM
[Work 1.5 hours - build presentation]
User: Q-CHECKPOINT     → Save progress at 10:30 AM
[Context auto-compacts at 11:00 AM]
[Continue working - polish presentation]
User: Q-END at 12:00   → Merges checkpoint + current work = complete docs
```

---

## Q-STATUS

When the user types `Q-STATUS`:

**Purpose:** Show current session state and provide recommendations.

**What to display:**

```
=== Session Status ===

Session started: [YYYY-MM-DD HH:MM] ([X] hours [Y] minutes ago)
Participant: [PersonName]
Session type: [Regular / Continued from auto-compact at HH:MM]

Progress:
- Accomplishments: [N] major items
- Files created: [N]
- Files modified: [N]
- Key decisions: [N]

Checkpoints:
- Last checkpoint: [HH:MM] ([X] minutes ago) [or "None yet"]
- Checkpoint location: GeneratedMDs/checkpoints/[filename]

Git Status:
- Uncommitted changes: [Yes/No] ([N] files)
- Commits ahead of origin: [N]

Context Health:
- Estimated usage: [percentage]% [OK/HIGH/CRITICAL]
- Messages in conversation: [N]
- Time since last checkpoint: [X] minutes

Recommendations:
- [If context >70%] ⚠️ Consider Q-CHECKPOINT soon to preserve progress
- [If >90 min without checkpoint] Consider Q-CHECKPOINT for insurance
- [If session >2 hours] Consider wrapping up with Q-END soon
- [If context >90%] ⚠️ Context critical - use Q-SAVE for quick exit
- [If continued session] Remember to document ALL work including from summary

Next steps:
- [List of pending tasks from TodoWrite if active]
- [or "No pending tasks"]
```

**Implementation notes:**
- Estimate context usage based on conversation length if possible
- Count accomplishments from current session context
- Check for checkpoint files in `GeneratedMDs/checkpoints/` from today with same person name
- Check git status for uncommitted changes
- Be concise but informative
- Provide actionable recommendations

**When users should run this:**
- Feeling uncertain about session progress
- Want to know if checkpoint is needed
- Long session and want status check
- Before committing to another big task

---

## Q-VERIFY

When the user types `Q-VERIFY`:

**Purpose:** Check that Q-END, Q-CHECKPOINT, or Q-SAVE actually worked correctly.

**What it does:**

1. Check for transcript files in `GeneratedMDs/transcripts/` from today
   - Filter by current user's name
   - Show most recent
2. Check for session notes in `GeneratedMDs/session-notes/` from today
   - Filter by current user's name
   - Show most recent
3. Check for checkpoints in `GeneratedMDs/checkpoints/` from today
   - Filter by current user's name
   - List all found
4. Check git status
   - Uncommitted changes?
   - Commits ahead of origin?
   - Last commit message and time
5. Report findings:
   ```
   === Verification Report ===

   ✅ Transcript: Found GeneratedMDs/transcripts/2025-11-13-0913-Gabriel.md
      - Created: [timestamp]
      - Size: [N] lines

   ✅ Session Notes: Found GeneratedMDs/session-notes/2025-11-13-0913-Gabriel.md
      - Created: [timestamp]
      - Size: [N] lines

   ✅ Checkpoints: Found [N] checkpoint(s)
      - 2025-11-13-1030-Gabriel.md (10:30 AM)
      - 2025-11-13-1145-Gabriel.md (11:45 AM)

   ✅ Git: Committed, clean working tree
      - Ahead of origin by [N] commit(s)
      - Last commit: "[message]" ([X] minutes ago)

   ⚠️ Missing: [list any expected files not found]

   Status: [All Clear / Issues Detected]
   ```

**When to use:**
- After Q-END to verify it worked completely
- After Q-CHECKPOINT to verify it saved
- After Q-SAVE to see what was captured
- When resuming session to see what exists from previous work
- Debugging: "Did my Q-END actually work?"

---

## Q-COURSE

When the user types `Q-COURSE`:

1. First, display the full list of questions from `planning/courses/COURSE-DEFINITION-TEMPLATE.md` so the creator can review and prepare
2. Ask the creator if they're ready to begin the interview or need time to prepare
3. If ready, work through each question one-by-one in a guided conversation:
   - Ask the question
   - Listen to the answer
   - Probe for clarity, specificity, or missing details as needed
   - Move to next question when satisfied
4. After all questions are answered, create a new course definition file:
   - Name: `planning/courses/course-[number]-[short-name].md`
   - Use the Course Definition Output Format from the template
   - Include all gathered information in a structured, complete document
5. Save the file and confirm completion with the creator
6. Update `planning/courses/README.md` if needed to reflect the new course

**Purpose:** Systematically gather all information needed to define a new course for the Alpha Peer platform.

---

## GENERAL ERROR HANDLING POLICY

**For ALL Q-commands:**

1. **Be explicit about failures:**
   - Never fail silently
   - Report specific errors immediately
   - Don't pretend something worked when it didn't

2. **Verify critical operations:**
   - After creating files, check they exist
   - After commits, check git status
   - After writes, verify content saved

3. **Provide actionable feedback:**
   - Tell user exactly what succeeded
   - Tell user exactly what failed
   - Provide manual steps to fix failures

4. **Graceful degradation:**
   - Complete what is possible
   - Skip what fails, but report it
   - Don't abort entire operation for one failure

5. **User control:**
   - Offer options when uncertain
   - Ask before destructive operations
   - Let user decide how to proceed

---

## VERSION HISTORY

**v2.0 (2025-11-13):**
- Redesigned file naming to prevent collisions (per-person-per-session)
- Reorganized directory structure (transcripts/, checkpoints/, session-notes/)
- Made Q-END robust with step-by-step verification
- Added Q-SAVE for lightweight quick exits
- Added Q-VERIFY for checking command success
- Enhanced Q-STATUS with context health and recommendations
- Added comprehensive error handling policy

**v1.0 (2025-11-11):**
- Initial command set: Q-BEGIN, Q-END, Q-DUMP, Q-COMMIT, Q-CHECKPOINT, Q-STATUS, Q-LEARNINGS, Q-COURSE
