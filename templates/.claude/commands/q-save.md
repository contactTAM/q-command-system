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

Create `.q-system/transcripts/${TIMESTAMP}-[Name].md` with lightweight content:

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

Transcript: .q-system/transcripts/[filename] (basic)
Git: Committed

Note: Skipped detailed session notes.
Run /q-verify to confirm what was saved.

Ready to push: git push
```

---

## When to Use /q-save

**Use /q-save when:**
- Context is critical (>90% usage) - monitoring shows `Context: ~90%+ - Use /q-save immediately`
- Need to exit immediately
- Already have checkpoints saved
- Simple session that doesn't need detailed notes

**The Q-SAVE vs Q-END trade-off at high context:**

| Command | Output | Risk at 90%+ |
|---------|--------|--------------|
| `/q-end` | Full documentation (800-1000 lines) | 30-40% failure rate |
| `/q-save` | Basic documentation (60-100 lines) | <5% failure rate |

**Key insight:** At 90%+ context, `/q-save` is safer. Basic saved data > risk of total loss.

**Trade-off:** Faster but less documentation than /q-end
