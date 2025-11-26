# Daily Workflow

How to use Q-Command System in your daily work.

---

## Starting a Session

```
Q-BEGIN
```

Claude will:
1. Read your project context (CLAUDE.md)
2. Load your last session notes
3. Ask what you want to work on

---

## During Your Session

### Check status anytime

```
Q-STATUS
```

Shows: session state, context health, files created, recommendations.

### Save progress mid-session

```text
Q-CHECKPOINT
```

Creates a snapshot in `GeneratedMDs/checkpoints/`. Use this every 60-90 minutes for long sessions — protects against context limits.

### Check context usage

```text
/context
```

Shows visual grid of your context usage. Claude Code has ~200,000 tokens — when it fills up, it auto-compacts.

### Free up context safely

```text
Q-COMPACT
```

Saves a checkpoint first, then compacts. Use when `/context` shows 70%+ usage. See [context-management.md](context-management.md) for details.

---

## Ending a Session

### Standard end (recommended)

```
Q-END
```

Creates:
- Session transcript → `GeneratedMDs/transcripts/`
- Session notes → `GeneratedMDs/session-notes/`
- Git commit with all changes

### Quick end (when short on time)

```
Q-SAVE
```

Lighter version — just transcript and commit, skips detailed notes.

### Verify it worked

```
Q-VERIFY
```

Confirms files were created successfully.

---

## After Session Ends

Claude will remind you:

```
git push
```

You control when to push. Claude never pushes automatically.

---

## Command Quick Reference

| Command | When to use |
|---------|-------------|
| `Q-BEGIN` | Start of every session |
| `Q-STATUS` | Anytime — check progress |
| `Q-CHECKPOINT` | Every 60-90 min in long sessions |
| `Q-COMPACT` | When context is 70%+ full |
| `Q-END` | End of session (standard) |
| `Q-SAVE` | End of session (quick) |
| `Q-VERIFY` | After Q-END to confirm success |
| `/context` | Check context usage |

---

## File Naming

All files use this format:
```
YYYY-MM-DD-HHmm-[YourName].md
```

Example: `2025-11-26-0930-Gabriel.md`

This prevents conflicts when multiple people work the same day.

---

## Tips

1. **Always start with Q-BEGIN** — loads context from previous sessions
2. **Use Q-CHECKPOINT every 60-90 minutes** — insurance against context limits
3. **Check `/context` periodically** — know your context usage
4. **Use Q-COMPACT when above 70%** — safe way to free space
5. **End with Q-END, not just closing the window** — saves your work properly
6. **Run Q-VERIFY if unsure** — confirms everything saved

---

## Learn More

- [context-management.md](context-management.md) — Understanding the 200K token limit
