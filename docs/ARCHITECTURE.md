# Q-Command System Architecture

**How the System Works Internally**

**Version:** 1.0
**Last Updated:** 2025-11-26

---

## Overview

The Q-Command System is a **prompt-based architecture** that extends Claude Code's capabilities through structured instructions embedded in markdown files.

**Core principle:** Claude reads instruction files at session start and follows their specifications when user types Q-commands.

---

## System Components

### 1. Instruction Files (The Brain)

**GeneratedMDs/SHORTCUTS.md**
- Primary instruction file
- Defines all Q-commands
- Specifies exact behavior for each command
- Claude reads this at session start (via Q-BEGIN or CLAUDE.md reference)

**CLAUDE.md**
- Project context file
- Includes Q-command workflow section
- References SHORTCUTS.md
- Loaded at session start

**docs/workflow.md**
- User-facing documentation
- Daily workflow guide
- Not read by Claude (human reference only)

---

### 2. Generated Files (The Memory)

**Transcripts** (`GeneratedMDs/transcripts/`)
- Full session chronology
- Created by Q-DUMP or Q-END
- Read by Q-BEGIN for context

**Session Notes** (`GeneratedMDs/session-notes/`)
- Session summaries
- Created by Q-END
- Read by Q-BEGIN for context

**Checkpoints** (`GeneratedMDs/checkpoints/`)
- Mid-session snapshots
- Created by Q-CHECKPOINT
- Read by Q-END for merging

---

### 3. File Naming System

**Format:** `YYYY-MM-DD-HHmm-[PersonName].md`

**Why this format:**
- **Sortable:** Chronological sorting works automatically
- **Unique:** Per-person-per-session prevents collisions
- **Parseable:** Easy to extract date, time, person with scripts
- **Scriptable:** No spaces for shell safety

**Pattern matching:**
```bash
# Find all Gabriel's sessions
ls GeneratedMDs/session-notes/*-Gabriel.md

# Find today's sessions
ls GeneratedMDs/session-notes/2025-11-13-*.md

# Find sessions from specific hour
ls GeneratedMDs/session-notes/2025-11-13-09*.md
```

---

## How Commands Work

### Command Execution Flow

```
User types: Q-BEGIN
     ↓
Claude's process reads SHORTCUTS.md (in context from CLAUDE.md)
     ↓
Claude finds: ## Q-BEGIN section
     ↓
Claude follows instructions step-by-step:
  1. Read CLAUDE.md
  2. Review session notes
  3. Check work plan
  4. Summarize
  5. Ask what to work on
     ↓
Claude executes and reports results to user
```

**Key insight:** Commands are executed via **prompt engineering**, not code. Claude follows markdown instructions like a human would follow a playbook.

---

### State Management

**No persistent state between sessions:**
- Each Claude session starts fresh
- Context comes from **reading files**
- Session notes = memory layer
- SHORTCUTS.md = behavior layer

**State reconstruction:**
```
New session starts
     ↓
Q-BEGIN reads:
  - CLAUDE.md (project context)
  - Last session notes (what happened last time)
  - Work plan (current project state)
     ↓
Claude now has "memory" of project
```

---

### Context Preservation

**The auto-compact problem:**
- Long conversations hit Claude's context limit
- System auto-compacts conversation (summarizes and continues)
- Risk: Summary might lose details

**Q-Command solution:**
1. **Detection:** Check for "This session is being continued" message
2. **Recovery:** Read conversation summary thoroughly
3. **Checkpoints:** Secondary data source if summary incomplete
4. **Merge:** Combine summary + checkpoints + current context
5. **Document:** Treat as ONE unified session

**Data flow:**
```
Session start (9:00 AM)
     ↓
Work for 1.5 hours
     ↓
Q-CHECKPOINT (10:30 AM) → Checkpoint file created
     ↓
Auto-compact occurs (10:45 AM) → Conversation summary generated
     ↓
Continue working
     ↓
Q-END (11:30 AM) → Reads:
  - Conversation summary (9:00-10:45)
  - Checkpoint (10:30)
  - Current context (10:45-11:30)
     ↓
Outputs: Complete session documentation (9:00-11:30)
```

---

## File Organization

### Directory Structure

```
Repository Root/
├── CLAUDE.md                      ← Project context + Q-command reference
├── docs/workflow.md               ← User workflow guide
│
└── GeneratedMDs/
    ├── SHORTCUTS.md                ← Q-command specifications
    │
    ├── transcripts/                ← Full session logs
    │   ├── 2025-11-13-0913-Gabriel.md
    │   └── 2025-11-13-1200-Guy.md
    │
    ├── session-notes/              ← Session summaries
    │   ├── 2025-11-13-0913-Gabriel.md
    │   └── 2025-11-13-1200-Guy.md
    │
    └── checkpoints/                ← Mid-session snapshots
        ├── 2025-11-13-1030-Gabriel.md
        └── 2025-11-13-1145-Gabriel.md
```

**Rationale:**
- **GeneratedMDs/** contains all AI-generated content
- Subdirectories by file type (transcripts, notes, checkpoints)
- SHORTCUTS.md at root of GeneratedMDs (system file)
- Clean separation of system files vs generated files

---

### File Lifecycle

**Transcript lifecycle:**
```
Q-BEGIN (optional, doesn't create files)
     ↓
Session work (no files yet)
     ↓
Q-CHECKPOINT (creates checkpoint file)
     ↓
More session work
     ↓
Q-END (creates):
  - Transcript (GeneratedMDs/transcripts/)
  - Session notes (GeneratedMDs/session-notes/)
     ↓
Next session Q-BEGIN reads session notes
```

**File retention:**
- System files (SHORTCUTS.md, CLAUDE.md): Keep forever
- Session files (transcripts, notes): Keep or archive based on project needs
- Checkpoints: Can delete after Q-END (already merged into session notes)

---

## Verification System

### Multi-Level Verification

**Level 1: Operation-level**
```python
# Pseudo-code for Q-END Step 2
def create_transcript():
    file_path = generate_file_path()
    content = compile_session_data()

    write_file(file_path, content)

    # Verification
    if file_exists(file_path):
        if file_size(file_path) > 100_lines:
            report_success("✅ Transcript created")
            return True

    report_failure("❌ Transcript NOT created")
    return False
```

**Level 2: Step-level**
```
Q-END executes 6 steps sequentially
Each step verifies before proceeding
If step fails, report and offer options
```

**Level 3: Command-level**
```
Q-VERIFY runs after Q-END
Checks all expected files exist
Checks git status
Reports comprehensive status
```

**Why three levels:**
- **Real-time:** Catch errors immediately (Level 1)
- **Process:** Ensure workflow completes (Level 2)
- **Post-mortem:** User can verify anytime (Level 3)

---

### Error Handling Philosophy

**Graceful degradation:**
```
Q-END Step 2 fails (transcript creation)
     ↓
Report error explicitly
     ↓
Continue with Step 3 (session notes)
     ↓
Complete what's possible
     ↓
Final report shows:
  ✅ Session notes created
  ❌ Transcript FAILED
  ✅ Git committed
     ↓
Provide manual steps to create transcript
```

**Never:**
- Fail silently
- Pretend success when failed
- Abort entire operation for one failure

**Always:**
- Report specific error
- Complete what's possible
- Provide manual recovery steps

---

## Multi-User Design

### Person Identification

**How Claude knows who the user is:**
1. User types Q-BEGIN
2. Claude checks context/environment (if available from Claude Code)
3. Or asks: "Who is this session for?" (if needed)
4. Uses person name in all file generation

**File filtering:**
```
Q-BEGIN for Gabriel:
  → ls GeneratedMDs/session-notes/*-Gabriel.md
  → Reads most recent Gabriel session

Q-BEGIN for Guy:
  → ls GeneratedMDs/session-notes/*-Guy.md
  → Reads most recent Guy session
```

**No cross-contamination:**
- Gabriel sees Gabriel's history
- Guy sees Guy's history
- Each person picks up where THEY left off

---

### Concurrent Sessions

**Scenario:** Gabriel and Guy both working same day

```
9:00 AM - Gabriel starts session
9:15 AM - Guy starts session (different Claude instance)

10:30 AM - Gabriel runs Q-END
  → Creates: 2025-11-13-0900-Gabriel.md

10:45 AM - Guy runs Q-END
  → Creates: 2025-11-13-0915-Guy.md

No conflicts! Different files.
```

**Git handling:**
```
Both commit locally:
- Gabriel: git commit (9 files changed)
- Guy: git commit (3 files changed)

Manual push (user controlled):
- Gabriel: git push (when ready)
- Guy: git pull, git push (when ready)

Standard git workflow, no special handling needed.
```

---

## Git Integration

### Commit Strategy

**Q-END commit:**
```bash
git add .
git commit -m "Brief summary

- Point 1
- Point 2
- Point 3

Co-Authored-By: Claude <noreply@anthropic.com>
"
```

**What gets committed:**
- All modified project files
- New session transcript
- New session notes
- Updated work plan (if changed)

**What doesn't get committed (optional):**
- Can configure .gitignore to exclude session files
- Or include everything for full audit trail
- User choice per project

---

### Push Policy

**Why user-controlled:**
```
Scenario: Claude automatically pushes

Risk:
- User wanted to review changes first
- Work in progress not ready for team
- Accidental push of sensitive data
- No chance to amend commit message

Result: Loss of user control
```

**User-controlled approach:**
```
Q-END: Commits locally ✅
User: Reviews changes
User: Decides when to push
User: git push (manual)

Result: Full control
```

**Benefits:**
- User sovereignty
- Review before share
- Timing control
- Safety net

---

## Customization Architecture

### Command Extension

**Adding new commands is trivial:**

1. Edit `GeneratedMDs/SHORTCUTS.md`
2. Add new section:
```markdown
## Q-NEWCOMMAND

When the user types `Q-NEWCOMMAND`:
1. Do this
2. Then do that
3. Report results
```
3. Save file
4. Use immediately (Claude reads SHORTCUTS.md at session start)

**No coding required** - pure prompt engineering.

---

### Command Modification

**Modifying existing commands:**

**Example: Add test execution to Q-END**

Before:
```markdown
**STEP 5: Commit All Changes**
1. Stage all changes
2. Commit with message
...
```

After:
```markdown
**STEP 4.5: Run Tests**
1. Execute test suite
2. Verify all pass
3. Report results

**STEP 5: Commit All Changes**
1. Stage all changes
2. Commit with message
...
```

Save and done. Next Q-END will run tests.

---

### Custom Commands

You can add domain-specific commands to SHORTCUTS.md.

**How:**
1. Add a `## Q-YOURCOMMAND` section to SHORTCUTS.md
2. Define what Claude should do
3. Save and use immediately

**Examples of custom commands:**
- Q-FEATURE — Product feature specification
- Q-API — API endpoint design
- Q-TESTCASE — Test case templates

---

## Performance Considerations

### File Size Management

**Transcripts grow over time:**
- Long sessions = large files (500-1000 lines)
- Multiple sessions per day = many files

**Mitigation strategies:**
1. **Archival:** Compress old sessions: `tar -czf archive.tar.gz GeneratedMDs/`
2. **Gitignore:** Exclude from repo, backup separately
3. **Cleanup:** Delete old checkpoints (already merged into session notes)

---

### Context Window Management

**Problem:** Long conversations fill context window

**Solutions in Q-Command System:**

1. **Q-STATUS monitoring**
   - Warns at 70% context usage
   - Recommends checkpoint or wrap-up

2. **Q-CHECKPOINT insurance**
   - Saves progress before auto-compact
   - Enables recovery if auto-compact loses data

3. **Q-SAVE lightweight exit**
   - Fast exit when context critical
   - Still captures essential information

4. **File-based memory**
   - Session notes = external memory
   - Next session loads from files, not context

**Result:** Work productively even with context limits.

---

## Security Considerations

### Sensitive Data

**Risks:**
- Session files may contain API keys, passwords if discussed
- Transcripts capture full conversation

**Mitigations:**
1. **Gitignore session files** if sensitive
2. **Review before push** (user-controlled push)
3. **Archive to secure storage** (encrypted backup)
4. **Redact sensitive data** from session files before committing

**Best practice:**
```
.gitignore session files by default
Keep in local backup only
Push system files (SHORTCUTS.md) but not generated files
```

---

### Access Control

**Team scenarios:**
- If session files in git, all team sees all sessions
- If session files .gitignored, only on local machine

**Recommendations:**
- **Open source projects:** Gitignore session files (personal notes)
- **Client projects:** Include session files (audit trail)
- **Team projects:** Team decision (transparency vs privacy)

---

## Extension Points

### Where to Customize

1. **SHORTCUTS.md** - Add/modify commands
2. **CLAUDE.md** - Add project context, customize workflow
3. **docs/workflow.md** - Add team-specific procedures
4. **.gitignore** - Configure what gets committed
5. **Template files** - Create domain-specific templates

### What NOT to Customize

- File naming format (breaks compatibility)
- Directory structure (breaks Q-BEGIN/Q-END)
- Verification steps (reduces reliability)

**Safe customization:**
- Add new commands: ✅
- Modify Q-END steps: ✅
- Add new verification: ✅
- Change file locations: ❌
- Remove verification: ❌

---

## System Limitations

### 1. Depends on Claude Following Instructions
- If Claude doesn't read SHORTCUTS.md, commands won't work
- Solution: CLAUDE.md references SHORTCUTS.md explicitly

### 2. No Enforcement Layer
- System can't prevent Claude from deviating
- Solution: Clear, explicit instructions in SHORTCUTS.md

### 3. File System Access Required
- Claude must be able to create files
- Solution: Use Claude Code (has file system access)

### 4. Git Required for Full Features
- Q-COMMIT needs git
- Solution: Commands gracefully degrade if git unavailable

### 5. Context Window Still Finite
- Very long sessions may still hit limits
- Solution: Q-CHECKPOINT + Q-SAVE provide safety net

---

## Design Principles

### 1. Prompt Engineering Over Code
- **Why:** More maintainable, more transparent
- **How:** All behavior in markdown instructions

### 2. Explicit Over Implicit
- **Why:** User trust requires transparency
- **How:** Every operation reports results explicitly

### 3. User Control Over Automation
- **Why:** Sovereignty and safety
- **How:** User decides when to push, can verify everything

### 4. Files Over Context
- **Why:** Context window is limited
- **How:** Persistent memory in session files

### 5. Graceful Degradation
- **Why:** Reliability in imperfect conditions
- **How:** Complete what's possible, report clearly

### 6. Multi-User by Design
- **Why:** Teams need this too
- **How:** Per-person-per-session file naming

---

## Future Enhancements

**Possible future features:**

1. **Automated archival:** Script to compress old sessions
2. **Session analytics:** Aggregate statistics across sessions
3. **Template marketplace:** Share domain-specific templates
4. **Webhook integration:** Notify team on session complete
5. **Cloud sync:** Sync session files to Dropbox/S3 automatically
6. **Web viewer:** Browse session files in browser
7. **Search:** Full-text search across all sessions

**Current v1.0 is stable and complete** - enhancements are optional.

---

## Summary

The Q-Command System works through:

✅ **Prompt engineering** - Instructions in markdown files
✅ **File-based memory** - Session notes persist between sessions
✅ **Verification at every step** - Explicit success/failure reporting
✅ **User control** - Manual push, verify everything
✅ **Multi-user naming** - No collisions
✅ **Graceful degradation** - Complete what's possible
✅ **Easy customization** - Edit markdown, no coding

**Architecture philosophy:** Simple, transparent, reliable, user-controlled.

---

**Next:** See [commands-reference.md](commands-reference.md) for complete command documentation.
