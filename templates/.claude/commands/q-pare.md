---
description: Optimize CLAUDE.md by offloading verbose content
version: 2.1.2
---

# Pare CLAUDE.md

**Purpose:** Optimize CLAUDE.md by moving less-critical reference material to OFFLOAD.md. Since CLAUDE.md is always loaded into context, keeping it lean improves performance.

## Step 1: Analyze CLAUDE.md

Read CLAUDE.md and identify content by category:

**KEEP in CLAUDE.md (essential for every session):**
- Project overview (1-2 paragraphs max)
- Tech stack (brief list)
- Core architecture (overview only)
- Key workflows and commands
- Critical policies (git push policy, etc.)
- Team member names
- Important constraints

**MOVE to OFFLOAD.md (useful but not needed every time):**
- Detailed command examples
- Complete file structure listings
- Full environment variable documentation
- Detailed deployment procedures
- Extended history or background
- Reference links
- Detailed code examples
- Complete schema documentation
- Testing procedures (detailed)

## Step 2: Create/Update OFFLOAD.md

Create or update `OFFLOAD.md` in project root:

```markdown
# OFFLOAD.md - Extended Documentation

This file contains detailed reference material extracted from CLAUDE.md to optimize context loading. Consult this file when you need detailed specifications.

---

## [Section Name]

[Moved content with original formatting preserved]

## [Section Name]

[Moved content...]
```

## Step 3: Update CLAUDE.md

1. Add pointer section near the top (after project overview):

```markdown
## Extended Documentation

For detailed reference material (full commands, environment setup, deployment procedures, etc.), see `OFFLOAD.md`. This file is kept lean for optimal context loading.
```

2. Replace verbose sections with summaries:
   - Keep essential info
   - Add "See OFFLOAD.md for details" where appropriate
   - Maintain structure but reduce verbosity

## Step 4: Verify and Report

```
CLAUDE.md Optimized

Moved to OFFLOAD.md:
- [Section 1]
- [Section 2]
- [Section 3]

CLAUDE.md changes:
- Before: ~[N] lines
- After: ~[M] lines ([X]% reduction)
- Added pointer to OFFLOAD.md
- Maintained all essential guidance

Both files ready. CLAUDE.md is now optimized for context loading.
```

---

**When to use:**
- CLAUDE.md is getting very long (>300 lines)
- Context feels constrained
- You notice CLAUDE.md has detailed reference content
- Setting up a new project with extensive documentation

**Tip:** Review OFFLOAD.md when you need details. Claude will read it when necessary.
