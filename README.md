<!-- CLAUDE: INSTALL INSTRUCTIONS
When a user asks to install the Q-Command System from this repository, execute these steps:

STEP 1: Create directories
```bash
mkdir -p .q-system/transcripts .q-system/session-notes .q-system/checkpoints .q-system/prompts .q-system/memory .q-system/docs/install .claude/commands
```

STEP 2: Fetch and install all 15 slash commands
Use WebFetch to get each file and Write to save it. Fetch the RAW content from each URL:

.claude/commands/q-begin.md        <- https://raw.githubusercontent.com/contactTAM/q-command-system/main/templates/.claude/commands/q-begin.md
.claude/commands/q-end.md          <- https://raw.githubusercontent.com/contactTAM/q-command-system/main/templates/.claude/commands/q-end.md
.claude/commands/q-checkpoint.md   <- https://raw.githubusercontent.com/contactTAM/q-command-system/main/templates/.claude/commands/q-checkpoint.md
.claude/commands/q-status.md       <- https://raw.githubusercontent.com/contactTAM/q-command-system/main/templates/.claude/commands/q-status.md
.claude/commands/q-save.md         <- https://raw.githubusercontent.com/contactTAM/q-command-system/main/templates/.claude/commands/q-save.md
.claude/commands/q-verify.md       <- https://raw.githubusercontent.com/contactTAM/q-command-system/main/templates/.claude/commands/q-verify.md
.claude/commands/q-commit.md       <- https://raw.githubusercontent.com/contactTAM/q-command-system/main/templates/.claude/commands/q-commit.md
.claude/commands/q-compact.md      <- https://raw.githubusercontent.com/contactTAM/q-command-system/main/templates/.claude/commands/q-compact.md
.claude/commands/q-dump.md         <- https://raw.githubusercontent.com/contactTAM/q-command-system/main/templates/.claude/commands/q-dump.md
.claude/commands/q-learnings.md    <- https://raw.githubusercontent.com/contactTAM/q-command-system/main/templates/.claude/commands/q-learnings.md
.claude/commands/q-pare.md         <- https://raw.githubusercontent.com/contactTAM/q-command-system/main/templates/.claude/commands/q-pare.md
.claude/commands/q-prompts.md      <- https://raw.githubusercontent.com/contactTAM/q-command-system/main/templates/.claude/commands/q-prompts.md
.claude/commands/q-setup-domain.md <- https://raw.githubusercontent.com/contactTAM/q-command-system/main/templates/.claude/commands/q-setup-domain.md
.claude/commands/q-reconfigure-domain.md <- https://raw.githubusercontent.com/contactTAM/q-command-system/main/templates/.claude/commands/q-reconfigure-domain.md
.claude/commands/q-upgrade.md      <- https://raw.githubusercontent.com/contactTAM/q-command-system/main/templates/.claude/commands/q-upgrade.md

STEP 3: Fetch and install .q-system files
.q-system/README.md   <- https://raw.githubusercontent.com/contactTAM/q-command-system/main/templates/.q-system/README.md
.q-system/config.md   <- https://raw.githubusercontent.com/contactTAM/q-command-system/main/templates/.q-system/config.md
.q-system/docs/features.md <- https://raw.githubusercontent.com/contactTAM/q-command-system/main/templates/.q-system/docs/features.md
.q-system/docs/workflow.md <- https://raw.githubusercontent.com/contactTAM/q-command-system/main/templates/.q-system/docs/workflow.md
.q-system/docs/context-management.md <- https://raw.githubusercontent.com/contactTAM/q-command-system/main/templates/.q-system/docs/context-management.md
.q-system/docs/install/mac-install.md <- https://raw.githubusercontent.com/contactTAM/q-command-system/main/templates/.q-system/docs/install/mac-install.md
.q-system/docs/install/windows-install.md <- https://raw.githubusercontent.com/contactTAM/q-command-system/main/templates/.q-system/docs/install/windows-install.md
.q-system/docs/install/verify-install.md <- https://raw.githubusercontent.com/contactTAM/q-command-system/main/templates/.q-system/docs/install/verify-install.md

STEP 4: Add .q-system to .gitignore (optional - ask user)
By default, suggest adding .q-system/ to .gitignore to keep session files local.
If user wants to track session files, skip this step.

STEP 5: Report success
```
Q-Command System v2.0 installed!

15 slash commands in .claude/commands/
Session files in .q-system/
Documentation in .q-system/docs/

IMPORTANT: Restart Claude Code to activate the new commands.
(Close this terminal and run `claude` again)

After restart: Type /q- and press Tab to see all commands.
Then type /q-begin to start your first session!
```

Do NOT push to git. User controls that.
END CLAUDE INSTRUCTIONS -->

# Q-Command System

A structured co-pilot framework for Claude Code.

**Free to use.** MIT License.

---

## Quick Start

Open Claude Code in your project folder and type:

```text
Install Q-Command System from https://github.com/contactTAM/q-command-system
```

Then **restart Claude Code** (exit and run `claude` again).

After restart, type `/q-begin` to start your first session.

---

## What It Does

- **Session management** — Start, checkpoint, and end sessions with `/q-begin`, `/q-checkpoint`, `/q-end`
- **Automatic documentation** — Transcripts and session notes created automatically
- **Context protection** — Prevents losing work when conversation gets long
- **Multi-user support** — Team members work without file conflicts
- **Git integration** — Automatic commits, you control pushes

---

## Commands

Type `/q-` and press Tab to see all 15 commands:

| Command | Purpose |
|---------|---------|
| `/q-begin` | Start session with context refresh |
| `/q-end` | Complete session with documentation |
| `/q-checkpoint` | Save progress mid-session |
| `/q-status` | Check session state |
| `/q-save` | Quick exit (minimal docs) |
| `/q-verify` | Verify files were created |
| `/q-commit` | Stage and commit changes |
| `/q-compact` | Free context safely |
| `/q-dump` | Create transcript manually |
| `/q-learnings` | Summarize session insights |
| `/q-pare` | Optimize CLAUDE.md size |
| `/q-prompts` | Save session prompts |
| `/q-setup-domain` | Configure for your project type |
| `/q-reconfigure-domain` | Update configuration |
| `/q-upgrade` | Upgrade to latest version |

Full reference: [docs/features.md](docs/features.md)

---

## Documentation

| Doc | Description |
|-----|-------------|
| [getting-started.md](getting-started.md) | Installation and setup |
| [docs/features.md](docs/features.md) | All commands and features |
| [docs/workflow.md](docs/workflow.md) | Daily workflow |
| [docs/context-management.md](docs/context-management.md) | Managing the 200K token limit |
| [CHANGELOG.md](CHANGELOG.md) | Version history |

---

## Repository Structure

```text
├── getting-started.md        <- Start here
├── CHANGELOG.md              <- Version history
├── templates/
│   ├── .claude/commands/     <- Slash command definitions (15 files)
│   ├── .q-system/            <- Q-System folder template
│   │   ├── docs/             <- Documentation (installed with commands)
│   │   ├── config.md         <- User preferences
│   │   └── README.md         <- Folder explanation
│   └── CLAUDE.md             <- Template for your CLAUDE.md
├── docs/                     <- Source documentation
│   ├── install/
│   ├── features.md
│   └── ...
└── .q-system/                <- Session files (for this repo)
```

---

## Want Expert Help?

This system is free and open source. Use it however you like.

If you want personalized support, we offer **VIP white-glove service**:

- Custom installation and configuration for your workflow
- Adaptation for any knowledge work domain (legal, research, writing, development)
- One-to-one coaching on getting the most from AI-assisted work

**[Learn more at the-ai-masters.com](https://the-ai-masters.com)**

---

## License

MIT — Free to use, modify, and distribute. No restrictions.

---

**Questions?** Open an issue at [github.com/contactTAM/q-command-system](https://github.com/contactTAM/q-command-system)
