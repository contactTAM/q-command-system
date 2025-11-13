# CLAUDE.md Template - Q-Command System Section

**This file shows the section to add to your CLAUDE.md file**

Copy everything from "## Workflow with Claude Code" onwards and paste it into your project's CLAUDE.md file. Customize the team member names and project-specific details.

---

## Workflow with Claude Code

### IMPORTANT POLICIES

**🚨 Git Push Policy:**
- Claude will NEVER push to GitHub without explicit user permission
- Only [PROJECT_OWNER_NAME] can decide when to push to remote repository
- Claude can stage and commit locally, but NEVER runs `git push` unless specifically requested

### Session Workflow

**File Organization (Q-Command System v2.0):**

All generated session files use per-person-per-session naming to prevent collisions:
- **Format:** `YYYY-MM-DD-HHmm-[PersonName].md` (example: `2025-11-13-0913-Gabriel.md`)
- **Transcripts:** `GeneratedMDs/transcripts/`
- **Session Notes:** `GeneratedMDs/session-notes/`
- **Checkpoints:** `GeneratedMDs/checkpoints/`

This allows multiple team members to work on the same day without file collisions.

**Start of session:**

Type `Q-BEGIN` and Claude will automatically:
1. Read `CLAUDE.md` for quick context refresh
2. Review last session notes from `GeneratedMDs/session-notes/`
   - Looks for files matching your name
   - Reads most recent session
3. Review current status from project files (e.g., `work-plan/work-plan.md` if exists)
   - Check blocker status
   - Review recent progress
   - Identify pending tasks
4. Provide brief summary of what was accomplished and current status
5. Ask: "What would you like to work on today?"
6. Set up TodoWrite if needed

**During session:**
- Use TodoWrite to track progress on tasks
- Document decisions and learnings as we go
- Ask questions when clarification needed
- Update relevant files (work-plan, session notes, etc.)
- **For long sessions:** Use `Q-CHECKPOINT` to save progress mid-session (insurance against auto-compact)
- **Check progress anytime:** Use `Q-STATUS` to see session state and recommendations
- **Verify saves worked:** Use `Q-VERIFY` to check files were created correctly

**End of session:**

Type `Q-END` and Claude will automatically:
1. Create session transcript in `GeneratedMDs/transcripts/YYYY-MM-DD-HHmm-[PersonName].md`
   - **For continued sessions:** Documents ENTIRE session including work before auto-compact
   - Merges any checkpoint files with final work
2. Create session notes in `GeneratedMDs/session-notes/YYYY-MM-DD-HHmm-[PersonName].md`
   - Comprehensive summary with accomplishments, decisions, files changed
3. Update project files with any progress or changes (if applicable)
4. Stage and commit all changes with `Q-COMMIT`
5. Verify each step completed successfully
6. Remind user: **USER manually pushes when ready:** `git push` ([PROJECT_OWNER_NAME] controls when code goes to GitHub)

**Alternative commands:**
- **Q-SAVE** → Lightweight quick exit (transcript + commit only, skips notes)
- **Q-VERIFY** → Check that Q-END/Q-CHECKPOINT actually worked
- **Q-STATUS** → Check current session state and get recommendations
- **Q-CHECKPOINT** → Save mid-session progress snapshot
- **Q-DUMP** → Create session transcript manually
- **Q-COMMIT** → Stage and commit changes
- **Q-LEARNINGS** → Summarize session key learnings
- **Q-COURSE** → [Customize for your domain: Guided interview/template generation]

---

## Reference Documents

[Add your project-specific reference documents here]

**Q-Command System Documentation:**
- `GeneratedMDs/SHORTCUTS.md` - Q-command specifications (v2.0 robust system)
- `SESSION-CHECKLIST.md` - Step-by-step session start and end procedures
- `GeneratedMDs/transcripts/` - Session transcripts by person and date
- `GeneratedMDs/session-notes/` - Session summaries by person and date
- `GeneratedMDs/checkpoints/` - Mid-session progress snapshots

**Available Q-Commands:**
- `Q-BEGIN` - Start session with context refresh
- `Q-END` - Complete session documentation and commit
- `Q-SAVE` - Lightweight quick exit (when context is tight)
- `Q-CHECKPOINT` - Save mid-session progress snapshot
- `Q-STATUS` - Check session state and get recommendations
- `Q-VERIFY` - Verify that Q-END/Q-CHECKPOINT worked
- `Q-DUMP` - Create session transcript manually
- `Q-COMMIT` - Stage and commit changes
- `Q-LEARNINGS` - Summarize session learnings
- `Q-COURSE` - [Customize for your domain]

---

**Key Insight:** [Add your project's key insight or mission statement here]

---

## Customization Instructions

**Before using this template:**

1. **Replace placeholders:**
   - `[PROJECT_OWNER_NAME]` → Your name or team lead's name
   - `[Customize for your domain]` → Adapt Q-COURSE command description

2. **Add your project context:**
   - Add sections about your project (What is it? Team? Status? etc.)
   - Add reference to your work plan or roadmap files
   - Add key insights or mission statement

3. **Customize Q-COURSE command:**
   - If you don't need Q-COURSE, remove it from lists
   - If you want to customize it, update SHORTCUTS.md accordingly

4. **Add team member names:**
   - List your actual team members who will use the system
   - This helps Claude address people correctly in session notes

**Example customized section:**

```markdown
## Team

- **Alice Johnson** - Lead Developer (uses Q-commands)
- **Bob Smith** - Backend Engineer (uses Q-commands)
- **Carol Williams** - Designer (occasional Q-command usage)

All team members use Q-BEGIN/Q-END workflow for session documentation.
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
