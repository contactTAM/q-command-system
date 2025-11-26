# Q-Command System Installation Instructions

**For Claude Code:** When a user asks to install the Q-Command System from this repository, follow these steps exactly.

---

## Step 1: Create Directory Structure

```bash
mkdir -p GeneratedMDs/transcripts
mkdir -p GeneratedMDs/session-notes
mkdir -p GeneratedMDs/checkpoints
```

---

## Step 2: Fetch and Install SHORTCUTS.md

Fetch this file:
```
https://raw.githubusercontent.com/contactTAM/q-command-system/main/templates/SHORTCUTS.md
```

Write it to:
```
GeneratedMDs/SHORTCUTS.md
```

---

## Step 3: Create .gitignore for GeneratedMDs

Create `GeneratedMDs/.gitignore` with this content:

```
# Ignore checkpoint files (temporary mid-session saves)
checkpoints/

# Keep transcripts and session-notes (they get committed)
!transcripts/
!session-notes/
```

---

## Step 4: Show User the CLAUDE.md Template

Fetch this file:
```
https://raw.githubusercontent.com/contactTAM/q-command-system/main/templates/CLAUDE.md
```

Show the user the "Workflow with Claude Code" section and tell them:

> I've installed the Q-Command System. You should add the "Workflow with Claude Code" section to your CLAUDE.md file (create one if you don't have it).
>
> **Key section to add:**
> - Copy everything from "## Workflow with Claude Code" onwards
> - Replace `[PROJECT_OWNER_NAME]` with your name
>
> Would you like me to create a CLAUDE.md file for you, or do you already have one I should add to?

---

## Step 5: Confirm Installation

After completing the above, report:

```
Q-Command System installed.

Created:
- GeneratedMDs/SHORTCUTS.md (v1.0)
- GeneratedMDs/transcripts/
- GeneratedMDs/session-notes/
- GeneratedMDs/checkpoints/
- GeneratedMDs/.gitignore

Next step: Run Q-SETUP-DOMAIN to configure for your project type.

Or if you want to start immediately: Run Q-BEGIN
```

---

## Notes for Claude

- Do NOT push to git. User controls that.
- If user already has GeneratedMDs/ folder, preserve existing files.
- If user already has SHORTCUTS.md, ask before overwriting (they may have custom commands).
- The Q-SETUP-DOMAIN command will ask about their domain (software, writing, research, etc.) and configure accordingly.
