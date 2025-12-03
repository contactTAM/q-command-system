---
description: Safely free context space (checkpoint + compact)
version: 2.1.2
---

# Safe Compact

**Purpose:** Free up context space by saving a checkpoint first, then compacting. Protects your work while giving more room to continue.

## Why Use /q-compact Instead of /compact Directly

- `/compact` alone summarizes and loses detail
- `/q-compact` saves a checkpoint FIRST, then compacts
- Your detailed work history is preserved in the checkpoint file
- You get more context space AND keep your work safe

## Step 1: Create Checkpoint

Execute `/q-checkpoint` to save current progress.

Wait for confirmation that checkpoint was saved.

## Step 2: Run Compact

Tell the user:

```
Checkpoint saved. Now run this command:

/compact Preserve: key decisions, files changed, current task status. This is a /q-compact operation - checkpoint already saved.
```

Or if you can execute /compact directly, do so with that prompt.

## Step 3: Report Results

```
/q-compact complete!

Checkpoint saved: .q-system/checkpoints/[filename]
Context compacted: More space available

Your detailed work is preserved in the checkpoint.
/q-end will merge checkpoint + remaining work into complete session notes.

Tip: Run /context to see your new context usage.
```

---

**When to use:**
- Context usage above 70%
- After /context shows high usage
- Before starting a large new task
- When Claude's responses are getting slower

**Example workflow:**
```
[Working for 90 minutes, context getting full]
User: /context              → Shows 75% usage
User: /q-compact            → Saves checkpoint, then compacts
                            → Now at ~30% usage
[Continue working with fresh context]
User: /q-end                → Merges checkpoint + new work
```
