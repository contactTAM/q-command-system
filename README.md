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

- **Session management** — Start, checkpoint, and end sessions with `Q-BEGIN`, `Q-CHECKPOINT`, `Q-END`
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

Then run `Q-SETUP-DOMAIN` to configure for your project.

That's it.

---

**[Full Setup Guide](getting-started.md)** — More details and manual installation options.

---

## Commands

| Command | Purpose |
|---------|---------|
| `Q-SETUP-DOMAIN` | Set up Q-Command System (run once) |
| `Q-BEGIN` | Start session |
| `Q-END` | End session, save everything |
| `Q-CHECKPOINT` | Save progress mid-session |
| `Q-COMPACT` | Free context safely (checkpoint + compact) |
| `Q-STATUS` | Check session state |
| `/context` | Check context usage |

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

```
├── getting-started.md       ← Start here
├── CHANGELOG.md             ← Version history
├── templates/               ← Files to copy to your projects
│   ├── SHORTCUTS.md         ← Q-command definitions
│   └── CLAUDE.md            ← Template for your CLAUDE.md
├── docs/                    ← Documentation
│   ├── install/             ← Platform installation guides
│   ├── commands-reference.md
│   └── ...
└── GeneratedMDs/            ← Session files (for this repo)
```

---

## License

MIT — Free to use, modify, and distribute. No restrictions.

---

**Questions?** Open an issue at [github.com/contactTAM/q-command-system](https://github.com/contactTAM/q-command-system)
