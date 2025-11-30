---
description: Configure Q-Command System for your project
---

# Setup

**Purpose:** One smart command to set up or reconfigure Q-Command System based on your project's context.

## How It Works

This command auto-detects your situation and adapts accordingly.

---

## Step 1: Detect Context

Check if `.q-system/` folder exists:

**If NO `.q-system/` exists → New Setup (go to Step 2)**

**If `.q-system/` exists → Existing Setup (go to Step 3)**

---

## Step 2: New Setup

Display:

```
Q-Command System Setup

I'll configure Q-System for your project. How detailed do you want setup to be?

1. Quick (2-3 minutes)
   - Basic questions, smart defaults
   - Good for simple projects or getting started fast

2. Detailed (10-15 minutes)
   - Domain-specific questions, full configuration
   - Adaptive triggers that grow with your project
   - Good for serious projects or when you want maximum customization

Which would you prefer?
```

### Quick Mode (Option 1)

Ask these 4 essential questions:

**Q1: What kind of project is this?**
- Software/Code
- Writing (book, screenplay, content)
- Research/Academic
- Business/Planning
- Other: [describe]

**Q2: Are you working solo or with others?**
- Solo
- With collaborators (need multi-user file naming)

**Q3: What's your experience with this type of project?**
- Beginner (more guidance helpful)
- Intermediate (some guidance)
- Advanced (minimal guidance)

**Q4: Anything special I should know about your project?**
- [Free text, optional]

Then:
1. Create `.q-system/` folder structure
2. Create `.q-system/config.md` with answers
3. Show what was created
4. Suggest: "Run `/q-begin` to start your first session"

### Detailed Mode (Option 2)

Run the full 7-question adaptive wizard:

**Q1: Starting Point** - What do you have now?
- Nothing yet (just an idea)
- Source materials to adapt
- Basic documents (vision doc, notes)
- Partial work already started

**Q2: Project Goal** - What are you creating?
- Explore concept
- Pitch package
- Complete deliverable
- Ongoing/long-term project

**Q3: Experience Level** - How much guidance do you need?
- Complete beginner (high guidance)
- Learning (moderate guidance)
- Intermediate (standard guidance)
- Advanced (minimal guidance)

**Q4: Collaboration** - Solo or team?
- Solo
- Occasional feedback
- Active collaboration
- Professional team

**Q5: Visual Needs** - Need visual development?
- Yes / Maybe later / No / Already have

**Q6: Source Material Complexity**
- No sources (original work)
- Single source
- Multiple sources
- Complex research

**Q7: Repository State**
- New empty repo
- Existing files
- Existing Q-Command setup

Then:
1. Generate configuration profile
2. Create `.q-system/domain-config.json` with answers and settings
3. Set up progressive scaffolding triggers
4. Create infrastructure based on answers
5. Show summary of what was created
6. Explain what will be offered later (triggers)
7. Suggest: "Run `/q-begin` to start your first session"

---

## Step 3: Existing Setup

Display:

```
Q-Command System Already Configured

I found an existing Q-System configuration. What would you like to do?

1. Update configuration
   - Project has evolved, need to adjust settings
   - Add infrastructure that wasn't set up initially

2. Start fresh
   - Reset everything (preserves your session notes and work)
   - Run setup wizard again

3. Cancel
   - Keep current configuration
```

### Update Configuration (Option 1)

1. Read current configuration from `.q-system/config.md` or `.q-system/domain-config.json`
2. Ask: "What's changed in your project or needs?"
3. Re-ask relevant questions, showing current answers
4. Allow keeping previous answers or changing them
5. Show before/after comparison:

```
=== Configuration Changes ===

CURRENT → NEW:
- [Setting]: [old] → [new]

WILL ADD:
- [new infrastructure]

WILL PRESERVE:
- All existing session notes
- All existing checkpoints
- All your work files

Proceed with changes? (yes/no)
```

6. Get explicit permission
7. Execute changes
8. Create change log in `.q-system/RECONFIGURATION-LOG-YYYY-MM-DD.md`

### Start Fresh (Option 2)

1. Confirm: "This will reset your Q-System configuration. Your session notes, checkpoints, and work files will be preserved. Continue?"
2. If yes, archive current config and run New Setup (Step 2)

---

## Safety Guarantees

**NEVER:**
- Delete user's work files
- Delete session notes or checkpoints
- Move files without permission
- Overwrite without asking

**ALWAYS:**
- Show preview before making changes
- Get explicit permission
- Preserve all existing work
- Create logs of changes

---

## Output Files

**Quick Mode creates:**
- `.q-system/` folder structure
- `.q-system/config.md`

**Detailed Mode creates:**
- `.q-system/` folder structure
- `.q-system/domain-config.json` (full configuration profile)
- `.q-system/triggers.json` (progressive scaffolding triggers)

**Update creates:**
- Updated configuration files
- `.q-system/RECONFIGURATION-LOG-YYYY-MM-DD.md`

---

## When to Use

- First time setting up Q-Command System
- Switching to a new project type
- Project needs have evolved
- Adding team members
- Want more/less structure

---

## See Also

- `/q-begin` - Start a session after setup
- `/q-status` - Check current configuration
- `/q-upgrade` - Upgrade Q-Command System version
