# Getting Started

Get the Q-Command System running in your project.

---

## Step 1: Prerequisites

You need Claude Code, VS Code, and Git installed first.

| Platform | Guide |
|----------|-------|
| Mac | [docs/install/mac-install.md](docs/install/mac-install.md) |
| Windows | [docs/install/windows-install.md](docs/install/windows-install.md) |

Already have them? [Verify your installation](docs/install/verify-install.md).

---

## Step 2: Install Q-Command System

Open Claude Code in your project folder and type:

```text
Install Q-Command System from https://github.com/contactTAM/q-command-system
```

Claude will fetch and install everything automatically:
- 15 slash commands in `.claude/commands/`
- Session file directories in `GeneratedMDs/`

**After installation, restart Claude Code** (exit and run `claude` again) to activate the commands.

---

## Step 3: Start Working

Begin every session with:

```text
/q-begin
```

End every session with:

```text
/q-end
```

That's it. The system handles documentation, commits, and context automatically.

---

## Quick Reference

Type `/q-` and press Tab to see all commands.

| Command | What it does |
|---------|--------------|
| `/q-begin` | Start session, load context |
| `/q-end` | End session, save everything |
| `/q-checkpoint` | Save progress mid-session |
| `/q-compact` | Free context safely |
| `/q-status` | Check session state |
| `/context` | Check context usage (built-in) |

Full command list: [docs/features.md](docs/features.md)

---

## Learn More

- [All features](docs/features.md)
- [Daily workflow](docs/workflow.md)

---

## Alternative: Manual Installation

If you need to install offline or prefer manual setup:

```bash
# 1. Create directories
mkdir -p GeneratedMDs/transcripts GeneratedMDs/session-notes GeneratedMDs/checkpoints
mkdir -p .claude/commands

# 2. Copy slash commands from downloaded Q-command-system repo
cp -r /path/to/Q-command-system/templates/.claude/commands/* .claude/commands/
```

Then open Claude Code and type `/q-begin` to verify it works.

---

## Troubleshooting

**Install command not working?**

Make sure you're connected to the internet. Claude needs to fetch files from GitHub.

**Commands not recognized?**

Restart Claude Code after installation. Close the terminal and run `claude` again.

If still not working, check that `.claude/commands/` folder exists with the q-*.md files inside.

**Need more help?**

See [docs/features.md](docs/features.md) or open an issue on GitHub.
