# Getting Started

Get the Q-Command System running in your project.

---

## Step 1: Install Prerequisites

You need Claude Code, VS Code, and Git installed first.

| Platform | Guide |
|----------|-------|
| Mac | [docs/install/mac-install.md](docs/install/mac-install.md) |
| Windows | [docs/install/windows-install.md](docs/install/windows-install.md) |

Already have them? [Verify your installation](docs/install/verify-install.md).

---

## Step 2: Add Q-Command System to Your Project

In your project folder:

```bash
# Create the required folder
mkdir -p GeneratedMDs

# Copy the Q-Command System (adjust path as needed)
cp /path/to/Q-command-system/templates/SHORTCUTS.md ./GeneratedMDs/
```

---

## Step 3: Run Setup

Open Claude Code in your project folder:

```bash
claude
```

Then tell Claude:

```text
I have SHORTCUTS.md at GeneratedMDs/SHORTCUTS.md.
Please read it and run Q-SETUP-DOMAIN to set up this repository.
```

Answer 7 questions about your project. Done!

---

## Step 4: Start Working

Begin every session with:

```text
Q-BEGIN
```

End every session with:

```text
Q-END
```

That's it. The system handles documentation, commits, and context automatically.

---

## Quick Reference

| Command | What it does |
|---------|--------------|
| `Q-BEGIN` | Start session, load context |
| `Q-END` | End session, save everything |
| `Q-CHECKPOINT` | Save progress mid-session |
| `Q-COMPACT` | Free context safely (checkpoint + compact) |
| `Q-STATUS` | Check session state |
| `/context` | Check context usage |

Full command list: [docs/commands-reference.md](docs/commands-reference.md)

---

## Learn More

- [How it works](docs/architecture.md)
- [All features](docs/features.md)
- [Daily workflow](docs/workflow.md)
- [Detailed setup options](docs/setup.md)

---

## Troubleshooting

**"Q-SETUP-DOMAIN not recognized"**
Make sure Claude read SHORTCUTS.md first. Tell Claude where it is.

**Commands not working?**
Check that `GeneratedMDs/SHORTCUTS.md` exists in your project.

**Need more help?**
See [docs/setup.md](docs/setup.md) for detailed instructions.
