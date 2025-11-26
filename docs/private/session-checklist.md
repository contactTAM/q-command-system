# Session Checklist

A quick reference for working with the Q-Command System.

**Last Updated:** 2025-11-26
**Version:** 1.0 (Matches SHORTCUTS v1.0)

---

## Quick Reference

| Command | What it does |
|---------|--------------|
| `Q-BEGIN` | Start session, load context |
| `Q-END` | End session, save everything |
| `Q-CHECKPOINT` | Save progress mid-session |
| `Q-COMPACT` | Free context safely (checkpoint + compact) |
| `Q-SAVE` | Quick exit (transcript + commit only) |
| `Q-STATUS` | Check session state |
| `Q-VERIFY` | Confirm saves worked |
| `/context` | Check context usage |

---

## Starting a Session

Type `Q-BEGIN` and Claude will:
1. Read CLAUDE.md for project context
2. Load your last session notes
3. Summarize what was accomplished
4. Ask what you want to work on

---

## During Your Session

### Regular checkpoints

Every 60-90 minutes, run `Q-CHECKPOINT` to save progress.

### Monitor context

Run `/context` to check usage. If above 70%, run `Q-COMPACT`.

### Check status

Run `Q-STATUS` to see:
- What you've accomplished
- Files changed
- Context health
- Time since last checkpoint

---

## Managing Context

Claude Code has a ~200,000 token limit. As you work, it fills up.

**Warning signs:**
- Claude's responses slow down
- Claude forgets things from earlier
- Working 2+ hours without checkpoint

**What to do:**
1. Run `/context` to check usage
2. If above 70%, run `Q-COMPACT`
3. Continue with fresh context

**Q-COMPACT is safe because:**
- Saves checkpoint first (your progress)
- Then compacts (frees space)
- Q-END merges everything later

See [context-management.md](../docs/context-management.md) for details.

---

## Ending a Session

### Normal exit: Q-END

Type `Q-END` and Claude will:
1. Create transcript in `GeneratedMDs/transcripts/`
2. Create session notes in `GeneratedMDs/session-notes/`
3. Merge any checkpoints with final work
4. Commit all changes
5. Remind you to `git push` when ready

### Quick exit: Q-SAVE

Use when context is very high (>90%) or you need to exit fast.

Type `Q-SAVE` and Claude will:
1. Create transcript only (no detailed notes)
2. Commit all changes

### Verify it worked

Run `Q-VERIFY` after Q-END or Q-SAVE to confirm files were created.

---

## File Naming

All session files use: `YYYY-MM-DD-HHmm-[PersonName].md`

Example: `2025-11-26-0913-Gabriel.md`

**Directory structure:**
```
GeneratedMDs/
  transcripts/      ← Full session transcripts
  session-notes/    ← Session summaries
  checkpoints/      ← Mid-session snapshots
  SHORTCUTS.md      ← Command specifications
```

---

## Troubleshooting

**Q-END didn't create files?**
- Run `Q-VERIFY` to check what exists
- Use `Q-DUMP` to create transcript manually

**Context getting full?**
- Run `Q-CHECKPOINT` now
- If >90%, use `Q-SAVE` for quick exit

**Can't find last session notes?**
- Check `GeneratedMDs/session-notes/`
- Look for files with your name: `*-YourName.md`

**Commands not recognized?**
- Make sure Claude read SHORTCUTS.md
- Check `GeneratedMDs/SHORTCUTS.md` exists

---

## Git Push Policy

Claude will NEVER push automatically. You control when code goes to GitHub.

After `Q-END` or `Q-SAVE`:
1. Review with `git status` and `git log -1`
2. When ready: `git push`

---

## Version History

**v1.0 (2025-11-26):**
- First public release
- Q-COMPACT for safe context management
- Simplified format
- Context management section

**v0.2 (2025-11-17):**
- Per-person-per-session file naming
- New directory structure
- Added Q-SAVE, Q-VERIFY, Q-STATUS

**v0.1 (2025-11-13):**
- Initial development version
