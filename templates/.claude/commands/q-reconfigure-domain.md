---
description: Update Q-Command configuration when project needs change
---

# Reconfigure Domain

**Purpose:** Update your Q-Command System configuration when your project evolves.

## When to Use

- Project goals changed (exploration → full development)
- Experience level increased (need less guidance now)
- Collaboration context changed (added team members)
- Need infrastructure that wasn't set up initially

## Process

### Step 1: Read Current Configuration

Load `.q-system/domain-config.json` and understand current setup.

### Step 2: Identify Changes

Ask: "What's changed in your project or needs?"

Re-ask relevant questions from original setup. Allow keeping previous answers or changing them.

### Step 3: Analyze Impact

Determine:
- What needs to be added
- What needs to be modified
- What should be preserved

### Step 4: Show Before/After

```text
=== Configuration Changes ===

CURRENT → NEW:
- Goal: [old] → [new]
- Experience: [old] → [new]

INFRASTRUCTURE CHANGES:

Will Add:
- [new items]

Will Modify:
- [changed items]

Will Preserve:
- [unchanged items]
- All existing work files

Estimated Impact: [Low/Medium/High]
```

### Step 5: Get Permission

Show preview and ask explicit permission. User can:
- Accept all changes
- Customize changes
- Cancel

### Step 6: Execute Changes

- Add new infrastructure
- Modify existing settings
- **NEVER delete or move user's work**
- Update `.q-system/domain-config.json`

### Step 7: Document Changes

Create `docs/RECONFIGURATION-LOG-YYYY-MM-DD.md` with:
- What changed and why
- What was added/modified
- What was preserved

### Step 8: Report

```text
Reconfiguration Complete!

Updated: .q-system/domain-config.json
Log: docs/RECONFIGURATION-LOG-[date].md

Changes:
- Added: [N] items
- Modified: [N] items
- Preserved: All existing work
```

## Safety Guarantees

**NEVER:**
- Delete user's work files
- Move files without permission
- Overwrite customizations

**ALWAYS:**
- Preserve all existing work
- Show preview before changes
- Get explicit permission
- Create change log

## See Also

- `/q-setup-domain` - Initial setup wizard
- `/q-upgrade` - Upgrade Q-Command System version
