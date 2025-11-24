# Q-SETUP-DOMAIN Test Walkthroughs

**Version:** 1.0
**Date:** 2025-11-17
**Purpose:** Test scenarios to validate Q-SETUP-DOMAIN implementation

---

## Test Scenario 1: UCU Context (Early Exploration with Source Material)

**Expected Configuration:** `screenplay-concept-beginner-solo-visual`

### User Inputs:

**Domain Selection:**
```
Q: What domain are you working in?
A: a) Screenplay/TV Writing
```

**Q1: Starting Point**
```
Q: What are you starting with today?
A: b) Source material - I have source texts/references to adapt from
```

**Q2: Project Goal**
```
Q: What's your goal for this project?
A: a) Explore the concept - Create proof-of-concept outlines or treatments
```

**Q3: Experience Level**
```
Q: What's your level of experience with screenwriting?
A: a) Complete beginner - Never written a screenplay before
```

**Q4: Collaboration Context**
```
Q: Will you be working solo or with collaborators?
A: a) Solo - Just me and Claude
```

**Q5: Visual Development Needs**
```
Q: Do you need visual development for this project?
A: a) Yes - Need to create character/location visual references
```

**Q6: Source Material Complexity**
```
Q: Do you have source materials you're adapting or referencing?
A: b) Single source - One canonical reference (Urantia Papers)
```

**Q7: Repository State**
```
Q: Are you setting this up in:
A: a) A new, empty repository - Starting from scratch
```

### Expected Configuration Output:

```json
{
  "domain": "screenplay",
  "config_name": "screenplay-concept-beginner-solo-visual",
  "timestamp": "2025-11-17T14:30:00Z",
  "answers": {
    "starting_point": "source_material",
    "goal": "explore_concept",
    "experience": "beginner",
    "collaboration": "solo",
    "visual_needs": "yes",
    "source_complexity": "single",
    "repo_state": "new"
  },
  "infrastructure": {
    "directories": [
      "/docs/",
      "/GeneratedMDs/",
      "/world-building/characters/",
      "/episode-outlines/",
      "/visual-reference/",
      "/working-notes/"
    ],
    "skills": [
      "Midjourney_Prompt_Skill.md"
    ],
    "agents": [
      "character-worldbuilding-agent.md"
    ],
    "custom_commands": [],
    "collaborative_mode": "narrative",
    "source_framework": "two_layer",
    "session_notes_strategy": "individual",
    "quality_level": "high_scaffolding"
  },
  "triggers": [
    {
      "condition": "user_mentions:writing_scenes",
      "offer": "scene-prep-agent",
      "priority": "medium"
    },
    {
      "condition": "repo_size > 30 files",
      "offer": "file_structure_map",
      "priority": "medium"
    },
    {
      "condition": "outlines_complete >= 3",
      "offer": "character_arc_tracking",
      "priority": "high"
    },
    {
      "condition": "user_mentions:feedback",
      "offer": "deliverables_export",
      "priority": "low"
    }
  ]
}
```

### Expected Setup Actions:

**Directories Created:**
- `.q-system/`
- `docs/`
- `GeneratedMDs/transcripts/`
- `GeneratedMDs/checkpoints/`
- `GeneratedMDs/session-notes/`
- `world-building/characters/`
- `episode-outlines/`
- `visual-reference/`
- `working-notes/`

**Files Created:**
- `.q-system/domain-config.json` (configuration profile)
- `CLAUDE.md` (with screenplay domain sections)
- `SESSION-CHECKLIST.md`
- `GeneratedMDs/SHORTCUTS.md` (base v2.1)
- `.gitignore` (for GeneratedMDs)
- `docs/Midjourney_Prompt_Skill.md` (visual development skill)
- `docs/Source_Fidelity_Framework.md` (two-layer framework)
- `docs/agents/character-worldbuilding-agent.md` (source mining agent)
- `docs/DOMAIN-SETUP-SUMMARY.md` (setup documentation)
- `docs/QUICK-REFERENCE.md` (command reference)

**NOT Created (too early):**
- Q-SCENE command (not writing scenes yet)
- FILE-STRUCTURE-MAP.md (repo too small)
- scene-prep-agent (not at scene writing stage)
- Deliverables directory (solo work, no sharing yet)

**Collaborative Mode Configuration:**
- Type: Narrative (in CLAUDE.md)
- Style: "Prep-Then-Collaborate" method documented
- Not structural enforcement (UCU used lighter collaborative mode)

**Source Framework:**
- Two-layer fidelity framework
- SACRED layer (what source explicitly states)
- CREATIVE LICENSE layer (documented additions)
- Creative license log template in working-notes/

### Expected User Report:

```
✅ Domain Setup Complete!

Configuration: Screenplay Concept Development (Beginner, Solo with Visual)
Profile: .q-system/domain-config.json

Created:
- 9 directories
- 1 skill (Midjourney visual development)
- 1 agent (character worldbuilding with source mining)
- 0 custom Q-commands (will offer as project grows)
- Setup documentation

Documentation:
- Setup Summary: docs/DOMAIN-SETUP-SUMMARY.md
- Quick Reference: docs/QUICK-REFERENCE.md

Progressive Triggers Set:
- When you mention "writing scenes" → Offer scene PREP agent
- When repo grows to 30+ files → Offer FILE-STRUCTURE-MAP.md
- When 3+ outlines complete → Offer character arc tracking
- When you mention feedback → Offer deliverables export

Next steps:
1. Review docs/DOMAIN-SETUP-SUMMARY.md to understand your setup
2. Run Q-BEGIN to start your first session
3. Start with character/world research using the character-worldbuilding-agent
4. Use visual-reference/ directory to organize Midjourney concept art

Ready to start! 🚀
```

---

## Test Scenario 2: TDW Context (Pilot Writing with Existing Materials)

**Expected Configuration:** `screenplay-pilot-beginner-feedback-research`

### User Inputs:

**Domain Selection:**
```
Q: What domain are you working in?
A: a) Screenplay/TV Writing
```

**Q1: Starting Point**
```
Q: What are you starting with today?
A: d) Pitch bible - I have a complete pitch bible
```

**Q2: Project Goal**
```
Q: What's your goal for this project?
A: c) Complete pilot - Write a full pilot episode screenplay
```

**Q3: Experience Level**
```
Q: What's your level of experience with screenwriting?
A: a) Complete beginner - Never written a screenplay before
```

**Q4: Collaboration Context**
```
Q: Will you be working solo or with collaborators?
A: b) With occasional feedback - I'll share drafts for feedback sometimes
```

**Q5: Visual Development Needs**
```
Q: Do you need visual development for this project?
A: c) No - Text-only project
```

**Q6: Source Material Complexity**
```
Q: Do you have source materials you're adapting or referencing?
A: d) Multiple sources with hierarchy - UB is canonical, Gospel is inspirational
```

**Q7: Repository State**
```
Q: Are you setting this up in:
A: a) A new, empty repository - Starting from scratch
```

### Expected Configuration Output:

```json
{
  "domain": "screenplay",
  "config_name": "screenplay-pilot-beginner-feedback-research",
  "timestamp": "2025-11-17T14:30:00Z",
  "answers": {
    "starting_point": "pitch_bible",
    "goal": "complete_pilot",
    "experience": "beginner",
    "collaboration": "occasional_feedback",
    "visual_needs": "no",
    "source_complexity": "multiple_hierarchy",
    "repo_state": "new"
  },
  "infrastructure": {
    "directories": [
      "/docs/",
      "/GeneratedMDs/",
      "/character-profiles/",
      "/character-arcs/",
      "/episode-planning/",
      "/screenplay/scenes/",
      "/deliverables/"
    ],
    "skills": [],
    "agents": [
      "scene-prep-agent-instructions.md"
    ],
    "custom_commands": [
      "Q-SCENE",
      "Q-RESEARCH"
    ],
    "collaborative_mode": "structural",
    "source_framework": "hierarchy",
    "session_notes_strategy": "individual",
    "quality_level": "high_scaffolding"
  },
  "triggers": [
    {
      "condition": "scenes_written >= 5",
      "offer": "q_character_command",
      "priority": "high"
    },
    {
      "condition": "user_mentions:character_arcs",
      "offer": "episode_by_episode_arc_tracking",
      "priority": "high"
    },
    {
      "condition": "user_mentions:timeline",
      "offer": "q_timeline_command",
      "priority": "medium"
    },
    {
      "condition": "frequent_feedback_sharing",
      "offer": "export_automation",
      "priority": "medium"
    }
  ]
}
```

### Expected Setup Actions:

**Directories Created:**
- `.q-system/`
- `docs/`
- `GeneratedMDs/transcripts/`
- `GeneratedMDs/checkpoints/`
- `GeneratedMDs/session-notes/`
- `character-profiles/`
- `character-arcs/`
- `episode-planning/`
- `screenplay/scenes/`
- `deliverables/`

**Files Created:**
- `.q-system/domain-config.json`
- `CLAUDE.md` (with screenplay + source hierarchy sections)
- `SESSION-CHECKLIST.md`
- `GeneratedMDs/SHORTCUTS.md` (base v2.1 + Q-SCENE + Q-RESEARCH)
- `.gitignore`
- `docs/Source_Hierarchy_Framework.md` (PRIMARY/SECONDARY designation)
- `docs/agents/scene-prep-agent-instructions.md`
- `docs/FILE-STRUCTURE-MAP.md` (created immediately - starting with complex materials)
- `docs/DOMAIN-SETUP-SUMMARY.md`
- `docs/QUICK-REFERENCE.md`

**Skills NOT Installed:**
- No Midjourney_Prompt_Skill.md (visual_needs = no)

**Collaborative Mode Configuration:**
- Type: Structural enforcement
- Location: Top of SHORTCUTS.md (read at Q-BEGIN)
- Contains: NEVER/ALWAYS lists, red flags
- Multi-layer enforcement (commands, workflows, templates, checklists)

**Source Framework:**
- Multi-source hierarchy
- PRIMARY: UB (canonical truth - use for plot, facts, events)
- SECONDARY: Gospel (inspiration - use for themes, interiority)
- Encoded in Q-RESEARCH command
- Multiple enforcement points

**Custom Q-Commands Added:**

**Q-SCENE** (5-step collaborative scene workflow):
- Step 1: Scene prep (context, research)
- Step 2: Beat discussion (collaborative)
- Step 3: Scene writing
- Step 4: Review (quality check)
- Step 5: Finalize (format, export)

**Q-RESEARCH** (source hierarchy enforcement):
- Prompts for research question
- Asks which source to search (PRIMARY or SECONDARY)
- Enforces proper labeling in findings
- Creates research notes with source designation
- Prevents treating inspiration as canon

### Expected User Report:

```
✅ Domain Setup Complete!

Configuration: Screenplay Pilot Development (Beginner, Feedback, Source Hierarchy)
Profile: .q-system/domain-config.json

Created:
- 10 directories (including deliverables for feedback sharing)
- 0 skills (no visual development needed)
- 1 agent (scene-prep for pilot writing)
- 2 custom Q-commands (Q-SCENE, Q-RESEARCH)
- Setup documentation

Special Features:
- ⚠️ Source Hierarchy Enforcement (PRIMARY: UB, SECONDARY: Gospel)
- 🤝 Structural Collaborative Mode (NEVER/ALWAYS lists at top of SHORTCUTS.md)
- 📁 FILE-STRUCTURE-MAP.md created (helps agents navigate complex project)

Documentation:
- Setup Summary: docs/DOMAIN-SETUP-SUMMARY.md
- Quick Reference: docs/QUICK-REFERENCE.md
- Source Hierarchy: docs/Source_Hierarchy_Framework.md
- File Structure: docs/FILE-STRUCTURE-MAP.md

Progressive Triggers Set:
- When you write 5+ scenes → Offer Q-CHARACTER command
- When you mention "character arcs" → Offer episode-by-episode arc tracking (HIGH PRIORITY)
- When you mention "timeline" → Offer Q-TIMELINE command
- When frequent feedback sharing → Offer export automation

Next steps:
1. Review docs/DOMAIN-SETUP-SUMMARY.md to understand your setup
2. Review docs/Source_Hierarchy_Framework.md to understand source hierarchy
3. Run Q-BEGIN to start your first session
4. Use Q-RESEARCH when researching source materials (enforces hierarchy)
5. Use Q-SCENE when writing scenes (standardized workflow)

⚠️ IMPORTANT: Always use Q-RESEARCH for source material queries to maintain
   proper PRIMARY/SECONDARY designation and prevent catastrophic errors.

Ready to start! 🚀
```

---

## Test Scenario 3: Experienced Writer, Original Work

**Expected Configuration:** `screenplay-season-advanced-solo`

### User Inputs:

**Domain Selection:**
```
Q: What domain are you working in?
A: a) Screenplay/TV Writing
```

**Q1: Starting Point**
```
Q: What are you starting with today?
A: c) Basic documents - I have a treatment
```

**Q2: Project Goal**
```
Q: What's your goal for this project?
A: d) Full season - Write multiple episodes (season arc)
```

**Q3: Experience Level**
```
Q: What's your level of experience with screenwriting?
A: d) Advanced - Extensive professional experience
```

**Q4: Collaboration Context**
```
Q: Will you be working solo or with collaborators?
A: a) Solo - Just me and Claude
```

**Q5: Visual Development Needs**
```
Q: Do you need visual development for this project?
A: b) Maybe later - Not now, but might need it eventually
```

**Q6: Source Material Complexity**
```
Q: Do you have source materials you're adapting or referencing?
A: a) No source materials - Original work
```

**Q7: Repository State**
```
Q: Are you setting this up in:
A: a) A new, empty repository - Starting from scratch
```

### Expected Configuration Output:

```json
{
  "domain": "screenplay",
  "config_name": "screenplay-season-advanced-solo",
  "timestamp": "2025-11-17T14:30:00Z",
  "answers": {
    "starting_point": "basic_documents",
    "goal": "full_season",
    "experience": "advanced",
    "collaboration": "solo",
    "visual_needs": "maybe",
    "source_complexity": "none",
    "repo_state": "new"
  },
  "infrastructure": {
    "directories": [
      "/docs/",
      "/GeneratedMDs/",
      "/characters/",
      "/episodes/",
      "/season-arc/"
    ],
    "skills": [],
    "agents": [],
    "custom_commands": [],
    "collaborative_mode": "minimal",
    "source_framework": "none",
    "session_notes_strategy": "user_choice",
    "quality_level": "minimal"
  },
  "triggers": [
    {
      "condition": "user_mentions:midjourney|visual",
      "offer": "visual_development_infrastructure",
      "priority": "medium"
    },
    {
      "condition": "repo_size > 50 files",
      "offer": "file_structure_map",
      "priority": "low"
    },
    {
      "condition": "user_requests:workflow_automation",
      "offer": "custom_command_creation",
      "priority": "high"
    }
  ]
}
```

### Expected Setup Actions:

**Directories Created:**
- `.q-system/`
- `docs/`
- `GeneratedMDs/transcripts/`
- `GeneratedMDs/checkpoints/`
- `GeneratedMDs/session-notes/`
- `characters/`
- `episodes/`
- `season-arc/`

**Files Created:**
- `.q-system/domain-config.json`
- `CLAUDE.md` (minimal, project-specific)
- `SESSION-CHECKLIST.md`
- `GeneratedMDs/SHORTCUTS.md` (base v2.1 only, no custom commands)
- `.gitignore`
- `docs/DOMAIN-SETUP-SUMMARY.md`
- `docs/QUICK-REFERENCE.md`

**NOT Created:**
- No skills (will add if user requests)
- No agents (experienced user will request if needed)
- No custom Q-commands (user will define their own if wanted)
- No FILE-STRUCTURE-MAP.md (will trigger at 50+ files for advanced users)
- No collaborative mode enforcement (experienced user drives)
- No source framework (original work)

**Session Notes Strategy:**
- Offer user choice: consolidated or standard individual files
- Explain benefits of each
- Let user decide

**Collaborative Mode:**
- Minimal/off by default
- Experienced user drives workflow
- System stays out of the way unless asked
- Available if user wants it

### Expected User Report:

```
✅ Domain Setup Complete!

Configuration: Screenplay Season Development (Advanced, Solo)
Profile: .q-system/domain-config.json

Created:
- 8 directories (minimal structure for flexibility)
- 0 skills (will add if you request)
- 0 agents (will add if you request)
- 0 custom Q-commands (you can define your own workflow)
- Setup documentation

Philosophy: Minimal Scaffolding
- You drive the workflow
- System provides infrastructure and documentation
- Request tools/agents when you need them
- Maximum flexibility for experienced workflow

Documentation:
- Setup Summary: docs/DOMAIN-SETUP-SUMMARY.md
- Quick Reference: docs/QUICK-REFERENCE.md

Session Notes Preference:
Would you prefer:
a) Individual files per session (standard v2.0)
b) Consolidated session notes with archiving (like UCU)

[Your choice will be saved in configuration]

Progressive Triggers Set:
- When you mention "Midjourney" or "visual" → Offer visual development infrastructure
- When repo grows to 50+ files → Offer FILE-STRUCTURE-MAP.md
- When you mention workflow pain points → Offer custom command creation
- Otherwise: Stay out of your way, provide tools when asked

Next steps:
1. Review docs/DOMAIN-SETUP-SUMMARY.md to understand your setup
2. Run Q-BEGIN to start your first session
3. Start developing your season arc and episode breakdowns
4. Request additional infrastructure as needed

System will stay minimal and let you work how you prefer. 🚀
```

---

## Validation Checklist

For each test scenario, verify:

**Configuration Generation:**
- [ ] All questions asked in correct order
- [ ] Answers properly stored in configuration profile
- [ ] Infrastructure decisions match answers logically
- [ ] Triggers appropriate for context
- [ ] No contradictions in configuration

**Directory Creation:**
- [ ] Only directories needed for configuration created
- [ ] No "just in case" directories
- [ ] .q-system/ directory created
- [ ] GeneratedMDs/ structure correct

**File Installation:**
- [ ] Core files installed (CLAUDE.md, SESSION-CHECKLIST.md, SHORTCUTS.md, .gitignore)
- [ ] Skills installed only when needed
- [ ] Agents installed only when appropriate
- [ ] Custom commands added only when required
- [ ] Configuration profile saved correctly

**Collaborative Mode:**
- [ ] Correct mode for experience level (structural vs narrative vs minimal)
- [ ] Placed in correct location (SHORTCUTS.md top vs CLAUDE.md)
- [ ] Contains appropriate guidance level

**Source Framework:**
- [ ] Correct framework for source complexity
- [ ] Enforcement mechanisms in place (if hierarchy)
- [ ] Documentation created

**Progressive Triggers:**
- [ ] Triggers appropriate for starting point and goal
- [ ] Not overwhelming (right number for context)
- [ ] Priority levels correct
- [ ] Conditions realistic and achievable

**Documentation:**
- [ ] DOMAIN-SETUP-SUMMARY.md created and accurate
- [ ] QUICK-REFERENCE.md created and helpful
- [ ] Context-specific recommendations provided
- [ ] User understands what was set up and why

**User Experience:**
- [ ] Not overwhelmed with too much upfront
- [ ] Understands what happens next (progressive triggers)
- [ ] Knows how to get started
- [ ] Clear on what to do first

---

## Edge Cases to Test

### Edge Case 1: User Answers "Not Sure" to Multiple Questions

**Input:**
- Q2 (Goal): f) Not sure yet - Help me figure out the right goal
- Q3 (Experience): a) Complete beginner
- Q5 (Visual): b) Maybe later

**Expected Behavior:**
- System doesn't force decision
- Sets up minimal viable infrastructure
- Explains: "We'll start simple and add more as your project evolves"
- Sets up MORE triggers to watch for signals
- Checks in after 2-3 sessions: "Now that you've started, want to refine setup?"

### Edge Case 2: Contradictory Answers

**Input:**
- Q3 (Experience): a) Complete beginner
- Q2 (Goal): d) Full season - Write multiple episodes

**Expected Behavior:**
- System detects contradiction (ambitious goal for beginner)
- Asks clarifying question:
  ```
  I notice you're a complete beginner but want to write a full season.
  That's ambitious! A few options:

  a) Start with pilot focus - Write pilot first, then expand if successful
  b) Full season with high support - Set up full infrastructure with lots of guidance
  c) Help me understand your timeline/plan better

  What makes most sense for your situation?
  ```
- User chooses approach
- System configures accordingly

### Edge Case 3: Existing Repository with Files

**Input:**
- Q7 (Repository State): b) An existing repository with some files

**Expected Behavior:**
- Analyzes existing structure first
- Shows what's currently there
- Offers to organize/standardize files
- Asks permission before moving/renaming anything
- Preserves all existing work
- Creates migration plan

### Edge Case 4: Existing Q-Command Repository

**Input:**
- Q7 (Repository State): c) An existing Q-Command repository

**Expected Behavior:**
- Detects current Q-Command version
- If v1.0 or v2.0 detected, offers upgrade
- Adds domain features to existing setup
- Preserves customizations
- Updates configuration profile
- Doesn't recreate what already exists

---

## Success Criteria

**Implementation is successful if:**

1. All three test scenarios produce expected configurations
2. Directory structures match specifications
3. Files created match experience level and context
4. Triggers are appropriate and not overwhelming
5. Documentation is clear and helpful
6. User understands what was set up and why
7. Edge cases handled gracefully
8. No contradictions in configuration
9. Progressive scaffolding triggers set appropriately
10. System adapts to context, not forcing fixed tiers

---

**END OF TEST WALKTHROUGHS**
