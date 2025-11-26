# Setup Guide

Add the Q-Command System to your project.

---

## Quick Setup (Recommended)

**For most users. Takes 5 minutes. No file editing required.**

### Step 1: Copy one file

In your project folder, run:

```bash
mkdir -p GeneratedMDs
cp /path/to/Q-command-system/templates/SHORTCUTS.md GeneratedMDs/
```

That's the only file you need.

### Step 2: Run the setup wizard

Open Claude Code in your project:

```bash
claude
```

Tell Claude:

```text
Please read GeneratedMDs/SHORTCUTS.md and run Q-SETUP-DOMAIN
```

### Step 3: Answer 7 questions

The wizard asks about:
- Your project type
- Your experience level
- Your team size

Based on your answers, it creates everything automatically — including CLAUDE.md configured for your project.

### Step 4: Test it

```text
Q-BEGIN
```

Claude should greet you and ask what you want to work on. Done!

---

## Advanced Setup

**For users who want full control or have special requirements.**

### When to use Advanced Setup

- You already have a CLAUDE.md file you don't want to overwrite
- You want to understand exactly what gets created
- You're setting up multiple repositories
- You want to customize before first use

### Manual Steps

#### 1. Create directory structure

```bash
cd /path/to/your/project
mkdir -p GeneratedMDs/transcripts
mkdir -p GeneratedMDs/session-notes
mkdir -p GeneratedMDs/checkpoints
```

#### 2. Copy SHORTCUTS.md (required)

```bash
cp /path/to/Q-command-system/templates/SHORTCUTS.md GeneratedMDs/
```

#### 3. Handle CLAUDE.md (careful!)

**If you DON'T have a CLAUDE.md yet:**

```bash
cp /path/to/Q-command-system/templates/CLAUDE.md .
```

Then edit it to add your project details.

**If you ALREADY have a CLAUDE.md:**

Don't overwrite it! Instead, add the Q-Command workflow section manually:

1. Open `templates/CLAUDE.md` in the Q-command-system folder
2. Find the section starting with `## Workflow with Claude Code`
3. Copy that entire section
4. Paste it into your existing CLAUDE.md

#### 4. Customize team names

Open `GeneratedMDs/SHORTCUTS.md` and find this line (around line 17):

```markdown
- `[PersonName]`: Gabriel, Guy, Fraser, or Brian
```

Replace the example names with your actual team member names.

#### 5. Optional: Add .gitignore

```bash
cp /path/to/Q-command-system/templates/.gitignore GeneratedMDs/
```

This prevents session files from being committed to git.

### Multi-Repository Options

**Option 1: Copy to each repo**
- Independent installations
- Can customize per-repo
- Simple, recommended for most cases

**Option 2: Symlink to shared installation**

```bash
ln -s ~/Q-command-system/templates/SHORTCUTS.md GeneratedMDs/SHORTCUTS.md
```

- Updates apply to all repos automatically
- Cannot customize per-repo

**Option 3: Git submodule**

```bash
git submodule add https://github.com/contactTAM/q-command-system.git
```

- Version controlled
- Good for teams

### Adding Custom Commands

Edit `GeneratedMDs/SHORTCUTS.md` and add a new section:

```markdown
## Q-YOURCOMMAND

When the user types `Q-YOURCOMMAND`:
1. Do this
2. Then do that
3. Report results
```

Save and use immediately — no restart needed.

---

## Troubleshooting

**"Q-BEGIN not recognized"**

Claude hasn't read SHORTCUTS.md yet. Tell Claude:

```text
Please read GeneratedMDs/SHORTCUTS.md and then run Q-BEGIN
```

**"Q-SETUP-DOMAIN not recognized"**

Same issue — Claude needs to read SHORTCUTS.md first.

**Files created in wrong location**

Check that `GeneratedMDs/` directory exists in your project root.

**Q-END didn't create files**

Run `Q-VERIFY` to check what exists. If context is full, try `Q-SAVE` instead.

**Accidentally overwrote CLAUDE.md**

If you had a CLAUDE.md and overwrote it:
1. Check git: `git checkout CLAUDE.md` to restore
2. Or restore from backup
3. Then manually add the Q-Command workflow section

---

## Verification Checklist

After setup, verify:

- [ ] `GeneratedMDs/SHORTCUTS.md` exists
- [ ] Subdirectories exist (transcripts/, session-notes/, checkpoints/)
- [ ] `Q-BEGIN` works
- [ ] `Q-STATUS` shows session info
- [ ] `Q-END` creates files in the right places

---

## Optional: Show Context Usage

You can display context usage in your Claude Code status bar.

### Step 1: Create status script

Create `~/.claude/statusline.sh`:

```bash
#!/bin/bash
echo "Q-System Ready"
```

### Step 2: Make it executable

```bash
chmod +x ~/.claude/statusline.sh
```

### Step 3: Configure Claude Code

Add to `~/.claude/settings.json`:

```json
{
  "statusLine": {
    "type": "command",
    "command": "~/.claude/statusline.sh"
  }
}
```

Now you'll see status info at the bottom of Claude Code.

For more on context management, see [context-management.md](context-management.md).

---

## Next Steps

1. Run `Q-BEGIN` to start your first session
2. Do some work
3. Run `/context` to check your context usage
4. Run `Q-CHECKPOINT` after 60-90 minutes
5. Run `Q-END` to save everything
6. Check `GeneratedMDs/session-notes/` — your session notes are there
7. Read [workflow.md](workflow.md) for daily usage tips
