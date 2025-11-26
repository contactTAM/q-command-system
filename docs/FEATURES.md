# Q-Command System Features Documentation

**Comprehensive Feature Overview**

**Version:** 1.0
**Last Updated:** 2025-11-26

---

## Table of Contents

1. [Session Management](#session-management)
2. [Context Protection](#context-protection)
3. [Documentation Generation](#documentation-generation)
4. [Verification & Error Handling](#verification--error-handling)
5. [Multi-User Support](#multi-user-support)
6. [Git Integration](#git-integration)
7. [Monitoring & Observability](#monitoring--observability)
8. [Customization](#customization)

---

## Session Management

### Q-BEGIN: Structured Session Start

**What it does:**
- Reads project context from CLAUDE.md
- Reviews last session notes (filtered by your name)
- Checks project status files (work plans, roadmaps, etc.)
- Provides summary of recent progress
- Asks what to work on today

**Why it matters:**
- No more starting sessions with zero context
- Builds on previous work seamlessly
- Ensures Claude knows project state
- Reduces time spent explaining context

**Features:**
- Multi-file context loading
- Person-specific session history
- Automatic status check
- TodoWrite setup for multi-step tasks

**Example flow:**
```
User: Q-BEGIN

Claude reads:
1. CLAUDE.md (project overview)
2. GeneratedMDs/session-notes/2025-11-12-1430-Gabriel.md (last session)
3. work-plan/work-plan.md (current status)

Claude: "Last session: Updated budget estimates to $25-50K across 6 documents.
Current status: Ready for Brian's review.
What would you like to work on today?"
```

---

### Q-END: Complete Session Documentation

**What it does:**
- Creates full session transcript
- Generates session notes summary
- Updates project files (work plans, etc.)
- Commits all changes to git
- Verifies each step succeeded

**Why it matters:**
- Never lose track of what was accomplished
- Automatic documentation without manual effort
- Git history matches session work
- Complete audit trail

**Features:**
- 6-step verification process
- Continued session detection (preserves work before auto-compact)
- Checkpoint merging
- Explicit success/failure reporting
- Automatic git commit with attribution

**Example output:**
```
✅ Session Complete!

Transcript: GeneratedMDs/transcripts/2025-11-13-0913-Gabriel.md
Session Notes: GeneratedMDs/session-notes/2025-11-13-0913-Gabriel.md
Work Plan: Updated
Git: Committed (9 files changed)

Ready to push! Run `git push` when ready.
```

---

### Q-SAVE: Lightweight Quick Exit

**What it does:**
- Creates basic transcript (key accomplishments + files changed)
- Commits all changes to git
- Skips detailed session notes and work plan updates

**Why it matters:**
- Emergency exit when context is critical (>90%)
- Fast wrap-up when in a hurry
- Still captures essential information
- Prevents total data loss

**When to use:**
- Context usage above 90%
- Conversation slowing down (sign of context pressure)
- Need to exit quickly
- Already created checkpoints earlier

**Trade-offs:**
- Less comprehensive documentation
- No work plan updates
- But faster and safer than trying full Q-END when context is constrained

---

### Q-CHECKPOINT: Mid-Session Progress Snapshot

**What it does:**
- Creates lightweight checkpoint file
- Documents accomplishments so far
- Lists files created/modified
- Notes current status and next steps

**Why it matters:**
- Insurance against auto-compact data loss
- Allows Q-END to reconstruct full session
- User control over when to save progress
- Minimal overhead (100-200 lines)

**When to use:**
- Every 90 minutes in long sessions
- After completing major milestone
- Before starting next big chunk of work
- When context usage reaches 70%

**Example checkpoint:**
```markdown
# Checkpoint: 2025-11-13 10:30 AM

Session started: 09:13 AM
Checkpoint time: 10:30 AM (1 hour 17 minutes elapsed)

Accomplishments:
- Updated budget estimates across 6 documents
- Removed "free" dashboard option
- Added preliminary estimate warnings

Files modified:
- alpha-peer-mvp-presentation.html
- hypothesis-to-feature-mapping.md
- brian-approval-checklist.md
- mvp-approach-comparison.md
- polished-concierge-presentation-outline.md
- html-presentation-plan.md

Next: Final consistency check, then commit
```

---

## Context Protection

### Auto-Compact Detection

**What it does:**
- Detects when conversation was auto-compacted
- Reads conversation summary for pre-compact work
- Treats entire session as one unified session
- Documents ALL work from start to finish

**Why it matters:**
- Prevents losing 1-2 hours of work
- Most critical failure mode in v1.0 was losing pre-compact work
- Automatic detection and recovery
- No user action required

**How it works:**
1. Q-END checks for "This session is being continued from a previous conversation"
2. If found, reads conversation summary thoroughly
3. Extracts all accomplishments, decisions, files changed
4. Merges with current context
5. Documents as ONE session with full timeline

**Example:**
```
Session started: 9:00 AM
Auto-compact occurred: 10:30 AM
Session continues until: 11:45 AM

Q-END documents:
- Start time: 9:00 AM (original)
- Duration: 2 hours 45 minutes (total)
- Work before auto-compact: [from summary]
- Work after auto-compact: [from current context]
Result: Complete session documentation
```

---

### Context Health Monitoring

**What it does:**
- Estimates context usage percentage
- Tracks conversation length
- Monitors time since last checkpoint
- Provides actionable recommendations

**Why it matters:**
- Proactive warning before problems occur
- User can decide when to checkpoint or exit
- Prevents surprise auto-compacts
- Optimizes session timing

**Included in Q-STATUS:**
```
Context Health:
- Estimated usage: 75% ⚠️ HIGH
- Messages in conversation: 187
- Time since last checkpoint: 62 minutes

Recommendations:
⚠️ Consider Q-CHECKPOINT soon to preserve progress
```

---

### Checkpoint Insurance

**What it does:**
- Provides fallback if auto-compact summary is incomplete
- Allows session reconstruction from multiple sources
- User-controlled save points

**Why it matters:**
- Belt-and-suspenders approach
- Even if auto-compact loses info, checkpoints preserve it
- Gives user peace of mind
- Minimal performance cost

**Recovery hierarchy:**
1. Current context (always available)
2. Conversation summary (if auto-compacted)
3. Checkpoints (if created)
4. Previous session notes (for Q-BEGIN)

Result: Multiple layers of data protection

---

## Documentation Generation

### Session Transcripts

**Location:** `GeneratedMDs/transcripts/YYYY-MM-DD-HHmm-[PersonName].md`

**Contents:**
- Chronological conversation flow
- User commands/prompts
- Claude's actions and responses
- File changes made
- Decisions taken
- Session metrics (duration, deliverables)

**Format:**
- Clear development log style
- References code effects without full code blocks
- Organized by major accomplishments
- Timestamped with session duration

**Use cases:**
- Review what was accomplished
- Understand decision rationale
- Debug issues from past sessions
- Billing/time tracking
- Knowledge transfer to team

---

### Session Notes

**Location:** `GeneratedMDs/session-notes/YYYY-MM-DD-HHmm-[PersonName].md`

**Contents:**
- Key accomplishments (executive summary)
- Decisions made with rationale
- Files created/modified (complete list)
- Blocker status updates
- Open questions
- Next steps

**Format:**
- High-level summary (not chronological)
- Bullet points and structured sections
- Scannable in 2-3 minutes
- Links to relevant files

**Use cases:**
- Quick status check
- Team standup references
- Project review meetings
- Resume work after break
- Q-BEGIN context loading

---

### Work Plan Updates

**Location:** Project-specific (e.g., `work-plan/work-plan.md`)

**What it updates:**
- Blocker status (if resolved)
- Completed milestones
- New tasks identified
- Recent progress section
- Timeline adjustments

**When it updates:**
- Only if significant progress made
- Q-END checks if updates needed
- Reports: "Work plan updated" or "Work plan unchanged"

**Why it matters:**
- Single source of truth stays current
- No manual work plan maintenance
- Project status always reflects reality

---

## Verification & Error Handling

### Step-by-Step Verification

**Q-END verification process:**

```
STEP 1: Check for continued sessions
✅ VERIFY: Conversation summary read (if applicable)

STEP 2: Create session transcript
✅ VERIFY: File exists at correct path
✅ VERIFY: File has substantial content (>100 lines)

STEP 3: Create session notes
✅ VERIFY: File exists at correct path
✅ VERIFY: File has content

STEP 4: Update work plan
✅ VERIFY: Changes saved (if updated)

STEP 5: Commit all changes
✅ VERIFY: git status shows clean working tree

STEP 6: Final report
✅ Shows all files created and git commit hash
```

**Why it matters:**
- No silent failures
- User knows exactly what happened
- Can catch problems immediately
- Can verify with Q-VERIFY

---

### Q-VERIFY: Post-Operation Verification

**What it checks:**
1. **Transcripts:** Files in GeneratedMDs/transcripts/ (today, your name)
2. **Session Notes:** Files in GeneratedMDs/session-notes/ (today, your name)
3. **Checkpoints:** Files in GeneratedMDs/checkpoints/ (today, your name)
4. **Git Status:** Uncommitted changes? Commits ahead of origin?

**Output example:**
```
=== Verification Report ===

✅ Transcript: Found GeneratedMDs/transcripts/2025-11-13-0913-Gabriel.md
   - Created: 11:45 AM
   - Size: 487 lines

✅ Session Notes: Found GeneratedMDs/session-notes/2025-11-13-0913-Gabriel.md
   - Created: 11:45 AM
   - Size: 142 lines

✅ Checkpoints: Found 2 checkpoint(s)
   - 2025-11-13-1030-Gabriel.md (10:30 AM)
   - 2025-11-13-1145-Gabriel.md (11:45 AM)

✅ Git: Committed, clean working tree
   - Ahead of origin by 1 commit(s)
   - Last commit: "Update budget estimates..." (2 minutes ago)

Status: All Clear
```

**Use cases:**
- After Q-END to confirm success
- After Q-CHECKPOINT to verify saved
- Debugging: "Did my command work?"
- Before manual push to verify state

---

### Explicit Error Reporting

**Error handling policy:**

1. **Never fail silently**
   - Always report what went wrong
   - Explain which step failed

2. **Graceful degradation**
   - Complete what's possible
   - Skip what fails, but report it clearly

3. **Actionable feedback**
   - Tell user exactly what succeeded
   - Tell user exactly what failed
   - Provide manual steps to fix

4. **User control**
   - Offer options when uncertain
   - Let user decide how to proceed

**Example error:**
```
❌ STEP 3 FAILED: Create session notes
Error: Unable to write file (disk full?)

What succeeded:
✅ Transcript created: GeneratedMDs/transcripts/2025-11-13-0913-Gabriel.md
✅ Checkpoints merged

What failed:
❌ Session notes NOT created
❌ Work plan NOT updated
❌ Git NOT committed

Manual steps:
1. Free up disk space
2. Run Q-DUMP manually to retry transcript
3. Run Q-COMMIT to commit changes
4. Or try Q-SAVE for lightweight alternative
```

---

## Multi-User Support

### Per-Person-Per-Session File Naming

**Format:** `YYYY-MM-DD-HHmm-[PersonName].md`

**Benefits:**
- **No collisions:** Gabriel and Guy can both work Nov 13 at 9:00 AM
- **Clear ownership:** Instantly see who worked when
- **Easy filtering:** `ls *-Gabriel.md` shows all Gabriel's sessions
- **Sortable:** Files sort chronologically
- **Scriptable:** No spaces in filenames

**Example directory:**
```
GeneratedMDs/transcripts/
  2025-11-13-0913-Gabriel.md
  2025-11-13-1000-Guy.md
  2025-11-13-1430-Fraser.md
  2025-11-13-1600-Brian.md
  2025-11-14-0900-Gabriel.md
  2025-11-14-0915-Guy.md
```

Each person has their own files, no conflicts.

---

### Person-Specific Session History

**Q-BEGIN behavior:**
- Looks for files matching current user's name
- Sorts by date/time
- Reads most recent session
- Ignores other people's sessions

**Example:**
```
Gabriel types Q-BEGIN:
→ Reads GeneratedMDs/session-notes/*-Gabriel.md (most recent)
→ Ignores Guy's sessions, Fraser's sessions, etc.
→ Shows Gabriel's last session summary

Guy types Q-BEGIN:
→ Reads GeneratedMDs/session-notes/*-Guy.md (most recent)
→ Ignores Gabriel's sessions
→ Shows Guy's last session summary
```

**Benefits:**
- Each person picks up where THEY left off
- No confusion from other people's work
- Clear context for each team member

---

### Team Coordination

**Features:**
- All session files in shared repo (if desired)
- Easy to review teammate's work: `cat GeneratedMDs/session-notes/2025-11-13-1000-Guy.md`
- Git history shows all team activity
- Session notes reference each other when needed

**Example coordination:**
```
Gabriel's session notes:
"Waiting for Guy to complete course #3 definition before proceeding with implementation."

Guy's session notes:
"Completed course #3 definition. Ready for Gabriel's review."
```

Team members can reference each other's sessions for context.

---

## Git Integration

### Automatic Commits

**Q-END behavior:**
1. Stages all changes: `git add .`
2. Creates descriptive commit message
3. Includes bullet points of changes
4. Adds co-author attribution
5. Verifies commit succeeded

**Commit message format:**
```
Brief summary of changes

- Point 1: description
- Point 2: description
- Point 3: description

Co-Authored-By: Claude <noreply@anthropic.com>
```

**Benefits:**
- Git history matches session work
- No forgotten uncommitted changes
- Clear commit messages
- Proper attribution

---

### User-Controlled Push

**Policy:** Claude NEVER pushes to remote automatically

**Reasoning:**
- User decides what to share publicly
- User controls timing of releases
- Prevents accidental pushes of WIP
- User maintains sovereignty over repository

**Workflow:**
```
Q-END completes:
✅ Changes committed locally

User reviews:
git status  → Clean working tree
git log -1  → Review commit message

User decides:
git push    → Share with team (user's choice)
```

**Benefits:**
- Full control over what goes public
- Can review before sharing
- Can make additional changes before push
- Peace of mind

---

### Attribution

**Co-authorship:**
Every commit includes:
```
Co-Authored-By: Claude <noreply@anthropic.com>
```

**Why it matters:**
- Clear that AI assisted
- Proper credit to Claude
- Transparent about workflow
- GitHub/GitLab recognizes co-authorship

---

## Monitoring & Observability

### Q-STATUS: Real-Time Session State

**What it shows:**

**Session Info:**
- Start time and duration
- Participant name
- Session type (regular vs continued)

**Progress:**
- Accomplishments count
- Files created/modified
- Key decisions made

**Checkpoints:**
- Last checkpoint time
- Checkpoint location
- Time since last checkpoint

**Git Status:**
- Uncommitted changes count
- Commits ahead of origin

**Context Health:**
- Estimated usage percentage
- Messages in conversation
- Time since last checkpoint

**Recommendations:**
- When to checkpoint
- When to wrap up
- When to use Q-SAVE

**Example:**
```
=== Session Status ===

Session started: 2025-11-13 09:13 (2 hours 32 minutes ago)
Participant: Gabriel
Session type: Continued from auto-compact at 10:30

Progress:
- Accomplishments: 8 major items
- Files created: 3
- Files modified: 6
- Key decisions: 4

Checkpoints:
- Last checkpoint: 10:30 (1 hour 2 minutes ago)
- Checkpoint location: GeneratedMDs/checkpoints/2025-11-13-1030-Gabriel.md

Git Status:
- Uncommitted changes: Yes (9 files)
- Commits ahead of origin: 0

Context Health:
- Estimated usage: 68% OK
- Messages in conversation: 143
- Time since last checkpoint: 62 minutes

Recommendations:
- Session >2 hours - consider wrapping up with Q-END soon
- Context healthy but consider Q-CHECKPOINT before next major task

Next steps:
- Complete final consistency check (in progress)
- Commit changes (pending)
```

---

### TodoWrite Integration

**Features:**
- Q-BEGIN sets up TodoWrite for multi-step tasks
- Real-time task tracking during session
- Q-STATUS shows pending tasks
- Tasks documented in session notes

**Benefits:**
- Clear session structure
- Progress visibility
- Nothing forgotten
- Professional organization

---

## Customization

### Add Custom Commands

**How to:**
1. Open `GeneratedMDs/SHORTCUTS.md`
2. Add new section: `## Q-[COMMAND]`
3. Define what Claude should do
4. Save and use immediately

**Example custom command:**
```markdown
## Q-REVIEW

When the user types `Q-REVIEW`:

1. Read all files modified in last commit
2. Check for common issues:
   - TODOs or FIXMEs left in code
   - Console.log statements
   - Commented-out code
   - Missing error handling
3. Generate review checklist
4. Ask user if they want to address any issues before pushing

**Purpose:** Pre-push code review automation
```

---

### Modify Existing Commands

**Q-END is fully customizable:**

Edit `GeneratedMDs/SHORTCUTS.md`, find `## Q-END`, modify steps:

**Add test execution:**
```markdown
**STEP 4.5: Run Tests**
1. Execute test suite: `npm test` or `pytest`
2. ✅ VERIFY: All tests pass
3. Report to user: "✅ Tests passed" or "⚠️ Tests failed: [details]"
```

**Add linting:**
```markdown
**STEP 4.6: Run Linter**
1. Execute linter: `npm run lint`
2. ✅ VERIFY: No linting errors
3. Report to user: "✅ Code linted" or "⚠️ Linting errors: [details]"
```

Changes take effect immediately (Claude reads SHORTCUTS.md at session start).

---

### Adding Custom Commands

You can add your own Q-commands for domain-specific tasks.

**How:**
1. Open `GeneratedMDs/SHORTCUTS.md`
2. Add a new `## Q-YOURCOMMAND` section
3. Define what Claude should do
4. Save and use immediately

**Example: Product Feature Spec**

```markdown
## Q-FEATURE

When the user types `Q-FEATURE`:

1. Display product feature specification template questions
2. Work through each question one-by-one:
   - Feature name and description
   - User stories and use cases
   - Acceptance criteria
   - Technical requirements
   - Dependencies and blockers
   - Success metrics
3. Generate: `planning/features/feature-[number]-[name].md`
4. Update feature roadmap

**Purpose:** Systematically gather requirements for new features
```

---

## Summary

The Q-Command System provides:

✅ **Structure** - Clear workflows for sessions
✅ **Memory** - Automatic documentation and context
✅ **Protection** - Multiple layers against data loss
✅ **Verification** - Explicit success/failure reporting
✅ **Multi-user** - Team support without conflicts
✅ **Git integration** - Automatic commits, user-controlled push
✅ **Observability** - Real-time status and recommendations
✅ **Customization** - Adapt to any workflow or domain

**Result:** Claude Code transforms from a helpful assistant into a **reliable, structured, accountable co-pilot** for software development.

---

**Next:** See [ARCHITECTURE.md](ARCHITECTURE.md) for how the system works internally, or [COMMANDS-REFERENCE.md](COMMANDS-REFERENCE.md) for complete command documentation.
