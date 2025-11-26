# Windows Installation Guide

**Install Claude Code and Prerequisites on Windows**

This guide helps you install the tools needed to run your Personal AI Co-Pilot. After completing this guide, proceed to the [Quick Start Guide](../QUICK-START-GUIDE.md) to set up the Q-Command System.

**Time required:** 15-20 minutes
**Difficulty:** Beginner-friendly

**Status:** This guide needs testing on Windows. Please report any issues.

---

## What You're Installing

| Component | What It Does |
|-----------|--------------|
| **Claude Code** | The AI co-pilot that runs in your terminal |
| **VS Code** | The code editor where you'll work |
| **Git** | Version control (tracks your project history) |

---

## Before You Start

**You'll need:**
- Windows 10 or Windows 11
- A Claude Pro or Max subscription ($20/month at claude.ai)
- Internet connection
- Administrator access to your computer

**You do NOT need:**
- Any programming experience
- Any existing developer tools

---

## Step 1: Open PowerShell

PowerShell is Windows' command-line interface.

**How to open PowerShell:**
1. Press `Windows + X`
2. Click **"Windows Terminal"** or **"PowerShell"**

Or:
1. Press `Windows + S` (opens search)
2. Type: `PowerShell`
3. Press `Enter`

A blue or black window will open. This is PowerShell.

---

## Step 2: Install Claude Code

Copy and paste this command into PowerShell, then press `Enter`:

```powershell
irm https://claude.ai/install.ps1 | iex
```

**What happens:**
- Downloads Claude Code
- Installs it automatically
- You'll see progress messages

**When it's done**, you should see a success message.

> **Note:** If this command doesn't work, Claude Code may use a different Windows installer. Check https://claude.ai/download for the latest instructions.

---

## Step 3: Install VS Code

VS Code is the editor where you'll do your work. It's free and made by Microsoft.

**Option A: Download directly (easiest)**
1. Go to: https://code.visualstudio.com/
2. Click the big blue **"Download for Windows"** button
3. Run the downloaded installer
4. Follow the installation wizard (accept defaults)
5. Open VS Code from Start menu

**Option B: Install via PowerShell (if you have winget)**

```powershell
winget install Microsoft.VisualStudioCode
```

---

## Step 4: Install Git

**Option A: Download directly**
1. Go to: https://git-scm.com/download/win
2. Download the installer
3. Run the installer (accept defaults)
4. Restart PowerShell after installation

**Option B: Install via PowerShell (if you have winget)**

```powershell
winget install Git.Git
```

After installation, close and reopen PowerShell, then verify:
```powershell
git --version
```

You should see a version number like `git version 2.43.0`.

---

## Step 5: Authenticate Claude Code

Now let's connect Claude Code to your Claude account.

In PowerShell, type:
```powershell
claude
```

**What happens:**
1. Claude Code starts
2. Your web browser opens to Claude's login page
3. Sign in with your Claude Pro/Max account
4. Click "Authorize" when prompted
5. Return to PowerShell - you should see Claude Code is ready

**To exit Claude Code for now**, type:
```
/exit
```

---

## Verify Your Installation

Before continuing, run the verification checklist:

**[Go to: Verify Installation](verify-install.md)**

---

## Next Step

Once verified, proceed to set up the Q-Command System:

**[Go to: Quick Start Guide](../QUICK-START-GUIDE.md)**

---

## Troubleshooting

### "claude: command not recognized"

**Solution:** Close PowerShell completely and reopen it. The installation added Claude to your PATH, but PowerShell needs to restart to see it.

### PowerShell execution policy error

If you see an error about execution policy, run PowerShell as Administrator and execute:
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

Then try the install command again.

### Git asks for my name and email

Run these commands (use your own name and email):
```powershell
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```

### Claude Code authentication fails

1. Make sure you have a Claude Pro or Max subscription
2. Try logging out at claude.ai and logging back in
3. Run `claude` again in PowerShell

### VS Code doesn't recognize 'claude' in terminal

1. Close VS Code completely
2. Reopen VS Code
3. Open a new terminal (`Ctrl + ~`)

---

## Known Issues (Needs Testing)

This guide has not been fully tested on Windows. The following need verification:

- [ ] Claude Code installer URL/command for Windows
- [ ] Whether PowerShell or Command Prompt works better
- [ ] Windows-specific path issues
- [ ] WSL vs native Windows behavior

**Please report any issues to help improve this guide.**

---

## Support

If you run into any issues during setup, contact your AI Co-Pilot support.

---

**Next:** [Verify Installation](verify-install.md) | [Quick Start Guide](../QUICK-START-GUIDE.md)
