# Context Management

Claude Code has a ~200,000 token context limit. This guide explains how to monitor and manage it.

---

## Quick Reference

| Command | What it does |
|---------|--------------|
| `/context` | Show current context usage (visual) |
| `/usage` | Show plan usage and rate limits |
| `Q-STATUS` | Show session state including context health |
| `Q-CHECKPOINT` | Save progress to file (insurance) |
| `Q-COMPACT` | Save checkpoint, then compact (recommended) |
| `/compact` | Compact context directly (loses detail) |

---

## For Beginners

### The Simple Rule

**Every 60-90 minutes, run `Q-CHECKPOINT`.**

This saves your work to a file. If anything goes wrong with context, your progress is safe.

### Warning Signs

Your context is getting full when:
- Claude's responses slow down
- Claude starts forgetting things from earlier
- You've been working for 2+ hours

### What to Do

1. Run `/context` to check usage
2. If above 70%, run `Q-COMPACT`
3. Continue working with fresh context

### The Safe Workflow

```text
Q-BEGIN                    ← Start session
[Work for 60-90 minutes]
Q-CHECKPOINT               ← Save progress
[Work more]
Q-COMPACT                  ← If context is high
[Continue working]
Q-END                      ← End session
```

---

## For Advanced Users

### Understanding Context

Claude Code uses a conversation context window of ~200,000 tokens. This includes:
- Your messages
- Claude's responses
- File contents read
- Tool outputs
- System instructions

As you work, this fills up. When full, Claude Code auto-compacts (summarizes the conversation to free space).

### The Auto-Compact Problem

When auto-compact happens:
1. Claude summarizes the conversation
2. Detailed history is lost
3. Only the summary remains

If you didn't checkpoint, work details may be gone.

### Manual Control with Q-COMPACT

`Q-COMPACT` gives you control:

1. **Saves checkpoint first** — detailed progress preserved in file
2. **Then compacts** — frees context space
3. **Q-END merges later** — checkpoint + remaining work = complete docs

This is safer than `/compact` alone because your details are preserved.

### Monitoring Commands

**`/context`** — Visual grid showing usage

**`/usage`** — Plan limits and rate status

**`Q-STATUS`** — Session state with context health warnings

### Configuring Context Display

You can show context usage in your status bar. Add to `~/.claude/settings.json`:

```json
{
  "statusLine": {
    "type": "command",
    "command": "~/.claude/statusline.sh"
  }
}
```

Create `~/.claude/statusline.sh`:

```bash
#!/bin/bash
# Custom status line showing context info
echo "Context: $(claude context --brief 2>/dev/null || echo 'N/A')"
```

Make it executable:

```bash
chmod +x ~/.claude/statusline.sh
```

### Environment Variables

| Variable | Purpose |
|----------|---------|
| `CLAUDE_CODE_MAX_OUTPUT_TOKENS` | Limit output per request |
| `BASH_MAX_OUTPUT_LENGTH` | Truncate bash output |
| `MAX_MCP_OUTPUT_TOKENS` | Limit MCP tool output |

### Advanced Telemetry

For programmatic monitoring:

```bash
export CLAUDE_CODE_ENABLE_TELEMETRY=1
export OTEL_METRICS_EXPORTER=otlp
export OTEL_EXPORTER_OTLP_ENDPOINT=http://localhost:4317
```

Metrics available:
- `claude_code.token.usage` — Tokens consumed
- `claude_code.cost.usage` — Session cost
- `claude_code.api_request` — Per-request details

---

## Best Practices

### Do

- Run `Q-CHECKPOINT` every 60-90 minutes
- Check `/context` before major tasks
- Use `Q-COMPACT` when above 70%
- Let `Q-END` merge checkpoints automatically

### Don't

- Work 3+ hours without checkpointing
- Ignore slowdown warnings
- Use `/compact` without checkpointing first
- Panic when auto-compact happens (checkpoints save you)

---

## Troubleshooting

**"Claude is forgetting what we did earlier"**

Context may have auto-compacted. Run `Q-CHECKPOINT` now to save current state, then continue. Your earlier work is in the conversation summary.

**"Auto-compact happened and I lost details"**

Check `GeneratedMDs/checkpoints/` for any checkpoint files from this session. Q-END will merge them with the summary.

**"How do I know when to compact?"**

Run `/context` regularly. Above 70% = time to `Q-COMPACT`.

**"I forgot to checkpoint before auto-compact"**

The conversation summary still has key information. Claude will do its best with Q-END. For future sessions, checkpoint every 60-90 minutes.

---

## Related

- [workflow.md](workflow.md) — Daily workflow including checkpoints
- [commands-reference.md](commands-reference.md) — All Q-commands
- [features.md](features.md) — Context protection features
