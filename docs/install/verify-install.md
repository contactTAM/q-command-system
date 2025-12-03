# Verify Your Installation

Confirm everything is working before setting up the Q-Command System.

**Version:** 1.0
**Last updated:** 2025-12-03
Part of **[The Q Marketplace](https://the-ai-masters.com/q-marketplace)**

**Time required:** 2-3 minutes

---

## Quick Verification Commands

Open your terminal (Terminal on Mac, PowerShell on Windows) and run these commands:

### 1. Check Claude Code

```bash
claude --version
```

**Expected:** Version number like `1.0.x` or similar

**If it fails:** Close and reopen your terminal, then try again. If still failing, re-run the Claude Code installer.

---

### 2. Check Git

```bash
git --version
```

**Expected:** Version number like `git version 2.39.0`

**If it fails:**
- **Mac:** Run `xcode-select --install`
- **Windows:** Download from https://git-scm.com/download/win

---

### 3. Check VS Code

```bash
code --version
```

**Expected:** Version number like `1.85.0`

**If it fails:** This is optional - VS Code might not be in your PATH. You can still open VS Code from Applications (Mac) or Start Menu (Windows).

---

### 4. Test Claude Code Authentication

```bash
claude
```

**Expected:** Claude Code starts and shows a prompt. If you see "Welcome" or a `>` prompt, you're authenticated.

**If it asks to authenticate:** Follow the browser prompts to log in with your Claude Pro/Max account.

**To exit:** Type `/exit`

---

## Verification Checklist

Before proceeding, confirm all items:

- [ ] `claude --version` shows a version number
- [ ] `git --version` shows a version number
- [ ] VS Code opens (from Applications or Start Menu)
- [ ] `claude` starts and you can interact with it
- [ ] You have a Claude Pro or Max subscription active

---

## Git Configuration (One-Time Setup)

If you haven't configured Git before, set your identity:

```bash
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```

Verify it worked:
```bash
git config --global --list
```

You should see your name and email listed.

---

## All Verified?

**Proceed to set up the Q-Command System:**

**[Quick Start Guide](../../getting-started.md)**

---

## Still Having Issues?

### Common Problems

| Problem | Solution |
|---------|----------|
| "command not found" | Close and reopen terminal |
| Authentication loop | Log out of claude.ai, clear browser cache, try again |
| Permission denied | Mac: prefix with `sudo`. Windows: run as Administrator |
| Slow installation | Check internet connection, try again |

### Get Help

If you're stuck, contact your AI Co-Pilot support with:
1. Which step failed
2. The exact error message
3. Your operating system (Mac/Windows version)

---

## Related

- **Mac Installation** — Install on macOS
- **Windows Installation** — Install on Windows
- **Quick Start Guide** — Set up the Q-Command System

---

## About This Guide

This guide is part of **[The Q Marketplace](https://the-ai-masters.com/q-marketplace)** — ready-to-use Claude Code companions for writers, founders, and creators.

- **Browse more Qs:** [the-ai-masters.com/q-marketplace](https://the-ai-masters.com/q-marketplace)
- **Custom Q for your workflow:** [the-ai-masters.com](https://the-ai-masters.com)
- **Q-System (open source):** [github.com/contactTAM/q-command-system](https://github.com/contactTAM/q-command-system)

---

**Previous:** [Mac Install](mac-install.md) | [Windows Install](windows-install.md)

**Next:** [Quick Start Guide](../../getting-started.md)
