# Q-Command System Implementation Guide

**How to Add the Q-Command System to Any Repository**

**Version:** 2.0
**Last Updated:** 2025-11-13

---

## Overview

This guide walks you through adding the Q-Command System to a new or existing repository. The process takes **10-15 minutes** and requires minimal setup.

---

## Prerequisites

Before starting, ensure you have:

- [ ] Claude Code CLI installed and working
- [ ] Git repository initialized
- [ ] Text editor for editing markdown files
- [ ] Bash/Zsh shell (standard on macOS/Linux)

---

## Step-by-Step Implementation

### Step 1: Create Directory Structure

Create the required directories in your repository root:

```bash
cd /path/to/your/repository

mkdir -p GeneratedMDs/transcripts
mkdir -p GeneratedMDs/session-notes
mkdir -p GeneratedMDs/checkpoints
```

**Verification:**
```bash
ls -la GeneratedMDs/
# Should see: transcripts/, session-notes/, checkpoints/
```

---

### Step 2: Copy Template Files

Copy the template files from the Q-command-system package:

```bash
# Copy SHORTCUTS.md to GeneratedMDs/
cp /path/to/Q-command-system/templates/SHORTCUTS.md GeneratedMDs/

# Copy SESSION-CHECKLIST.md to repo root
cp /path/to/Q-command-system/templates/SESSION-CHECKLIST.md .

# Copy .gitignore to GeneratedMDs/
cp /path/to/Q-command-system/templates/.gitignore GeneratedMDs/
```

**Verification:**
```bash
ls -la GeneratedMDs/SHORTCUTS.md
ls -la SESSION-CHECKLIST.md
ls -la GeneratedMDs/.gitignore
# All files should exist
```

---

### Step 3: Create or Update CLAUDE.md

#### If CLAUDE.md doesn't exist:
```bash
# Copy the entire template
cp /path/to/Q-command-system/templates/CLAUDE.md .
```

Then customize it with your project details.

#### If CLAUDE.md already exists:
Open `templates/CLAUDE.md` and copy the **Workflow with Claude Code** section (everything from "## Workflow with Claude Code" to the end of that section).

Paste it into your existing `CLAUDE.md` file.

**The section to add:**
```markdown
## Workflow with Claude Code

### IMPORTANT POLICIES

**🚨 Git Push Policy:**
- Claude will NEVER push to GitHub without explicit user permission
- Only [Your Name] can decide when to push to remote repository
- Claude can stage and commit locally, but NEVER runs `git push` unless specifically requested

### Session Workflow

**File Organization (Q-Command System v2.0):**

All generated session files use per-person-per-session naming to prevent collisions:
- **Format:** `YYYY-MM-DD-HHmm-[PersonName].md`
- **Transcripts:** `GeneratedMDs/transcripts/`
- **Session Notes:** `GeneratedMDs/session-notes/`
- **Checkpoints:** `GeneratedMDs/checkpoints/`

[... rest of workflow section from template ...]
```

**Verification:**
```bash
grep "Q-BEGIN" CLAUDE.md
# Should find the Q-BEGIN command description
```

---

### Step 4: Customize for Your Team

Edit the template files to match your team:

#### In SHORTCUTS.md:
- Line 17: Update `[PersonName]` list with your actual team member names
  ```markdown
  - `[PersonName]`: Gabriel, Guy, Fraser, or Brian
  ```
  Change to your team names.

#### In CLAUDE.md:
- Update the git push policy with your name
- Update the team member list
- Add any project-specific context

#### In SESSION-CHECKLIST.md:
- Update file naming examples with your team names

**Verification:**
- Search for "Gabriel" or "Guy" in files
- Replace with your actual team member names

---

### Step 5: Add to Git (Optional but Recommended)

Add the Q-command system files to git:

```bash
git add GeneratedMDs/SHORTCUTS.md
git add GeneratedMDs/.gitignore
git add SESSION-CHECKLIST.md
git add CLAUDE.md  # if created or modified

git commit -m "Add Q-Command System v2.0 for structured Claude Code sessions

- Added SHORTCUTS.md with Q-command specifications
- Added SESSION-CHECKLIST.md for workflow guidance
- Added directory structure for transcripts, session notes, checkpoints
- Added .gitignore for generated files
- Updated CLAUDE.md with Q-command workflow

Co-Authored-By: Claude <noreply@anthropic.com>
"
```

**Note:** Generated files (transcripts, session notes, checkpoints) are typically .gitignored. Only commit the *system files*, not the *generated files*.

---

### Step 6: Configure .gitignore (Optional)

If you want to exclude generated session files from git:

```bash
# Add to your main .gitignore (or use GeneratedMDs/.gitignore)
echo "GeneratedMDs/transcripts/*.md" >> .gitignore
echo "GeneratedMDs/session-notes/*.md" >> .gitignore
echo "GeneratedMDs/checkpoints/*.md" >> .gitignore

# Keep the system files
echo "!GeneratedMDs/SHORTCUTS.md" >> .gitignore
```

**Alternative:** Keep all session files in git for full audit trail (good for client work).

---

### Step 7: Test the System

Start a Claude Code session and test:

```bash
# Open Claude Code in your repository
cd /path/to/your/repository
claude-code  # or however you launch Claude Code

# In Claude Code chat:
Q-BEGIN
```

**Expected behavior:**
- Claude reads CLAUDE.md
- Claude looks for previous session notes (won't find any on first run)
- Claude asks: "What would you like to work on today?"

**Test each command:**
```
Q-STATUS      # Should show session state
Q-CHECKPOINT  # Should create file in GeneratedMDs/checkpoints/
Q-VERIFY      # Should show verification report
Q-END         # Should create transcript + session notes + commit
```

**Verification after Q-END:**
```bash
ls -la GeneratedMDs/transcripts/
ls -la GeneratedMDs/session-notes/
git log -1
# Should see new files and commit
```

---

## Common Customizations

### Customize Q-COURSE Command

The Q-COURSE command is designed to be adapted to your domain:

**Original:** Guided interview for course definition
**Adapt to:**
- Product feature specification
- Design system components
- API endpoint design
- Test case creation
- Documentation templates

**How to customize:**
1. Open `GeneratedMDs/SHORTCUTS.md`
2. Find `## Q-COURSE` section
3. Update the questions and output format
4. Save and test

### Add Custom Q-Commands

To add your own Q-commands:

1. Open `GeneratedMDs/SHORTCUTS.md`
2. Add a new section with your command name (e.g., `## Q-REVIEW`)
3. Define what Claude should do when user types that command
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
```

### Modify Q-END Workflow

To change what Q-END does:

1. Open `GeneratedMDs/SHORTCUTS.md`
2. Find `## Q-END` section
3. Modify the steps (add, remove, or reorder)
4. Update verification requirements

**Example:** Add test execution to Q-END:
```markdown
**STEP 4.5: Run Tests**
1. Execute test suite: `npm test` or `pytest`
2. ✅ VERIFY: All tests pass
3. Report to user: "✅ Tests passed" or "⚠️ Tests failed: [details]"
```

---

## Troubleshooting

### Problem: Q-BEGIN says "command not found"
**Solution:** Claude hasn't read SHORTCUTS.md yet. In your first message, say:
```
Please read GeneratedMDs/SHORTCUTS.md and then execute Q-BEGIN
```

### Problem: Files created in wrong location
**Solution:**
1. Check that SHORTCUTS.md is in `GeneratedMDs/` directory
2. Check that directory structure exists (`transcripts/`, etc.)
3. Manually move misplaced files to correct location

### Problem: Person name not recognized
**Solution:**
- Update SHORTCUTS.md line 17 with actual team member names
- Claude will use names from that list

### Problem: Q-END didn't create files
**Solution:**
1. Run `Q-VERIFY` to check what exists
2. Check context window (might be full - use `Q-SAVE` instead)
3. Run individual commands: `Q-DUMP` then `Q-COMMIT`

### Problem: Git conflicts with session files
**Solution:**
- Each person should have unique session files (no conflicts)
- Check file naming includes person name
- If conflicts occur, keep both files and rename manually

---

## Advanced Configuration

### Multi-Repository Setup

If you work across multiple repositories, you can:

**Option 1: Copy Q-command-system to each repo**
- Each repo is independent
- Can customize per repo
- Larger total disk space

**Option 2: Symlink to shared Q-command-system**
```bash
# In each repo:
ln -s ~/Q-command-system/templates/SHORTCUTS.md GeneratedMDs/SHORTCUTS.md
ln -s ~/Q-command-system/templates/SESSION-CHECKLIST.md SESSION-CHECKLIST.md
```
- Shared system across all repos
- Updates apply everywhere
- Smaller disk space

**Option 3: Git submodule**
```bash
git submodule add https://github.com/your-username/Q-command-system.git
```
- Version controlled
- Can update centrally
- Requires git submodule knowledge

### Team Onboarding

When adding new team members:

1. **Add their name to SHORTCUTS.md** (line 17)
2. **Update CLAUDE.md** team member list
3. **Share SESSION-CHECKLIST.md** for workflow guidance
4. **Have them run Q-BEGIN** on first session

### Continuous Integration

To integrate with CI/CD:

**Option 1: Include session notes in commits**
- Remove `.gitignore` rules for session files
- Full audit trail in git history
- Good for compliance

**Option 2: Archive session files**
- Script to compress and archive old session files
- Keep git repo lean
- Archive to S3, Dropbox, etc.

**Example archival script:**
```bash
#!/bin/bash
# archive-sessions.sh
DATE=$(date +%Y-%m)
tar -czf "sessions-archive-$DATE.tar.gz" GeneratedMDs/
mv sessions-archive-$DATE.tar.gz ~/Archives/
```

---

## Maintenance

### Regular Updates

**Monthly:**
- Review session files for insights
- Clean up old session files if desired
- Update custom commands as workflows evolve

**Quarterly:**
- Check for Q-Command System updates (new versions)
- Review team member list in SHORTCUTS.md
- Update documentation for new team patterns

**As Needed:**
- Add new custom commands for repeated tasks
- Adjust Q-END workflow for project changes
- Update .gitignore rules

### Backup Strategy

**Recommended:**
1. **System files** (SHORTCUTS.md, etc.) → In git
2. **Session files** (transcripts, notes) → Your choice:
   - In git (full audit trail)
   - In backup system (Dropbox, S3, etc.)
   - Archived periodically

**Critical files to backup:**
- `GeneratedMDs/SHORTCUTS.md` - Your custom commands
- `CLAUDE.md` - Your project context
- `GeneratedMDs/transcripts/` - Full work history
- `GeneratedMDs/session-notes/` - Summary records

---

## Migration from v1.0

If you're upgrading from Q-Command System v1.0:

**See:** [docs/MIGRATION-GUIDE-v2.md](docs/MIGRATION-GUIDE-v2.md)

**Quick version:**
1. Create new directory structure
2. Copy new template files
3. Old files remain accessible (backward compatible)
4. Start using new format immediately
5. Optional: Migrate old files using script

---

## Support

### Getting Help

**Documentation:**
- [README.md](README.md) - Overview
- [docs/FEATURES.md](docs/FEATURES.md) - Feature details
- [docs/COMMANDS-REFERENCE.md](docs/COMMANDS-REFERENCE.md) - Command reference
- [docs/ARCHITECTURE.md](docs/ARCHITECTURE.md) - How it works

**Common Issues:**
- Check troubleshooting section above
- Run `Q-VERIFY` to diagnose problems
- Review session notes for error messages

**Community:**
- Share your customizations
- Report bugs or suggestions
- Contribute improvements

---

## Success Checklist

Before finishing implementation, verify:

- [ ] Directory structure created (`transcripts/`, `session-notes/`, `checkpoints/`)
- [ ] SHORTCUTS.md copied to `GeneratedMDs/`
- [ ] SESSION-CHECKLIST.md copied to repo root
- [ ] CLAUDE.md updated with Q-command workflow section
- [ ] Team member names customized in templates
- [ ] .gitignore configured (optional)
- [ ] System files committed to git
- [ ] Q-BEGIN tested and works
- [ ] Q-STATUS tested and works
- [ ] Q-CHECKPOINT tested and works
- [ ] Q-END tested and works
- [ ] Q-VERIFY confirms everything created correctly

---

## Next Steps

After implementation:

1. **Run your first session** with Q-BEGIN
2. **Work on a small task** to test the workflow
3. **Use Q-CHECKPOINT** mid-session for practice
4. **End with Q-END** and verify files created
5. **Review generated files** to see documentation quality
6. **Share with team** and onboard other members
7. **Customize commands** for your specific workflows

---

## Estimated Setup Time

- **Minimal setup:** 10 minutes (copy files, test Q-BEGIN)
- **Full setup:** 15-20 minutes (customize, test all commands, commit)
- **Team onboarding:** 5 minutes per person (share docs, explain workflow)

---

## Questions?

Refer to:
- **[Commands Reference](docs/COMMANDS-REFERENCE.md)** - What does each command do?
- **[Architecture](docs/ARCHITECTURE.md)** - How does the system work?
- **[Examples](examples/)** - Sample sessions and workflows

---

**Ready to implement? Start with Step 1 above!**

**After implementation, your first command should be:** `Q-BEGIN`
