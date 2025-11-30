# Q-Command System Repository

**A Robust Co-Pilot System for Claude Code**

**Version:** 2.1
**Author:** Gabriel Rymberg
**Repository:** github.com/contactTAM/q-command-system
**License:** MIT

---

## What is This Repository?

This repository **IS** the Q-Command System - the source code, documentation, templates, and examples for the comprehensive co-pilot framework that structures Claude Code sessions.

**Meta Usage:** This repository uses its own Q-Command System to manage its own development. We practice what we preach!

---

## Project Purpose

The Q-Command System transforms Claude Code from a simple AI assistant into a **reliable development co-pilot** with:

- Structured session management (`/q-begin`, `/q-end`, `/q-checkpoint`)
- Automatic documentation (transcripts, session notes)
- Context awareness and protection
- Multi-user support without file collisions
- Git workflow integration
- Explicit verification and error handling

**This repository contains:**
- `/docs/` - Comprehensive documentation
- `/templates/.claude/commands/` - Slash command definitions (15 files)
- `/templates/.q-system/` - Q-System folder template (docs, config, session folders)
- `/templates/CLAUDE.md` - Template for your CLAUDE.md

---

## Current Status

**Version:** 2.1 (Released 2025-11-30)

**Latest Updates:**
- Consolidated `/q-setup` command (replaces `/q-setup-domain` and `/q-reconfigure-domain`)
- Auto-detects new vs existing projects
- Quick mode (2-3 min) and Detailed mode (10-15 min)
- 14 commands total

**Repository State:** Stable, ready for public use

---

## Team

**Primary Maintainer:**
- **Gabriel Rymberg** - Creator and lead developer

**Contributors:** Open to community contributions

**Usage:** This repository uses Q-commands for all development work

---

## Repository Structure

```text
Q-command-system/
├── getting-started.md        <- Start here
├── README.md                 <- Overview + install instructions
├── CHANGELOG.md              <- Version history
│
├── templates/
│   ├── .claude/commands/     <- Slash command definitions (15 files)
│   ├── .q-system/            <- Q-System folder template
│   │   ├── docs/             <- Documentation (copied during install)
│   │   ├── config.md         <- User preferences template
│   │   └── README.md         <- Folder explanation
│   └── CLAUDE.md             <- Template for your CLAUDE.md
│
├── docs/                     <- Source documentation
│   ├── install/
│   ├── features.md
│   ├── workflow.md
│   └── context-management.md
│
└── .q-system/                <- Session files for THIS repo
    ├── transcripts/
    ├── session-notes/
    ├── checkpoints/
    └── config.md
```

---

## Key Design Principles

1. **User Control** - Never push to remote without permission
2. **Explicit Operations** - No silent failures, verify everything
3. **Graceful Degradation** - Complete what's possible when errors occur
4. **Context Awareness** - Monitor and protect conversation context
5. **Multi-User by Design** - No file collisions between team members
6. **Backward Compatible** - Works with existing workflows

---

## Development Workflow

### Making Changes to the System

When working on this repository:

1. **Documentation changes** → Update relevant files in `/docs/` or root
2. **Template improvements** → Modify files in `/templates/`
3. **New commands** → Add to `/templates/.claude/commands/`, update docs
4. **Bug fixes** → Update affected files, note in session notes

### Testing Changes

Before releasing updates:
- Test install in a fresh repository
- Verify all slash commands work
- Check documentation is accurate
- Update version numbers and CHANGELOG

---

## Workflow with Claude Code

### IMPORTANT POLICIES

**Git Push Policy:**
- Claude will NEVER push to GitHub without explicit user permission
- Only Gabriel can decide when to push to remote repository
- Claude can stage and commit locally, but NEVER runs `git push` unless specifically requested

### Session Workflow

**File Organization (Q-Command System v2.0):**

All Q-System files live in the `.q-system/` folder:
- **Format:** `YYYY-MM-DD-HHmm-[PersonName].md` (example: `2025-11-27-1405-Gabriel.md`)
- **Transcripts:** `.q-system/transcripts/`
- **Session Notes:** `.q-system/session-notes/`
- **Checkpoints:** `.q-system/checkpoints/`

**Start of session:**

Type `/q-begin` and Claude will automatically:
1. Read `CLAUDE.md` for quick context refresh
2. Review last session notes from `.q-system/session-notes/`
3. Review current status and pending tasks
4. Provide brief summary of what was accomplished and current status
5. Ask: "What would you like to work on today?"
6. Set up TodoWrite if needed

**During session:**
- Use TodoWrite to track progress on tasks
- Document decisions and learnings as we go
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

**All commands:** Type `/q-` and press Tab to see all 15 commands.

---

## Reference Documents

**Documentation:**
- `getting-started.md` - Quick start guide
- `docs/features.md` - All commands and features
- `docs/workflow.md` - Daily workflow
- `docs/context-management.md` - Managing the 200K token limit

**Q-Command System Files:**
- `.claude/commands/` - Slash command definitions (15 files)
- `.q-system/` - All Q-System generated files
  - `transcripts/` - Session transcripts
  - `session-notes/` - Session summaries
  - `checkpoints/` - Mid-session snapshots
  - `config.md` - User preferences

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

## Key Insight

**The Q-Command System exists to solve a fundamental problem:** AI coding assistants are powerful but ephemeral. Without structure, sessions are forgotten, work is lost, and context disappears.

By adding **structured session management, automatic documentation, and explicit verification**, we transform Claude Code from a helpful assistant into a **reliable, accountable, structured co-pilot** for software development.

**This repository practices what it preaches:** We use Q-commands to develop Q-commands. Every feature, bug fix, and documentation update is managed through `/q-begin`, `/q-checkpoint`, and `/q-end`. Our session notes are our development log. Our transcripts are our audit trail.

---

## Project Philosophy

1. **AI assistants should be structured, not chaotic**
2. **Documentation should be automatic, not manual**
3. **Context limits should be managed, not ignored**
4. **Verification should be explicit, not assumed**
5. **Users should control sharing, not AI**
6. **Errors should be reported, not hidden**
7. **Systems should degrade gracefully, not fail catastrophically**

---

## Contributing

Interested in contributing to the Q-Command System?

**Ways to contribute:**
- Test the system in your projects and share feedback
- Report bugs or edge cases
- Suggest new features or improvements
- Improve documentation
- Create domain-specific extensions

**Development process:**
- All work done through Q-command sessions
- Session notes document decisions and rationale
- Commits reference session files for full context
- Gabriel reviews and merges contributions

---

## Contact & Support

**Issues:** Report at github.com/contactTAM/q-command-system/issues
**Discussions:** GitHub Discussions (coming soon)

---

**Meta Note:** This CLAUDE.md file was created using the Q-Command System to manage the Q-Command System repository.
