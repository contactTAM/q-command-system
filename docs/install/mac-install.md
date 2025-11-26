# Mac Installation Guide

**Install Claude Code and Prerequisites on macOS**

This guide helps you install the tools needed to run your Personal AI Co-Pilot. After completing this guide, proceed to the [Quick Start Guide](../QUICK-START-GUIDE.md) to set up the Q-Command System.

**Time required:** 10-15 minutes
**Difficulty:** Beginner-friendly

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
- A Mac running macOS 10.15 or newer
- A Claude Pro or Max subscription ($20/month at claude.ai)
- Internet connection

**You do NOT need:**
- Any programming experience
- Any existing developer tools

---

## Step 1: Open Terminal

Terminal is an app that lets you type commands to your Mac.

**How to open Terminal:**
1. Press `Cmd + Space` (opens Spotlight search)
2. Type: `Terminal`
3. Press `Enter`

A window with a white or black background will open. This is Terminal.

> **Tip:** You can make the text bigger with `Cmd + Plus (+)`

---

## Step 2: Install Claude Code

Copy and paste this entire line into Terminal, then press `Enter`:

```bash
curl -fsSL https://claude.ai/install.sh | bash
```

**What happens:**
- Downloads Claude Code (takes 1-2 minutes)
- Installs it automatically
- You'll see progress messages

**When it's done**, you should see a success message.

---

## Step 3: Install VS Code

VS Code is the editor where you'll do your work. It's free and made by Microsoft.

**Option A: Download directly (easiest)**
1. Go to: https://code.visualstudio.com/
2. Click the big blue **"Download for Mac"** button
3. Open the downloaded file (it's in your Downloads folder)
4. Drag "Visual Studio Code" to your Applications folder
5. Open VS Code from Applications

**Option B: Install via Terminal**

Copy and paste this into Terminal:
```bash
curl -L "https://code.visualstudio.com/sha/download?build=stable&os=darwin-universal" -o ~/Downloads/VSCode.zip && unzip -q ~/Downloads/VSCode.zip -d /Applications && rm ~/Downloads/VSCode.zip
```

---

## Step 4: Check Git Installation

Git is usually pre-installed on Mac. Let's verify.

In Terminal, type:
```bash
git --version
```

**If you see a version number** (like `git version 2.39.0`): You're good! Skip to Step 5.

**If you see a popup asking to install "command line developer tools"**:
1. Click **"Install"**
2. Wait for installation to complete (5-10 minutes)
3. Try `git --version` again

**If you see "command not found"**:
Run this command to install Git:
```bash
xcode-select --install
```
Then follow the popup instructions.

---

## Step 5: Authenticate Claude Code

Now let's connect Claude Code to your Claude account.

In Terminal, type:
```bash
claude
```

**What happens:**
1. Claude Code starts
2. Your web browser opens to Claude's login page
3. Sign in with your Claude Pro/Max account
4. Click "Authorize" when prompted
5. Return to Terminal - you should see Claude Code is ready

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

### "claude: command not found"

**Solution:** Close Terminal completely and reopen it. The installation added Claude to your PATH, but Terminal needs to restart to see it.

### VS Code terminal doesn't recognize 'claude'

**Solution:** Close VS Code completely and reopen it. Or in VS Code terminal, run:
```bash
source ~/.zshrc
```

### Git asks for my name and email

Run these commands (use your own name and email):
```bash
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```

### "Permission denied" errors

If you see permission errors, try adding `sudo` before the command:
```bash
sudo <the command that failed>
```
You'll need to enter your Mac password.

### Claude Code authentication fails

1. Make sure you have a Claude Pro or Max subscription
2. Try logging out at claude.ai and logging back in
3. Run `claude` again in Terminal

---

## Support

If you run into any issues during setup, contact your AI Co-Pilot support.

---

**Next:** [Verify Installation](verify-install.md) | [Quick Start Guide](../QUICK-START-GUIDE.md)
