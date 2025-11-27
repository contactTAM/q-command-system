---
description: Set up Q-Command System for your project domain
---

# Setup Domain

**Purpose:** Configure Q-Command System based on your project's specific context and needs.

## What This Does

Runs an adaptive setup wizard that asks 7 questions about your project, then configures:
- Directory structure
- Domain-specific tools and workflows
- Appropriate level of guidance based on experience
- Collaboration settings

## Process

### Step 1: Domain Selection

Ask which domain:
- Screenplay/TV Writing
- Software Development
- Academic/Research
- Legal
- Other

### Step 2: Contextual Questions (7 questions)

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

### Step 3: Generate Configuration

Create `.q-system/domain-config.json` with answers and infrastructure settings.

### Step 4: Preview and Confirm

Show user what will be created:
- Directories
- Files
- Commands
- Settings

Ask permission to proceed.

### Step 5: Execute Setup

Create directories and files based on configuration.

### Step 6: Verify and Report

```text
Q-Command System configured!

Created:
- [directories]
- [files]

Configuration saved: .q-system/domain-config.json

Next: Run /q-begin to start your first session!
```

## When to Use

- First time setting up Q-Command System in a new project
- Starting a project that needs structured workflow
- Want domain-specific configuration instead of generic setup

## See Also

- `/q-reconfigure-domain` - Update configuration when needs change
- `/q-upgrade` - Upgrade to latest Q-Command System version
