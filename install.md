# Q-Command System Installation Instructions

**For Claude Code:** When a user asks to install the Q-Command System from this repository, follow these steps exactly.

---

## Step 1: Create Directory Structure

```bash
mkdir -p GeneratedMDs/transcripts
mkdir -p GeneratedMDs/session-notes
mkdir -p GeneratedMDs/checkpoints
mkdir -p .claude/commands
```

---

## Step 2: Install Slash Commands

Fetch each of these files and write them to `.claude/commands/`:

| Fetch from | Write to |
|------------|----------|
| `https://raw.githubusercontent.com/contactTAM/q-command-system/main/templates/.claude/commands/q-begin.md` | `.claude/commands/q-begin.md` |
| `https://raw.githubusercontent.com/contactTAM/q-command-system/main/templates/.claude/commands/q-end.md` | `.claude/commands/q-end.md` |
| `https://raw.githubusercontent.com/contactTAM/q-command-system/main/templates/.claude/commands/q-checkpoint.md` | `.claude/commands/q-checkpoint.md` |
| `https://raw.githubusercontent.com/contactTAM/q-command-system/main/templates/.claude/commands/q-status.md` | `.claude/commands/q-status.md` |
| `https://raw.githubusercontent.com/contactTAM/q-command-system/main/templates/.claude/commands/q-save.md` | `.claude/commands/q-save.md` |
| `https://raw.githubusercontent.com/contactTAM/q-command-system/main/templates/.claude/commands/q-verify.md` | `.claude/commands/q-verify.md` |
| `https://raw.githubusercontent.com/contactTAM/q-command-system/main/templates/.claude/commands/q-commit.md` | `.claude/commands/q-commit.md` |
| `https://raw.githubusercontent.com/contactTAM/q-command-system/main/templates/.claude/commands/q-compact.md` | `.claude/commands/q-compact.md` |
| `https://raw.githubusercontent.com/contactTAM/q-command-system/main/templates/.claude/commands/q-dump.md` | `.claude/commands/q-dump.md` |
| `https://raw.githubusercontent.com/contactTAM/q-command-system/main/templates/.claude/commands/q-learnings.md` | `.claude/commands/q-learnings.md` |
| `https://raw.githubusercontent.com/contactTAM/q-command-system/main/templates/.claude/commands/q-pare.md` | `.claude/commands/q-pare.md` |
| `https://raw.githubusercontent.com/contactTAM/q-command-system/main/templates/.claude/commands/q-prompts.md` | `.claude/commands/q-prompts.md` |

---

## Step 3: Install SHORTCUTS.md (Reference)

Fetch this file:

```text
https://raw.githubusercontent.com/contactTAM/q-command-system/main/templates/SHORTCUTS.md
```

Write it to:

```text
GeneratedMDs/SHORTCUTS.md
```

This serves as reference documentation for the commands.

---

## Step 4: Create .gitignore for GeneratedMDs

Create `GeneratedMDs/.gitignore` with this content:

```gitignore
# Ignore checkpoint files (temporary mid-session saves)
checkpoints/

# Ignore prompts (personal reference)
prompts/

# Keep transcripts and session-notes (they get committed)
!transcripts/
!session-notes/
```

---

## Step 5: Show User the CLAUDE.md Template

Fetch this file:

```text
https://raw.githubusercontent.com/contactTAM/q-command-system/main/templates/CLAUDE.md
```

Show the user the "Workflow with Claude Code" section and tell them:

> I've installed the Q-Command System. You should add the "Workflow with Claude Code" section to your CLAUDE.md file (create one if you don't have it).
>
> **Key section to add:**
>
> - Copy everything from "## Workflow with Claude Code" onwards
> - Replace `[PROJECT_OWNER_NAME]` with your name
>
> Would you like me to create a CLAUDE.md file for you, or do you already have one I should add to?

---

## Step 6: Confirm Installation

After completing the above, report:

```text
Q-Command System installed!

Slash commands available (type / to see them):
  /q-begin      - Start session with context refresh
  /q-end        - Complete session with documentation
  /q-checkpoint - Save mid-session progress
  /q-status     - Check session state
  /q-save       - Quick exit (minimal docs)
  /q-verify     - Verify files were created
  /q-commit     - Stage and commit changes
  /q-compact    - Safe context management
  /q-dump       - Create transcript manually
  /q-learnings  - Summarize session insights
  /q-pare       - Optimize CLAUDE.md size
  /q-prompts    - Save session prompts

Created:
  .claude/commands/     (12 slash commands)
  GeneratedMDs/         (session file storage)
    SHORTCUTS.md        (command reference)
    transcripts/
    session-notes/
    checkpoints/
    .gitignore

Next: Run /q-begin to start your first session!
```

---

## Notes for Claude

- Do NOT push to git. User controls that.
- If user already has `.claude/commands/` folder, ask before overwriting.
- If user already has GeneratedMDs/ folder, preserve existing files.
- The slash commands work immediately after installation - user can type `/q-` and tab to see them.
