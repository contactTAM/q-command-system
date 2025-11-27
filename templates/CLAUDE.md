# CLAUDE.md Template - Q-Command System Section

**This file shows the section to add to your CLAUDE.md file**

Copy everything from "## Workflow with Claude Code" onwards and paste it into your project's CLAUDE.md file. Customize the team member names and project-specific details.

---

## Workflow with Claude Code

### IMPORTANT POLICIES

**Git Push Policy:**
- Claude will NEVER push to GitHub without explicit user permission
- Only [PROJECT_OWNER_NAME] can decide when to push to remote repository
- Claude can stage and commit locally, but NEVER runs `git push` unless specifically requested

### Session Workflow

**File Organization (Q-Command System v1.1):**

All generated session files use per-person-per-session naming to prevent collisions:
- **Format:** `YYYY-MM-DD-HHmm-[PersonName].md` (example: `2025-11-27-0913-Gabriel.md`)
- **Transcripts:** `GeneratedMDs/transcripts/`
- **Session Notes:** `GeneratedMDs/session-notes/`
- **Checkpoints:** `GeneratedMDs/checkpoints/`

This allows multiple team members to work on the same day without file collisions.

**Start of session:**

Type `/q-begin` and Claude will automatically:
1. Read `CLAUDE.md` for quick context refresh
2. Review last session notes from `GeneratedMDs/session-notes/`
   - Looks for files matching your name
   - Reads most recent session
3. Review current status from project files
4. Provide brief summary of what was accomplished and current status
5. Ask: "What would you like to work on today?"
6. Set up TodoWrite if needed

**During session:**
- Use TodoWrite to track progress on tasks
- Document decisions and learnings as we go
- Ask questions when clarification needed
- **For long sessions:** Use `/q-checkpoint` to save progress mid-session
- **Check progress anytime:** Use `/q-status` to see session state
- **Verify saves worked:** Use `/q-verify` to check files were created

**End of session:**

Type `/q-end` and Claude will automatically:
1. Create session transcript in `GeneratedMDs/transcripts/`
2. Create session notes in `GeneratedMDs/session-notes/`
3. Stage and commit all changes
4. Verify each step completed successfully
5. Remind user to `git push` when ready

**All commands:** Type `/q-` and press Tab to see all 15 commands.

---

## Reference Documents

[Add your project-specific reference documents here]

**Q-Command System Files:**
- `.claude/commands/` - Slash command definitions (15 files)
- `GeneratedMDs/transcripts/` - Session transcripts by person and date
- `GeneratedMDs/session-notes/` - Session summaries by person and date
- `GeneratedMDs/checkpoints/` - Mid-session progress snapshots

**Available Commands (type /q- and Tab):**
- `/q-begin` - Start session with context refresh
- `/q-end` - Complete session documentation and commit
- `/q-save` - Lightweight quick exit
- `/q-checkpoint` - Save mid-session progress
- `/q-status` - Check session state
- `/q-verify` - Verify saves worked
- `/q-commit` - Stage and commit changes
- `/q-compact` - Free context safely
- `/q-dump` - Create transcript manually
- `/q-learnings` - Summarize session insights
- `/q-pare` - Optimize CLAUDE.md size
- `/q-prompts` - Save session prompts
- `/q-setup-domain` - Configure for project type
- `/q-reconfigure-domain` - Update configuration
- `/q-upgrade` - Upgrade Q-Command System

---

**Key Insight:** [Add your project's key insight or mission statement here]

---

## Customization Instructions

**Before using this template:**

1. **Replace placeholders:**
   - `[PROJECT_OWNER_NAME]` → Your name or team lead's name

2. **Add your project context:**
   - Add sections about your project (What is it? Team? Status? etc.)
   - Add reference to your work plan or roadmap files
   - Add key insights or mission statement

3. **Add team member names:**
   - List your actual team members who will use the system
   - This helps Claude address people correctly in session notes

**Example customized section:**

```markdown
## Team

- **Alice Johnson** - Lead Developer
- **Bob Smith** - Backend Engineer
- **Carol Williams** - Designer

All team members use /q-begin and /q-end for session documentation.
```

---

## Full Template Structure

Your complete CLAUDE.md should have:

1. **Project Overview** - What is this project?
2. **Team** - Who works on it?
3. **Current Status** - Where are we?
4. **Workflow with Claude Code** - Q-command section (this template)
5. **Reference Documents** - Where to find things
6. **Project-Specific Context** - Domain knowledge, decisions, etc.

---

**After customizing, save as CLAUDE.md in your repository root.**
