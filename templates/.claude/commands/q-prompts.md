---
description: Save all user prompts from session
version: 2.1.2
---

# Save Session Prompts

**Purpose:** Extract and save all user prompts/instructions from this session for future reference and reuse.

## Step 1: Generate Timestamp

```bash
TIMESTAMP=$(date +"%Y-%m-%d-%H%M")
```

## Step 2: Create Directory

```bash
mkdir -p .q-system/prompts
```

## Step 3: Determine Participant Name

Use known name or ask user.

## Step 4: Extract Prompts

Review the entire conversation and extract:
- Every user message/instruction
- In chronological order
- Exactly as written (or slightly cleaned up for clarity)

## Step 5: Create Prompts File

Create `.q-system/prompts/${TIMESTAMP}-[Name].md`:

```markdown
# Session Prompts: [TIMESTAMP]

**Date:** [YYYY-MM-DD]
**Participant:** [Name]

---

## Prompts (Chronological)

1. [First user prompt]

2. [Second user prompt]

3. [Third user prompt]

[Continue for all prompts...]

---

## Useful Prompts to Reuse

### [Category: e.g., "Code Review"]
- "[Prompt that worked well]"

### [Category: e.g., "Documentation"]
- "[Prompt that worked well]"

---

**Total prompts:** [N]
```

## Step 6: Verify and Report

```
Prompts saved: .q-system/prompts/[filename]

Total prompts captured: [N]
Highlighted [M] prompts as particularly useful for reuse.

Tip: Review this file to find prompts worth reusing in future sessions.
```

---

**Why save prompts:**
- Find effective prompts to reuse
- Track how you interact with Claude
- Build a personal prompt library
- Learn what instructions work well

**When to use:**
- End of productive session
- After discovering effective prompts
- When you want to remember how you asked for something
- Building a prompt library
