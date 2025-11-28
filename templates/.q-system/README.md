# .q-system/

This folder is managed by the **Q-Command System** - a structured co-pilot framework for Claude Code.

## Contents

| Folder | Purpose |
|--------|---------|
| `config.md` | Your preferences (user name, git tracking, etc.) |
| `docs/` | Q-System documentation |
| `transcripts/` | Full session conversation logs |
| `session-notes/` | Session summaries and accomplishments |
| `checkpoints/` | Mid-session progress snapshots |
| `prompts/` | Saved session prompts for reuse |
| `memory/` | Learned preferences (future feature) |

## File Naming

Session files follow the pattern: `YYYY-MM-DD-HHmm-[Name].md`

Example: `2025-11-28-1430-Gabriel.md`

This prevents collisions when multiple people use Q-System on the same repo.

## Git Tracking

By default, this folder is **not tracked** in git (added to `.gitignore`).

To track session files in git:
1. Edit `config.md` and set `track_in_git: yes`
2. Remove `.q-system/` from your `.gitignore`

## Commands

Type `/q-` and press Tab to see all available commands:

- `/q-begin` - Start session with context refresh
- `/q-end` - Complete session with documentation
- `/q-status` - Check session state
- `/q-checkpoint` - Save mid-session progress

See `docs/features.md` for the full command reference.

## Documentation

- [Features & Commands](docs/features.md)
- [Daily Workflow](docs/workflow.md)
- [Context Management](docs/context-management.md)

## More Information

- Repository: https://github.com/contactTAM/q-command-system
- Issues: https://github.com/contactTAM/q-command-system/issues
