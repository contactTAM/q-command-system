# Mac Installation Guide

**Your AI Co-Pilot System - Complete Setup**

This guide will help you set up your complete AI co-pilot environment on Mac. No technical experience required - just follow each step.

**Time required:** 15-20 minutes
**Difficulty:** Beginner-friendly

---

## What You're Installing

| Component | What It Does |
|-----------|--------------|
| **Claude Code** | The AI co-pilot that runs in your terminal |
| **VS Code** | The editor where you'll work with your co-pilot |
| **Git** | Version control (tracks your project history) |
| **Q-Command System** | The session management system that makes Claude remember everything |

---

## Before You Start

**You'll need:**
- [ ] A Mac running macOS 10.15 or newer
- [ ] A Claude Pro or Max subscription ($20/month at claude.ai)
- [ ] Internet connection
- [ ] About 20 minutes

**You do NOT need:**
- Any programming experience
- Any existing developer tools
- To understand what a "terminal" is (we'll explain)

---

## Step 1: Open Terminal

Terminal is an app that lets you type commands to your Mac. Don't worry - we'll tell you exactly what to type.

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

**To verify it worked**, type this and press `Enter`:
```bash
claude --version
```

You should see a version number like `1.0.x`. If you see "command not found", close Terminal and open it again, then try the command once more.

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

Then open VS Code from your Applications folder.

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

## Step 6: Set Up Your First Project

Now let's create a project folder and install the Q-Command System.

### 6.1 Create a project folder

In Terminal, run these commands one at a time:

```bash
mkdir -p ~/Projects/my-first-copilot
```

```bash
cd ~/Projects/my-first-copilot
```

```bash
git init
```

You now have a project folder with Git tracking.

### 6.2 Download Q-Command System files

Run this command to download the Q-Command System:

```bash
git clone https://github.com/contactTAM/q-command-system.git ~/q-command-system-temp
```

### 6.3 Set up Q-Command System in your project

Run these commands one at a time:

```bash
mkdir -p GeneratedMDs/transcripts GeneratedMDs/session-notes GeneratedMDs/checkpoints
```

```bash
cp ~/q-command-system-temp/templates/SHORTCUTS.md GeneratedMDs/
```

```bash
cp ~/q-command-system-temp/templates/SESSION-CHECKLIST.md .
```

```bash
cp ~/q-command-system-temp/templates/CLAUDE.md .
```

### 6.4 Clean up

```bash
rm -rf ~/q-command-system-temp
```

---

## Step 7: Open Your Project in VS Code

### 7.1 Open VS Code

1. Open VS Code from your Applications folder
2. Click **File → Open Folder**
3. Navigate to your home folder → Projects → my-first-copilot
4. Click **Open**

### 7.2 Open the integrated terminal

1. In VS Code, click **View → Terminal** (or press `` Ctrl + ` ``)
2. A terminal panel opens at the bottom of VS Code

This is where you'll interact with Claude Code.

---

## Step 8: Start Your First Session

In the VS Code terminal, type:

```bash
claude
```

Claude Code starts. Now type:

```
Q-BEGIN
```

**What happens:**
- Claude reads your project context (CLAUDE.md)
- Claude looks for previous session notes (none yet)
- Claude asks: "What would you like to work on today?"

**Congratulations!** Your AI co-pilot system is ready.

---

## Step 9: Customize Your Setup

Open `CLAUDE.md` in VS Code and customize:

1. **Replace `[PROJECT_OWNER_NAME]`** with your name
2. **Add your project description** at the top
3. **Add your team members** if working with others

Open `GeneratedMDs/SHORTCUTS.md` and find line 17:
- Replace the example names with your name (and team members if any)

Save both files.

---

## Quick Reference

### Starting a session
```
Q-BEGIN
```

### Ending a session
```
Q-END
```

### Saving progress mid-session
```
Q-CHECKPOINT
```

### Checking session status
```
Q-STATUS
```

### Quick exit (when low on time)
```
Q-SAVE
```

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

### Q-BEGIN doesn't work

Make sure you're in the right folder (your project folder) and that `CLAUDE.md` and `GeneratedMDs/SHORTCUTS.md` exist.

---

## What's Next?

### Customize for your work

Your AI co-pilot becomes more powerful when configured for YOUR specific work:

- Add project context to `CLAUDE.md`
- Create custom Q-commands in `SHORTCUTS.md`
- Add skills and agents for your domain

### Learn the workflow

1. Always start sessions with `Q-BEGIN`
2. Use `Q-CHECKPOINT` during long sessions
3. Always end with `Q-END` or `Q-SAVE`
4. Your co-pilot remembers everything between sessions

### Get help

- Check `SESSION-CHECKLIST.md` for the complete workflow
- Read `docs/COMMANDS-REFERENCE.md` for all commands
- Your support contact: [TO BE FILLED IN]

---

## Installation Checklist

Before you finish, verify everything is working:

- [ ] `claude --version` shows a version number
- [ ] VS Code opens and you can see your project files
- [ ] `git --version` shows a version number
- [ ] `claude` starts and you're authenticated
- [ ] `Q-BEGIN` works and Claude responds
- [ ] `CLAUDE.md` is customized with your name
- [ ] `GeneratedMDs/SHORTCUTS.md` has your name

**All checked?** You're ready to work with your AI co-pilot!

---

## Support

If you run into any issues during setup, contact:

**[Your support contact information here]**

We're here to help you get up and running.

---

**Welcome to your new AI co-pilot system!**
