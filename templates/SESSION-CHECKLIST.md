# Session Checklist

Use this checklist at the end of every working session with Claude Code.

**Last Updated:** 2025-11-13
**Version:** 2.0 (Matches SHORTCUTS v2.0 robust system)

---

## Quick Reference

**NEW in v2.0:**
- All session files now use per-person-per-session naming: `YYYY-MM-DD-HHmm-[PersonName].md`
- New directory structure under `GeneratedMDs/` (transcripts/, session-notes/, checkpoints/)
- New commands: `Q-SAVE`, `Q-VERIFY` for better reliability
- Enhanced `Q-STATUS` with context health warnings
- All commands now include verification steps

---

## End of Session Checklist

**TIP:** Just type `Q-END` and Claude will do all of this automatically with verification!

### Step 1: Create Session Transcript
- [ ] User types `Q-END` (or `Q-DUMP` if manual)
- [ ] Claude creates transcript in `GeneratedMDs/transcripts/YYYY-MM-DD-HHmm-[PersonName].md`
- [ ] **CRITICAL for continued sessions:** Claude documents ALL work from entire session (including before auto-compact)
- [ ] **Verification:** Claude confirms file exists and has substantial content
- [ ] You see: "✅ Transcript created: GeneratedMDs/transcripts/[filename]"

### Step 2: Create Session Notes
- [ ] Claude creates session notes in `GeneratedMDs/session-notes/YYYY-MM-DD-HHmm-[PersonName].md`
- [ ] Session summary includes all key accomplishments
- [ ] Files created/modified documented
- [ ] Decisions made documented
- [ ] Open questions documented
- [ ] Next actions identified
- [ ] **Verification:** Claude confirms file exists and has content
- [ ] You see: "✅ Session notes created: GeneratedMDs/session-notes/[filename]"

### Step 3: Update Work Plan (if applicable)
- [ ] Claude checks if blockers resolved or milestones completed
- [ ] If yes: Claude updates `work-plan/work-plan.md`
  - Blockers updated
  - Timeline adjusted if needed
  - New tasks added
  - Recent progress section updated
- [ ] **Verification:** Claude confirms changes saved
- [ ] You see: "✅ Work plan updated" or "ℹ️ Work plan unchanged"

### Step 4: Commit All Changes
- [ ] Claude stages all changes (`git add .`)
- [ ] Claude commits with descriptive message + bullets
- [ ] Includes: `Co-Authored-By: Claude <noreply@anthropic.com>`
- [ ] **Verification:** Claude confirms clean working tree
- [ ] You see: "✅ Changes committed: [message]"

### Step 5: Final Verification (Automatic in Q-END)
- [ ] You see final report showing:
  ```
  ✅ Session Complete!

  Transcript: GeneratedMDs/transcripts/[filename]
  Session Notes: GeneratedMDs/session-notes/[filename]
  Work Plan: [Updated/Unchanged]
  Git: Committed ([N] files changed)

  Ready to push! Run `git push` when ready.
  ```

### Step 6: Manual Push (Your Control)
- [ ] Review all staged changes: `git status` (should show clean tree)
- [ ] Review commit message: `git log -1`
- [ ] **When ready**, you manually run: `git push`
- [ ] Verify push successful on GitHub

---

## Alternative: Q-SAVE (Lightweight Quick Exit)

**When to use:** Context usage is critical (>90%), need to exit quickly, or conversation is slowing down

- [ ] User types `Q-SAVE`
- [ ] Claude creates basic transcript in `GeneratedMDs/transcripts/`
- [ ] Claude commits all changes
- [ ] You see: "✅ Quick Save Complete!"
- [ ] **Note:** Skips detailed session notes and work plan updates
- [ ] Run `Q-VERIFY` later to see what was saved

---

## Verification: Did It Work?

**After Q-END or Q-SAVE, run Q-VERIFY to confirm:**

- [ ] User types `Q-VERIFY`
- [ ] Claude checks for transcript file (should exist)
- [ ] Claude checks for session notes file (should exist if Q-END)
- [ ] Claude checks for checkpoints from session (if any)
- [ ] Claude checks git status (should be committed)
- [ ] You see verification report with ✅ or ⚠️ for each item

---

## 🚨 IMPORTANT POLICIES

### Git Push Policy
- **Claude will NEVER run `git push` automatically**
- Only you decide when code goes to GitHub
- Claude can stage and commit locally, but push is manual
- This gives you full control over what gets shared

### Why This Matters
- Allows review before making public
- Control over timing of releases
- Prevents accidental pushes of work-in-progress
- You maintain sovereignty over the repository

---

## Mid-Session Checkpointing (Optional but Recommended)

**When to checkpoint:**
- [ ] Long session (over 90 minutes)
- [ ] After completing major milestone
- [ ] Before starting next big chunk of work
- [ ] Notice conversation slowing down (context getting full)
- [ ] Want insurance against auto-compact

**How to checkpoint:**
- [ ] User types `Q-CHECKPOINT` in chat
- [ ] Claude creates checkpoint file in `GeneratedMDs/checkpoints/YYYY-MM-DD-HHmm-[PersonName].md`
- [ ] Lightweight snapshot of progress so far (session start, accomplishments, files changed, current status)
- [ ] **Verification:** Claude confirms file exists
- [ ] You see: "✅ Checkpoint saved at [HH:MM]"
- [ ] Continue working after checkpoint saved
- [ ] Q-END will merge checkpoint + final work = complete docs

**Check status anytime:**
- [ ] User types `Q-STATUS` to see current session state
- [ ] Shows accomplishments, files changed, context health
- [ ] Tells you if checkpoint is recommended
- [ ] Shows time since last checkpoint

---

## Session Start Checklist

**TIP:** Just type `Q-BEGIN` and Claude will do all of this automatically!

### Step 1: Context Refresh
- [ ] Claude reads `CLAUDE.md` for quick context
- [ ] Claude reviews last session notes from `GeneratedMDs/session-notes/`
  - Filters by your name
  - Reads most recent session
- [ ] Claude reviews current status from `work-plan/work-plan.md`
  - Check blocker status
  - Review recent progress
  - Identify pending tasks

### Step 2: Session Summary
- [ ] Claude provides brief summary:
  - What was accomplished last session
  - Current blocker status
  - Open questions or decisions needed

### Step 3: Today's Focus
- [ ] Claude asks: "What would you like to work on today?"
- [ ] Clarify any questions or confusion
- [ ] Discuss approach for today's work

### Step 4: Begin Work
- [ ] Claude sets up TodoWrite for today's tasks (if needed)
- [ ] Proceed with planned work
- [ ] Document decisions as we go

---

## Quick Commands Reference

### Session Management
- **Q-BEGIN** - Start session (context refresh, review notes & work plan, ask what to work on)
- **Q-END** - End session (transcript, session notes, work plan update, commit, verify)
- **Q-SAVE** - Lightweight quick exit (transcript + commit only, skips detailed notes)
- **Q-CHECKPOINT** - Create mid-session progress snapshot (insurance against auto-compact)
- **Q-STATUS** - Show current session state, context health, and recommendations
- **Q-VERIFY** - Check that Q-END/Q-CHECKPOINT actually worked

### Documentation
- **Q-DUMP** - Create session transcript manually in GeneratedMDs/transcripts/
- **Q-COMMIT** - Stage and commit all changes locally (no push)
- **Q-LEARNINGS** - Summarize key learnings from session

### Course Management
- **Q-COURSE** - Guided interview to define a new course

---

## File Naming Convention (v2.0)

All generated session files now follow this format:
**`YYYY-MM-DD-HHmm-[PersonName].md`**

**Examples:**
- `2025-11-13-0913-Gabriel.md` (Gabriel's session starting at 9:13 AM)
- `2025-11-13-1200-Guy.md` (Guy's session starting at 12:00 PM)
- `2025-11-13-1430-Fraser.md` (Fraser's session starting at 2:30 PM)

**Directory Structure:**
```
GeneratedMDs/
  transcripts/          ← Full session transcripts
  session-notes/        ← Session summaries
  checkpoints/          ← Mid-session snapshots
  SHORTCUTS.md          ← Command specifications
```

**Benefits:**
- No file name collisions when multiple people work same day
- Sortable by date and time
- Clear who worked when
- Easy to find your own sessions

---

## Troubleshooting

### Q-END didn't create files?
1. Run `Q-VERIFY` to check what exists
2. Check `GeneratedMDs/transcripts/` and `GeneratedMDs/session-notes/` directories
3. If missing, run `Q-DUMP` manually to create transcript
4. Context may have been too high - use `Q-SAVE` next time

### Checkpoint didn't save?
1. Run `Q-VERIFY` to check
2. Look in `GeneratedMDs/checkpoints/` for files matching today's date and your name
3. If missing, run `Q-CHECKPOINT` again

### Context getting full, conversation slowing?
1. Run `Q-STATUS` to check context health
2. If >70%: Run `Q-CHECKPOINT` now
3. If >90%: Use `Q-SAVE` for quick exit instead of Q-END

### Can't find last session notes?
1. Check `GeneratedMDs/session-notes/` directory
2. Look for files matching your name: `*-YourName.md`
3. Sort by date to find most recent
4. Old format files may still be in `session-notes/session-notes-YYYY-MM-DD.md`

---

## Error Handling

**If Claude reports errors during Q-END:**
- Claude will tell you exactly what succeeded vs failed
- Complete what is possible, skip what fails
- Provide manual steps for failed items
- You can run individual commands manually:
  - `Q-DUMP` - Create transcript
  - `Q-COMMIT` - Commit changes
  - Then manually update notes/work plan if needed

**If uncertain:**
- Run `Q-STATUS` anytime to see session state
- Run `Q-VERIFY` after Q-END to confirm it worked
- Ask Claude "Did Q-END complete successfully?"

---

**Remember:** The workflow is designed to give you complete control while leveraging Claude's documentation and organization capabilities. Claude handles the documentation burden, but you control when code goes to GitHub.

---

## Version History

**v2.0 (2025-11-13):**
- Updated for new per-person-per-session file naming
- Updated directory structure (GeneratedMDs/ subdirectories)
- Added Q-SAVE, Q-VERIFY, enhanced Q-STATUS
- Added verification steps throughout
- Added troubleshooting section

**v1.0 (2025-11-11):**
- Initial checklist for Q-command workflow
