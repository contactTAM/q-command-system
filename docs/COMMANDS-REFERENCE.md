# Q-Command System - Complete Commands Reference

**Comprehensive Command Documentation**

**Version:** 1.1
**Last Updated:** 2025-11-27

---

## Command Index

All commands are available as slash commands. Type `/q-` and press Tab to see them.

### Setup & Configuration

- [/q-setup-domain](#q-setup-domain) - Adaptive domain-specific setup wizard
- [/q-reconfigure-domain](#q-reconfigure-domain) - Update configuration when needs change
- [/q-upgrade](#q-upgrade) - Upgrade to latest version

### Session Management

- [/q-begin](#q-begin) - Start session with context refresh
- [/q-end](#q-end) - Complete session documentation and commit
- [/q-save](#q-save) - Lightweight quick exit

### Progress Tracking

- [/q-checkpoint](#q-checkpoint) - Save mid-session progress snapshot
- [/q-status](#q-status) - Check session state and context health
- [/q-verify](#q-verify) - Verify command success
- [/q-compact](#q-compact) - Safe context management (checkpoint + compact)

### Documentation

- [/q-dump](#q-dump) - Create session transcript manually
- [/q-learnings](#q-learnings) - Summarize session insights
- [/q-prompts](#q-prompts) - Save all user prompts from session

### Git Operations

- [/q-commit](#q-commit) - Stage and commit changes

### Optimization

- [/q-pare](#q-pare) - Optimize CLAUDE.md by offloading verbose content

---

## Q-SETUP-DOMAIN

**Purpose:** Set up domain-specific Q-Command System infrastructure adapted to your project context using progressive scaffolding (not fixed tiers)

**Version:** 1.0

### Usage
```
Q-SETUP-DOMAIN
```

### What It Does

Runs a 10-step adaptive wizard that configures your repository based on contextual questions:

**STEP 1-2: Domain Selection**
- Asks what domain you're working in (Screenplay, Software, Research, Legal, Other)
- Branches to domain-specific questions

**STEP 3: Contextual Questions (7 for Screenplay)**
1. **Starting point** - What you have now (nothing, source material, pitch bible, partial work)
2. **Project goal** - What you're creating (explore concept, pitch package, pilot, season, series)
3. **Experience level** - How much guidance needed (beginner, learning, intermediate, advanced)
4. **Collaboration context** - Solo vs team (solo, occasional feedback, active, professional)
5. **Visual needs** - Visual development requirements (yes, maybe, no, have it)
6. **Source complexity** - Source material situation (none, single, multiple, hierarchy, complex)
7. **Repository state** - New vs existing (new, existing files, existing Q-system)

**STEP 4: Handle Uncertainty**
- If user answers "not sure" to multiple questions → Sets up minimal infrastructure, more triggers
- If answers contradictory (e.g., beginner + full season) → Asks clarifying questions, offers options

**STEP 5-6: Configuration Generation & Preview**
- Generates configuration profile based on answers
- Shows preview of what will be set up (directories, skills, agents, commands, triggers)
- Asks permission to proceed

**STEP 7: Setup Execution**
- Creates directories (only what's needed)
- Installs core files (CLAUDE.md, SHORTCUTS.md, SESSION-CHECKLIST.md, .gitignore)
- Installs domain-specific skills (conditional)
- Installs agents (conditional)
- Adds custom Q-commands (conditional)
- Configures collaborative mode (based on experience level)
- Creates FILE-STRUCTURE-MAP.md (if complex project)
- Saves configuration profile to `.q-system/domain-config.json`

**STEP 8: Documentation Generation**
- Creates `docs/DOMAIN-SETUP-SUMMARY.md` (what was set up and why)
- Creates `docs/QUICK-REFERENCE.md` (command reference)

**STEP 9: Verification**
- Verifies all directories created
- Verifies all files written successfully
- Verifies configuration profile saved
- Reports git status

**STEP 10: Offer First Session**
- Asks if you want to run Q-BEGIN now
- If yes, starts first session automatically

### Configuration Profile

Stores complete configuration in `.q-system/domain-config.json`:

```json
{
  "domain": "screenplay",
  "config_name": "screenplay-pilot-beginner-solo",
  "timestamp": "2025-11-17T14:30:00Z",
  "answers": { ... },
  "infrastructure": {
    "directories": [...],
    "skills": [...],
    "agents": [...],
    "custom_commands": [...],
    "collaborative_mode": "structural",
    "source_framework": "two_layer",
    "session_notes_strategy": "individual",
    "quality_level": "high_scaffolding"
  },
  "triggers": [...]
}
```

### Progressive Scaffolding Triggers

Sets up triggers that offer infrastructure as project grows:

**Examples:**
- When 5+ scenes written → Offer Q-SCENE command
- When user mentions "character arcs" → Offer arc tracking
- When repo reaches 30+ files → Offer FILE-STRUCTURE-MAP.md
- When user mentions "visual" → Offer visual development setup

**Benefits:**
- Don't overwhelm user on Day 1
- Offer tools at the right time (teachable moments)
- System adapts as project evolves

### Experience-Based Calibration

Same infrastructure, different levels of guidance:

**Beginner:**
- High scaffolding (extensive guidance in templates)
- Educational checklists (prevent common mistakes, explain why)
- Structural collaborative mode (NEVER/ALWAYS lists, red flags)
- Detailed explanations

**Intermediate:**
- Medium scaffolding (standard templates)
- Standard checklists
- Narrative collaborative mode
- Assumes basic knowledge

**Advanced:**
- Minimal scaffolding (bare-bones templates, customizable)
- Brief/no checklists
- Optional collaborative mode
- Maximum flexibility

### Example Configurations

**UCU Context** (Early exploration with source material):
- Config: `screenplay-concept-beginner-solo-visual`
- Infrastructure: Lightweight, organic growth, visual development, source fidelity framework
- Triggers: Offer scene agent when mentions writing, arc tracking when outlines complete

**TDW Context** (Pilot writing with existing materials):
- Config: `screenplay-pilot-beginner-feedback-research`
- Infrastructure: Full-featured, source hierarchy enforcement, deliverables export
- Immediate: Q-SCENE, Q-RESEARCH commands, FILE-STRUCTURE-MAP.md
- Triggers: Arc tracking when mentioned, timeline when needed

**Experienced Writer** (Original work):
- Config: `screenplay-season-advanced-solo`
- Infrastructure: Minimal structure, no agents/skills upfront
- User drives, system stays out of way
- Triggers: Offer tools only when user signals need

### When to Use

- **First time** setting up Q-System in a repository
- **Adding** domain-specific features to existing Q-System
- **Starting** a new project that needs structured workflow

### What Gets Created

**Directories (conditional):**
- `.q-system/` (configuration storage)
- `docs/` (documentation, skills, agents)
- `GeneratedMDs/` (transcripts, checkpoints, session-notes)
- Domain-specific directories based on configuration

**Files (always):**
- `.q-system/domain-config.json` (configuration profile)
- `CLAUDE.md` (project context with domain sections)
- `SESSION-CHECKLIST.md` (workflow guide)
- `GeneratedMDs/SHORTCUTS.md` (base v2.1 + custom commands)
- `.gitignore` (for GeneratedMDs)
- `docs/DOMAIN-SETUP-SUMMARY.md` (setup documentation)
- `docs/QUICK-REFERENCE.md` (command reference)

**Files (conditional):**
- Skills (e.g., Midjourney_Prompt_Skill.md)
- Agents (e.g., scene-prep-agent-instructions.md)
- Source frameworks (e.g., Source_Hierarchy_Framework.md)
- FILE-STRUCTURE-MAP.md (if complex project)

### Customization

Each domain can define:
- Custom question set (7-10 questions)
- Infrastructure decision logic
- Skills and agents to install
- Custom Q-commands to add
- Trigger conditions and offers

### See Also

- [Q-RECONFIGURE-DOMAIN](#q-reconfigure-domain) - Update configuration when needs change
- Full specification in SHORTCUTS.md Q-SETUP-DOMAIN section

---

## Q-RECONFIGURE-DOMAIN

**Purpose:** Update domain configuration when project needs change

**Version:** 1.0

### Usage
```
Q-RECONFIGURE-DOMAIN
```

### What It Does

Updates your Q-Command System configuration when your project evolves:

**STEP 1: Read Current Configuration**
- Loads `.q-system/domain-config.json`
- Understands what's currently installed
- Shows current answers

**STEP 2: Identify Changes**
- Asks: "What's changed in your project or needs?"
- Re-asks relevant questions from Q-SETUP-DOMAIN
- Allows keeping previous answers or changing them
- Identifies what changed

**STEP 3: Analyze Impact**
- Determines what needs to be added
- Determines what needs to be modified
- Determines what should be preserved
- Estimates effort/disruption level

**STEP 4: Show Before/After Comparison**
```
=== Configuration Changes ===

CURRENT → NEW:
- Starting point: concept → pilot
- Goal: explore → complete_pilot
- Experience: beginner → learning

INFRASTRUCTURE CHANGES:

Will Add:
- /screenplay/scenes/ directory
- scene-prep-agent-instructions.md
- Q-SCENE command
- Deliverables export infrastructure

Will Modify:
- SHORTCUTS.md (add Q-SCENE)
- CLAUDE.md (update collaborative mode)

Will Preserve:
- All existing work
- Visual reference materials
- Character profiles

Estimated Impact: Medium
```

**STEP 5: Get Permission**
- Shows preview of changes
- Asks explicit permission
- User can: Accept all, Customize first, or Cancel

**STEP 6: Execute Upgrade**
- Adds new infrastructure (directories, files)
- Modifies existing infrastructure carefully
- **NEVER deletes or moves user's work**
- Updates `.q-system/domain-config.json`
- Updates SHORTCUTS.md with new commands (if applicable)
- Updates CLAUDE.md with new sections (if applicable)

**STEP 7: Update Documentation**
- Updates `docs/DOMAIN-SETUP-SUMMARY.md`
- Updates `docs/QUICK-REFERENCE.md`
- Creates `docs/RECONFIGURATION-LOG-YYYY-MM-DD.md` with:
  - What changed
  - Why it changed
  - What was added/modified
  - What was preserved

**STEP 8: Verify & Report**
```
✅ Reconfiguration Complete!

Updated configuration: .q-system/domain-config.json
Reconfiguration log: docs/RECONFIGURATION-LOG-2025-11-17.md

Changes:
- Added: 5 items
- Modified: 2 items
- Preserved: All existing work

Updated documentation:
- docs/DOMAIN-SETUP-SUMMARY.md
- docs/QUICK-REFERENCE.md

Your work is safe - all files preserved.
Review the reconfiguration log for details.
```

### When to Use

**Project Evolution:**
- Started with "explore concept" → Now writing complete pilot
- Started with "pitch package" → Now developing full season
- Started solo → Now working with team

**Experience Growth:**
- Started as beginner → Now more confident (reduce scaffolding)
- Started as intermediate → Now expert (minimal guidance)

**Collaboration Changes:**
- Solo work → Now sharing for feedback (need deliverables)
- Occasional feedback → Active collaboration (need multi-user)
- Solo → Professional team (need approval workflows)

**Infrastructure Needs:**
- Didn't need visual development → Now need it
- Didn't have source materials → Now adapting from book
- Simple project → Grown complex (need FILE-STRUCTURE-MAP.md)

### Safety Guarantees

**NEVER:**
- Deletes user's work files
- Moves files without permission
- Overwrites customizations
- Makes destructive changes

**ALWAYS:**
- Preserves all existing work
- Shows preview before changes
- Gets explicit permission
- Creates reconfiguration log
- Reports what changed

### Example Scenarios

**Scenario 1: From Exploration to Execution**
- Started: Explore concept (lightweight setup)
- Now: Writing complete pilot (need full infrastructure)
- Changes: Add screenplay structure, scene PREP agent, Q-SCENE command
- Impact: Medium (adds infrastructure, preserves explorations)

**Scenario 2: Experience Level Increase**
- Started: Complete beginner (high scaffolding)
- Now: Learning/intermediate (reduce guidance)
- Changes: Lighter templates, less verbose checklists, minimal collaborative mode
- Impact: Low (mostly template updates)

**Scenario 3: Adding Team Members**
- Started: Solo (individual session notes)
- Now: Team of 3 (need multi-user file naming)
- Changes: Update file naming, add collaboration docs, add decision tracking
- Impact: Low (infrastructure addition, no disruption)

### Configuration History

Reconfiguration logs create audit trail:
- `docs/RECONFIGURATION-LOG-2025-11-17.md` (first reconfiguration)
- `docs/RECONFIGURATION-LOG-2025-12-01.md` (second reconfiguration)
- etc.

Each log documents:
- What changed and why
- Before/after configuration comparison
- What was added/modified/preserved
- User's reason for reconfiguration

### See Also

- [Q-SETUP-DOMAIN](#q-setup-domain) - Initial setup wizard
- Full specification in SHORTCUTS.md

---

## Q-UPGRADE

**Purpose:** Check current version and guide upgrade to latest Q-Command System

### Usage

```
Q-UPGRADE
```

### What It Does

1. Reads your current SHORTCUTS.md version
2. Asks you to provide the latest version (paste or file path)
3. Compares versions
4. Identifies any custom commands you've added
5. Offers upgrade options:
   - Full replacement (if no custom commands)
   - Guided merge (preserves custom commands)
   - Manual upgrade (shows what changed)
6. Creates backup before making changes
7. Verifies upgrade succeeded

### When to Use

- When a new version of Q-Command System is released
- When you want to check if you're up to date
- When you have custom commands and want to upgrade safely

### Custom Command Preservation

Q-UPGRADE automatically detects any custom `## Q-` sections you've added to SHORTCUTS.md that aren't part of the standard commands. During upgrade, these are preserved and merged into the new version.

### Backup

Before any upgrade, Q-UPGRADE creates:
```
GeneratedMDs/SHORTCUTS-backup-YYYY-MM-DD.md
```

If anything goes wrong, your original file is safe.

### Example Flow

```
You: Q-UPGRADE

Claude: Current Q-Command System version: 1.0
        Installed at: GeneratedMDs/SHORTCUTS.md

        To check for upgrades, I need the latest SHORTCUTS.md.
        Option A: Tell me the latest version number
        Option B: Paste the header of the new SHORTCUTS.md
        Option C: Provide path to downloaded file

        Which would you like to do?

You: C - it's at ~/Downloads/SHORTCUTS.md

Claude: === Upgrade Analysis ===
        Current version: 1.0
        Latest version: 1.1
        Custom commands found: 1 (Q-REVIEW)

        How would you like to proceed?
        1: Full replacement
        2: Guided merge (recommended)
        3: Manual upgrade

You: 2

Claude: === Upgrade Complete ===
        Previous: 1.0 (backed up)
        New: 1.1
        Custom commands preserved: Q-REVIEW

        Run Q-BEGIN to verify everything works.
```

### See Also

- [CHANGELOG.md](../CHANGELOG.md) - What changed in each version
- Full specification in SHORTCUTS.md

---

## Q-BEGIN

**Purpose:** Start session with full context refresh

### Usage
```
Q-BEGIN
```

### What It Does

1. **Reads CLAUDE.md** for project context
2. **Reviews last session notes** from `GeneratedMDs/session-notes/`
   - Filters by your name
   - Reads most recent session
3. **Checks project status** from work plan or similar files
4. **Provides summary** of recent progress and current state
5. **Asks what to work on** today
6. **Sets up TodoWrite** if needed for multi-step tasks

### Example Output
```
[After reading CLAUDE.md and last session notes]

Last session (2025-11-12 14:30):
- Updated budget estimates to $25-50K across 6 documents
- Removed "free" dashboard option
- Added preliminary estimate warnings
- All changes committed

Current project status:
- Phase: Pre-Development Planning
- Blockers: None resolved since last session
- Next steps: Review with Brian

What would you like to work on today?
```

### When to Use
- **Beginning of every work session**
- After opening Claude Code in a repository
- When resuming work after a break

### Customization
Edit `GeneratedMDs/SHORTCUTS.md` under `## Q-BEGIN` to:
- Add additional files to read
- Change summary format
- Add project-specific checks

---

## Q-END

**Purpose:** Complete session with full documentation and commit

### Usage
```
Q-END
```

### What It Does

Executes 6 steps with verification:

**STEP 1: Check for Continued Sessions**
- Detects if conversation was auto-compacted
- Reads conversation summary if present
- Checks for checkpoints from this session

**STEP 2: Create Session Transcript**
- File: `GeneratedMDs/transcripts/YYYY-MM-DD-HHmm-[PersonName].md`
- Contains chronological session flow
- ✅ Verifies file created with substantial content

**STEP 3: Create Session Notes**
- File: `GeneratedMDs/session-notes/YYYY-MM-DD-HHmm-[PersonName].md`
- Contains summary: accomplishments, decisions, files, next steps
- ✅ Verifies file created

**STEP 4: Update Work Plan** (if applicable)
- Updates project files with progress
- ✅ Verifies changes saved

**STEP 5: Commit All Changes**
- Stages: `git add .`
- Commits with descriptive message + bullets
- ✅ Verifies clean working tree

**STEP 6: Final Report**
- Shows all files created
- Shows commit hash
- Reminds to `git push` manually

### Example Output
```
✅ Session Complete!

Transcript: GeneratedMDs/transcripts/2025-11-13-0913-Gabriel.md (487 lines)
Session Notes: GeneratedMDs/session-notes/2025-11-13-0913-Gabriel.md (142 lines)
Work Plan: Updated
Git: Committed (9 files changed, commit abc1234)

Ready to push! Run `git push` when ready.
```

### When to Use
- **End of every work session**
- When finishing work for the day
- Before switching to different project
- After completing major milestone

### Error Handling
If any step fails:
- Reports specific error
- Completes what's possible
- Provides manual steps to fix

### Customization
Edit `GeneratedMDs/SHORTCUTS.md` under `## Q-END` to:
- Add test execution
- Add linting
- Add deployment steps
- Customize verification

---

## Q-SAVE

**Purpose:** Lightweight quick exit when context is constrained

### Usage
```
Q-SAVE
```

### What It Does

1. **Creates basic transcript** in `GeneratedMDs/transcripts/`
   - Key accomplishments
   - Files changed
   - Lightweight format (not full chronology)
2. **Commits all changes** (Q-COMMIT)
3. **Reports completion**

### What It Skips
- Detailed session notes
- Work plan updates
- Comprehensive verification

### Example Output
```
✅ Quick Save Complete!

Transcript: GeneratedMDs/transcripts/2025-11-13-0913-Gabriel.md (basic)
Git: Committed (6 files changed, commit def5678)

Note: Skipped session notes and work plan updates.
Run Q-VERIFY to see what was saved.
Ready to push! Run `git push` when ready.
```

### When to Use
- **Context usage >90%** (conversation slowing down)
- **Need to exit quickly** (meeting starting, etc.)
- **Already created checkpoints** earlier
- **Emergency exit** scenario

### Trade-offs
- **Pros:** Fast, safe, captures essentials
- **Cons:** Less comprehensive documentation

---

## Q-CHECKPOINT

**Purpose:** Save mid-session progress snapshot

### Usage
```
Q-CHECKPOINT
```

### What It Does

1. **Creates checkpoint directory** if needed (`GeneratedMDs/checkpoints/`)
2. **Creates checkpoint file:** `GeneratedMDs/checkpoints/YYYY-MM-DD-HHmm-[PersonName].md`
   - Uses **current time** (not session start time)
3. **Documents:**
   - Session start time
   - Checkpoint time
   - Accomplishments so far
   - Files created/modified
   - Key decisions
   - Current status and next steps
4. **Verifies** file created
5. **Reports success**

### Example Output
```
✅ Checkpoint saved at 10:30 AM

Location: GeneratedMDs/checkpoints/2025-11-13-1030-Gabriel.md
Session progress preserved (insurance against auto-compact)

Continue working - Q-END will merge checkpoint + final work.
```

### When to Use
- **Every 90 minutes** in long sessions
- **After major milestone** (completed feature, fixed bug, etc.)
- **Before starting next big chunk** of work
- **When context usage >70%**
- **Before risky operations** (large refactors, etc.)

### Benefits
- Insurance against auto-compact data loss
- Q-END merges checkpoints into final documentation
- Minimal overhead (lightweight, 100-200 lines)
- User control over save points

---

## Q-STATUS

**Purpose:** Show current session state and context health

### Usage
```
Q-STATUS
```

### What It Displays

**Session Info:**
- Start time and duration
- Participant name
- Session type (regular / continued from auto-compact)

**Progress:**
- Accomplishments count
- Files created/modified
- Key decisions made

**Checkpoints:**
- Last checkpoint time
- Checkpoint location
- Time since last checkpoint

**Git Status:**
- Uncommitted changes count
- Commits ahead of origin

**Context Health:**
- Estimated usage percentage
- Messages in conversation
- Time since last checkpoint

**Recommendations:**
- When to checkpoint
- When to wrap up
- When to use Q-SAVE
- If continued session, reminder about full documentation

**Next Steps:**
- Pending tasks from TodoWrite (if active)

### Example Output
```
=== Session Status ===

Session started: 2025-11-13 09:13 (2 hours 17 minutes ago)
Participant: Gabriel
Session type: Continued from auto-compact at 10:30

Progress:
- Accomplishments: 6 major items
- Files created: 3
- Files modified: 6
- Key decisions: 4

Checkpoints:
- Last checkpoint: 10:30 (1 hour 47 minutes ago)
- Location: GeneratedMDs/checkpoints/2025-11-13-1030-Gabriel.md

Git Status:
- Uncommitted changes: Yes (9 files)
- Commits ahead of origin: 0

Context Health:
- Estimated usage: 75% ⚠️ HIGH
- Messages in conversation: 187
- Time since last checkpoint: 107 minutes

Recommendations:
⚠️ Consider Q-CHECKPOINT soon to preserve progress
- Session >2 hours - consider wrapping up with Q-END soon
- Remember to document ALL work including from before auto-compact

Next steps:
- Finalize budget updates (in progress)
- Commit changes (pending)
```

### When to Use
- **Anytime** to check progress
- **Long sessions** to monitor context health
- **Before big tasks** to see if checkpoint needed
- **Feeling uncertain** about session state

---

## Q-VERIFY

**Purpose:** Verify that Q-END/Q-CHECKPOINT actually worked

### Usage
```
Q-VERIFY
```

### What It Checks

1. **Transcripts:** Files in `GeneratedMDs/transcripts/` from today, your name
2. **Session Notes:** Files in `GeneratedMDs/session-notes/` from today, your name
3. **Checkpoints:** Files in `GeneratedMDs/checkpoints/` from today, your name
4. **Git Status:** Uncommitted changes? Commits ahead of origin? Last commit details

### Example Output
```
=== Verification Report ===

✅ Transcript: Found GeneratedMDs/transcripts/2025-11-13-0913-Gabriel.md
   - Created: 11:45 AM (3 minutes ago)
   - Size: 487 lines

✅ Session Notes: Found GeneratedMDs/session-notes/2025-11-13-0913-Gabriel.md
   - Created: 11:45 AM (3 minutes ago)
   - Size: 142 lines

✅ Checkpoints: Found 2 checkpoint(s)
   - 2025-11-13-1030-Gabriel.md (10:30 AM)
   - 2025-11-13-1145-Gabriel.md (11:45 AM)

✅ Git: Committed, clean working tree
   - Ahead of origin by 1 commit(s)
   - Last commit: "Update budget estimates to realistic ranges" (3 minutes ago)

Status: All Clear ✅
```

### When to Use
- **After Q-END** to confirm it worked
- **After Q-CHECKPOINT** to verify saved
- **After Q-SAVE** to see what was captured
- **Debugging:** "Did my command work?"
- **Before manual push** to verify git state

---

## Q-DUMP

**Purpose:** Create session transcript manually

### Usage
```
Q-DUMP
```

### What It Does

1. **Checks for continued sessions** (auto-compact detection)
2. **Determines session start time** (original, not continuation time)
3. **Creates transcript file:** `GeneratedMDs/transcripts/YYYY-MM-DD-HHmm-[PersonName].md`
4. **Documents complete session:**
   - For continued sessions: ALL work including from before auto-compact
   - For regular sessions: Current conversation
5. **Includes:**
   - Major accomplishments
   - Files created/modified
   - Key decisions
   - Conversation flow
   - Session metrics
6. **Verifies** file created

### Example Output
```
✅ Transcript created: GeneratedMDs/transcripts/2025-11-13-0913-Gabriel.md
   - Session duration: 2 hours 45 minutes
   - 487 lines documented
   - 9 files modified
```

### When to Use
- **Manually** if not using Q-END
- **For documentation** without full Q-END process
- **Recovery** if Q-END failed partially
- **Testing** the transcript generation

### Difference from Q-END
- Q-DUMP: Only creates transcript
- Q-END: Creates transcript + session notes + commits

---

## Q-LEARNINGS

**Purpose:** Summarize key learnings from session

### Usage
```
Q-LEARNINGS
```

### What It Does

1. **Analyzes current session** for insights
2. **Identifies key learnings:**
   - Technical discoveries
   - Process improvements
   - Best practices found
   - Important decisions and rationale
3. **Presents as bulleted list** in chat (NOT in file)

### Example Output
```
Key Learnings from This Session:

Technical:
- Budget estimates must account for labor on "free" tools like Notion
- Even simple setup tasks require 1-3K in developer time
- Preliminary estimates need prominent caveats to manage expectations

Process:
- Multi-file consistency updates work best with Edit tool's replace_all
- Q-CHECKPOINT system needs robust specifications to prevent failures
- Per-person-per-session naming prevents file collisions

Decisions:
- Budget ranges: $25-50K (not $15-25K) for realistic Phase 1 estimate
- Dashboard minimum budget: $1K (not $0) to reflect labor costs
- All estimates marked as "preliminary" requiring validation

Best Practices:
- Add verification steps to all multi-step commands
- Always report what succeeded vs what failed explicitly
- Provide manual recovery steps when errors occur
```

### When to Use
- **End of session** to reflect on insights
- **After solving difficult problem** to capture approach
- **For team sharing** (copy to session notes)
- **Personal growth** tracking

---

## Q-COMMIT

**Purpose:** Stage and commit all changes locally

### Usage
```
Q-COMMIT
```

### What It Does

1. **Saves all unsaved changes**
2. **Stages all changes:** `git add .`
3. **Creates commit** with:
   - Concise summary message
   - Bullet points of changes
   - Co-author attribution
4. **Verifies** commit succeeded
5. **Reports** commit hash and message
6. **Does NOT push** to remote

### Example Output
```
✅ Changes committed successfully

Commit: abc1234
Message: "Update budget estimates to realistic ranges

- Phase 1: $15-25K → $25-50K
- Platform MVP: $30-75K → $50-100K
- Dashboard: $0-3K → $1-10K with labor costs
- Added preliminary estimate warnings

Co-Authored-By: Claude <noreply@anthropic.com>
"

Working tree clean. Ready to push when you're ready.
```

### When to Use
- **Manually** if not using Q-END
- **Mid-session** to commit work in progress
- **After major milestone** to save progress
- **Before risky operations** (refactors, etc.)

### Git Push Policy

**Q-COMMIT NEVER pushes to remote** - user controls when to share code

---

## /q-compact

**Purpose:** Safely free context space by checkpointing first, then compacting

### Usage

```text
/q-compact
```

### What It Does

1. **Creates checkpoint** via /q-checkpoint to preserve detailed work
2. **Runs /compact** with instructions to preserve key information
3. **Reports results** showing checkpoint location and new context state

### Why Use /q-compact Instead of /compact

- `/compact` alone summarizes and loses detail
- `/q-compact` saves a checkpoint FIRST, then compacts
- Your detailed work history is preserved in the checkpoint file
- You get more context space AND keep your work safe

### Example Output

```text
Q-COMPACT Complete!

Checkpoint saved: GeneratedMDs/checkpoints/2025-11-13-1030-Gabriel.md
Context compacted: More space available

Your detailed work is preserved in the checkpoint.
/q-end will merge checkpoint + remaining work into complete session notes.

Tip: Run /context to see your new context usage.
```

### When to Use

- **Context usage above 70%** (session slowing down)
- **After /context shows high usage**
- **Before starting a large new task**
- **When Claude's responses are getting slower**

### Workflow Example

```text
[Working for 90 minutes, context getting full]
User: /context              → Shows 75% usage
User: /q-compact            → Saves checkpoint, then compacts
                            → Now at ~30% usage
[Continue working with fresh context]
User: /q-end                → Merges checkpoint + new work
```

---

## /q-pare

**Purpose:** Optimize CLAUDE.md by moving verbose content to OFFLOAD.md

### Usage

```text
/q-pare
```

### What It Does

1. **Analyzes CLAUDE.md** to identify verbose reference content
2. **Creates/updates OFFLOAD.md** with moved content
3. **Slims down CLAUDE.md** while preserving essential guidance
4. **Reports** what was moved and size reduction achieved

### What Stays in CLAUDE.md (Essential)

- Project overview (1-2 paragraphs)
- Tech stack (brief list)
- Core architecture overview
- Key workflows and commands
- Critical policies
- Team member names
- Important constraints

### What Moves to OFFLOAD.md (Reference)

- Detailed command examples
- Complete file structure listings
- Full environment variable documentation
- Detailed deployment procedures
- Extended history or background
- Reference links
- Detailed code examples
- Complete schema documentation

### Example Output

```text
CLAUDE.md Optimized

Moved to OFFLOAD.md:
- Detailed development commands
- Complete page structure reference
- Full design system specifications
- Environment variables details

CLAUDE.md changes:
- Before: ~325 lines
- After: ~150 lines (54% reduction)
- Added pointer to OFFLOAD.md
- Maintained all essential guidance

Both files ready. CLAUDE.md is now optimized for context loading.
```

### When to Use

- **CLAUDE.md is very long** (>300 lines)
- **Context feels constrained**
- **Setting up a new project** with extensive documentation
- **Performance optimization** needed

### Benefits

- Faster context loading (CLAUDE.md is always loaded)
- Better performance in long sessions
- Reference content still available when needed
- Claude reads OFFLOAD.md on demand

---

## /q-prompts

**Purpose:** Save all user prompts from the session for future reference and reuse

### Usage

```text
/q-prompts
```

### What It Does

1. **Extracts all user prompts** from the current session
2. **Creates prompts file** in `GeneratedMDs/prompts/`
3. **Lists prompts chronologically**
4. **Highlights useful prompts** worth reusing

### File Location

```text
GeneratedMDs/prompts/YYYY-MM-DD-HHmm-[Name].md
```

### Example Output

```text
Prompts saved: GeneratedMDs/prompts/2025-11-13-0913-Gabriel.md

Total prompts captured: 23
Highlighted 5 prompts as particularly useful for reuse.

Tip: Review this file to find prompts worth reusing in future sessions.
```

### File Contents

```markdown
# Session Prompts: 2025-11-13-0913

**Date:** 2025-11-13
**Participant:** Gabriel

---

## Prompts (Chronological)

1. Q-BEGIN

2. Let's work on the authentication system today

3. Can you show me how the login flow works?

[... continues ...]

---

## Useful Prompts to Reuse

### Code Review
- "Review this code for security vulnerabilities and suggest fixes"

### Documentation
- "Create API documentation for this endpoint following our standard format"
```

### When to Use

- **End of productive session** to capture effective prompts
- **After discovering effective prompts** you want to remember
- **Building a prompt library** for your workflow
- **Learning what instructions work well** with Claude

### Benefits

- Build a personal prompt library
- Find effective prompts to reuse
- Track how you interact with Claude
- Learn what instructions work best

---

## Command Comparison

### When to Use Each Command

| Situation | Command | Why |
|-----------|---------|-----|
| Starting work session | /q-begin | Load context, see last session |
| Long session (90+ min) | /q-checkpoint | Insurance against data loss |
| Want to check progress | /q-status | See session state, context health |
| Finishing work (normal) | /q-end | Full documentation + commit |
| Context critical (>90%) | /q-save | Fast exit, still captures essentials |
| Context high (70-90%) | /q-compact | Free space while preserving work |
| Want to verify success | /q-verify | Check all files created correctly |
| Mid-session commit | /q-commit | Save work without full documentation |
| Reflecting on session | /q-learnings | Capture insights and decisions |
| Save prompts for reuse | /q-prompts | Build prompt library |
| CLAUDE.md too long | /q-pare | Optimize context loading |

---

## Command Relationships

### Typical Session Flow
```
Q-BEGIN
   ↓
Work...
   ↓
Q-STATUS (check progress)
   ↓
Work...
   ↓
Q-CHECKPOINT (90 min mark)
   ↓
Work...
   ↓
Q-END (finish session)
   ↓
Q-VERIFY (confirm success)
```

### Alternative Flows

**Quick Session:**
```
Q-BEGIN → Work... → Q-END
```

**Long Session with Context Pressure:**
```
Q-BEGIN → Work... → Q-CHECKPOINT → Work... → Q-SAVE (context critical)
```

**Multiple Checkpoints:**
```
Q-BEGIN → Work → Q-CHECKPOINT → Work → Q-CHECKPOINT → Work → Q-END
```

---

## Error Recovery

### If Q-END Fails

**Use individual commands:**
```
Q-DUMP      → Create transcript manually
Q-COMMIT    → Commit changes manually
Then manually create session notes or skip
```

### If Files Missing

**Use Q-VERIFY to diagnose:**
```
Q-VERIFY
   ↓
Report shows what's missing
   ↓
Re-run failed command
```

### If Git Issues

**Check git status:**
```bash
git status
git log -1
```

Then re-run Q-COMMIT or fix manually.

---

## Advanced Usage

### Combining Commands

**Checkpoint then verify:**
```
Q-CHECKPOINT
Q-VERIFY
```

**Status check before end:**
```
Q-STATUS
[Review recommendations]
Q-END
```

### Scripting Support

All commands can be used in documented workflows:
```markdown
Daily workflow:
1. Q-BEGIN
2. Work for 90 minutes
3. Q-CHECKPOINT
4. Continue work
5. Q-STATUS (before ending)
6. Q-END
7. Q-VERIFY
8. git push
```

---

## Customization Guide

### Adding New Commands

**Template:**
```markdown
## Q-[COMMANDNAME]

When the user types `Q-[COMMANDNAME]`:

1. First step
2. Second step
3. Third step

**Purpose:** What this command does
```

Add to `GeneratedMDs/SHORTCUTS.md` and use immediately.

### Modifying Existing Commands

**Find command section in SHORTCUTS.md:**
```markdown
## Q-END

When the user types `Q-END`:
[...existing steps...]
```

**Add new step:**
```markdown
**STEP 4.5: Run Tests**
1. Execute: npm test
2. ✅ VERIFY: All tests pass
3. Report results
```

Save and use - next Q-END will run tests.

---

## Summary

The Q-Command System provides **15 commands** organized into:

**Session Management:** /q-begin, /q-end, /q-save

**Progress Tracking:** /q-checkpoint, /q-status, /q-verify, /q-compact

**Documentation:** /q-dump, /q-learnings, /q-prompts

**Git:** /q-commit

**Optimization:** /q-pare

**Setup:** /q-setup-domain, /q-reconfigure-domain, /q-upgrade

All commands:

- Available as native slash commands (type `/q-` and Tab)
- Include verification
- Report explicitly
- Degrade gracefully
- Are customizable

---

**Next:** See [FEATURES.md](FEATURES.md) for detailed feature documentation, or [ARCHITECTURE.md](ARCHITECTURE.md) for how the system works internally.
