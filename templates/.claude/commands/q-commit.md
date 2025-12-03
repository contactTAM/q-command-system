---
description: Stage and commit all changes
version: 2.1.2
---

# Commit Changes

**Purpose:** Stage and commit all changes to local git.

## Step 1: Save All Changes

Ensure all file changes are saved.

## Step 2: Check Status

```bash
git status
```

Show what will be committed. If nothing to commit, report and stop.

## Step 3: Stage Changes

```bash
git add .
```

## Step 4: Create Commit

Commit with descriptive message:

```bash
git commit -m "Brief summary of changes

- Point 1: description
- Point 2: description
- Point 3: description

Co-Authored-By: Claude <noreply@anthropic.com>"
```

**Message guidelines:**
- First line: Brief summary (50 chars or less)
- Blank line
- Bullet points of specific changes
- Co-author attribution

## Step 5: Verify

```bash
git status
```

Should show: "nothing to commit, working tree clean"

## Step 6: Report

```
Committed: [hash]

[Full commit message]

Working tree clean. Ready to push when you're ready: git push
```

---

**Important:** This command NEVER pushes to remote. User controls when to push.

**When to use:**
- Mid-session to save work in progress
- As part of /q-end workflow
- After completing a logical unit of work
- Before switching to different task
