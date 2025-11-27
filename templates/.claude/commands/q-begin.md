---
description: Start session with context refresh
---

# Start Session

Execute the following steps to start a new work session:

## Step 1: Read Project Context

Read `CLAUDE.md` for project context and guidelines.

## Step 2: Find Last Session Notes

1. List files in `GeneratedMDs/session-notes/`
2. Find the most recent file (sort by date in filename)
3. Read that file to understand what was accomplished last session

## Step 3: Check Current Status

1. Run `git status` to see current state
2. Check for any uncommitted changes
3. Note any pending work

## Step 4: Present Summary

Display to user:

```
=== Session Started ===

Last session: [date from filename]
- [Key accomplishments from session notes]
- [Current status]

Git status: [clean/uncommitted changes]

What would you like to work on today?
```

## Step 5: Set Up Task Tracking

If user describes multi-step work, use TodoWrite to track tasks.

---

**Note:** If no previous session notes exist, skip Step 2 and mention this is the first session.
