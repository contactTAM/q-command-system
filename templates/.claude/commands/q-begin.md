---
description: Start session with context refresh
version: 2.1.2
---

# Start Session

**Purpose:** Initialize a new work session with full context refresh.

---

## MANDATORY PRE-FLIGHT CHECKLIST

**STOP. Before proceeding, confirm:**

- [ ] 1. I will execute ALL 5 steps in order
- [ ] 2. I will NOT skip reading session notes
- [ ] 3. I will report findings to user before asking what to work on

---

## Step 1: Read Project Context

**EXECUTE:**

```bash
cat CLAUDE.md 2>/dev/null || echo "No CLAUDE.md found"
```

- [ ] Read CLAUDE.md completely
- [ ] Note key policies (especially git push policy)
- [ ] Note team members if listed
- [ ] Note project status

**If CLAUDE.md not found:** Note this - it's okay to continue, but suggest running `/q-setup`.

---

## Step 2: MANDATORY - Find and Read Last Session Notes

### 2.1 List Session Notes

```bash
ls -la .q-system/session-notes/ 2>/dev/null | tail -5 || echo "No session notes found"
```

- [ ] Command executed
- [ ] Identified most recent file

### 2.2 Read Last Session Notes

**If session notes exist:**

```bash
# Read the most recent session notes file
cat .q-system/session-notes/[MOST_RECENT_FILE]
```

- [ ] File read completely
- [ ] Noted key accomplishments
- [ ] Noted pending "Next Actions"
- [ ] Noted any blockers or issues

**VERIFICATION GATE 1:**
```
Last session notes: [filename or "none found"]
Key items from last session:
- Accomplishments: [list or "N/A"]
- Pending actions: [list or "N/A"]
```

**If no session notes exist:** This is the first session - note this for the summary.

---

## Step 3: Check Current Repository Status

### 3.1 Git Status

```bash
git status
```

- [ ] Command executed
- [ ] Noted if working tree is clean or dirty
- [ ] Noted any uncommitted changes

### 3.2 Check for Uncommitted Session Work

```bash
git diff --stat HEAD 2>/dev/null || echo "No git history"
```

- [ ] Identified any uncommitted changes

### 3.3 Check for Orphaned Checkpoints

```bash
ls -la .q-system/checkpoints/ 2>/dev/null | tail -3 || echo "No checkpoints"
```

- [ ] Noted any checkpoints from previous sessions that weren't incorporated

**VERIFICATION GATE 2:**
```
Repository status:
- Git: [clean/dirty with N uncommitted changes]
- Orphaned checkpoints: [list or "none"]
```

---

## Step 4: Present Summary to User

**MANDATORY output format:**

```
=== Session Started ===

Project: [name from CLAUDE.md or "Unknown"]
Participant: [name if known or "TBD"]

Last session: [date from filename or "First session"]
- [Key accomplishment 1]
- [Key accomplishment 2]
- [Pending action from last session]

Current status:
- Git: [clean/dirty]
- Uncommitted work: [yes/no]
- Checkpoints to review: [N or "none"]

What would you like to work on today?

---
Part of The Q Marketplace: the-ai-masters.com/q-marketplace
```

- [ ] Summary displayed to user
- [ ] Waited for user response

---

## Step 5: Initialize Task Tracking

**After user describes their goals:**

- [ ] If multi-step work: Use TodoWrite to create task list
- [ ] If single task: Proceed directly
- [ ] Note participant name for session files

---

## Error Handling

**If session notes unreadable:**
- Report the error
- Continue with session start
- Note this is a fresh start

**If git status fails:**
- Report the error
- Continue without git status
- Warn user to check repository state

---

## FINAL CHECKLIST

Before asking "What would you like to work on today?":

- [ ] CLAUDE.md read (or noted as missing)
- [ ] Last session notes read (or noted as first session)
- [ ] Git status checked
- [ ] Summary presented to user

**If any item is unchecked, go back and complete it.**
