# Claude Code Tips and Tricks for Beginners

A quick reference to get more out of Claude Code.

**Version:** 1.0
**Last updated:** 2025-12-03
Part of **[The Q Marketplace](https://the-ai-masters.com/q-marketplace)**

---

## Beginner Tips

### 1. CLAUDE.md Is Your Control Panel

Every project can have a `CLAUDE.md` file. This is where you put persistent instructions that Claude follows every session.

**Examples of what to put there:**

- "Never push to git without asking first"
- "Use TypeScript for all new files"
- "Run tests before committing"

Claude reads this file at the start of every conversation. It's your way to customize behavior without repeating yourself.

---

### 2. The Context Window: Your Invisible Limit

Claude Code has a 200,000 token context window. Think of it as Claude's working memory.

**What happens when it fills up:**

- Claude starts forgetting earlier parts of the conversation
- Responses may become less coherent
- You'll need to compact or start fresh

**How to check your token count:**

Look at the right side of your status line — it shows your current token count (e.g., `52424 tokens`). This updates as you work.

This is a limitation of the tool. Once you understand it, you can work with it.

---

### 3. Permissions Mode: Speed vs. Safety

By default, Claude asks permission before running commands, editing files, etc. You can change this.

**"Bypass permissions" mode:**

- Claude acts without asking for approval each time
- Much faster workflow — no constant "approve/deny" clicks
- But: Claude can make changes you didn't intend

**My take:** Once you learn to trust it, it saves a lot of time. But it's your call.

**Caveat emptor:** Understand the power and the risk. Use git (see Git Quick Start) so you can always undo.

**How to toggle:** Use `shift+tab` to cycle through permission modes, or check `/config`.

---

### 4. Managing Your Context

When your context gets high, you need to compact. There are two options:

**`/compact` (built-in Claude Code command)**

- Shrinks the context window
- Claude summarizes the conversation and continues with less tokens
- Quick and simple

**`/q-compact` (Q-System command)**

- More powerful than /compact
- First saves a checkpoint (your work is protected)
- Then gives you optimized text to use with /compact
- Workflow: Run `/q-compact` first, then run `/compact` with the text it provides

**When to compact:** When you notice tokens getting high (check your status line), or before starting a complex new task in a long session.

---

### 5. Checkpoints for Long Sessions

For longer sessions, save checkpoints along the way.

**`/q-checkpoint`:**

- Saves a snapshot of your current progress
- Creates a record you can reference later
- Protects against context loss

Use checkpoints before major changes or when you've completed a significant piece of work.

---

### 6. Be Specific About Paths

Vague requests waste tokens:

- "Edit that file" → Claude has to search
- "Edit `src/utils/auth.ts`" → Claude goes straight there

Being specific saves context and time.

---

### 7. You Can Interrupt

If Claude is going the wrong direction, just say so.

- "Stop, that's not what I meant"
- "Wait, let me clarify"
- "Actually, let's try a different approach"

You don't have to wait for Claude to finish.

---

### 8. Git Is Your Safety Net

Claude makes mistakes. Commit frequently.

If something goes wrong:

- `git checkout .` — discard all changes
- `git stash` — save changes aside temporarily
- `git diff` — see what changed

See the **Git Quick Start for Beginners** for more.

---

## Advanced Tips

### 9. Terminal Output Gets Truncated

Long outputs (build logs, test results) get cut off at ~30,000 characters.

**If you need the full output:**

```bash
npm test > test-output.txt
```

Then ask Claude to read the file.

---

### 10. Background Tasks

Long-running processes (builds, servers) can run in the background.

Claude can start them, continue with other work, and check on them later. Useful for:

- Development servers
- Long test suites
- Build processes

---

## Quick Reference

| Situation | What to do |
|-----------|------------|
| Check token usage | Look at right side of status line |
| Context getting high | Run `/q-compact`, then `/compact` |
| Long session, want to save progress | Run `/q-checkpoint` |
| Claude going wrong direction | Just interrupt and redirect |
| Made a mistake | Use git to undo (`git checkout .`) |
| Want persistent instructions | Add to `CLAUDE.md` |
| Toggle permissions mode | `shift+tab` to cycle |

---

## Related

- **Git Quick Start for Beginners** — Essential git commands for working with Claude Code
- **Q Quick Start Guide** — Get started with any Q

---

## About This Guide

This guide is part of **[The Q Marketplace](https://the-ai-masters.com/q-marketplace)** — ready-to-use Claude Code companions for writers, founders, and creators.

- **Browse more Qs:** [the-ai-masters.com/q-marketplace](https://the-ai-masters.com/q-marketplace)
- **Custom Q for your workflow:** [the-ai-masters.com](https://the-ai-masters.com)
- **Q-System (open source):** [github.com/contactTAM/q-command-system](https://github.com/contactTAM/q-command-system)
