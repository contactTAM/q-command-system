---
description: Show session state and recommendations
version: 2.1.2
---

# Session Status

**Purpose:** Display current session state, progress, and recommendations.

## Step 1: Gather Information

1. Check for checkpoint files from today: `ls .q-system/checkpoints/*$(date +%Y-%m-%d)* 2>/dev/null`
2. Check git status: `git status --short`
3. Count uncommitted files
4. Estimate session duration (if start time known)

## Step 2: Display Status

```
=== Session Status ===

Session: [Started time] ([X] hours [Y] minutes ago)
Participant: [Name]
Type: [Regular / Continued from auto-compact]

Progress:
- Accomplishments: [N] major items
- Files modified: [N]
- Key decisions: [N]

Checkpoints:
- Last checkpoint: [time] ([X] minutes ago)
- Location: .q-system/checkpoints/[filename]
[or "None yet"]

Git Status:
- Uncommitted changes: [Yes/No] ([N] files)
- Last commit: [message] ([time] ago)

Context Health:
- Estimated usage: ~[XX]%
- Status: [Healthy / Caution / Warning / Critical]
- Time since checkpoint: [X] minutes

Recommendations:
[Based on status, show relevant recommendations]
```

### Context Health Thresholds

| Usage | Status | Recommendation |
|-------|--------|----------------|
| 0-70% | Healthy | Continue normally |
| 70-85% | Caution | Consider /q-checkpoint soon |
| 85-90% | Warning | /q-checkpoint NOW |
| 90%+ | Critical | Use /q-save, /q-end may fail |

## Step 3: Recommendations Logic

Show relevant recommendations based on context and session state:

**Context-based (highest priority):**

- **If context 90%+:**
  "CRITICAL: Use /q-save immediately. /q-end may fail at this context level."

- **If context 85-90%:**
  "WARNING: /q-checkpoint recommended NOW. Consider wrapping up soon."

- **If context 70-85%:**
  "CAUTION: Consider /q-checkpoint after current task."

**Time-based:**

- **If no checkpoint and session > 60 min:**
  "Consider /q-checkpoint to preserve progress"

- **If last checkpoint > 90 min ago:**
  "Consider /q-checkpoint (last one was [X] minutes ago)"

- **If session > 2 hours:**
  "Long session - consider wrapping up with /q-end soon"

**Git-based:**

- **If uncommitted changes:**
  "You have uncommitted changes - remember to commit"

**Session-based:**

- **If continued session:**
  "Remember: Document ALL work including from before auto-compact"

## Step 4: Show Next Steps

If TodoWrite has pending tasks, show them:
```
Pending Tasks:
- [ ] Task 1
- [ ] Task 2
```

Or: "No pending tasks tracked"

---

**Tip:** Run `/q-status` periodically in long sessions to stay aware of context health.
