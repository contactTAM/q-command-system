# Q-Command System Features

**Version:** 2.0
**Last Updated:** 2025-11-28

---

## Quick Start (For New Users)

**What it does:** Turns Claude Code into a reliable co-pilot with automatic documentation, context protection, and git integration.

**The 3 commands you need:**

| Command | When | What happens |
|---------|------|--------------|
| `/q-begin` | Start of session | Loads context, shows last session summary |
| `/q-checkpoint` | Every 90 min | Saves progress (insurance) |
| `/q-end` | End of session | Creates docs, commits to git |

That's it. Type `/q-` and press Tab to see all commands.

---

## All Commands (Quick Reference)

### Essential (Use Daily)

| Command | Purpose |
|---------|---------|
| `/q-begin` | Start session with context refresh |
| `/q-end` | End session with full documentation and commit |
| `/q-checkpoint` | Save mid-session progress snapshot |

### Monitoring

| Command | Purpose |
|---------|---------|
| `/q-status` | Check session state and context health |
| `/q-verify` | Verify that saves/commits worked |

### Context Management

| Command | Purpose |
|---------|---------|
| `/q-compact` | Free context space safely (checkpoint first, then compact) |
| `/q-save` | Quick exit when context is critical (>90%) |

### Documentation

| Command | Purpose |
|---------|---------|
| `/q-dump` | Create session transcript manually |
| `/q-learnings` | Summarize key insights from session |
| `/q-prompts` | Save all user prompts for future reuse |

### Git

| Command | Purpose |
|---------|---------|
| `/q-commit` | Stage and commit changes (without full /q-end) |

### Optimization

| Command | Purpose |
|---------|---------|
| `/q-pare` | Slim down CLAUDE.md by moving verbose content to OFFLOAD.md |

### Setup

| Command | Purpose |
|---------|---------|
| `/q-setup-domain` | Configure Q-Command System for your project type |
| `/q-reconfigure-domain` | Update configuration as project evolves |
| `/q-upgrade` | Upgrade to latest Q-Command System version |

**Detailed command info:** See `.claude/commands/q-*.md` files

---

## Command Details

### /q-begin

**What it does:**
- Reads CLAUDE.md for project context
- Reviews your last session notes
- Shows summary of recent progress
- Asks what to work on today

**Example:**
```
User: /q-begin

Claude: Last session (Nov 26, 2:30 PM):
- Added user authentication
- Fixed 3 bugs in checkout flow
- All changes committed

What would you like to work on today?
```

---

### /q-end

**What it does:**
1. Creates session transcript in `.q-system/transcripts/`
2. Creates session notes in `.q-system/session-notes/`
3. Commits all changes to git
4. Verifies each step succeeded
5. Reminds you to `git push`

**Example output:**
```
Session Complete!

Transcript: .q-system/transcripts/2025-11-27-0913-Gabriel.md
Session Notes: .q-system/session-notes/2025-11-27-0913-Gabriel.md
Git: Committed (9 files changed)

Ready to push! Run `git push` when ready.
```

---

### /q-checkpoint

**What it does:**
- Creates checkpoint file with current progress
- Documents accomplishments, files changed, next steps
- Insurance against context loss

**When to use:**
- Every 90 minutes in long sessions
- After completing a major milestone
- When context usage reaches 70%

---

### /q-status

**What it shows:**
- Session duration
- Accomplishments count
- Files modified
- Context health (usage percentage)
- Recommendations (when to checkpoint, when to wrap up)

---

### /q-verify

**What it checks:**
- Transcripts created today
- Session notes created today
- Checkpoints created today
- Git status (uncommitted changes, commits ahead)

Use after `/q-end` to confirm everything saved correctly.

---

### /q-compact

**What it does:**
1. Runs `/q-checkpoint` first (saves your work)
2. Then runs `/compact` to free context space

**Why use /q-compact instead of /compact:**
- `/compact` alone loses detail
- `/q-compact` preserves your work in a checkpoint file first

---

### /q-save

**Lightweight quick exit when context is critical.**

Creates basic transcript and commits, but skips detailed session notes.

**Use when:**
- Context usage above 90%
- Need to exit quickly
- Already created checkpoints earlier

---

### /q-dump

Creates session transcript manually without full `/q-end` process.

---

### /q-learnings

Analyzes session and presents key insights:
- Technical discoveries
- Process improvements
- Important decisions and rationale

---

### /q-prompts

Saves all your prompts from the session to `.q-system/prompts/`.

Useful for building a personal prompt library.

---

### /q-commit

Stages and commits all changes without full `/q-end` documentation.

**Note:** Never pushes to remote - you control that.

---

### /q-pare

Optimizes CLAUDE.md by moving verbose reference content to OFFLOAD.md.

**What stays in CLAUDE.md:** Project overview, tech stack, key workflows
**What moves to OFFLOAD.md:** Detailed examples, full file listings, extended docs

---

### /q-setup-domain

Runs a setup wizard that configures Q-Command System for your project:
- Asks about your domain (software, research, writing, etc.)
- Asks about experience level
- Creates appropriate directory structure
- Installs relevant commands

---

### /q-reconfigure-domain

Updates your configuration when your project evolves:
- From exploration to execution
- Experience level changes
- Team size changes

---

### /q-upgrade

Checks your version and guides upgrade to latest Q-Command System.

Preserves any custom commands you've added.

---

## How It Works

Commands are defined in `.claude/commands/q-*.md` files. When you type `/q-begin`, Claude reads the instruction file and follows it step-by-step. Session notes serve as memory between sessions—Claude reads them at the start of each new session.

No code, no plugins. Just markdown instructions that Claude follows.

---

## Features Deep Dive (For Advanced Users)

### Context Protection

**The Problem:** Long conversations hit Claude's 200K token limit. When this happens, Claude auto-compacts and can lose work details.

**How Q-Command protects you:**

1. **Auto-compact detection** - `/q-end` detects if conversation was compacted and reads the summary
2. **Checkpoint insurance** - `/q-checkpoint` saves detailed progress that survives compaction
3. **Context health monitoring** - `/q-status` shows usage percentage and warns you
4. **Safe compaction** - `/q-compact` saves checkpoint FIRST, then compacts

**Recovery hierarchy:**
1. Current context (always available)
2. Conversation summary (if auto-compacted)
3. Checkpoints (if created)
4. Previous session notes (for /q-begin)

---

### Documentation Generation

**Session Transcripts** (`.q-system/transcripts/`)
- Chronological conversation flow
- All actions and responses
- Full session history

**Session Notes** (`.q-system/session-notes/`)
- Executive summary
- Key accomplishments
- Files changed
- Next steps
- Scannable in 2-3 minutes

**File naming:** `YYYY-MM-DD-HHmm-[PersonName].md`
- Example: `2025-11-27-0913-Gabriel.md`
- Sorts chronologically
- No collisions between team members

---

### Multi-User Support

**Per-person file naming prevents collisions:**
```
.q-system/session-notes/
  2025-11-27-0913-Gabriel.md
  2025-11-27-1000-Guy.md
  2025-11-27-1430-Fraser.md
```

**Person-specific history:**
- `/q-begin` reads YOUR last session, not teammates'
- Each person picks up where THEY left off

---

### Git Integration

**Automatic commits:**
- `/q-end` commits all changes
- Descriptive commit messages with bullet points
- Co-author attribution to Claude

**User-controlled push:**
- Claude NEVER pushes automatically
- You review and push when ready

**Commit format:**
```
Brief summary of changes

- Point 1: description
- Point 2: description

Co-Authored-By: Claude <noreply@anthropic.com>
```

---

### Verification & Error Handling

**Every command verifies success:**
- Files created? Check.
- Content substantial? Check.
- Git committed? Check.

**Explicit error reporting:**
- Never fails silently
- Reports what succeeded and what failed
- Provides manual recovery steps

**Example error:**
```
STEP 3 FAILED: Create session notes
Error: Unable to write file

What succeeded:
- Transcript created
- Checkpoints merged

What failed:
- Session notes NOT created

Manual steps:
1. Check disk space
2. Run /q-dump to retry
```

---

### Customization

**Add custom commands:**

1. Create `.claude/commands/q-yourcommand.md`
2. Define what Claude should do
3. Use immediately with `/q-yourcommand`

**Example custom command:**

Create `.claude/commands/q-review.md`:
```markdown
# /q-review

Pre-push code review.

When the user runs this command:

1. Read files modified in last commit
2. Check for common issues (TODOs, console.logs, etc.)
3. Generate review checklist
4. Ask if user wants to fix anything
```

**Modify existing commands:**

Edit any `.claude/commands/q-*.md` file. Changes take effect immediately.

---

### Status Line (Optional)

Display Q-System status in Claude Code status bar.

**Step 1:** Create `~/.claude/statusline.sh`:
```bash
#!/bin/bash
echo "Q-System Ready"
```

**Step 2:** Make executable:
```bash
chmod +x ~/.claude/statusline.sh
```

**Step 3:** Add to `~/.claude/settings.json`:
```json
{
  "statusLine": {
    "type": "command",
    "command": "~/.claude/statusline.sh"
  }
}
```

---

## When to Use Each Command

| Situation | Command | Why |
|-----------|---------|-----|
| Starting work session | `/q-begin` | Load context, see last session |
| Long session (90+ min) | `/q-checkpoint` | Insurance against data loss |
| Want to check progress | `/q-status` | See session state, context health |
| Finishing work (normal) | `/q-end` | Full documentation + commit |
| Context critical (>90%) | `/q-save` | Fast exit, still captures essentials |
| Context high (70-90%) | `/q-compact` | Free space while preserving work |
| Want to verify success | `/q-verify` | Check all files created correctly |
| Mid-session commit | `/q-commit` | Save work without full documentation |
| Reflecting on session | `/q-learnings` | Capture insights and decisions |
| Save prompts for reuse | `/q-prompts` | Build prompt library |
| CLAUDE.md too long | `/q-pare` | Optimize context loading |

---

## Typical Session Flow

```text
/q-begin
   ↓
Work...
   ↓
/q-status (check progress)
   ↓
Work...
   ↓
/q-checkpoint (90 min mark)
   ↓
Work...
   ↓
/q-end (finish session)
   ↓
/q-verify (confirm success)
```

**Quick session:** `/q-begin` → Work → `/q-end`

**Long session with context pressure:** `/q-begin` → Work → `/q-checkpoint` → Work → `/q-save`

**Multiple checkpoints:** `/q-begin` → Work → `/q-checkpoint` → Work → `/q-checkpoint` → Work → `/q-end`

---

## Error Recovery

**If /q-end fails:**
```text
/q-dump      → Create transcript manually
/q-commit    → Commit changes manually
```

**If files missing:** Run `/q-verify` to see what's missing, then re-run the failed command.

**If git issues:** Check `git status` and `git log -1`, then re-run `/q-commit`.

---

## Summary

**For new users:** Start with `/q-begin`, `/q-checkpoint`, `/q-end`. That's 90% of what you need.

**For power users:** The system provides context protection, automatic documentation, multi-user support, git integration, and full customization.

**Result:** Claude Code transforms from a helpful assistant into a reliable, structured, accountable co-pilot.

---

**Questions?** Open an issue at [github.com/contactTAM/q-command-system](https://github.com/contactTAM/q-command-system)
