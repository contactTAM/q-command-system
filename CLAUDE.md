# Q-Command System Repository

**A Robust Co-Pilot System for Claude Code**

**Version:** 1.0
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

- ✅ Structured session management (Q-BEGIN, Q-END, Q-CHECKPOINT)
- ✅ Automatic documentation (transcripts, session notes)
- ✅ Context awareness and protection
- ✅ Multi-user support without file collisions
- ✅ Git workflow integration
- ✅ Explicit verification and error handling

**This repository contains:**
- `/docs/` - Comprehensive documentation (FEATURES.md, ARCHITECTURE.md, COMMANDS-REFERENCE.md, etc.)
- `/templates/` - Ready-to-use files for other repos (SHORTCUTS.md, CLAUDE.md, SESSION-CHECKLIST.md)
- `/examples/` - Sample sessions and workflows
- Implementation and migration guides

---

## Current Status

**Version:** 1.0 (Released 2025-11-26)

**First Public Release:**
- Q-COMPACT for safe context management
- Q-SETUP-DOMAIN for adaptive domain-specific configuration
- Per-person-per-session file naming (no collisions)
- Organized directory structure (transcripts/, session-notes/, checkpoints/)
- Q-SAVE, Q-VERIFY, Q-STATUS with context health monitoring
- Comprehensive error handling

**Repository State:** Stable, ready for public use

---

## Team

**Primary Maintainer:**
- **Gabriel Rymberg** - Creator and lead developer

**Contributors:** Open to community contributions

**Usage:** This repository uses Q-commands for all development work

---

## Project Goals

### Short-term (Current Sprint)
- Refine documentation based on user feedback
- Add more examples and use cases
- Create video walkthrough guides
- Build community around the system

### Medium-term
- Plugin system for custom Q-commands
- Integration with other Claude Code features
- Multi-language support (currently English-centric)
- VS Code extension for Q-command shortcuts

### Long-term
- Ecosystem of domain-specific Q-command libraries
- Analytics dashboard for session insights
- Team collaboration features
- AI-assisted Q-command generation

---

## Repository Structure

```
Q-command-system/
├── getting-started.md       ← Start here
├── README.md                ← Overview
├── CHANGELOG.md             ← Version history
│
├── templates/               ← Files to copy to your projects
│   ├── SHORTCUTS.md         ← Q-command specifications
│   ├── CLAUDE.md            ← Template for your CLAUDE.md
│   └── .gitignore           ← For GeneratedMDs directory
│
├── docs/                    ← Documentation
│   ├── install/             ← Platform installation guides
│   ├── commands-reference.md
│   ├── features.md
│   ├── architecture.md
│   ├── workflow.md
│   ├── context-management.md
│   └── setup.md
│
└── GeneratedMDs/            ← Session files for THIS repo
    ├── transcripts/
    ├── session-notes/
    └── checkpoints/
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
3. **New features** → Update SHORTCUTS.md, document in FEATURES.md
4. **Bug fixes** → Update affected files, note in session notes
5. **Examples** → Add to `/examples/`

### Testing Changes

Before releasing updates:
- Test all Q-commands in a sample repository
- Verify documentation is clear and accurate
- Check backward compatibility with previous versions
- Update version numbers and release notes

---

## Workflow with Claude Code

### IMPORTANT POLICIES

**🚨 Git Push Policy:**
- Claude will NEVER push to GitHub without explicit user permission
- Only Gabriel can decide when to push to remote repository
- Claude can stage and commit locally, but NEVER runs `git push` unless specifically requested

### Session Workflow

**File Organization (Q-Command System v1.0):**

All generated session files use per-person-per-session naming to prevent collisions:
- **Format:** `YYYY-MM-DD-HHmm-[PersonName].md` (example: `2025-11-13-1405-Gabriel.md`)
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
3. Review current status and pending tasks
4. Provide brief summary of what was accomplished and current status
5. Ask: "What would you like to work on today?"
6. Set up TodoWrite if needed

**During session:**
- Use TodoWrite to track progress on tasks
- Document decisions and learnings as we go
- Ask questions when clarification needed
- Update relevant files (docs, templates, examples)
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
3. Update any relevant project files with progress or changes
4. Stage and commit all changes with `Q-COMMIT`
5. Verify each step completed successfully
6. Remind user: **USER manually pushes when ready:** `git push` (Gabriel controls when code goes to GitHub)

**Alternative commands:**
- **Q-SAVE** → Lightweight quick exit (transcript + commit only, skips notes)
- **Q-VERIFY** → Check that Q-END/Q-CHECKPOINT actually worked
- **Q-STATUS** → Check current session state and get recommendations
- **Q-CHECKPOINT** → Save mid-session progress snapshot
- **Q-DUMP** → Create session transcript manually
- **Q-COMMIT** → Stage and commit changes
- **Q-LEARNINGS** → Summarize session key learnings

---

## Reference Documents

**Documentation:**
- `getting-started.md` - Quick start guide
- `docs/commands-reference.md` - All Q-commands
- `docs/workflow.md` - Daily workflow
- `docs/context-management.md` - Managing the 200K token limit
- `docs/features.md` - Feature details
- `docs/architecture.md` - System internals

**Q-Command System Files:**
- `GeneratedMDs/SHORTCUTS.md` - Q-command specifications (v1.0)
- `GeneratedMDs/transcripts/` - Session transcripts
- `GeneratedMDs/session-notes/` - Session summaries
- `GeneratedMDs/checkpoints/` - Mid-session snapshots

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

---

## Key Insight

**The Q-Command System exists to solve a fundamental problem:** AI coding assistants are powerful but ephemeral. Without structure, sessions are forgotten, work is lost, and context disappears.

By adding **structured session management, automatic documentation, and explicit verification**, we transform Claude Code from a helpful assistant into a **reliable, accountable, structured co-pilot** for software development.

**This repository practices what it preaches:** We use Q-commands to develop Q-commands. Every feature, bug fix, and documentation update is managed through Q-BEGIN, Q-CHECKPOINT, and Q-END. Our session notes are our development log. Our transcripts are our audit trail.

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
- Share your custom Q-commands
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
**Email:** [Add if desired]

---

**Meta Note:** This CLAUDE.md file was created using the Q-Command System to manage the Q-Command System repository. Inception complete! 🎯
