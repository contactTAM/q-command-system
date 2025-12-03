---
description: Configure Q-Command System for your project
version: 2.1.2
---

# Setup

**Purpose:** One smart command to set up or reconfigure Q-Command System based on your project's context.

---

## MANDATORY PRE-FLIGHT CHECKLIST

**STOP. Before proceeding, confirm:**

- [ ] 1. I will detect context BEFORE asking questions
- [ ] 2. I will create version.yaml with provenance information
- [ ] 3. I will VERIFY all created files
- [ ] 4. I will NEVER delete user's existing work

---

## Step 1: Detect Context

### 1.1 Check for Existing Installation

```bash
ls -la .q-system/ 2>/dev/null || echo "No .q-system folder"
ls -la .q-system/version.yaml 2>/dev/null || echo "No version.yaml"
ls -la .q-system/config.md 2>/dev/null || echo "No config.md"
```

- [ ] Checked for .q-system folder
- [ ] Checked for version.yaml
- [ ] Checked for config.md

**Decision logic:**
- **NO .q-system/:** → New Setup (Step 2)
- **.q-system/ exists with config:** → Existing Setup (Step 3)

---

## Step 2: New Setup

**Display to user:**

```
=== Q-Command System Setup ===

I'll configure Q-System for your project. How detailed do you want setup to be?

1. Quick (2-3 minutes)
   - Basic questions, smart defaults
   - Good for simple projects or getting started fast

2. Detailed (10-15 minutes)
   - Domain-specific questions, full configuration
   - Good for serious projects needing maximum customization

Which would you prefer? [1/2]:
```

- [ ] Options presented
- [ ] User choice recorded: ____________________

### Quick Mode (Option 1)

**Ask these 4 essential questions:**

**Q1: What kind of project is this?**
- Software/Code
- Writing (book, screenplay, content)
- Research/Academic
- Business/Planning
- Other: [describe]

**Q2: Are you working solo or with others?**
- Solo
- With collaborators (need multi-user file naming)

**Q3: What's your experience level with this type of project?**
- Beginner (more guidance helpful)
- Intermediate (some guidance)
- Advanced (minimal guidance)

**Q4: Anything special I should know about your project?**
- [Free text, optional]

- [ ] All 4 questions answered
- [ ] Answers recorded

**Then execute Quick Setup (Step 2.1)**

### Detailed Mode (Option 2)

**Run the full 7-question wizard:**

**Q1: Starting Point** - What do you have now?
**Q2: Project Goal** - What are you creating?
**Q3: Experience Level** - How much guidance?
**Q4: Collaboration** - Solo or team?
**Q5: Visual Needs** - Need visual development?
**Q6: Source Material Complexity** - How complex are sources?
**Q7: Repository State** - New or existing files?

- [ ] All 7 questions answered
- [ ] Answers recorded

**Then execute Detailed Setup (Step 2.2)**

---

### Step 2.1: Execute Quick Setup

**MANDATORY: Create all required files with verification**

#### 2.1.1 Create Directory Structure

```bash
mkdir -p .q-system/transcripts
mkdir -p .q-system/session-notes
mkdir -p .q-system/checkpoints
mkdir -p .q-system/docs
```

- [ ] All directories created

#### 2.1.2 Create version.yaml (CRITICAL)

**Generate timestamp:**
```bash
INSTALL_TIME=$(date -u +"%Y-%m-%dT%H:%M:%SZ") && echo "Install time: $INSTALL_TIME"
```

**Create `.q-system/version.yaml`:**

```yaml
# Q-Command System - Version & Provenance
# Installed via /q-setup on [DATE]

q_system:
  version: "2.1.2"
  installed: "[INSTALL_TIME]"
  source: "github.com/contactTAM/q-command-system"
  branch: "main"

commands:
  q-begin: "2.1.2"
  q-checkpoint: "2.1.2"
  q-commit: "2.1.2"
  q-compact: "2.1.2"
  q-dump: "2.1.2"
  q-end: "2.1.2"
  q-learnings: "2.1.2"
  q-pare: "2.1.2"
  q-prompts: "2.1.2"
  q-save: "2.1.2"
  q-setup: "2.1.2"
  q-status: "2.1.2"
  q-upgrade: "2.1.2"
  q-verify: "2.1.2"

upgrade_history: []
```

- [ ] version.yaml created with actual timestamp
- [ ] Source and branch recorded

#### 2.1.3 Create config.md

**Create `.q-system/config.md`:**

```markdown
# Q-System Configuration

**Created:** [DATE]
**Setup mode:** Quick

---

## User Identity

```
user_name: [from Q2 if collaborators, otherwise "User"]
```

---

## Project Profile

```
project_type: [from Q1]
collaboration: [from Q2]
experience_level: [from Q3]
special_notes: [from Q4 or "none"]
```

---

## Git Tracking

```
track_in_git: no
```

---

## Session Behavior

```
friction_prompt: yes
auto_checkpoint_minutes: 0
```
```

- [ ] config.md created with user's answers

#### 2.1.4 VERIFY Quick Setup

```bash
ls -la .q-system/
cat .q-system/version.yaml | head -10
```

- [ ] .q-system/ folder exists
- [ ] version.yaml exists with correct version
- [ ] config.md exists
- [ ] All subdirectories exist

**VERIFICATION GATE (Quick):**
```
Quick Setup verification:
- Directories: [N]/4 created
- version.yaml: [YES/NO]
- config.md: [YES/NO]
```

---

### Step 2.2: Execute Detailed Setup

**Same as Quick Setup PLUS:**

#### 2.2.1 Create domain-config.json

```json
{
  "setup_date": "[INSTALL_TIME]",
  "setup_mode": "detailed",
  "profile": {
    "starting_point": "[Q1 answer]",
    "project_goal": "[Q2 answer]",
    "experience_level": "[Q3 answer]",
    "collaboration": "[Q4 answer]",
    "visual_needs": "[Q5 answer]",
    "source_complexity": "[Q6 answer]",
    "repository_state": "[Q7 answer]"
  },
  "triggers": []
}
```

- [ ] domain-config.json created

#### 2.2.2 VERIFY Detailed Setup

- [ ] All Quick Setup items verified
- [ ] domain-config.json exists

---

## Step 3: Existing Setup

**Display to user:**

```
=== Q-Command System Already Configured ===

I found an existing Q-System configuration.

Current version: [from version.yaml or "unknown"]
Installed: [date from version.yaml or "unknown"]

What would you like to do?

1. Update configuration
   - Adjust settings without losing data

2. Start fresh
   - Reset configuration (preserves session notes)

3. Cancel
   - Keep current configuration
```

- [ ] Options presented
- [ ] User choice recorded: ____________________

### Update Configuration (Option 1)

1. Read current config from `.q-system/config.md`
2. Ask: "What's changed in your project or needs?"
3. Show current settings, allow changes
4. Update files preserving what's unchanged
5. Update version.yaml `upgraded` field

- [ ] Changes made with user permission
- [ ] Reconfiguration logged

### Start Fresh (Option 2)

1. Confirm: "This will reset configuration. Session notes preserved. Continue?"
2. If yes:
   - Archive current config: `mv .q-system/config.md .q-system/config.md.backup-YYYY-MM-DD`
   - Run New Setup (Step 2)
3. If no: Cancel

- [ ] User confirmed
- [ ] Old config archived
- [ ] New setup completed

---

## Step 4: Final Report

**MANDATORY output format (New Setup):**

```
=== Q-Command System Configured ===

Version: 2.1.2
Mode: [Quick/Detailed]
Installed: [timestamp]

Created:
- .q-system/version.yaml (provenance tracking)
- .q-system/config.md (your preferences)
- .q-system/transcripts/ (session transcripts)
- .q-system/session-notes/ (session summaries)
- .q-system/checkpoints/ (mid-session saves)

Your configuration:
- Project type: [type]
- Collaboration: [solo/team]
- Experience: [level]

Next steps:
1. Run /q-begin to start your first session
2. At session end, run /q-end to save documentation
3. Run /q-upgrade periodically to get updates

Ready to go!
```

---

## Safety Guarantees

**NEVER:**
- Delete user's work files
- Delete session notes or checkpoints
- Delete transcripts
- Overwrite without asking

**ALWAYS:**
- Show preview before changes
- Get explicit permission
- Preserve existing work
- Create version.yaml with provenance

---

## FINAL CHECKLIST

Before reporting setup complete:

- [ ] version.yaml created with correct version (2.1.2)
- [ ] version.yaml has installation timestamp
- [ ] version.yaml has source repository info
- [ ] config.md created with user preferences
- [ ] All directories created and verified
- [ ] User told next steps (/q-begin)

**If any item is unchecked, go back and complete it.**
