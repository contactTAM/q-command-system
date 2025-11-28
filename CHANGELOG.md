# Changelog

All notable changes to the Q-Command System.

---

## [2.0.0] - 2025-11-28

**Self-contained `.q-system/` folder.**

### Breaking Changes

- **Session files moved** — All session files now live in `.q-system/` instead of `GeneratedMDs/`
  - `.q-system/transcripts/` (was `GeneratedMDs/transcripts/`)
  - `.q-system/session-notes/` (was `GeneratedMDs/session-notes/`)
  - `.q-system/checkpoints/` (was `GeneratedMDs/checkpoints/`)
  - `.q-system/prompts/` (was `GeneratedMDs/prompts/`)

### Migration Guide

If you have an existing installation with `GeneratedMDs/`:

1. Rename folder: `mv GeneratedMDs .q-system`
2. Update your `.gitignore` if needed (replace `GeneratedMDs/` with `.q-system/`)
3. Copy new templates: Re-run install or manually update `.claude/commands/` files

Your existing session files will continue to work in the new location.

### Added

- **`.q-system/` folder** — All Q-System files in one self-contained location
- **`.q-system/config.md`** — User preferences (name, git tracking, etc.)
- **`.q-system/README.md`** — Folder documentation
- **`.q-system/docs/`** — Q-System documentation installed with commands
- **`.q-system/memory/`** — Future: tiered memory system

### Changed

- All 15 slash commands updated to use `.q-system/` paths
- Install creates `.q-system/` with full structure and docs
- Documentation references updated throughout
- Version number updated to 2.0 in CLAUDE.md and features.md

### Rationale

The `.q-system/` folder provides:
- **Self-containment** — Everything Q-System needs in one place
- **Clean repos** — Doesn't pollute project structure with multiple folders
- **Portability** — Easy to understand what's Q-System vs project files
- **Future-ready** — Room for config, memory, and other features

---

## [1.1.0] - 2025-11-27

**Native slash commands and simplified install.**

### Added

- **Native slash commands** — All 15 commands available as `/q-begin`, `/q-end`, etc. with tab completion
- **/q-pare** — Optimize CLAUDE.md by moving verbose content to OFFLOAD.md
- **/q-prompts** — Save all user prompts from session for future reuse
- **/q-setup-domain**, **/q-reconfigure-domain**, **/q-upgrade** — As slash commands
- **One-liner install** — `Install Q-Command System from https://github.com/contactTAM/q-command-system`
- **Install instructions in README** — Claude finds them immediately (HTML comment at top)

### Changed

- **Removed SHORTCUTS.md** — Slash commands are now the only command source
- Commands use slash format (`/q-begin`) as primary style
- Simplified getting-started.md to match README quick start
- Harmonized all documentation to use slash command format

### Removed

- `templates/SHORTCUTS.md` — No longer needed (slash commands contain all specifications)
- `docs/setup.md` — Consolidated into getting-started.md and features.md
- `docs/commands-reference.md` — Merged into features.md
- `docs/architecture.md` — Brief "How It Works" added to features.md instead
- `install.md` — Install instructions now in README.md

### Documentation

- Updated all docs to remove SHORTCUTS.md references
- Moved install instructions to README.md for faster discovery
- Updated CLAUDE.md template with slash command format

---

## [1.0.0] - 2025-11-26

**First public release.**

### Added

- **Q-UPGRADE** — Easy version upgrades (preserves custom commands)
- **Q-COMPACT** — Safe context management (checkpoint first, then compact)
- **Q-SETUP-DOMAIN** — Adaptive setup wizard with 7 contextual questions
- **Q-RECONFIGURE-DOMAIN** — Update configuration as project evolves
- **Context management guide** — Documentation for the 200K token limit
- **Platform installation guides** — Mac and Windows setup instructions

### Features

- Per-person-per-session file naming (no collisions)
- Organized directory structure (transcripts/, session-notes/, checkpoints/)
- Step-by-step verification in Q-END
- Q-SAVE for lightweight quick exits
- Q-VERIFY for confirming saves worked
- Q-STATUS with context health monitoring
- Comprehensive error handling with graceful degradation
- Progressive scaffolding system (adapts to user experience level)

### Documentation

- Simplified getting-started.md (~100 lines)
- Concise README.md (~90 lines)
- Lowercase filenames throughout (friendlier)
- Two-audience approach (beginners vs experts)

---

## [0.2.0] - 2025-11-17

**Development version: Domain-specific setup.**

### Added

- Domain-specific setup wizard concept
- Configuration profile system (.q-system/domain-config.json)
- Automatic documentation generation

---

## [0.1.0] - 2025-11-13

**Development version: Initial system.**

### Added

- Q-BEGIN — Start session with context refresh
- Q-END — Complete session documentation and commit
- Q-CHECKPOINT — Save mid-session progress
- Q-STATUS — Check session state
- Q-DUMP — Create transcript manually
- Q-COMMIT — Stage and commit changes
- Q-LEARNINGS — Summarize session insights
- Q-SAVE — Lightweight quick exit
- Q-VERIFY — Verify command success

---

## Version Numbering

We use [Semantic Versioning](https://semver.org/):

| Bump | When | Example |
|------|------|---------|
| **MAJOR** (2.0.0) | Breaking changes requiring user action | Renaming commands, changing file locations |
| **MINOR** (1.1.0) | New features, backward compatible | New commands, slash command support |
| **PATCH** (1.0.1) | Bug fixes, documentation fixes | Typos, clarifications |

**Version ranges:**

- **1.x** — Public releases (stable, documented)
- **0.x** — Development versions (internal testing)
