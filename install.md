# Q-Command System Installation

**Note:** The install instructions are now in [README.md](README.md) at the top (in an HTML comment that Claude can read).

This file is kept for reference but is no longer the primary install source.

---

## What Gets Installed

**15 slash commands** in `.claude/commands/`:

| Command | Purpose |
|---------|---------|
| `q-begin.md` | Start session with context refresh |
| `q-end.md` | Complete session with documentation |
| `q-checkpoint.md` | Save progress mid-session |
| `q-status.md` | Check session state |
| `q-save.md` | Quick exit (minimal docs) |
| `q-verify.md` | Verify files were created |
| `q-commit.md` | Stage and commit changes |
| `q-compact.md` | Free context safely |
| `q-dump.md` | Create transcript manually |
| `q-learnings.md` | Summarize session insights |
| `q-pare.md` | Optimize CLAUDE.md size |
| `q-prompts.md` | Save session prompts |
| `q-setup-domain.md` | Configure for your project type |
| `q-reconfigure-domain.md` | Update configuration |
| `q-upgrade.md` | Upgrade to latest version |

**Directories** in `GeneratedMDs/`:

```text
GeneratedMDs/
├── transcripts/      # Full session records
├── session-notes/    # Summary notes
├── checkpoints/      # Mid-session saves
├── prompts/          # Saved prompts
└── .gitignore        # Ignores checkpoints/ and prompts/
```

---

## Manual Installation

If you need to install manually (offline or troubleshooting):

```bash
# 1. Create directories
mkdir -p GeneratedMDs/transcripts GeneratedMDs/session-notes GeneratedMDs/checkpoints GeneratedMDs/prompts
mkdir -p .claude/commands

# 2. Copy slash commands from downloaded repo
cp -r /path/to/Q-command-system/templates/.claude/commands/* .claude/commands/

# 3. Create .gitignore
echo -e "checkpoints/\nprompts/" > GeneratedMDs/.gitignore
```

Then type `/q-begin` to verify it works.

---

## Troubleshooting

**Commands not showing up?**

Check that `.claude/commands/` folder exists with 15 `.md` files inside.

**Tab completion not working?**

Restart Claude Code after installation.

**Need more help?**

See [getting-started.md](getting-started.md) or open an issue.
