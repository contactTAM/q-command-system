# Q-Command System

A structured co-pilot framework for Claude Code.

**Free to use.** MIT License.

---

## Want Expert Help?

This system is free and open source. Use it however you like.

If you want personalized support, we offer **VIP white-glove service**:

- Custom installation and configuration for your workflow
- Adaptation for any knowledge work domain (legal, research, writing, development)
- One-to-one coaching on getting the most from AI-assisted work

**[Learn more at the-ai-masters.com](https://the-ai-masters.com)**

---

## What It Does

- **Session management** — Start, checkpoint, and end sessions with `/q-begin`, `/q-checkpoint`, `/q-end`
- **Automatic documentation** — Transcripts and session notes created automatically
- **Context protection** — Prevents losing work when conversation gets long
- **Multi-user support** — Team members work without file conflicts
- **Git integration** — Automatic commits, you control pushes

---

## Quick Start

Open Claude Code in your project folder and type:

```
Install Q-Command System from https://github.com/contactTAM/q-command-system
```

Then type `/q-begin` to start your first session.

That's it.

---

**[Full Setup Guide](getting-started.md)** — More details and manual installation options.

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

Full reference: [docs/commands-reference.md](docs/commands-reference.md)

---

## Documentation

| Doc | Description |
|-----|-------------|
| [getting-started.md](getting-started.md) | Installation and setup |
| [docs/commands-reference.md](docs/commands-reference.md) | All commands |
| [docs/workflow.md](docs/workflow.md) | Daily workflow |
| [docs/context-management.md](docs/context-management.md) | Managing the 200K token limit |
| [docs/features.md](docs/features.md) | Feature details |
| [CHANGELOG.md](CHANGELOG.md) | Version history |

---

## Repository Structure

```text
├── getting-started.md       <- Start here
├── CHANGELOG.md             <- Version history
├── templates/
│   ├── .claude/commands/    <- Slash command definitions
│   ├── SHORTCUTS.md         <- Command reference
│   └── CLAUDE.md            <- Template for your CLAUDE.md
├── docs/                    <- Documentation
│   ├── install/             <- Platform installation guides
│   ├── commands-reference.md
│   └── ...
└── GeneratedMDs/            <- Session files (for this repo)
```

---

## License

MIT — Free to use, modify, and distribute. No restrictions.

---

**Questions?** Open an issue at [github.com/contactTAM/q-command-system](https://github.com/contactTAM/q-command-system)
