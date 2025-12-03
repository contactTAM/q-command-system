# Git Quick Start for Beginners

Essential git commands for working with Claude Code.

**Version:** 1.0
**Last updated:** 2025-12-03
Part of **[The Q Marketplace](https://the-ai-masters.com/q-marketplace)**

---

## Why Git Matters with Claude Code

Claude Code edits your files directly. Git is your safety net:

- See what changed
- Undo mistakes
- Save your progress

If you're not using git, start now.

---

## Getting Started

### What Is Git?

Git tracks changes to your files. Think of it as "save points" for your code.

**Two parts to understand:**

1. **Local** — Git runs on your computer. All your save points (commits) are stored locally.
2. **Remote** — Optionally, you can connect to a cloud service (GitHub, GitLab, etc.) to back up your code and collaborate with others.

You don't need a remote to use git. Local-only git still gives you undo power.

### Starting a New Git Repository

If your project doesn't have git yet:

```bash
cd your-project-folder
git init
```

That's it. Git is now tracking this folder.

### Checking If Git Is Already Set Up

```bash
git status
```

If you see info about your files, git is working. If you see "not a git repository," run `git init`.

---

## The Essentials

### See What's Happening

```bash
git status
```

Shows:

- What files changed
- What's ready to commit
- What's not tracked

Run this often. It's your dashboard.

---

### See What Changed

```bash
git diff
```

Shows the actual changes, line by line.

```bash
git diff path/to/file.ts
```

Shows changes for one specific file.

---

### Save Your Work (Commit)

**Step 1: Stage the changes**

```bash
git add .
```

(The `.` means "everything that changed")

Or stage specific files:

```bash
git add src/utils/auth.ts
```

**Step 2: Commit with a message**

```bash
git commit -m "Add user authentication"
```

**Pro tip:** Commit frequently. Small commits are easier to undo.

---

### Undo Mistakes

**Discard all uncommitted changes:**

```bash
git checkout .
```

Goes back to your last commit. Everything Claude changed is gone.

**Discard changes to one file:**

```bash
git checkout path/to/file.ts
```

**Save changes aside temporarily:**

```bash
git stash
```

Get them back later:

```bash
git stash pop
```

---

### See History

```bash
git log --oneline
```

Shows recent commits, one per line. Useful to see what happened.

```bash
git log --oneline -5
```

Shows only the last 5 commits.

---

## Quick Reference

| I want to... | Command |
|--------------|---------|
| Start git in a folder | `git init` |
| See what changed | `git status` |
| See the actual changes | `git diff` |
| Save my work | `git add .` then `git commit -m "message"` |
| Undo everything since last commit | `git checkout .` |
| Undo one file | `git checkout path/to/file` |
| Save changes aside temporarily | `git stash` |
| Get stashed changes back | `git stash pop` |
| See recent commits | `git log --oneline` |

---

## The Workflow

1. **Before Claude works:** Make sure you have a clean commit
2. **While Claude works:** Let it do its thing
3. **After Claude finishes:** Run `git status` and `git diff` to review
4. **If it looks good:** `git add .` and `git commit`
5. **If something went wrong:** `git checkout .` to undo

---

## Common Situations

### "Claude broke something"

```bash
git checkout .
```

Undoes all changes since your last commit.

### "I want to see what Claude changed before committing"

```bash
git diff
```

### "I want to save this before trying something risky"

```bash
git add . && git commit -m "Checkpoint before refactor"
```

### "I want to undo just one file Claude edited"

```bash
git checkout src/components/Header.tsx
```

---

## Advanced: Branches

Branches let you work on something without affecting your main code.

### Create a new branch

```bash
git checkout -b my-feature
```

### Switch between branches

```bash
git checkout main
git checkout my-feature
```

### See all branches

```bash
git branch
```

**When to use branches:** When you're trying something experimental and want to keep your main code safe.

---

## Advanced: Connecting to a Remote

A remote is a cloud copy of your repository (GitHub, GitLab, Bitbucket, etc.).

**Why use a remote:**

- Backup your code
- Access it from other machines
- Collaborate with others

### Connect to an existing remote

If you created a repo on GitHub:

```bash
git remote add origin https://github.com/yourusername/your-repo.git
```

### Push your code to the remote

```bash
git push -u origin main
```

After the first push, just use:

```bash
git push
```

### Pull changes from the remote

```bash
git pull
```

**Note:** You can use git entirely locally without ever connecting to a remote. The remote is optional.

---

## How Q-System Uses Git

The Q-System integrates with git to help track your work.

### What `/q-end` does with git

When you run `/q-end` to finish a session:

1. It creates session notes documenting what you did
2. **If you have a git repo:** It commits your changes automatically
3. **It does NOT push to remote** — that's your choice

This means your work is saved locally, but you control when (and if) it goes to the cloud.

### What `/q-checkpoint` does with git

When you run `/q-checkpoint`:

1. It saves a snapshot of your progress
2. **If you have a git repo:** It may commit the checkpoint
3. **It does NOT push to remote**

### Why no automatic push?

Pushing is a deliberate action. The Q-System respects that:

- You might not have a remote set up
- You might want to review before pushing
- You might be working on something not ready to share

When you're ready to push, do it manually:

```bash
git push
```

---

## Learn More

This guide covers the basics. Git has much more to offer:

- **Interactive tutorials:** [learngitbranching.js.org](https://learngitbranching.js.org)
- **Official documentation:** [git-scm.com/doc](https://git-scm.com/doc)
- **GitHub's guide:** [docs.github.com/en/get-started](https://docs.github.com/en/get-started)

---

## Related

- **Claude Code Tips and Tricks** — Get more out of Claude Code
- **Q Quick Start Guide** — Get started with any Q

---

## About This Guide

This guide is part of **[The Q Marketplace](https://the-ai-masters.com/q-marketplace)** — ready-to-use Claude Code companions for writers, founders, and creators.

- **Browse more Qs:** [the-ai-masters.com/q-marketplace](https://the-ai-masters.com/q-marketplace)
- **Custom Q for your workflow:** [the-ai-masters.com](https://the-ai-masters.com)
- **Q-System (open source):** [github.com/contactTAM/q-command-system](https://github.com/contactTAM/q-command-system)
