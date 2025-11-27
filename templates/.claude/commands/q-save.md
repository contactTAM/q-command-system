---
description: Quick exit with minimal documentation
---

# Quick Save

**Purpose:** Lightweight session wrap-up when time or context is limited.

## Step 1: Generate Timestamp

```bash
TIMESTAMP=$(date +"%Y-%m-%d-%H%M")
```

## Step 2: Create Basic Transcript

Create `GeneratedMDs/transcripts/${TIMESTAMP}-[Name].md` with lightweight content:

```markdown
# Session: [TIMESTAMP]

**Participant:** [Name]
**Type:** Quick save (abbreviated)

## Key Accomplishments

- [Bullet list of main work done]

## Files Changed

- [List of files created/modified]

## Status at Exit

[Brief current state]
```

Keep it short - focus on essentials only.

## Step 3: Commit Changes

1. Stage: `git add .`
2. Commit:
   ```
   Quick save: [brief summary]

   Co-Authored-By: Claude <noreply@anthropic.com>
   ```
3. Verify: `git status` shows clean

## Step 4: Report

```
Quick Save Complete!

Transcript: GeneratedMDs/transcripts/[filename] (basic)
Git: Committed

Note: Skipped detailed session notes.
Run /q-verify to confirm what was saved.

Ready to push: git push
```

---

**When to use:**
- Context critical (>90% usage)
- Need to exit immediately
- Already have checkpoints saved
- Simple session that doesn't need detailed notes

**Trade-off:** Faster but less documentation than /q-end
