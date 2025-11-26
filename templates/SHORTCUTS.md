# SHORTCUTS.md

This file contains custom shortcut commands for this repository.

**Last Updated:** 2025-11-26
**Version:** 1.0 (First public release)

---

## FILE NAMING CONVENTIONS

All generated files follow consistent naming to prevent collisions when multiple team members work on the same day:

**Format:** `YYYY-MM-DD-HHmm-[PersonName].md`
- `YYYY-MM-DD`: Date (sortable)
- `HHmm`: 24-hour time (no colon, underscore removed for consistency)
- `[PersonName]`: Gabriel, Guy, Fraser, or Brian

**Examples:**
- `2025-11-13-0913-Gabriel.md` (Gabriel's session starting at 9:13 AM)
- `2025-11-13-1200-Guy.md` (Guy's session starting at 12:00 PM)
- `2025-11-13-1430-Fraser.md` (Fraser's session starting at 2:30 PM)

**Benefits:**
- Sortable by date and time
- No file name collisions
- Clear who worked when
- Multiple people can work same day

---

## DIRECTORY STRUCTURE

```
GeneratedMDs/
  transcripts/
    2025-11-13-0913-Gabriel.md    ← Session transcripts
    2025-11-13-1200-Guy.md

  checkpoints/
    2025-11-13-1130-Gabriel.md    ← Mid-session checkpoints
    2025-11-13-1345-Guy.md

  session-notes/
    2025-11-13-0913-Gabriel.md    ← Session summaries
    2025-11-13-1200-Guy.md

  SHORTCUTS.md                     ← This file (metadata at root)
```

**Why this structure:**
- All generated files organized by type
- Easy to find files by person or date
- Clear separation of concerns
- Consistent naming across all types

---

## Q-COMMIT

When the user types `Q-COMMIT`:

1. Save all unsaved changes anywhere in the codebase
2. Stage all changes (`git add .`)
3. Commit all changes to local git with a concise message and point-form highlights of changes
4. Include co-author attribution: `Co-Authored-By: Claude <noreply@anthropic.com>`
5. Do NOT push to remote unless explicitly requested

Example commit message format:
```
Brief summary of changes

- Point 1: description
- Point 2: description
- Point 3: description

Co-Authored-By: Claude <noreply@anthropic.com>
```

**Verification:**
- After commit, verify with `git status` (should show clean working tree)
- Report commit hash and message to user

---

## Q-DUMP

When the user types `Q-DUMP`:

**STEP 1: Check for Continued Sessions (CRITICAL)**

1. Look for message: "This session is being continued from a previous conversation"
2. If present, this is a **continued session** - conversation history was auto-compacted
3. The conversation summary contains ALL work from before auto-compact
4. You MUST document the ENTIRE session (summary + current context) as ONE unified session

**STEP 2: Determine Session Start Time**

- **Regular session:** Use current session start time
- **Continued session:** Use original session start time from conversation summary
- Example: If session started 7:00 AM, auto-compacted at 8:30 AM, continued until 9:15 AM → Use 7:00 AM as start time

**IMPORTANT - Timestamp Generation:**
- ALWAYS generate timestamp using: `date +"%Y-%m-%d-%H%M"`
- This ensures LOCAL 24-hour time format (e.g., 2025-11-24-0946)
- Run this bash command ONCE at session start and reuse the value

**STEP 3: Create Session Transcript File**

1. Create subdirectory if needed: `GeneratedMDs/transcripts/` (use Bash: `mkdir -p`)
2. **Generate timestamp:** Run `TIMESTAMP=$(date +"%Y-%m-%d-%H%M")` to get session start time in local timezone
3. **File naming format: `GeneratedMDs/transcripts/YYYY-MM-DD-HHmm-[PersonName].md`**
   - Example: `GeneratedMDs/transcripts/2025-11-13-0913-Gabriel.md`
   - Use ORIGINAL session start time (not continuation time)
   - Use actual participant's name (Gabriel, Guy, Fraser, Brian)
   - 24-hour time format with NO colon (0913, not 09:13)
   - ALWAYS follow this exact format

**STEP 4: Document Complete Session**

**For CONTINUED sessions:**
- Read conversation summary thoroughly
- Document ALL accomplishments from summary
- Add accomplishments from current context
- Include ALL files created/modified throughout entire session
- Calculate total session duration (start to now)
- Treat as ONE unified session, not "previous + current"

**For REGULAR sessions:**
- Document current conversation in chronological order
- Each user command/prompt
- Concise summary of actions taken or answers provided

**STEP 5: Content Requirements**

- Major accomplishments (all, including from summary if continued)
- Files created/modified (complete list)
- Key decisions made (throughout entire session)
- Conversation flow summary
- Session metrics (duration, deliverables, etc.)
- Format as clear development log/transcript
- Reference code effects, don't include full code blocks

**STEP 6: Verification**

- ✅ VERIFY: File exists at correct path
- ✅ VERIFY: File has content >100 lines (for substantial sessions)
- Report to user: "✅ Transcript created: GeneratedMDs/transcripts/[filename]"

**WARNING:** If you document only current context in a continued session, you will lose all major work from before auto-compact. This is a CRITICAL failure. Always check for continuation first.

---

## Q-LEARNINGS

When the user types `Q-LEARNINGS`:

1. Summarize in the chat (not in a file) the key learnings discovered during the current session
2. Focus on insights, decisions, best practices, or important discoveries made
3. Present as a concise bulleted list
4. Include both technical and workflow/process learnings

---

## Q-BEGIN

When the user types `Q-BEGIN`:

1. Read `CLAUDE.md` for quick context refresh
2. Review the most recent session notes:
   - Check `GeneratedMDs/session-notes/*-[PersonName].md`
   - Sort by date/time, read most recent file matching your name
3. Review current status from `work-plan/work-plan.md`:
   - Check blocker status
   - Review recent progress
   - Identify pending tasks
4. Provide a brief summary:
   - What was accomplished last session
   - Current blocker status
   - Open questions or decisions needed
5. Ask the user: "What would you like to work on today?"
6. Set up TodoWrite if the work involves multiple tasks

**Purpose:** Start each session with full context and clear direction.

---

## Q-END

When the user types `Q-END`:

**CRITICAL: This is a multi-step operation with verification. Execute each step completely before proceeding.**

**STEP 1: Check for Continued Sessions**

1. Look for message: "This session is being continued from a previous conversation"
2. If present, read conversation summary thoroughly - it contains all work before auto-compact
3. Check for any Q-CHECKPOINT files from this session - merge that information too
4. You MUST document ENTIRE session (summary + checkpoints + current context) as ONE unified session

**STEP 2: Create Session Transcript**

1. Create subdirectory if needed: `mkdir -p "GeneratedMDs/transcripts"`
2. **Generate timestamp:** Run `TIMESTAMP=$(date +"%Y-%m-%d-%H%M")` to get session start time in LOCAL timezone (24-hour format)
3. Determine participant name (e.g., Gabriel, Guy, Fraser, Brian)
4. Create file: `GeneratedMDs/transcripts/${TIMESTAMP}-[PersonName].md`
   - Use ORIGINAL session start time (if continued session, adjust timestamp accordingly)
   - Document ALL work including from summary and checkpoints
5. Write complete transcript following Q-DUMP specifications
6. ✅ VERIFY: File exists and has substantial content
7. Report to user: "✅ Transcript created: [filename]"

**STEP 3: Create Session Notes**

1. Create subdirectory if needed: `mkdir -p "GeneratedMDs/session-notes"`
2. **Use same timestamp** from Step 2 (same session, same timestamp for all files)
3. Create file: `GeneratedMDs/session-notes/${TIMESTAMP}-[PersonName].md`
3. Write session summary including:
   - Key accomplishments (ALL from entire session)
   - Decisions made (ALL)
   - Files created/modified (ALL)
   - Blocker status updates
   - Open questions
   - Next steps
4. ✅ VERIFY: File exists and has content
5. Report to user: "✅ Session notes created: [filename]"

**STEP 4: Update Work Plan** (if applicable)

1. Check if blockers changed or milestones completed
2. If yes: Update `work-plan/work-plan.md`
   - Update blocker status
   - Add completed milestones
   - Document new decisions or action items
   - Add to Recent Progress section if significant work done
3. ✅ VERIFY: Changes saved (if updated)
4. Report to user: "✅ Work plan updated" or "ℹ️ Work plan unchanged"

**STEP 5: Commit All Changes**

1. Stage all changes: `git add .`
2. Commit with descriptive message + bullets
3. Include: `Co-Authored-By: Claude <noreply@anthropic.com>`
4. ✅ VERIFY: `git status` shows clean working tree
5. Report commit hash and message to user: "✅ Changes committed: [message]"

**STEP 6: Final Report**

1. Show user summary of what was created:
   ```
   ✅ Session Complete!

   Transcript: GeneratedMDs/transcripts/[filename]
   Session Notes: GeneratedMDs/session-notes/[filename]
   Work Plan: [Updated/Unchanged]
   Git: Committed ([N] files changed)

   Ready to push! Run `git push` when ready.
   ```

**ERROR HANDLING:**

If any step fails:
1. Report specific error to user immediately
2. Don't continue silently
3. Complete what is possible
4. Report clearly what succeeded vs what failed
5. Provide manual steps for failed items

**Purpose:** Systematically wrap up session with all documentation updated and changes committed locally.

**Note:** User maintains control - `git push` is always manual.

---

## Q-SAVE

When the user types `Q-SAVE`:

**Purpose:** Lightweight session wrap-up when context is constrained or quick exit needed.

**What it does:**

1. **Generate timestamp:** Run `TIMESTAMP=$(date +"%Y-%m-%d-%H%M")` to get session start time in LOCAL timezone
2. Create basic transcript in `GeneratedMDs/transcripts/${TIMESTAMP}-[PersonName].md`
   - Lightweight version (key accomplishments + files changed)
   - Skip detailed chronology
2. Commit all changes (Q-COMMIT)
3. Report to user:
   ```
   ✅ Quick Save Complete!

   Transcript: GeneratedMDs/transcripts/[filename]
   Git: Committed

   Note: Skipped session notes and work plan updates.
   Run Q-VERIFY to see what was saved.
   ```

**What it skips:**
- Detailed session notes (user can add later if needed)
- Work plan updates (user can do manually)

**When to use:**
- Context usage >90%
- Need to wrap up quickly
- Don't need comprehensive documentation
- Emergency exit scenario

---

## Q-CHECKPOINT

When the user types `Q-CHECKPOINT`:

**Purpose:** Create mid-session progress snapshot as insurance against auto-compact information loss.

**When to use:**
- Context usage getting high (conversation slowing, responses taking longer)
- After completing major milestone mid-session
- Before starting next big chunk of work
- User wants insurance that work won't be lost if auto-compact happens

**What to do:**

**STEP 1: Create checkpoint directory if needed**
```bash
mkdir -p "GeneratedMDs/checkpoints"
```

**STEP 2: Create checkpoint file**
- **Generate timestamp:** Run `CHECKPOINT_TIME=$(date +"%Y-%m-%d-%H%M")` to get CURRENT time in LOCAL timezone
- Format: `GeneratedMDs/checkpoints/${CHECKPOINT_TIME}-[PersonName].md`
- Example: `GeneratedMDs/checkpoints/2025-11-13-1130-Gabriel.md`
- Use current time for checkpoint (NOT session start time - checkpoints use their own timestamp)

**STEP 3: Document in checkpoint file**
- Session start time (when session originally began)
- Checkpoint time (current time)
- Accomplishments so far (bullet list)
- Files created/modified (list)
- Key decisions made
- Current status/next steps
- Estimated context usage (if known)

**STEP 4: Keep it lightweight**
- High-level summaries, not full details
- Focus on "what" not "how"
- Typically 100-200 lines, not 500+

**STEP 5: Verification**
- ✅ VERIFY: File exists in GeneratedMDs/checkpoints/
- ✅ VERIFY: File has content
- Report to user:
  ```
  ✅ Checkpoint saved at [HH:MM]

  Location: GeneratedMDs/checkpoints/[filename]
  Session progress preserved (insurance against auto-compact)

  Continue working - Q-END will merge checkpoint + final work.
  ```

**How Q-END uses checkpoints:**
- Checks for checkpoint files from same session (same date, same person)
- Merges checkpoint info + current context = complete session notes
- Provides insurance if auto-compact summary is incomplete

**Benefits:**
- User control over when to save progress
- Insurance against information loss
- Works even if auto-compact summary fails
- Minimal overhead (lightweight, fast)

**Example workflow:**
```
User: Q-BEGIN          → Start session at 9:00 AM
[Work 1.5 hours - build presentation]
User: Q-CHECKPOINT     → Save progress at 10:30 AM
[Context auto-compacts at 11:00 AM]
[Continue working - polish presentation]
User: Q-END at 12:00   → Merges checkpoint + current work = complete docs
```

---

## Q-STATUS

When the user types `Q-STATUS`:

**Purpose:** Show current session state and provide recommendations.

**What to display:**

```
=== Session Status ===

Session started: [YYYY-MM-DD HH:MM] ([X] hours [Y] minutes ago)
Participant: [PersonName]
Session type: [Regular / Continued from auto-compact at HH:MM]

Progress:
- Accomplishments: [N] major items
- Files created: [N]
- Files modified: [N]
- Key decisions: [N]

Checkpoints:
- Last checkpoint: [HH:MM] ([X] minutes ago) [or "None yet"]
- Checkpoint location: GeneratedMDs/checkpoints/[filename]

Git Status:
- Uncommitted changes: [Yes/No] ([N] files)
- Commits ahead of origin: [N]

Context Health:
- Estimated usage: [percentage]% [OK/HIGH/CRITICAL]
- Messages in conversation: [N]
- Time since last checkpoint: [X] minutes

Recommendations:
- [If context >70%] ⚠️ Consider Q-CHECKPOINT soon to preserve progress
- [If >90 min without checkpoint] Consider Q-CHECKPOINT for insurance
- [If session >2 hours] Consider wrapping up with Q-END soon
- [If context >90%] ⚠️ Context critical - use Q-SAVE for quick exit
- [If continued session] Remember to document ALL work including from summary

Next steps:
- [List of pending tasks from TodoWrite if active]
- [or "No pending tasks"]
```

**Implementation notes:**
- Estimate context usage based on conversation length if possible
- Count accomplishments from current session context
- Check for checkpoint files in `GeneratedMDs/checkpoints/` from today with same person name
- Check git status for uncommitted changes
- Be concise but informative
- Provide actionable recommendations

**When users should run this:**
- Feeling uncertain about session progress
- Want to know if checkpoint is needed
- Long session and want status check
- Before committing to another big task

---

## Q-VERIFY

When the user types `Q-VERIFY`:

**Purpose:** Check that Q-END, Q-CHECKPOINT, or Q-SAVE actually worked correctly.

**What it does:**

1. Check for transcript files in `GeneratedMDs/transcripts/` from today
   - Filter by current user's name
   - Show most recent
2. Check for session notes in `GeneratedMDs/session-notes/` from today
   - Filter by current user's name
   - Show most recent
3. Check for checkpoints in `GeneratedMDs/checkpoints/` from today
   - Filter by current user's name
   - List all found
4. Check git status
   - Uncommitted changes?
   - Commits ahead of origin?
   - Last commit message and time
5. Report findings:
   ```
   === Verification Report ===

   ✅ Transcript: Found GeneratedMDs/transcripts/2025-11-13-0913-Gabriel.md
      - Created: [timestamp]
      - Size: [N] lines

   ✅ Session Notes: Found GeneratedMDs/session-notes/2025-11-13-0913-Gabriel.md
      - Created: [timestamp]
      - Size: [N] lines

   ✅ Checkpoints: Found [N] checkpoint(s)
      - 2025-11-13-1030-Gabriel.md (10:30 AM)
      - 2025-11-13-1145-Gabriel.md (11:45 AM)

   ✅ Git: Committed, clean working tree
      - Ahead of origin by [N] commit(s)
      - Last commit: "[message]" ([X] minutes ago)

   ⚠️ Missing: [list any expected files not found]

   Status: [All Clear / Issues Detected]
   ```

**When to use:**
- After Q-END to verify it worked completely
- After Q-CHECKPOINT to verify it saved
- After Q-SAVE to see what was captured
- When resuming session to see what exists from previous work
- Debugging: "Did my Q-END actually work?"

---

## Q-SETUP-DOMAIN

When the user types `Q-SETUP-DOMAIN`:

**Purpose:** Set up domain-specific Q-Command System infrastructure adapted to project context.

**OVERVIEW:**

This command configures the Q-Command System based on contextual questions about the project, using **progressive scaffolding** (not fixed tiers). The system adapts to:
- Starting point (what exists now)
- Project goal (what you're creating)
- Experience level (how much guidance needed)
- Collaboration context (solo vs team)
- Special needs (visual, research, source materials)

**PROCESS:**

**STEP 1: INTRODUCTION**

Present introduction to user:
```
I'll help you set up a domain-specific Q-Command System for your project.
This will configure the right infrastructure, tools, and workflows based on
your specific context and goals.

Let's start with some questions to understand your project...
```

**STEP 2: DOMAIN SELECTION**

Ask user to select domain:
```
What domain are you working in?

a) Screenplay/TV Writing - Screenplays, pilots, TV series
b) Software Development - Code, applications, systems
c) Academic/Research - Papers, literature reviews, research
d) Legal - Contracts, briefs, legal research
e) Other - [Let me describe my domain]
```

Store answer in temporary variable for configuration.

**STEP 3: CONTEXTUAL QUESTIONS (Domain-Specific)**

**For "Screenplay/TV Writing" domain, ask these 7 questions:**

**Q1: Starting Point**
```
What are you starting with today?

a) Nothing yet - I have an idea but no written materials
b) Source material - I have source texts/references to adapt from
c) Basic documents - I have a vision doc, treatment, or notes
d) Pitch bible - I have a complete pitch bible
e) Partial work - I've already started writing scenes or outlines
f) Let me describe my situation: [free text]
```

**Q2: Project Goal**
```
What's your goal for this project?

a) Explore the concept - Create proof-of-concept outlines or treatments
b) Pitch package - Create pitch bible and sample materials for pitching
c) Complete pilot - Write a full pilot episode screenplay
d) Full season - Write multiple episodes (season arc)
e) Ongoing series - Long-running development (multiple seasons)
f) Not sure yet - Help me figure out the right goal
```

**Q3: Experience Level**
```
What's your level of experience with screenwriting?

a) Complete beginner - Never written a screenplay before
b) Learning - Written some, but not professionally
c) Intermediate - Some professional experience or formal training
d) Advanced - Extensive professional experience

Note: This helps me calibrate how much guidance and structure to provide.
```

**Q4: Collaboration Context**
```
Will you be working solo or with collaborators?

a) Solo - Just me and Claude
b) With occasional feedback - I'll share drafts for feedback sometimes
c) Active collaboration - Regular collaboration with writing partner(s)
d) Team/professional - Multiple stakeholders (producers, directors, etc.)
```

**Q5: Visual Development Needs**
```
Do you need visual development for this project?

a) Yes - Need to create character/location visual references (concept art, etc.)
b) Maybe later - Not now, but might need it eventually
c) No - Text-only project
d) Already have - Existing visual materials I'll reference
```

**Q6: Source Material Complexity**
```
Do you have source materials you're adapting or referencing?

a) No source materials - Original work
b) Single source - One canonical reference (book, historical event, etc.)
c) Multiple equal sources - Research from various sources, all equally valid
d) Multiple sources with hierarchy - Some are canonical, others are inspirational
e) Complex research - Academic/historical research with citations needed
```

**Q7: Repository State**
```
Are you setting this up in:

a) A new, empty repository - Starting from scratch
b) An existing repository with some files - Need to organize what's there
c) An existing Q-Command repository - Upgrading or adding domain features
```

**For other domains:** Adapt questions as appropriate to the domain's specific needs.

**STEP 4: HANDLE UNCERTAIN ANSWERS**

If user answers "not sure" or "help me decide" to multiple questions:
- Don't force decision
- Offer to set up minimal viable infrastructure
- Explain: "We'll start simple and add more as your project evolves"
- Set up more progressive triggers to watch for signals

If answers seem contradictory (e.g., beginner + full season):
- Ask clarifying question
- Present options (e.g., "Start with pilot focus" vs "Full season with high support")
- Help user think through timeline and realistic scope

**STEP 5: GENERATE CONFIGURATION PROFILE**

Based on answers, generate configuration profile and store in `.q-system/domain-config.json`:

```json
{
  "domain": "[screenplay|software|research|legal|other]",
  "config_name": "[descriptive-name]",
  "timestamp": "YYYY-MM-DDTHH:MM:SSZ",
  "answers": {
    "starting_point": "[answer_key]",
    "goal": "[answer_key]",
    "experience": "[beginner|learning|intermediate|advanced]",
    "collaboration": "[solo|occasional_feedback|active|professional]",
    "visual_needs": "[yes|maybe|no|have_it]",
    "source_complexity": "[none|single|multiple_equal|multiple_hierarchy|complex]",
    "repo_state": "[new|existing_files|existing_q_system]"
  },
  "infrastructure": {
    "directories": ["[list of directories to create]"],
    "skills": ["[list of skills to install]"],
    "agents": ["[list of agents to install]"],
    "custom_commands": ["[list of Q-commands to add]"],
    "collaborative_mode": "[structural|narrative|minimal|off]",
    "source_framework": "[none|two_layer|hierarchy|academic]",
    "session_notes_strategy": "[individual|consolidated|multi_user]",
    "quality_level": "[high_scaffolding|medium|light|minimal]"
  },
  "triggers": [
    {
      "condition": "[trigger condition]",
      "offer": "[what to offer]",
      "priority": "[high|medium|low]"
    }
  ]
}
```

**STEP 6: SHOW CONFIGURATION PREVIEW**

Present configuration to user:
```
Based on your answers, here's what I'll set up:

📁 Directory Structure:
- [list directories with brief explanations]

🛠️ Skills & Agents:
- [list skills/agents with when to use them]

⚙️ Custom Q-Commands:
- [list custom commands with usage]

🤝 Collaborative Mode:
- [explain configured mode]

📚 Source Framework:
- [explain if applicable]

🔔 Progressive Triggers:
- [list what will be offered later as project grows]

Would you like me to proceed with this setup?
[Yes / Customize first / Cancel]
```

**STEP 7: SETUP EXECUTION**

**7.1: Create Directory Structure**
- Create `.q-system/` directory
- Create only directories needed for current configuration
- Don't create "just in case" directories

**7.2: Install Core Q-Command Files**
- `CLAUDE.md` (with domain-specific sections)
- `SESSION-CHECKLIST.md`
- `GeneratedMDs/SHORTCUTS.md` (base v2.0 + domain customizations)
- `.gitignore` (for GeneratedMDs if not exists)

**7.3: Install Domain-Specific Skills**
Conditional based on configuration:
- IF visual_needs = yes → Install Midjourney_Prompt_Skill.md or Visual_Development_Skill.md
- IF source_complexity requires → Install source fidelity framework docs

**7.4: Install Agents**
Conditional based on configuration:
- IF goal = complete_pilot/full_season → Install scene-prep-agent-instructions.md
- IF starting_point = source_material → Install source-mining-agent.md

**7.5: Add Custom Q-Commands to SHORTCUTS.md**
Conditional based on configuration:
- IF needs Q-SCENE → Add Q-SCENE command spec
- IF source_complexity = multiple_hierarchy → Add Q-RESEARCH command with hierarchy enforcement

**7.6: Configure Collaborative Mode**
Add to top of SHORTCUTS.md or in CLAUDE.md based on experience level

**7.7: Create FILE-STRUCTURE-MAP.md (if needed)**
- IF starting_point = pitch_bible OR existing_repo → Create immediately
- ELSE → Set trigger for later (when repo reaches ~30 files)

**7.8: Save Configuration Profile**
- Write `.q-system/domain-config.json` with complete configuration
- Include timestamps and all answers

**STEP 8: CREATE DOCUMENTATION**

**8.1: Create DOMAIN-SETUP-SUMMARY.md**

Write `docs/DOMAIN-SETUP-SUMMARY.md`:
```markdown
# Your Q-[Domain] System Setup

**Configuration:** [Description]
**Date:** [YYYY-MM-DD]

## What I've Set Up For You

### Directory Structure
[List created directories with explanations]

### Skills Available
[List installed skills with when to use them]

### Agents Available
[List installed agents with how to invoke them]

### Custom Q-Commands
[List custom commands with usage examples]

### Collaborative Mode
[Explain configured collaborative mode]

## What Happens Next

As your project grows, I'll offer additional infrastructure:
- [List progressive triggers and what they offer]

## Getting Started

Recommended first steps:
1. Run Q-BEGIN to start your first session
2. [Contextual recommendation based on starting_point]
3. [Contextual recommendation based on goal]

## Need Help?

Type Q-STATUS at any time to see:
- Current session state
- Available commands and tools
- Recommendations for next steps
```

**8.2: Create Quick Reference Card**

Write `docs/QUICK-REFERENCE.md`:
```markdown
# Quick Reference: Your Q-[Domain] Commands

## Core Q-Commands (Always Available)
- Q-BEGIN - Start session
- Q-END - Complete session with documentation
- Q-CHECKPOINT - Save mid-session progress
- Q-STATUS - See current state and recommendations
- Q-VERIFY - Check that files were created correctly
- Q-SAVE - Quick exit (lightweight)

## Your Custom Q-Commands
[List only commands installed for this configuration]

## Agents You Can Invoke
[List only agents installed for this configuration]

## Skills Reference
[List only skills installed for this configuration]
```

**STEP 9: VERIFICATION & FINAL REPORT**

1. ✅ VERIFY: All directories created
2. ✅ VERIFY: All files written successfully
3. ✅ VERIFY: Configuration profile saved
4. ✅ VERIFY: Git status (should show new files)

Report to user:
```
✅ Domain Setup Complete!

Configuration: [name]
Profile: .q-system/domain-config.json

Created:
- [N] directories
- [N] skills
- [N] agents
- [N] custom Q-commands
- Setup documentation

Documentation:
- Setup Summary: docs/DOMAIN-SETUP-SUMMARY.md
- Quick Reference: docs/QUICK-REFERENCE.md

Next steps:
1. Review docs/DOMAIN-SETUP-SUMMARY.md to understand your setup
2. Run Q-BEGIN to start your first session
3. [Contextual first task recommendation]

Ready to start! 🚀
```

**STEP 10: OFFER TO START FIRST SESSION**

Ask user:
```
Would you like me to run Q-BEGIN now to start your first session?
[Yes / No, I'll start later]
```

If yes, execute Q-BEGIN automatically.

**QUALITY CHECKS:**
- [ ] All questions answered (or explicitly deferred)
- [ ] Configuration profile makes sense (no contradictions)
- [ ] Infrastructure matches configuration
- [ ] User understands what was set up
- [ ] User knows how to get started
- [ ] Triggers are appropriate for context
- [ ] All files verified to exist
- [ ] Documentation is clear and helpful

**ERROR HANDLING:**
- If any file creation fails, report specifically what failed
- Complete what is possible, report what couldn't be done
- Provide manual steps for failed items
- Don't fail silently

---

## Q-RECONFIGURE-DOMAIN

When the user types `Q-RECONFIGURE-DOMAIN`:

**Purpose:** Update domain configuration when project needs change.

**When to Use:**
- Project goals have evolved (concept → pilot, pilot → season)
- Experience level changed (more confident now)
- Collaboration context changed (adding team members)
- Need infrastructure that wasn't set up initially

**PROCESS:**

**STEP 1: READ CURRENT CONFIGURATION**
- Load `.q-system/domain-config.json`
- Understand current setup
- Identify what's currently installed

**STEP 2: IDENTIFY CHANGES**
- Ask: "What's changed in your project or needs?"
- Re-ask relevant questions from Q-SETUP-DOMAIN
- Allow user to keep previous answers or change them
- Compare new answers to old answers

**STEP 3: ANALYZE IMPACT**
- Determine what needs to be added
- Determine what needs to be modified
- Determine what should be preserved
- Estimate effort/disruption

**STEP 4: SHOW BEFORE/AFTER COMPARISON**

Present comparison:
```
=== Configuration Changes ===

CURRENT → NEW:
- Starting point: [old] → [new]
- Goal: [old] → [new]
- Experience: [old] → [new]
[etc for changed answers]

INFRASTRUCTURE CHANGES:

Will Add:
- [new directories]
- [new skills]
- [new agents]
- [new commands]

Will Modify:
- [existing items to update]

Will Preserve:
- [everything staying the same]

Estimated Impact: [Low/Medium/High]
```

**STEP 5: GET PERMISSION**
- Show preview of changes
- Ask explicit permission
- Allow user to:
  - Accept all changes
  - Modify/customize changes
  - Cancel reconfiguration

**STEP 6: EXECUTE UPGRADE**
- Add new infrastructure (directories, files)
- Modify existing infrastructure carefully
- **NEVER delete or move user's work**
- Update `.q-system/domain-config.json`
- Update SHORTCUTS.md with new commands (if applicable)
- Update CLAUDE.md with new sections (if applicable)

**STEP 7: UPDATE DOCUMENTATION**
- Update `docs/DOMAIN-SETUP-SUMMARY.md`
- Update `docs/QUICK-REFERENCE.md`
- Create `docs/RECONFIGURATION-LOG-YYYY-MM-DD.md` with:
  - What changed
  - Why it changed
  - What was added/modified
  - What was preserved

**STEP 8: VERIFY & REPORT**
- Run verification checks
- Report to user:
  ```
  ✅ Reconfiguration Complete!

  Updated configuration: .q-system/domain-config.json
  Reconfiguration log: docs/RECONFIGURATION-LOG-[date].md

  Changes:
  - Added: [N] items
  - Modified: [N] items
  - Preserved: All existing work

  Updated documentation:
  - docs/DOMAIN-SETUP-SUMMARY.md
  - docs/QUICK-REFERENCE.md

  Your work is safe - all files preserved.
  Review the reconfiguration log for details.
  ```

**QUALITY CHECKS:**
- [ ] No work lost or damaged
- [ ] Configuration profile updated
- [ ] Documentation reflects changes
- [ ] User understands new capabilities
- [ ] All new files created successfully
- [ ] Existing customizations preserved

---

## Q-COMPACT

When the user types `Q-COMPACT`:

**Purpose:** Safely free up context space by saving progress first, then compacting. This protects your work while giving you more room to continue.

**Why use Q-COMPACT instead of /compact directly:**

- `/compact` alone summarizes and loses detail
- `Q-COMPACT` saves a checkpoint FIRST, then compacts
- Your detailed work history is preserved in the checkpoint file
- You get more context space AND keep your work safe

**What to do:**

**STEP 1: Show current context usage**

Report to user:

```text
📊 Context Status (Before)
Run /context to see current usage...
```

Then guide user or describe the context level if visible.

**STEP 2: Create checkpoint (preserve work)**

Execute Q-CHECKPOINT internally:

1. Create checkpoint file with all progress so far
2. Verify checkpoint was saved
3. Report: "✅ Progress saved to checkpoint"

**STEP 3: Run /compact with instructions**

Tell the user to run:

```text
/compact Preserve: key decisions, files changed, current task status. This is a Q-COMPACT operation - checkpoint already saved.
```

Or if Claude can execute it directly, do so.

**STEP 4: Report results**

```text
📊 Context Status (After)

✅ Q-COMPACT Complete!

Checkpoint saved: GeneratedMDs/checkpoints/[filename]
Context compacted: More space available

Your detailed work is preserved in the checkpoint.
Q-END will merge checkpoint + remaining work into complete session notes.

💡 Tip: Run /context to see your new context usage.
```

**When to use Q-COMPACT:**

- Context usage above 70% (session slowing down)
- After `/context` shows high usage
- Before starting a large new task
- When Claude's responses are getting slower

**Benefits:**

- Frees context space for more work
- Preserves detailed history in checkpoint
- User-controlled (not auto-compact surprise)
- Q-END will merge everything together

**Example workflow:**

```text
[Working for 90 minutes, context getting full]
User: /context              → Shows 75% usage
User: Q-COMPACT             → Saves checkpoint, then compacts
                            → Now at ~30% usage
[Continue working with fresh context]
User: Q-END                 → Merges checkpoint + new work = complete docs
```

---

## Q-UPGRADE

When the user types `Q-UPGRADE`:

**Purpose:** Check current Q-Command System version and guide upgrade to latest version.

**STEP 1: Read Current Version**

1. Read this SHORTCUTS.md file
2. Find the line: `**Version:** X.X`
3. Extract version number
4. Report to user:
   ```
   Current Q-Command System version: [version]
   Installed at: GeneratedMDs/SHORTCUTS.md
   ```

**STEP 2: Ask for Latest Version**

Ask user:
```
To check for upgrades, I need the latest SHORTCUTS.md.

Option A: Tell me the latest version number (if you know it)
Option B: Paste the header of the new SHORTCUTS.md (first 10 lines)
Option C: Provide path to downloaded SHORTCUTS.md file

Which would you like to do?
```

**STEP 3: Compare Versions**

Once you have both versions:
- If current >= latest: Report "You're up to date!" and stop
- If current < latest: Continue to Step 4

**STEP 4: Check for Custom Commands**

1. Read current SHORTCUTS.md completely
2. Identify standard Q-commands (Q-BEGIN, Q-END, Q-CHECKPOINT, Q-STATUS, Q-VERIFY, Q-SAVE, Q-DUMP, Q-COMMIT, Q-LEARNINGS, Q-COMPACT, Q-SETUP-DOMAIN, Q-RECONFIGURE-DOMAIN, Q-UPGRADE)
3. Find any ADDITIONAL `## Q-` sections that are NOT in the standard list
4. These are custom commands the user added

Report:
```
=== Upgrade Analysis ===

Current version: [X.X]
Latest version: [Y.Y]

Custom commands found: [N]
[List any custom commands, or "None"]

Standard commands to update: [list what changed between versions]
```

**STEP 5: Offer Upgrade Options**

```
How would you like to proceed?

Option 1: Full replacement (recommended if no custom commands)
   - Replace SHORTCUTS.md entirely with new version
   - Fast and clean

Option 2: Guided merge (recommended if you have custom commands)
   - I'll update standard commands
   - I'll preserve your custom commands
   - You review the result

Option 3: Manual upgrade
   - I'll show you exactly what changed
   - You make the edits yourself

Which option? [1/2/3]
```

**STEP 6: Execute Upgrade**

**For Option 1 (Full replacement):**
1. Ask user to provide new SHORTCUTS.md content (paste or file path)
2. Back up current: Copy to `GeneratedMDs/SHORTCUTS-backup-YYYY-MM-DD.md`
3. Replace SHORTCUTS.md with new content
4. Verify new file exists and has content
5. Report success

**For Option 2 (Guided merge):**
1. Ask user to provide new SHORTCUTS.md content
2. Back up current: Copy to `GeneratedMDs/SHORTCUTS-backup-YYYY-MM-DD.md`
3. Start with new SHORTCUTS.md as base
4. Find user's custom commands in backup
5. Append custom commands before VERSION HISTORY section
6. Write merged file
7. Show user what was preserved
8. Verify file exists

**For Option 3 (Manual):**
1. List what's new in latest version (from CHANGELOG or version history)
2. Explain each change
3. Tell user which sections to update
4. Offer to show diff if helpful

**STEP 7: Verify and Report**

```
=== Upgrade Complete ===

Previous version: [X.X] (backed up to SHORTCUTS-backup-YYYY-MM-DD.md)
New version: [Y.Y]

Custom commands preserved: [list or "N/A"]

Next steps:
1. Run Q-BEGIN to verify everything works
2. Delete backup file when satisfied

Upgrade successful!
```

**ERROR HANDLING:**

- If backup fails: Stop and report error
- If write fails: Restore from backup
- If custom command merge is ambiguous: Ask user to resolve
- Never lose user's custom commands without explicit permission

**NOTES:**

- This command works by reading and comparing SHORTCUTS.md files
- User must provide the new version (paste or file path)
- Always creates backup before making changes
- Custom commands are preserved by default

---

## GENERAL ERROR HANDLING POLICY

**For ALL Q-commands:**

1. **Be explicit about failures:**
   - Never fail silently
   - Report specific errors immediately
   - Don't pretend something worked when it didn't

2. **Verify critical operations:**
   - After creating files, check they exist
   - After commits, check git status
   - After writes, verify content saved

3. **Provide actionable feedback:**
   - Tell user exactly what succeeded
   - Tell user exactly what failed
   - Provide manual steps to fix failures

4. **Graceful degradation:**
   - Complete what is possible
   - Skip what fails, but report it
   - Don't abort entire operation for one failure

5. **User control:**
   - Offer options when uncertain
   - Ask before destructive operations
   - Let user decide how to proceed

---

## VERSION HISTORY

**v1.0 (2025-11-26):**
- First public release
- Q-UPGRADE for easy version upgrades (preserves custom commands)
- Q-COMPACT for safe context management (checkpoint + compact)
- Q-SETUP-DOMAIN for adaptive domain-specific configuration
- Q-RECONFIGURE-DOMAIN for evolving project needs
- Progressive scaffolding system (not fixed tiers)
- Per-person-per-session file naming (no collisions)
- Organized directory structure (transcripts/, checkpoints/, session-notes/)
- Step-by-step verification in Q-END
- Q-SAVE for lightweight quick exits
- Q-VERIFY for checking command success
- Q-STATUS with context health and recommendations
- Comprehensive error handling policy

**v0.2 (2025-11-17):**
- Added domain-specific setup wizard
- Added configuration profile system
- Added automatic documentation generation

**v0.1 (2025-11-13):**
- Initial development version
- Basic command set: Q-BEGIN, Q-END, Q-DUMP, Q-COMMIT, Q-CHECKPOINT, Q-STATUS, Q-LEARNINGS
