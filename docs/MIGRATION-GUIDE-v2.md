# Migration Guide: Q-Command System v1.0 → v2.0

**Created:** 2025-11-13
**Purpose:** Guide for transitioning from old file structure to new robust system

---

## What Changed in v2.0?

### File Naming Convention
**OLD (v1.0):**
- `GeneratedMDs/YYYY-MM-DD HH_mm Dev [PersonName].md`
- `session-notes/session-notes-YYYY-MM-DD.md` (one file per date, all people)

**NEW (v2.0):**
- `GeneratedMDs/transcripts/YYYY-MM-DD-HHmm-[PersonName].md`
- `GeneratedMDs/session-notes/YYYY-MM-DD-HHmm-[PersonName].md`
- `GeneratedMDs/checkpoints/YYYY-MM-DD-HHmm-[PersonName].md`

**Key differences:**
- Removed spaces from filenames (easier for scripts)
- Removed "Dev" label (redundant)
- Time format: `HHmm` instead of `HH_mm` (cleaner, no underscore)
- Organized into subdirectories by type
- One file per person per session (no collisions)

### Directory Structure
**OLD (v1.0):**
```
GeneratedMDs/
  2025-11-13 09_13 Dev Gabriel.md
  checkpoints/
    [checkpoint files]
  SHORTCUTS.md

session-notes/
  session-notes-2025-11-13.md  ← Multiple people in one file
```

**NEW (v2.0):**
```
GeneratedMDs/
  transcripts/
    2025-11-13-0913-Gabriel.md
    2025-11-13-1200-Guy.md
  session-notes/
    2025-11-13-0913-Gabriel.md
    2025-11-13-1200-Guy.md
  checkpoints/
    2025-11-13-1130-Gabriel.md
  SHORTCUTS.md
```

### New Commands
- **Q-SAVE** - Lightweight quick exit (when context is tight)
- **Q-VERIFY** - Verify Q-END/Q-CHECKPOINT actually worked

### Enhanced Commands
- **Q-END** - Now includes verification steps and better error handling
- **Q-STATUS** - Now shows context health and provides recommendations
- **Q-CHECKPOINT** - Now verifies file creation

---

## Migration Strategy

### Option 1: Leave Legacy Files As-Is (RECOMMENDED)
**Best for:** Minimal disruption, easy rollout

**What to do:**
1. Keep all existing files in their current locations
2. Start using new format from today forward
3. Q-BEGIN will check both old and new locations for session notes
4. No file moves required

**Pros:**
- No risk of losing history
- Immediate start with new system
- Old files still accessible

**Cons:**
- Two file formats coexist
- Slightly messier during transition

### Option 2: Migrate All Files to New Structure
**Best for:** Clean slate, consistent structure

**What to do:**
1. Move transcript files from `GeneratedMDs/*.md` to `GeneratedMDs/transcripts/`
2. Rename files to new format (remove spaces, standardize time format)
3. Split session notes by person (one file per session)
4. Move checkpoints to new format

**Pros:**
- Everything consistent
- Easier to find files long-term
- Clean directory structure

**Cons:**
- Risk of errors during migration
- Time-consuming
- May break references

**Migration script required** (user decision whether to implement)

---

## Current File Inventory

### Existing Files (as of 2025-11-13)

**In GeneratedMDs/:**
- `2025-11-11 20_00 Dev.md` (no person name)
- `2025-11-12 14_30 Dev.md` (no person name)
- `2025-11-12 session-transcript.md` (non-standard format)
- `2025-11-12_session-transcript.md` (non-standard format)
- `2025-11-13 09_13 Dev Gabriel.md` (v1 format with person name)
- `2025-11-13 12_00 Guy Claude Code.md` (v1 format with person name)

**In GeneratedMDs/checkpoints/:**
- (checkpoint files - check directory for current list)

**In session-notes/:**
- `CHECKPOINT-2025-11-13-afternoon.md` (created in wrong location)
- `session-notes-2025-11-11.md` (v1 format, per-date)
- `session-notes-2025-11-12.md` (v1 format, per-date)
- `session-notes-2025-11-13.md` (v1 format, per-date)

---

## Backward Compatibility

### Q-BEGIN Behavior
Q-BEGIN will now check BOTH locations for session notes:
1. **First:** Check `GeneratedMDs/session-notes/*-[PersonName].md` (new format)
2. **Fallback:** Check `session-notes/session-notes-*.md` (old format)
3. Read most recent file found

### Finding Old Files
Legacy files remain accessible:
- Search by date: `ls GeneratedMDs/2025-11-*`
- Search session notes: `cat session-notes/session-notes-2025-11-13.md`
- All content preserved, just in old locations

---

## Recommended Migration Plan

### Phase 1: Immediate (Today)
✅ **DONE:**
- [x] Create new directory structure
- [x] Update SHORTCUTS.md with v2.0 specifications
- [x] Update CLAUDE.md with new conventions
- [x] Update SESSION-CHECKLIST.md with v2.0 workflow

### Phase 2: Start Using New System (Next Session)
- [ ] All new sessions use new file format
- [ ] Q-BEGIN checks both old and new locations
- [ ] Q-END creates files in new locations

### Phase 3: Coexistence (Next 1-2 Weeks)
- [ ] Team members start using v2.0 system
- [ ] Old files remain for reference
- [ ] No urgent need to migrate old files

### Phase 4: Optional Cleanup (Future)
- [ ] User decides whether to migrate old files
- [ ] Can create migration script if desired
- [ ] Not required for system to function

---

## File Naming Examples

### Converting Old Format to New Format

**Example 1: Transcript with person name**
- OLD: `2025-11-13 09_13 Dev Gabriel.md`
- NEW: `transcripts/2025-11-13-0913-Gabriel.md`
- Changes: Removed spaces, removed "Dev", changed `09_13` to `0913`, moved to subdirectory

**Example 2: Session notes (per-date)**
- OLD: `session-notes/session-notes-2025-11-13.md` (contains Gabriel + Guy)
- NEW: Split into:
  - `session-notes/2025-11-13-0913-Gabriel.md` (Gabriel's session)
  - `session-notes/2025-11-13-1200-Guy.md` (Guy's session)

**Example 3: Checkpoint**
- OLD: `checkpoints/2025-11-13 13_09 Checkpoint Gabriel.md`
- NEW: `checkpoints/2025-11-13-1309-Gabriel.md`
- Changes: Removed spaces, removed "Checkpoint" label

---

## Testing the New System

### Verify Q-Commands Work
1. **Test Q-STATUS:**
   ```
   User: Q-STATUS
   Expected: Shows current session state
   ```

2. **Test Q-CHECKPOINT:**
   ```
   User: Q-CHECKPOINT
   Expected: Creates file in GeneratedMDs/checkpoints/YYYY-MM-DD-HHmm-[PersonName].md
   ```

3. **Test Q-VERIFY:**
   ```
   User: Q-VERIFY
   Expected: Shows verification report of existing files
   ```

4. **Test Q-END:**
   ```
   User: Q-END
   Expected: Creates both transcript and session notes in new locations
   Expected: Shows verification for each step
   ```

### Verify Directory Structure
```bash
ls -la GeneratedMDs/transcripts/
ls -la GeneratedMDs/session-notes/
ls -la GeneratedMDs/checkpoints/
```

Should see new subdirectories exist (may be empty initially).

---

## Troubleshooting

### Q-BEGIN can't find last session notes
**Problem:** Q-BEGIN says "no previous session found"
**Solution:**
1. Old files are in `session-notes/session-notes-YYYY-MM-DD.md`
2. Q-BEGIN should check both locations
3. If not working, manually review old session notes

### Q-CHECKPOINT created file in wrong location
**Problem:** Checkpoint created as `session-notes/CHECKPOINT-*.md` instead of `GeneratedMDs/checkpoints/`
**Solution:**
1. Manually move file to correct location
2. Update SHORTCUTS.md spec if Claude didn't follow it
3. File will work from either location, but prefer new location

### Files have spaces in names
**Problem:** New files created with spaces (old format)
**Solution:**
1. Check that SHORTCUTS.md was updated correctly
2. Claude should read SHORTCUTS.md at session start
3. Report issue and re-run Q-END or Q-CHECKPOINT

---

## Benefits of v2.0 System

1. **No Collisions:** Multiple team members can work same day without conflicts
2. **Better Organization:** Transcripts, notes, and checkpoints separated by type
3. **Scriptable:** No spaces in filenames = easier automation
4. **Sortable:** Files sort chronologically by date and time
5. **Verifiable:** Q-VERIFY command confirms operations succeeded
6. **Robust:** Step-by-step verification prevents silent failures
7. **Context-Aware:** Q-STATUS warns when context is high, Q-SAVE provides quick exit

---

## Questions?

**Q: Do I need to migrate old files right now?**
A: No. Old files remain accessible. New system works alongside old files.

**Q: Will old files stop working?**
A: No. They remain readable and accessible. Just won't be updated.

**Q: Can I still find Guy's sessions from Nov 13?**
A: Yes. Check `session-notes/session-notes-2025-11-13.md` for old format, or `GeneratedMDs/session-notes/2025-11-13-1200-Guy.md` for new format (if created).

**Q: What if Q-END fails?**
A: Use Q-VERIFY to see what was created. Use Q-SAVE for lightweight backup. Run individual commands (Q-DUMP, Q-COMMIT) manually if needed.

**Q: How do I know which format a file uses?**
A: Check file location and name:
- Spaces + "Dev" label = old format
- Dashes + subdirectory = new format

---

## Summary

**What You Need to Know:**
1. ✅ New file format starting today: `YYYY-MM-DD-HHmm-[PersonName].md`
2. ✅ New directories: `GeneratedMDs/transcripts/`, `session-notes/`, `checkpoints/`
3. ✅ New commands: Q-SAVE, Q-VERIFY
4. ✅ Old files remain accessible (no migration required)
5. ✅ All commands now include verification steps

**What Changed:**
- File naming (removed spaces, standardized format)
- Directory structure (organized by type)
- Added verification and error handling
- Better context awareness

**What Stayed the Same:**
- Q-BEGIN, Q-END, Q-CHECKPOINT workflow
- Git push policy (always manual)
- TodoWrite integration
- Core functionality

**Next Steps:**
1. Start using new system from today forward
2. Test Q-VERIFY after Q-END to confirm it works
3. Use Q-STATUS during long sessions to monitor context
4. Old files remain for reference

---

**Version:** v2.0 Migration Guide
**Last Updated:** 2025-11-13
**Status:** System upgraded and ready to use
