# Changelog

All notable changes to the Q-Command System.

---

## [2.1.1] - 2025-12-02

**Strict checklists, YAML versioning, efficient upgrades, and command adherence improvements.**

### Added

- **YAML versioning system** — `.q-system/version.yaml` replaces simple `version` file
  - Full provenance tracking (source repo, branch, install date)
  - Individual command version tracking
  - Upgrade history log
  - Enables precise version comparison and targeted updates

- **Command-level version headers** — Each command file now has `version: 2.1.1` in frontmatter
  - `/q-upgrade` can now identify which commands need updating
  - Users can verify command versions match installed system version

- **Mandatory pre-flight checklists** — All critical commands now have strict adherence protocols
  - Explicit checkbox items Claude must confirm before proceeding
  - VERIFICATION GATES between major steps
  - FINAL CHECKLISTS before completion reports
  - Designed to prevent instruction drift at high context usage

- **Efficient script-based upgrades** — New upgrade infrastructure
  - `scripts/upgrade.sh` — Shell script for bulk curl operations
  - `releases.yaml` — Machine-readable release metadata
  - Reduces upgrade token usage by ~85% (1 WebFetch + 1 Bash vs 16 fetches + 14 writes)
  - Supports differential upgrades (only update changed commands)

### Changed

- **`/q-end` significantly strengthened**
  - MANDATORY checkpoint gathering step (non-negotiable)
  - Explicit verification that ALL checkpoints from today were read
  - 4 verification gates throughout execution
  - Final reminder checklist before completion

- **`/q-begin` strengthened** — Added verification gates and mandatory session notes reading

- **`/q-checkpoint` strengthened** — Added verification gates and mandatory work documentation

- **`/q-save` strengthened** — Added verification gates even for quick saves

- **`/q-upgrade` completely rewritten for efficiency**
  - Uses `releases.yaml` to determine what changed between versions
  - Executes `upgrade.sh` script instead of individual file fetches
  - Supports differential upgrades (only fetch changed commands)
  - Updates version.yaml with detailed upgrade history
  - ~85% reduction in token usage

- **`/q-setup` updated for YAML versioning**
  - Creates version.yaml with full provenance on install
  - Records all command versions

### Rationale

**Strict checklists:** When context is stretched (70%+), Claude's adherence to CLAUDE.md instructions degrades. Commands need their own strict checklists that Claude reads at execution time, not just instructions in CLAUDE.md that may be "forgotten."

**YAML versioning:** A single version number isn't enough. Each Q-System installation should know:
- Where it came from (provenance)
- What version of each command is installed
- History of upgrades

**Efficient upgrades:** The old upgrade approach required Claude to fetch and write 14+ files individually, using significant tokens and time. The new script-based approach uses native `curl` which is faster, more reliable, and token-efficient.

This enables smarter upgrades, better debugging, and marketplace-ready versioning.

### Bug Fixes

- Fixed: `/q-end` not reliably reading all checkpoints in long sessions
- Fixed: Timestamp generation not consistently executed
- Fixed: File verification sometimes skipped under context pressure
- Fixed: Upgrade process using excessive tokens

---

## [2.1.0] - 2025-11-30

**Proactive context monitoring, consolidated setup, robust upgrades.**

### Added

- **Proactive context monitoring** — Claude now shows context status periodically during sessions
  - 0-70%: Healthy (continue normally)
  - 70-85%: Caution (consider checkpoint)
  - 85-90%: Warning (checkpoint NOW)
  - 90%+: Critical (use /q-save, /q-end may fail)
  - Prevents the worst failure mode: Q-END failing at high context and losing all work
  - Credit: Brian LeBlanc (PeerLoop project) for the proposal and testing

- **Version file** — `.q-system/version` tracks installed Q-System version
  - Enables proper version comparison in /q-upgrade
  - Pre-2.1 installations show as "unknown"

- **Changelog-driven upgrades** — `/q-upgrade` now shows what changed between versions
  - Fetches and parses CHANGELOG.md
  - Shows relevant changes since your version
  - Creates backup before upgrading
  - Preserves user files (session notes, config, CLAUDE.md)

### Changed

- **`/q-setup` replaces two commands** — `/q-setup-domain` and `/q-reconfigure-domain` consolidated
  - Auto-detects context (new vs existing project)
  - New projects: Quick mode (2-3 min) or Detailed mode (10-15 min)
  - Existing projects: Update, Reset, or Cancel
  - Command count reduced from 15 to 14

- **`/q-status` enhanced** — Now shows context health with thresholds and recommendations

- **`/q-save` clarified** — Documents the Q-SAVE vs Q-END trade-off at high context

### Removed

- `/q-setup-domain` — Absorbed into `/q-setup`
- `/q-reconfigure-domain` — Absorbed into `/q-setup`

### Rationale

**Context monitoring:** The most frustrating Q-System failure is Q-END failing at high context, losing hours of work. Proactive monitoring warns users BEFORE this happens, allowing them to checkpoint or use Q-SAVE.

**Setup consolidation:** One command to remember instead of two. System auto-detects your situation.

**Robust upgrades:** Version tracking and changelog display make upgrades transparent and safe.

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
