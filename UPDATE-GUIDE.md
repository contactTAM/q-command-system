# Q-Command System Update Guide

**How to Update an Existing v2.0 Installation**

**Version:** 2.0
**Last Updated:** 2025-11-13

---

## Overview

This guide covers **updating an existing Q-Command System v2.0 installation** when:
- Bug fixes are released
- New commands are added
- Improvements are made to existing commands
- Documentation is updated

**This guide is NOT for:**
- Initial installation → See [IMPLEMENTATION-GUIDE.md](IMPLEMENTATION-GUIDE.md)
- Upgrading from v1.0 → v2.0 → See [docs/MIGRATION-GUIDE-v2.md](docs/MIGRATION-GUIDE-v2.md)

---

## What Gets Updated vs Preserved

### System Files (UPDATE These)
✅ **SHORTCUTS.md** - Q-command specifications
✅ **SESSION-CHECKLIST.md** - Workflow guide
✅ **CLAUDE.md** - Q-command section (may need manual merge)

### Generated Files (PRESERVE These)
❌ **DON'T touch transcripts/** - Your session history
❌ **DON'T touch session-notes/** - Your summaries
❌ **DON'T touch checkpoints/** - Your snapshots

### Directory Structure (KEEP As-Is)
✓ GeneratedMDs/transcripts/
✓ GeneratedMDs/session-notes/
✓ GeneratedMDs/checkpoints/

---

## Quick Update (Simple Cases)

**Use this method when:**
- Only SHORTCUTS.md changed
- No breaking changes
- Just bug fixes or new commands

### Steps:

1. **Backup current system files:**
```bash
cd /path/to/your/repository
cp GeneratedMDs/SHORTCUTS.md GeneratedMDs/SHORTCUTS.md.backup
cp SESSION-CHECKLIST.md SESSION-CHECKLIST.md.backup
```

2. **Copy new system files:**
```bash
# From Q-command-system package
cp /path/to/Q-command-system/templates/SHORTCUTS.md GeneratedMDs/
cp /path/to/Q-command-system/templates/SESSION-CHECKLIST.md .
```

3. **Test with Q-BEGIN:**
```
Q-BEGIN
```

If it works, you're done!

4. **If customizations exist, restore them:**
```bash
# Compare old vs new
diff GeneratedMDs/SHORTCUTS.md.backup GeneratedMDs/SHORTCUTS.md

# Manually merge your customizations back in
```

---

## Detailed Update (With Customizations)

**Use this method when:**
- You've customized commands
- You've added custom Q-commands
- CLAUDE.md section needs updating

### Step 1: Backup Everything

```bash
cd /path/to/your/repository

# Backup system files
mkdir -p ~/q-command-backup-$(date +%Y%m%d)
cp GeneratedMDs/SHORTCUTS.md ~/q-command-backup-$(date +%Y%m%d)/
cp SESSION-CHECKLIST.md ~/q-command-backup-$(date +%Y%m%d)/
cp CLAUDE.md ~/q-command-backup-$(date +%Y%m%d)/

echo "Backup created in ~/q-command-backup-$(date +%Y%m%d)/"
```

### Step 2: Identify Your Customizations

**Check for custom commands:**
```bash
# Look for custom Q-commands you added
grep "## Q-" GeneratedMDs/SHORTCUTS.md
```

**Document your customizations:**
- Custom commands (Q-REVIEW, Q-DEPLOY, etc.)
- Modified Q-END steps (added tests, linting, etc.)
- Changed file locations
- Team member names
- Any other modifications

### Step 3: Update System Files

**Option A: Replace and Re-Customize**
```bash
# Replace with new version
cp /path/to/Q-command-system/templates/SHORTCUTS.md GeneratedMDs/
cp /path/to/Q-command-system/templates/SESSION-CHECKLIST.md .

# Then manually add your customizations back
# (Use backup files as reference)
```

**Option B: Merge Changes Manually**
```bash
# Use diff to see what changed
diff ~/q-command-backup-*/SHORTCUTS.md /path/to/Q-command-system/templates/SHORTCUTS.md

# Manually merge new features with your customizations
# (Recommended for complex customizations)
```

### Step 4: Update CLAUDE.md Section

**If CLAUDE.md Q-command section changed:**

1. Open `templates/CLAUDE.md` in new package
2. Check if "Workflow with Claude Code" section has changes
3. If yes, update your CLAUDE.md section accordingly
4. Preserve your project-specific context

### Step 5: Test Updated System

```bash
# Start Claude Code session
# Test each command:
Q-BEGIN
Q-STATUS
Q-CHECKPOINT
Q-VERIFY
Q-END
```

**Verify:**
- ✅ Q-BEGIN reads last session correctly
- ✅ All commands work as expected
- ✅ Your customizations still work
- ✅ File naming format unchanged
- ✅ No errors reported

---

## Update Checklist

### Before Update
- [ ] Backup current SHORTCUTS.md
- [ ] Backup current SESSION-CHECKLIST.md
- [ ] Backup current CLAUDE.md
- [ ] Document any custom commands you've added
- [ ] Note any modifications to standard commands
- [ ] Commit any uncommitted work (`git status`)

### During Update
- [ ] Copy new SHORTCUTS.md
- [ ] Copy new SESSION-CHECKLIST.md
- [ ] Update CLAUDE.md section (if needed)
- [ ] Re-apply custom commands (if any)
- [ ] Re-apply command modifications (if any)
- [ ] Update team member names (if changed)

### After Update
- [ ] Test Q-BEGIN (reads last session?)
- [ ] Test Q-STATUS (shows correct info?)
- [ ] Test Q-CHECKPOINT (creates file?)
- [ ] Test Q-VERIFY (checks files?)
- [ ] Test Q-END (creates transcript + notes?)
- [ ] Verify custom commands still work (if any)
- [ ] Check file naming format unchanged
- [ ] Commit updated system files

---

## Preserving Session History

**CRITICAL: Never delete or overwrite:**

```
GeneratedMDs/
  transcripts/          ← YOUR SESSION HISTORY
    2025-11-*.md        ← Keep all these!
  session-notes/        ← YOUR SUMMARIES
    2025-11-*.md        ← Keep all these!
  checkpoints/          ← YOUR SNAPSHOTS
    2025-11-*.md        ← Keep all these!
```

**Only update:**
```
GeneratedMDs/
  SHORTCUTS.md          ← System file (safe to replace)

SESSION-CHECKLIST.md    ← Documentation (safe to replace)
CLAUDE.md               ← Merge Q-command section carefully
```

---

## Handling Custom Commands

### If You Added Custom Commands

**Example:** You added Q-REVIEW command

**Preserve your custom command:**

1. **Before update:**
```bash
# Extract your custom command
sed -n '/## Q-REVIEW/,/^## /p' GeneratedMDs/SHORTCUTS.md > my-custom-commands.md
```

2. **After updating SHORTCUTS.md:**
```bash
# Append your custom command to new SHORTCUTS.md
cat my-custom-commands.md >> GeneratedMDs/SHORTCUTS.md
```

3. **Or manually copy-paste** your custom command section into updated SHORTCUTS.md

---

## Handling Modified Commands

### If You Modified Existing Commands

**Example:** You added test execution to Q-END

**Steps:**

1. **Document your modification:**
```markdown
I added this to Q-END STEP 4.5:
- Execute: npm test
- Verify: All tests pass
- Report results
```

2. **After update:**
- Open new SHORTCUTS.md
- Find Q-END section
- Re-add your modification to appropriate step

3. **Test thoroughly** to ensure modification still works with new version

---

## Breaking Changes

### How to Identify Breaking Changes

**Check release notes** (if provided) for:
- File naming format changes
- Directory structure changes
- Command behavior changes
- Required new parameters

**If breaking changes exist:**
- Follow migration instructions carefully
- May need to regenerate some files
- Test extensively before committing

**v2.0 is stable** - future v2.x updates should be non-breaking

---

## Rollback Procedure

**If update causes problems:**

### Quick Rollback

```bash
# Restore from backup
cp ~/q-command-backup-*/SHORTCUTS.md GeneratedMDs/
cp ~/q-command-backup-*/SESSION-CHECKLIST.md .
cp ~/q-command-backup-*/CLAUDE.md .

# Or use git if committed:
git checkout HEAD~1 GeneratedMDs/SHORTCUTS.md
git checkout HEAD~1 SESSION-CHECKLIST.md
git checkout HEAD~1 CLAUDE.md
```

### Test After Rollback

```
Q-BEGIN
Q-STATUS
```

Should work as before update.

---

## Version Tracking

### Track Which Version You Have

**Add to SHORTCUTS.md header:**
```markdown
# SHORTCUTS.md

**Version:** 2.0.1
**Last Updated:** 2025-11-20
**Customizations:** Q-REVIEW command added, Q-END runs tests
```

**Or create version file:**
```bash
echo "Q-Command System v2.0.1" > GeneratedMDs/.version
echo "Updated: 2025-11-20" >> GeneratedMDs/.version
echo "Customizations: Q-REVIEW, modified Q-END" >> GeneratedMDs/.version
```

---

## Updating Multiple Repositories

**If you use Q-Command System in multiple projects:**

### Option 1: Update Each Individually
- Most control
- Can test in one before updating others
- Customizations per project preserved

### Option 2: Shared Symlink Approach
```bash
# All repos link to shared system
~/Q-command-system/templates/SHORTCUTS.md

# Update once, applies to all repos
cp /path/to/new/SHORTCUTS.md ~/Q-command-system/templates/

# All repos using symlink get update automatically
```

**Caution with Option 2:**
- Changes affect all repos simultaneously
- Less safe for testing
- But much faster for updates

---

## Staying Up To Date

### Check for Updates

**If Q-Command System is in a GitHub repo:**
```bash
# Check for new releases
# Visit: https://github.com/your-username/Q-command-system/releases

# Or if you cloned it:
cd ~/Q-command-system
git pull
```

### Subscribe to Updates

- Watch the Q-Command System repo on GitHub
- Check release notes for changes
- Update when convenient

---

## Example Update Session

### Scenario: Bug fix released for Q-END

```bash
# 1. Backup
cd /path/to/your/project
cp GeneratedMDs/SHORTCUTS.md GeneratedMDs/SHORTCUTS.md.backup

# 2. Note customizations
grep "## Q-REVIEW" GeneratedMDs/SHORTCUTS.md
# I have a custom Q-REVIEW command

# 3. Update
cp ~/Q-command-system-new/templates/SHORTCUTS.md GeneratedMDs/

# 4. Restore customization
# Open GeneratedMDs/SHORTCUTS.md
# Copy Q-REVIEW section from backup
# Paste at end of file

# 5. Test
# Start Claude Code
Q-BEGIN
Q-REVIEW
Q-END

# 6. Commit
git add GeneratedMDs/SHORTCUTS.md
git commit -m "Update Q-Command System to v2.0.1 (Q-END bug fix)

Preserved custom Q-REVIEW command.

Co-Authored-By: Claude <noreply@anthropic.com>
"
```

---

## Troubleshooting Updates

### Problem: Q-BEGIN doesn't work after update

**Likely cause:** SHORTCUTS.md syntax error

**Solution:**
```bash
# Restore backup
cp GeneratedMDs/SHORTCUTS.md.backup GeneratedMDs/SHORTCUTS.md

# Try update again more carefully
# Or report issue
```

### Problem: Custom commands disappeared

**Cause:** Overwrote SHORTCUTS.md without merging

**Solution:**
```bash
# Restore backup
cp GeneratedMDs/SHORTCUTS.md.backup GeneratedMDs/SHORTCUTS.md

# Extract custom commands
# Update carefully
# Re-add custom commands
```

### Problem: Files created in wrong location

**Cause:** Directory structure changed

**Solution:**
```bash
# Check directory structure
ls -la GeneratedMDs/

# Should see:
# transcripts/
# session-notes/
# checkpoints/

# If missing, create:
mkdir -p GeneratedMDs/transcripts
mkdir -p GeneratedMDs/session-notes
mkdir -p GeneratedMDs/checkpoints
```

---

## Summary

**Updating Q-Command System v2.0:**

1. **Backup** system files
2. **Document** customizations
3. **Update** system files (SHORTCUTS.md, etc.)
4. **Restore** customizations
5. **Test** all commands
6. **Commit** if successful

**Never delete:**
- Session history (transcripts)
- Session notes
- Checkpoints

**Safe to replace:**
- SHORTCUTS.md (but preserve customizations)
- SESSION-CHECKLIST.md
- CLAUDE.md Q-command section (merge carefully)

---

## Quick Reference

| Scenario | Action | Guide Section |
|----------|--------|---------------|
| Simple bug fix, no customizations | Quick Update | [Quick Update](#quick-update-simple-cases) |
| Update with custom commands | Detailed Update | [Detailed Update](#detailed-update-with-customizations) |
| Update broke something | Rollback | [Rollback Procedure](#rollback-procedure) |
| Multiple repos to update | Multi-repo | [Updating Multiple Repositories](#updating-multiple-repositories) |
| Upgrading from v1.0 | Migration Guide | [MIGRATION-GUIDE-v2.md](docs/MIGRATION-GUIDE-v2.md) |
| First time install | Implementation | [IMPLEMENTATION-GUIDE.md](IMPLEMENTATION-GUIDE.md) |

---

**Remember:** Your session history is precious. Always backup before updating system files!
