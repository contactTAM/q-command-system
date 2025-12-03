# Q Quick Start Guide

You just got a Q. Claude Code is open. Now what?

This guide gets you started in 5 minutes.

**Version:** 1.0
**Last updated:** 2025-12-03
Part of **[The Q Marketplace](https://the-ai-masters.com/q-marketplace)**

---

## What is a Q?

A Q is a **Claude Code companion with memory and a methodology**.

- **Memory:** It remembers your project across sessions
- **Methodology:** It knows how to guide you through a specific type of work

Unlike regular Claude Code, a Q doesn't start fresh every time. It picks up where you left off.

> This guide uses q-teach-anything as the example, but everything here applies to any Q.

---

## The Core Loop

Every Q session follows the same pattern:

```
/q-begin  →  work  →  /q-end
```

| Command | What it does |
|---------|--------------|
| `/q-begin` | Q reads your project files and remembers where you left off |
| *(work)* | You talk naturally, Q guides you |
| `/q-end` | Q saves your progress for next time |

That's it. Start, work, end.

---

## Your First Session

### Step 1: Just say what you want to do

Don't overthink it. Type something like:

> "I want to create a workshop on Python basics"

or

> "Help me build a presentation about our new product"

The Q will take it from there.

### Step 2: Answer the Q's questions

The Q will ask you things like:
- Who's your audience?
- What format are you creating?
- What should they be able to do after?

These questions aren't busywork — they shape the work that follows.

### Step 3: Work naturally

Once the Q understands your project, you'll work together:
- It suggests structure
- You provide content and decisions
- It drafts, you refine

### Example exchange:

```
You: I want to create teaching materials for API design

Q: Great topic. A few questions to get started:
   - Who's your audience? Developers? What level?
   - What format? Workshop? Document? Presentation?
   - How long is the teaching experience?

You: Senior developers, a 2-hour workshop, hands-on with exercises

Q: Got it. What are the 3-5 key concepts they need to walk away with?

You: REST principles, error handling, versioning, documentation

Q: Let me draft a skeleton for the workshop...
```

### You can't do it wrong

Seriously. Just talk. If the Q needs something different, it'll ask.

---

## Where Stuff Lives

Your Q has a file structure. You don't need to manage it manually — the Q handles it — but it helps to know what's there:

| File/Folder | What it is |
|-------------|------------|
| `CLAUDE.md` | The Q's "brain" — how it thinks and behaves |
| `my-teaching/` | Your project files (name varies by Q) |
| `project.md` | Definition of what you're creating |
| `session-log.md` | Progress tracking across sessions |
| `materials/` | Your outputs (drafts, final materials) |

**Pro tip:** You can read these files anytime to see your progress.

---

## When You're Stuck

### Option 1: Just say so

> "I'm stuck"
> "What should I do next?"
> "I don't know how to answer that question"

The Q will help you move forward.

### Option 2: Check your status

Type `/q-status` to see:
- Where you are in the process
- What's been completed
- What's next

### Option 3: Save and come back later

If you need to step away mid-session:

```
/q-checkpoint
```

This saves your progress without fully closing the session.

---

## Tips

**Trust the questions.** The Q asks things for a reason. The answers shape better output.

**You can always come back.** Memory persists. Take a break, close the window, come back tomorrow — `/q-begin` picks up where you left off.

**One project at a time.** Each Q instance is one project. For a new project, start a fresh Q.

**Read the CLAUDE.md if curious.** It's not secret — it's how the Q thinks. Reading it helps you understand what to expect.

---

## Quick Reference

| Command | When to use it |
|---------|----------------|
| `/q-begin` | Start of every session |
| `/q-end` | End of every session |
| `/q-status` | When you want to see where you are |
| `/q-checkpoint` | Mid-session save (optional) |

---

## You're Ready

That's everything you need to start.

Open your Q, type `/q-begin`, and tell it what you want to create.

The Q takes it from there.

---

## Related

- **Claude Code Tips and Tricks** — Get more out of Claude Code
- **Git Quick Start for Beginners** — Essential git commands

---

## About This Guide

This guide is part of **[The Q Marketplace](https://the-ai-masters.com/q-marketplace)** — ready-to-use Claude Code companions for writers, founders, and creators.

- **Browse more Qs:** [the-ai-masters.com/q-marketplace](https://the-ai-masters.com/q-marketplace)
- **Custom Q for your workflow:** [the-ai-masters.com](https://the-ai-masters.com)
- **Q-System (open source):** [github.com/contactTAM/q-command-system](https://github.com/contactTAM/q-command-system)
