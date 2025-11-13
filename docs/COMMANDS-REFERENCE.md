# Q-Command System - Complete Commands Reference

**Comprehensive Command Documentation**

**Version:** 2.0
**Last Updated:** 2025-11-13

---

## Command Index

### Session Management
- [Q-BEGIN](#q-begin) - Start session with context refresh
- [Q-END](#q-end) - Complete session documentation and commit
- [Q-SAVE](#q-save) - Lightweight quick exit

### Progress Tracking
- [Q-CHECKPOINT](#q-checkpoint) - Save mid-session progress snapshot
- [Q-STATUS](#q-status) - Check session state and context health
- [Q-VERIFY](#q-verify) - Verify command success

### Documentation
- [Q-DUMP](#q-dump) - Create session transcript manually
- [Q-LEARNINGS](#q-learnings) - Summarize session insights

### Git Operations
- [Q-COMMIT](#q-commit) - Stage and commit changes

### Specialized
- [Q-COURSE](#q-course) - Guided interview (customizable)

---

## Q-BEGIN

**Purpose:** Start session with full context refresh

### Usage
```
Q-BEGIN
```

### What It Does

1. **Reads CLAUDE.md** for project context
2. **Reviews last session notes** from `GeneratedMDs/session-notes/`
   - Filters by your name
   - Reads most recent session
3. **Checks project status** from work plan or similar files
4. **Provides summary** of recent progress and current state
5. **Asks what to work on** today
6. **Sets up TodoWrite** if needed for multi-step tasks

### Example Output
```
[After reading CLAUDE.md and last session notes]

Last session (2025-11-12 14:30):
- Updated budget estimates to $25-50K across 6 documents
- Removed "free" dashboard option
- Added preliminary estimate warnings
- All changes committed

Current project status:
- Phase: Pre-Development Planning
- Blockers: None resolved since last session
- Next steps: Review with Brian

What would you like to work on today?
```

### When to Use
- **Beginning of every work session**
- After opening Claude Code in a repository
- When resuming work after a break

### Customization
Edit `GeneratedMDs/SHORTCUTS.md` under `## Q-BEGIN` to:
- Add additional files to read
- Change summary format
- Add project-specific checks

---

## Q-END

**Purpose:** Complete session with full documentation and commit

### Usage
```
Q-END
```

### What It Does

Executes 6 steps with verification:

**STEP 1: Check for Continued Sessions**
- Detects if conversation was auto-compacted
- Reads conversation summary if present
- Checks for checkpoints from this session

**STEP 2: Create Session Transcript**
- File: `GeneratedMDs/transcripts/YYYY-MM-DD-HHmm-[PersonName].md`
- Contains chronological session flow
- ✅ Verifies file created with substantial content

**STEP 3: Create Session Notes**
- File: `GeneratedMDs/session-notes/YYYY-MM-DD-HHmm-[PersonName].md`
- Contains summary: accomplishments, decisions, files, next steps
- ✅ Verifies file created

**STEP 4: Update Work Plan** (if applicable)
- Updates project files with progress
- ✅ Verifies changes saved

**STEP 5: Commit All Changes**
- Stages: `git add .`
- Commits with descriptive message + bullets
- ✅ Verifies clean working tree

**STEP 6: Final Report**
- Shows all files created
- Shows commit hash
- Reminds to `git push` manually

### Example Output
```
✅ Session Complete!

Transcript: GeneratedMDs/transcripts/2025-11-13-0913-Gabriel.md (487 lines)
Session Notes: GeneratedMDs/session-notes/2025-11-13-0913-Gabriel.md (142 lines)
Work Plan: Updated
Git: Committed (9 files changed, commit abc1234)

Ready to push! Run `git push` when ready.
```

### When to Use
- **End of every work session**
- When finishing work for the day
- Before switching to different project
- After completing major milestone

### Error Handling
If any step fails:
- Reports specific error
- Completes what's possible
- Provides manual steps to fix

### Customization
Edit `GeneratedMDs/SHORTCUTS.md` under `## Q-END` to:
- Add test execution
- Add linting
- Add deployment steps
- Customize verification

---

## Q-SAVE

**Purpose:** Lightweight quick exit when context is constrained

### Usage
```
Q-SAVE
```

### What It Does

1. **Creates basic transcript** in `GeneratedMDs/transcripts/`
   - Key accomplishments
   - Files changed
   - Lightweight format (not full chronology)
2. **Commits all changes** (Q-COMMIT)
3. **Reports completion**

### What It Skips
- Detailed session notes
- Work plan updates
- Comprehensive verification

### Example Output
```
✅ Quick Save Complete!

Transcript: GeneratedMDs/transcripts/2025-11-13-0913-Gabriel.md (basic)
Git: Committed (6 files changed, commit def5678)

Note: Skipped session notes and work plan updates.
Run Q-VERIFY to see what was saved.
Ready to push! Run `git push` when ready.
```

### When to Use
- **Context usage >90%** (conversation slowing down)
- **Need to exit quickly** (meeting starting, etc.)
- **Already created checkpoints** earlier
- **Emergency exit** scenario

### Trade-offs
- **Pros:** Fast, safe, captures essentials
- **Cons:** Less comprehensive documentation

---

## Q-CHECKPOINT

**Purpose:** Save mid-session progress snapshot

### Usage
```
Q-CHECKPOINT
```

### What It Does

1. **Creates checkpoint directory** if needed (`GeneratedMDs/checkpoints/`)
2. **Creates checkpoint file:** `GeneratedMDs/checkpoints/YYYY-MM-DD-HHmm-[PersonName].md`
   - Uses **current time** (not session start time)
3. **Documents:**
   - Session start time
   - Checkpoint time
   - Accomplishments so far
   - Files created/modified
   - Key decisions
   - Current status and next steps
4. **Verifies** file created
5. **Reports success**

### Example Output
```
✅ Checkpoint saved at 10:30 AM

Location: GeneratedMDs/checkpoints/2025-11-13-1030-Gabriel.md
Session progress preserved (insurance against auto-compact)

Continue working - Q-END will merge checkpoint + final work.
```

### When to Use
- **Every 90 minutes** in long sessions
- **After major milestone** (completed feature, fixed bug, etc.)
- **Before starting next big chunk** of work
- **When context usage >70%**
- **Before risky operations** (large refactors, etc.)

### Benefits
- Insurance against auto-compact data loss
- Q-END merges checkpoints into final documentation
- Minimal overhead (lightweight, 100-200 lines)
- User control over save points

---

## Q-STATUS

**Purpose:** Show current session state and context health

### Usage
```
Q-STATUS
```

### What It Displays

**Session Info:**
- Start time and duration
- Participant name
- Session type (regular / continued from auto-compact)

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
- If continued session, reminder about full documentation

**Next Steps:**
- Pending tasks from TodoWrite (if active)

### Example Output
```
=== Session Status ===

Session started: 2025-11-13 09:13 (2 hours 17 minutes ago)
Participant: Gabriel
Session type: Continued from auto-compact at 10:30

Progress:
- Accomplishments: 6 major items
- Files created: 3
- Files modified: 6
- Key decisions: 4

Checkpoints:
- Last checkpoint: 10:30 (1 hour 47 minutes ago)
- Location: GeneratedMDs/checkpoints/2025-11-13-1030-Gabriel.md

Git Status:
- Uncommitted changes: Yes (9 files)
- Commits ahead of origin: 0

Context Health:
- Estimated usage: 75% ⚠️ HIGH
- Messages in conversation: 187
- Time since last checkpoint: 107 minutes

Recommendations:
⚠️ Consider Q-CHECKPOINT soon to preserve progress
- Session >2 hours - consider wrapping up with Q-END soon
- Remember to document ALL work including from before auto-compact

Next steps:
- Finalize budget updates (in progress)
- Commit changes (pending)
```

### When to Use
- **Anytime** to check progress
- **Long sessions** to monitor context health
- **Before big tasks** to see if checkpoint needed
- **Feeling uncertain** about session state

---

## Q-VERIFY

**Purpose:** Verify that Q-END/Q-CHECKPOINT actually worked

### Usage
```
Q-VERIFY
```

### What It Checks

1. **Transcripts:** Files in `GeneratedMDs/transcripts/` from today, your name
2. **Session Notes:** Files in `GeneratedMDs/session-notes/` from today, your name
3. **Checkpoints:** Files in `GeneratedMDs/checkpoints/` from today, your name
4. **Git Status:** Uncommitted changes? Commits ahead of origin? Last commit details

### Example Output
```
=== Verification Report ===

✅ Transcript: Found GeneratedMDs/transcripts/2025-11-13-0913-Gabriel.md
   - Created: 11:45 AM (3 minutes ago)
   - Size: 487 lines

✅ Session Notes: Found GeneratedMDs/session-notes/2025-11-13-0913-Gabriel.md
   - Created: 11:45 AM (3 minutes ago)
   - Size: 142 lines

✅ Checkpoints: Found 2 checkpoint(s)
   - 2025-11-13-1030-Gabriel.md (10:30 AM)
   - 2025-11-13-1145-Gabriel.md (11:45 AM)

✅ Git: Committed, clean working tree
   - Ahead of origin by 1 commit(s)
   - Last commit: "Update budget estimates to realistic ranges" (3 minutes ago)

Status: All Clear ✅
```

### When to Use
- **After Q-END** to confirm it worked
- **After Q-CHECKPOINT** to verify saved
- **After Q-SAVE** to see what was captured
- **Debugging:** "Did my command work?"
- **Before manual push** to verify git state

---

## Q-DUMP

**Purpose:** Create session transcript manually

### Usage
```
Q-DUMP
```

### What It Does

1. **Checks for continued sessions** (auto-compact detection)
2. **Determines session start time** (original, not continuation time)
3. **Creates transcript file:** `GeneratedMDs/transcripts/YYYY-MM-DD-HHmm-[PersonName].md`
4. **Documents complete session:**
   - For continued sessions: ALL work including from before auto-compact
   - For regular sessions: Current conversation
5. **Includes:**
   - Major accomplishments
   - Files created/modified
   - Key decisions
   - Conversation flow
   - Session metrics
6. **Verifies** file created

### Example Output
```
✅ Transcript created: GeneratedMDs/transcripts/2025-11-13-0913-Gabriel.md
   - Session duration: 2 hours 45 minutes
   - 487 lines documented
   - 9 files modified
```

### When to Use
- **Manually** if not using Q-END
- **For documentation** without full Q-END process
- **Recovery** if Q-END failed partially
- **Testing** the transcript generation

### Difference from Q-END
- Q-DUMP: Only creates transcript
- Q-END: Creates transcript + session notes + commits

---

## Q-LEARNINGS

**Purpose:** Summarize key learnings from session

### Usage
```
Q-LEARNINGS
```

### What It Does

1. **Analyzes current session** for insights
2. **Identifies key learnings:**
   - Technical discoveries
   - Process improvements
   - Best practices found
   - Important decisions and rationale
3. **Presents as bulleted list** in chat (NOT in file)

### Example Output
```
Key Learnings from This Session:

Technical:
- Budget estimates must account for labor on "free" tools like Notion
- Even simple setup tasks require 1-3K in developer time
- Preliminary estimates need prominent caveats to manage expectations

Process:
- Multi-file consistency updates work best with Edit tool's replace_all
- Q-CHECKPOINT system needs robust specifications to prevent failures
- Per-person-per-session naming prevents file collisions

Decisions:
- Budget ranges: $25-50K (not $15-25K) for realistic Phase 1 estimate
- Dashboard minimum budget: $1K (not $0) to reflect labor costs
- All estimates marked as "preliminary" requiring validation

Best Practices:
- Add verification steps to all multi-step commands
- Always report what succeeded vs what failed explicitly
- Provide manual recovery steps when errors occur
```

### When to Use
- **End of session** to reflect on insights
- **After solving difficult problem** to capture approach
- **For team sharing** (copy to session notes)
- **Personal growth** tracking

---

## Q-COMMIT

**Purpose:** Stage and commit all changes locally

### Usage
```
Q-COMMIT
```

### What It Does

1. **Saves all unsaved changes**
2. **Stages all changes:** `git add .`
3. **Creates commit** with:
   - Concise summary message
   - Bullet points of changes
   - Co-author attribution
4. **Verifies** commit succeeded
5. **Reports** commit hash and message
6. **Does NOT push** to remote

### Example Output
```
✅ Changes committed successfully

Commit: abc1234
Message: "Update budget estimates to realistic ranges

- Phase 1: $15-25K → $25-50K
- Platform MVP: $30-75K → $50-100K
- Dashboard: $0-3K → $1-10K with labor costs
- Added preliminary estimate warnings

Co-Authored-By: Claude <noreply@anthropic.com>
"

Working tree clean. Ready to push when you're ready.
```

### When to Use
- **Manually** if not using Q-END
- **Mid-session** to commit work in progress
- **After major milestone** to save progress
- **Before risky operations** (refactors, etc.)

### Git Push Policy
**Q-COMMIT NEVER pushes to remote** - user controls when to share code

---

## Q-COURSE

**Purpose:** Guided interview for structured data collection

**⚠️ Note:** This command is designed to be **customized for your domain**.

### Default Usage (Course Definition)
```
Q-COURSE
```

### What It Does (Default)

1. **Displays template questions** from `planning/courses/COURSE-DEFINITION-TEMPLATE.md`
2. **Asks if ready** to begin interview or need time to prepare
3. **Works through questions** one-by-one:
   - Ask question
   - Listen to answer
   - Probe for clarity/specifics
   - Move to next question
4. **Creates course definition file:** `planning/courses/course-[number]-[short-name].md`
5. **Updates** course README if needed

### Customization Examples

**Adapt to Product Features:**
```markdown
## Q-FEATURE

When the user types `Q-FEATURE`:

1. Display feature specification template
2. Work through questions:
   - Feature name and description
   - User stories
   - Acceptance criteria
   - Technical requirements
   - Dependencies
3. Create: `planning/features/feature-[number]-[name].md`
```

**Adapt to API Design:**
```markdown
## Q-API

When the user types `Q-API`:

1. Display API endpoint template
2. Work through questions:
   - Endpoint path and method
   - Request/response formats
   - Authentication requirements
   - Error handling
3. Create: `docs/api/endpoints/[name].md`
```

### How to Customize

1. **Create template file** in your project (e.g., `planning/feature-template.md`)
2. **Edit** `GeneratedMDs/SHORTCUTS.md`
3. **Find** `## Q-COURSE` section
4. **Modify or duplicate** for new command
5. **Update** template reference and output location
6. **Save** and use immediately

---

## Command Comparison

### When to Use Each Command

| Situation | Command | Why |
|-----------|---------|-----|
| Starting work session | Q-BEGIN | Load context, see last session |
| Long session (90+ min) | Q-CHECKPOINT | Insurance against data loss |
| Want to check progress | Q-STATUS | See session state, context health |
| Finishing work (normal) | Q-END | Full documentation + commit |
| Context critical (>90%) | Q-SAVE | Fast exit, still captures essentials |
| Want to verify success | Q-VERIFY | Check all files created correctly |
| Mid-session commit | Q-COMMIT | Save work without full documentation |
| Reflecting on session | Q-LEARNINGS | Capture insights and decisions |
| Structured data collection | Q-COURSE | Guided interview (customize) |

---

## Command Relationships

### Typical Session Flow
```
Q-BEGIN
   ↓
Work...
   ↓
Q-STATUS (check progress)
   ↓
Work...
   ↓
Q-CHECKPOINT (90 min mark)
   ↓
Work...
   ↓
Q-END (finish session)
   ↓
Q-VERIFY (confirm success)
```

### Alternative Flows

**Quick Session:**
```
Q-BEGIN → Work... → Q-END
```

**Long Session with Context Pressure:**
```
Q-BEGIN → Work... → Q-CHECKPOINT → Work... → Q-SAVE (context critical)
```

**Multiple Checkpoints:**
```
Q-BEGIN → Work → Q-CHECKPOINT → Work → Q-CHECKPOINT → Work → Q-END
```

---

## Error Recovery

### If Q-END Fails

**Use individual commands:**
```
Q-DUMP      → Create transcript manually
Q-COMMIT    → Commit changes manually
Then manually create session notes or skip
```

### If Files Missing

**Use Q-VERIFY to diagnose:**
```
Q-VERIFY
   ↓
Report shows what's missing
   ↓
Re-run failed command
```

### If Git Issues

**Check git status:**
```bash
git status
git log -1
```

Then re-run Q-COMMIT or fix manually.

---

## Advanced Usage

### Combining Commands

**Checkpoint then verify:**
```
Q-CHECKPOINT
Q-VERIFY
```

**Status check before end:**
```
Q-STATUS
[Review recommendations]
Q-END
```

### Scripting Support

All commands can be used in documented workflows:
```markdown
Daily workflow:
1. Q-BEGIN
2. Work for 90 minutes
3. Q-CHECKPOINT
4. Continue work
5. Q-STATUS (before ending)
6. Q-END
7. Q-VERIFY
8. git push
```

---

## Customization Guide

### Adding New Commands

**Template:**
```markdown
## Q-[COMMANDNAME]

When the user types `Q-[COMMANDNAME]`:

1. First step
2. Second step
3. Third step

**Purpose:** What this command does
```

Add to `GeneratedMDs/SHORTCUTS.md` and use immediately.

### Modifying Existing Commands

**Find command section in SHORTCUTS.md:**
```markdown
## Q-END

When the user types `Q-END`:
[...existing steps...]
```

**Add new step:**
```markdown
**STEP 4.5: Run Tests**
1. Execute: npm test
2. ✅ VERIFY: All tests pass
3. Report results
```

Save and use - next Q-END will run tests.

---

## Summary

The Q-Command System provides **10 commands** organized into:

**Session Management:** Q-BEGIN, Q-END, Q-SAVE
**Progress Tracking:** Q-CHECKPOINT, Q-STATUS, Q-VERIFY
**Documentation:** Q-DUMP, Q-LEARNINGS
**Git:** Q-COMMIT
**Specialized:** Q-COURSE (customizable)

All commands:
- ✅ Include verification
- ✅ Report explicitly
- ✅ Degrade gracefully
- ✅ Are customizable

---

**Next:** See [FEATURES.md](FEATURES.md) for detailed feature documentation, or [ARCHITECTURE.md](ARCHITECTURE.md) for how the system works internally.
