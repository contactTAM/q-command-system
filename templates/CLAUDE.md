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

**File Organization (Q-Command System v2.0):**

All Q-System files live in the `.q-system/` folder:
- **Format:** `YYYY-MM-DD-HHmm-[PersonName].md` (example: `2025-11-27-0913-Gabriel.md`)
- **Transcripts:** `.q-system/transcripts/`
- **Session Notes:** `.q-system/session-notes/`
- **Checkpoints:** `.q-system/checkpoints/`
- **Documentation:** `.q-system/docs/`

This allows multiple team members to work on the same day without file collisions.

**Start of session:**

Type `/q-begin` and Claude will automatically:
1. Read `CLAUDE.md` for quick context refresh
2. Review last session notes from `.q-system/session-notes/`
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
1. Create session transcript in `.q-system/transcripts/`
2. Create session notes in `.q-system/session-notes/`
3. Stage and commit all changes
4. Verify each step completed successfully
5. Remind user to `git push` when ready

**All commands:** Type `/q-` and press Tab to see all 14 commands.

### Context Monitoring Protocol

**IMPORTANT:** Monitor context usage proactively throughout sessions.

**Why this matters:** Q-END generates extensive documentation (800-1000 lines). At high context (>90%), this generation can fail mid-execution, losing all work. Proactive monitoring warns users BEFORE this happens.

**Implementation:** Add context status every ~10 responses, or every response when context >70%:

| Context | Status | Message |
|---------|--------|---------|
| 0-70% | Healthy | `Context: ~XX% - Healthy` |
| 70-85% | Caution | `Context: ~XX% - Consider /q-checkpoint soon` |
| 85-90% | Warning | `Context: ~XX% - /q-checkpoint recommended NOW` |
| 90%+ | Critical | `Context: ~XX% - Use /q-save immediately, /q-end may fail` |

**Estimation method:** Track conversation length and message count. ~80% accuracy is sufficient for warnings.

**Key insight for users:** At 90%+ context, /q-save (basic documentation, likely to succeed) is better than /q-end (full documentation, may fail and lose everything).

---

## Reference Documents

[Add your project-specific reference documents here]

**Q-Command System Files:**
- `.claude/commands/` - Slash command definitions (14 files)
- `.q-system/` - All Q-System generated files
  - `transcripts/` - Session transcripts by person and date
  - `session-notes/` - Session summaries by person and date
  - `checkpoints/` - Mid-session progress snapshots
  - `docs/` - Q-System documentation
  - `config.md` - Your preferences

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
- `/q-setup` - Configure Q-Command System
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

## For Q Templates: First-Session Welcome

**If you're building a Q template** (not just using Q-System), add a first-session welcome to your CLAUDE.md:

```markdown
### New User (No /q-begin, Empty Profile)

They just started chatting. This is their first time. Don't lecture them - just work with them, but weave in session management naturally:

1. Welcome them with brief orientation:
   > "Welcome to Q-[NAME]! This Q is part of the Q Marketplace — a collection of Claude Code companions for [DOMAIN]. I have memory (I'll remember your project across sessions) and a methodology for [WHAT_IT_DOES].
   >
   > If you find this useful, there are more Qs at the-ai-masters.com/q-marketplace, or you can get a custom Q built for your workflow.
   >
   > Now — [FIRST_QUESTION]?"

2. Start the work immediately
3. **Before ending**, mention: "When you're done for now, use `/q-end` to save your progress."

**Important:** The marketplace mention happens ONCE in the welcome. Don't repeat it.
```

---

## License

This Q is provided under the [Q Template License](LICENSE.md). Use is subject to the terms therein.

---

## About This Q

This Q is part of **[The Q Marketplace](https://the-ai-masters.com/q-marketplace)**.

- **More Qs:** [the-ai-masters.com/q-marketplace](https://the-ai-masters.com/q-marketplace)
- **Custom Q setup:** [the-ai-masters.com](https://the-ai-masters.com)
- **Q-System:** [github.com/contactTAM/q-command-system](https://github.com/contactTAM/q-command-system)

---

**After customizing, save as CLAUDE.md in your repository root.**
