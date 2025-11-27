# Changelog

All notable changes to the Q-Command System.

---

## [1.1.0] - 2025-11-27

**Native slash commands and new features.**

### Added

- **Native slash commands** — All commands now available as `/q-begin`, `/q-end`, etc. with tab completion
- **/q-pare** — Optimize CLAUDE.md by moving verbose content to OFFLOAD.md
- **/q-prompts** — Save all user prompts from session for future reuse
- **One-liner install** — `Install Q-Command System from https://github.com/contactTAM/q-command-system`

### Changed

- Commands now use slash format (`/q-begin`) as primary style
- Uppercase format (`Q-BEGIN`) still works — both do the same thing
- Simplified getting-started.md to match README quick start
- Harmonized documentation to use consistent command format

### Documentation

- Updated commands-reference.md with all 15 commands
- Added command format explanation (slash vs uppercase)
- Moved manual installation to "Alternative" section

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
