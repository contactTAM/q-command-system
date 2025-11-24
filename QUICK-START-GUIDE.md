# Q-Command System - Quick Start Guide

**For new users who want to get started quickly**

**Version:** 2.1
**Last Updated:** 2025-11-17

---

## 30-Second Quick Start (Absolute Minimum)

```bash
# In YOUR project folder:
mkdir -p GeneratedMDs
cp /path/to/Q-command-system/templates/SHORTCUTS.md ./GeneratedMDs/
```

Then in Claude Code, tell Claude:

```text
I have SHORTCUTS.md at GeneratedMDs/SHORTCUTS.md.
Please read it and run Q-SETUP-DOMAIN to set up this repository.
```

Answer 7 questions. Done!

**Want more details?** Keep reading below.

---

## What You Downloaded

The Q-Command System is a structured co-pilot framework for Claude Code that:

- Automatically documents your work sessions
- Prevents losing work when context fills up
- Helps multiple team members work without conflicts
- Adapts to your project type and experience level

**Think of it as:** Training wheels + autopilot for Claude Code.

---

## Prerequisites (Do This First!)

Before you can use Q-SETUP-DOMAIN, you need to get the Q-Command System files into your project.

### Step 0: Install Q-Command System Files

**If you downloaded Q-Command System as a ZIP:**

```bash
# 1. Extract the ZIP somewhere (e.g., your Downloads folder)
unzip Q-command-system.zip -d ~/Downloads/

# 2. Navigate to YOUR project folder
cd /path/to/your-project

# 3. Copy the base SHORTCUTS.md to your project
mkdir -p GeneratedMDs
cp ~/Downloads/Q-command-system/templates/SHORTCUTS.md ./GeneratedMDs/

# 4. Verify it's there
cat GeneratedMDs/SHORTCUTS.md | head -n 10
# Should show: Version: 2.1
```

**If you cloned the Q-Command System repo:**

```bash
# 1. Navigate to YOUR project folder
cd /path/to/your-project

# 2. Copy the base SHORTCUTS.md to your project
mkdir -p GeneratedMDs
cp /path/to/Q-command-system/templates/SHORTCUTS.md ./GeneratedMDs/

# 3. Verify it's there
cat GeneratedMDs/SHORTCUTS.md | head -n 10
# Should show: Version: 2.1
```

**What you just installed:**
- `GeneratedMDs/SHORTCUTS.md` - Contains Q-SETUP-DOMAIN command and all other Q-commands

**That's it!** Now Claude Code can read SHORTCUTS.md and execute Q-SETUP-DOMAIN.

---

## Two Ways to Start

### Option 1: Automated Setup (Recommended for v2.1)

**Best for:** New projects or if you want adaptive configuration

```text
1. Open Claude Code in your project folder
2. Tell Claude: "Read GeneratedMDs/SHORTCUTS.md and run Q-SETUP-DOMAIN"
3. Answer 7 questions about your project
4. System sets up everything automatically
```

**What it does:**

- Asks about your project (screenplay? software? research?)
- Asks your experience level (beginner? expert?)
- Creates the right infrastructure for YOU
- Installs only what you need now
- Offers more tools as your project grows

**Time:** 5 minutes (after Step 0 above)

**Go to:** [Option 1 Details](#option-1-automated-setup-detailed) below

---

### Option 2: Manual Setup (If you prefer control)

**Best for:** Existing projects or if you want to understand what gets installed

```text
1. Copy template files to your repo (you already did Step 0 above)
2. Create directory structure manually
3. Add Q-command section to CLAUDE.md
4. Start using Q-BEGIN / Q-END
```

**What it does:**

- You install base Q-Command System only
- No domain-specific features
- You're in full control
- Can customize later

**Time:** 10 minutes (after Step 0 above)

**Go to:** [Option 2 Details](#option-2-manual-setup-detailed) below

---

## Which Option Should I Choose?

| Choose Option 1 (Automated) if: | Choose Option 2 (Manual) if: |
|--------------------------------|------------------------------|
| You're starting a NEW project | You have EXISTING Q-system setup |
| You want help getting started | You know exactly what you want |
| You're a beginner | You're experienced with Q-commands |
| You want domain-specific features | You want minimal base system only |
| You trust the wizard to configure | You want full manual control |

**Not sure?** Choose Option 1 - you can always customize later.

---

## Option 1: Automated Setup (Detailed)

### Prerequisites

1. **Claude Code installed** (Anthropic's CLI)
2. **Git initialized** in your project (`git init` if needed)
3. **Q-Command System files installed** (Step 0 above - you copied SHORTCUTS.md)
4. **You're in your project directory** in Claude Code

### Step-by-Step

**STEP 1: Verify SHORTCUTS.md is Present**

Before running the wizard, make sure Claude Code can find the commands:

```bash
# Check that SHORTCUTS.md exists
ls -la GeneratedMDs/SHORTCUTS.md

# Should show: GeneratedMDs/SHORTCUTS.md
```

If this file doesn't exist, go back to [Step 0: Install Q-Command System Files](#step-0-install-q-command-system-files).

**STEP 2: Tell Claude About SHORTCUTS.md**

Claude needs to read SHORTCUTS.md to know about Q-commands. In Claude Code, type:

```text
I have SHORTCUTS.md at GeneratedMDs/SHORTCUTS.md.
Please read it and then run Q-SETUP-DOMAIN to set up this repository.
```

Claude will:
1. Read GeneratedMDs/SHORTCUTS.md (learns about Q-commands)
2. Execute the Q-SETUP-DOMAIN wizard
3. Start asking you questions

**STEP 3: Answer Questions**

The system will ask 7 questions. Here's what they mean:

**Q1: What domain are you working in?**

- Screenplay/TV Writing
- Software Development
- Academic/Research
- Legal
- Other

*Just pick what's closest to your project.*

**Q2: What are you starting with?**

- Nothing yet (just an idea)
- Source material (book, papers, etc.)
- Basic documents (notes, treatment)
- Pitch bible or plan
- Partial work (already started)

*This helps set up the right initial structure.*

**Q3: What's your goal?**

- Explore concept
- Create pitch/proposal
- Complete pilot/prototype
- Full project (season, application, paper)
- Ongoing work (series, platform)

*Determines how much infrastructure to set up.*

**Q4: Your experience level?**

- Complete beginner
- Learning
- Intermediate
- Advanced

*Controls how much guidance you get in templates.*

**Q5: Working solo or with team?**

- Solo
- With occasional feedback
- Active collaboration
- Professional team

*Determines file organization and export features.*

**Q6: Need visual development?** (Screenplay domain)

- Yes
- Maybe later
- No
- Already have it

*Only for domains with visual components.*

**Q7: Do you have source materials?** (Screenplay domain)

- No source materials
- Single source
- Multiple equal sources
- Multiple with hierarchy
- Complex research

*Sets up research and citation frameworks if needed.*

**STEP 4: Review Configuration**

The system shows you what it will create:

```
Based on your answers, here's what I'll set up:

📁 Directory Structure:
- /docs/ (documentation, skills, agents)
- /GeneratedMDs/ (session transcripts, notes)
- /characters/ (character profiles)
- /episodes/ (episode outlines)
...

🛠️ Skills & Agents:
- scene-prep-agent (helps write scenes)
- Midjourney skill (visual development)
...

⚙️ Custom Q-Commands:
- Q-SCENE (standardized scene workflow)
- Q-RESEARCH (source material research)
...

Would you like me to proceed?
```

**STEP 5: Confirm**

Type: `Yes` (or `Customize first` if you want changes)

**STEP 6: Setup Runs**

The system creates:

- Directory structure
- Configuration files
- Documentation
- Domain-specific tools
- Setup summary

**STEP 7: Start Working**

When setup completes, type:

```text
Q-BEGIN
```

This starts your first session!

**Note:** If Claude says "Q-SETUP-DOMAIN command not recognized," it means SHORTCUTS.md wasn't found. Make sure you completed Step 0 and the file is at `GeneratedMDs/SHORTCUTS.md` in your project root.

---

## Option 2: Manual Setup (Detailed)

### Prerequisites

Same as Option 1.

### Step-by-Step

**STEP 1: Copy Template Files**

From the Q-Command System repo, copy these files to your project:

```bash
# Navigate to your project
cd /path/to/your-project

# Copy SHORTCUTS.md
cp /path/to/Q-command-system/templates/SHORTCUTS.md ./GeneratedMDs/

# Copy SESSION-CHECKLIST.md
cp /path/to/Q-command-system/templates/SESSION-CHECKLIST.md ./

# Copy .gitignore
cp /path/to/Q-command-system/templates/.gitignore ./GeneratedMDs/
```

**STEP 2: Create Directory Structure**

```bash
mkdir -p GeneratedMDs/transcripts
mkdir -p GeneratedMDs/session-notes
mkdir -p GeneratedMDs/checkpoints
mkdir -p docs
```

**STEP 3: Add Q-Command Section to CLAUDE.md**

Open (or create) `CLAUDE.md` in your project root.

Add this section (copy from `templates/CLAUDE.md` in Q-Command System repo):

```markdown
## Workflow with Claude Code

### Session Workflow

**Start of session:**
Type `Q-BEGIN` and Claude will automatically:
1. Read CLAUDE.md for context
2. Review last session notes
3. Ask what you'd like to work on

**End of session:**
Type `Q-END` and Claude will automatically:
1. Create session transcript
2. Create session notes
3. Commit all changes
4. Remind you to push when ready

**Available Q-Commands:**
- Q-BEGIN, Q-END, Q-SAVE
- Q-CHECKPOINT, Q-STATUS, Q-VERIFY
- Q-DUMP, Q-COMMIT, Q-LEARNINGS
```

(See `templates/CLAUDE.md` for full template)

**STEP 4: Commit Initial Setup**

```bash
git add .
git commit -m "Add Q-Command System v2.1

- Added SHORTCUTS.md with Q-command specifications
- Added SESSION-CHECKLIST.md for workflow guide
- Created GeneratedMDs directory structure
- Updated CLAUDE.md with Q-command workflow

Co-Authored-By: Q-Command System <>"
```

**STEP 5: Start Using**

In Claude Code, type:

```
Q-BEGIN
```

---

## Daily Workflow (After Setup)

Once set up (either option), your daily workflow is simple:

### Morning / Session Start

```
You: Q-BEGIN
```

Claude reads your project context, reviews last session, and asks what to work on.

### During Work

**Check progress anytime:**

```
You: Q-STATUS
```

Shows session state, context health, recommendations.

**Save mid-session (insurance against auto-compact):**

```
You: Q-CHECKPOINT
```

Creates progress snapshot (recommended every 90 min).

### End of Session

**Full documentation:**

```
You: Q-END
```

Creates transcript, session notes, commits everything.

**Quick exit (if in hurry):**

```
You: Q-SAVE
```

Lighter version - just transcript and commit.

**Verify it worked:**

```
You: Q-VERIFY
```

Checks that files were created successfully.

### Push to Remote (Manual)

```bash
git push
```

**Important:** Claude NEVER pushes automatically. You control when code goes to GitHub.

---

## Testing Before Commit (Your Question)

**"How do I test Phase 1 before committing?"**

### Quick Test in This Repo

1. **Create a test branch:**

   ```bash
   git checkout -b test-q-setup-domain
   ```

2. **Run Q-SETUP-DOMAIN in Claude Code:**

   ```
   Q-SETUP-DOMAIN
   ```

3. **Answer questions** (pick any test scenario)

4. **Check what was created:**

   ```bash
   ls -la .q-system/
   ls -la docs/
   cat .q-system/domain-config.json
   cat docs/DOMAIN-SETUP-SUMMARY.md
   ```

5. **If satisfied:**

   ```bash
   git checkout main
   git branch -D test-q-setup-domain
   ```

### Full Test in New Repo

1. **Create test repository:**

   ```bash
   mkdir /tmp/q-test-repo
   cd /tmp/q-test-repo
   git init
   ```

2. **Copy Q-Command System repo path** to clipboard

3. **Open Claude Code in test repo:**

   ```bash
   claude code
   ```

4. **Tell Claude about Q-Command System:**

   ```
   I have the Q-Command System repository at [path].
   I want to test Q-SETUP-DOMAIN.
   Please run Q-SETUP-DOMAIN and set up this test repo.
   ```

5. **Answer wizard questions** (test scenario: screenplay, beginner, solo)

6. **Verify results:**

   ```bash
   ls -la
   tree .  # if you have tree installed
   cat .q-system/domain-config.json
   cat docs/DOMAIN-SETUP-SUMMARY.md
   ```

7. **Test basic workflow:**

   ```
   Q-BEGIN
   [Do some test work]
   Q-STATUS
   Q-CHECKPOINT
   Q-END
   Q-VERIFY
   ```

8. **Check generated files:**

   ```bash
   ls -la GeneratedMDs/transcripts/
   ls -la GeneratedMDs/session-notes/
   cat GeneratedMDs/session-notes/[latest].md
   ```

9. **If satisfied, delete test repo:**

   ```bash
   rm -rf /tmp/q-test-repo
   ```

---

## What Gets Created (Summary)

### Option 1: Automated Setup

**Always created:**

- `.q-system/domain-config.json` (your configuration)
- `GeneratedMDs/SHORTCUTS.md` (Q-command specs)
- `GeneratedMDs/transcripts/` (session transcripts)
- `GeneratedMDs/session-notes/` (session summaries)
- `GeneratedMDs/checkpoints/` (progress snapshots)
- `CLAUDE.md` (project context)
- `SESSION-CHECKLIST.md` (workflow guide)
- `docs/DOMAIN-SETUP-SUMMARY.md` (what was set up)
- `docs/QUICK-REFERENCE.md` (command reference)

**Created based on your answers:**

- Domain-specific directories (e.g., `/characters/`, `/episodes/`)
- Skills (e.g., `docs/Midjourney_Prompt_Skill.md`)
- Agents (e.g., `docs/agents/scene-prep-agent.md`)
- Custom Q-commands (e.g., Q-SCENE, Q-RESEARCH added to SHORTCUTS.md)
- Source frameworks (if adapting source materials)
- FILE-STRUCTURE-MAP.md (if complex project)

### Option 2: Manual Setup

**Created:**

- `GeneratedMDs/SHORTCUTS.md` (base v2.1)
- `GeneratedMDs/transcripts/` (empty initially)
- `GeneratedMDs/session-notes/` (empty initially)
- `GeneratedMDs/checkpoints/` (empty initially)
- `SESSION-CHECKLIST.md` (workflow guide)
- Updated `CLAUDE.md` (with Q-command section)

**NOT created:**

- No domain-specific features
- No custom Q-commands
- No skills or agents
- No configuration profile

---

## Common Questions

### "I messed up the wizard answers. Can I redo it?"

Yes! Run:

```
Q-RECONFIGURE-DOMAIN
```

This lets you change your answers and update the configuration.

### "I started with manual setup. Can I get domain features later?"

Yes! Just run:

```
Q-SETUP-DOMAIN
```

It will detect existing Q-system and add domain features.

### "Where are my session notes?"

```
GeneratedMDs/session-notes/
```

Files are named: `YYYY-MM-DD-HHmm-[YourName].md`

Example: `2025-11-17-0930-Gabriel.md`

### "How do I see what commands are available?"

After setup:

```
cat docs/QUICK-REFERENCE.md
```

Or read:

```
GeneratedMDs/SHORTCUTS.md
```

### "Can multiple people use this?"

Yes! Each person gets their own files:

- `2025-11-17-0930-Gabriel.md`
- `2025-11-17-1000-Alice.md`
- `2025-11-17-1430-Bob.md`

No collisions.

### "What if I don't want all this structure?"

Use Option 2 (manual setup) for minimal base system.

Or answer "advanced" + "solo" in Option 1 wizard for minimal scaffolding.

### "How do I update Q-Command System later?"

See [UPDATE-GUIDE.md](UPDATE-GUIDE.md) for updating existing installations.

---

## Troubleshooting

### "Q-SETUP-DOMAIN command not recognized"

**This is the most common issue!**

**Problem:** Claude doesn't know about Q-commands until you tell it to read SHORTCUTS.md.

**Solution:** Don't just type `Q-SETUP-DOMAIN` alone. Instead, tell Claude:

```text
I have SHORTCUTS.md at GeneratedMDs/SHORTCUTS.md.
Please read it and run Q-SETUP-DOMAIN.
```

This tells Claude where to find the command definitions.

**Alternative solution:** Make sure you have the latest SHORTCUTS.md (v2.1).

Check version:

```bash
head -n 10 GeneratedMDs/SHORTCUTS.md
```

Should show: `Version: 2.1`

If not, copy latest from `templates/SHORTCUTS.md`.

### "Setup failed midway through"

**Solution:** The system is designed to complete what it can.

Check what was created:

```bash
ls -la .q-system/
ls -la docs/
```

Read any error messages and complete manually, or run Q-SETUP-DOMAIN again.

### "I see markdownlint warnings"

**Solution:** These are just formatting warnings, not errors.

The system works fine. To fix warnings, run:

```bash
npx markdownlint-cli --fix docs/
```

### "Git push is rejected"

**Solution:** Q-Command System never pushes automatically.

You control when to push:

```bash
git push
```

If rejected (branch protection, permissions), check your git settings.

---

## Next Steps

### After Quick Start

1. **Read setup summary:**

   ```bash
   cat docs/DOMAIN-SETUP-SUMMARY.md
   ```

2. **Review available commands:**

   ```bash
   cat docs/QUICK-REFERENCE.md
   ```

3. **Start first session:**

   ```text
   Q-BEGIN
   ```

4. **Work on your project** (the system documents automatically)

5. **End session:**

   ```text
   Q-END
   ```

6. **Review session notes:**

   ```bash
   cat GeneratedMDs/session-notes/[latest].md
   ```

### Learn More

- **[COMMANDS-REFERENCE.md](docs/COMMANDS-REFERENCE.md)** - Complete command documentation
- **[FEATURES.md](docs/FEATURES.md)** - Detailed feature explanations
- **[ARCHITECTURE.md](docs/ARCHITECTURE.md)** - How the system works
- **[Phase 1 Implementation](docs/PHASE-1-IMPLEMENTATION-SUMMARY.md)** - What's new in v2.1

### Customize

- Edit `GeneratedMDs/SHORTCUTS.md` to add custom Q-commands
- Edit `CLAUDE.md` to add project-specific context
- Edit `docs/DOMAIN-SETUP-SUMMARY.md` if setup changed

---

## Summary: One-Minute Version

**New user?**

1. Type `Q-SETUP-DOMAIN` in Claude Code
2. Answer 7 questions
3. System sets up everything
4. Type `Q-BEGIN` to start working
5. Type `Q-END` when done
6. Session automatically documented

**That's it!** Everything else is automatic.

---

**Questions?** See [README.md](README.md) for full documentation.

**Ready to start?** Choose Option 1 or Option 2 above and follow the steps!
