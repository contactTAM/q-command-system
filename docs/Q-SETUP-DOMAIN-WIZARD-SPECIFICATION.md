# Q-SETUP-DOMAIN Wizard Specification

**Version:** 1.0
**Date:** 2025-11-17
**Purpose:** Adaptive domain-specific Q-Command System setup that configures infrastructure based on project context, not user choice of "tiers"

---

## Philosophy: Progressive Scaffolding, Not Fixed Tiers

**Core Principle:**
> The Q-Command System acts as a **one-on-one tutor/coach** that adapts its teaching style, scaffolding, and complexity to the user's context: where they're starting from, what they're trying to create, what they already have, and how experienced they are.

**NOT:**
- "Choose Lite or Full"
- "Choose Beginner or Advanced"
- Fixed tier systems

**INSTEAD:**
- Adaptive configuration based on contextual questions
- Progressive disclosure (start simple, offer more as needed)
- Just-in-time infrastructure setup
- Growth-aware triggers

---

## Wizard Architecture

### Phase 1: Universal Domain Selection

**Q-SETUP-DOMAIN Invocation:**
```
User types: Q-SETUP-DOMAIN

Claude responds:
"I'll help you set up a domain-specific Q-Command System for your project.
This will configure the right infrastructure, tools, and workflows based on
your specific context and goals.

Let's start with some questions to understand your project..."
```

### Phase 2: Contextual Question Engine

**Questions are domain-specific and adaptive.**

Each question:
1. **Branches** based on previous answers
2. **Stores** answers in configuration profile
3. **Determines** what infrastructure to set up
4. **Sets** triggers for future progressive offers

---

## Domain-Specific Question Sets

### SCREENPLAY/TV WRITING DOMAIN

#### Question 1: Starting Point

**Ask:**
```
What are you starting with today?

a) Nothing yet - I have an idea but no written materials
b) Source material - I have source texts/references to adapt from
c) Basic documents - I have a vision doc, treatment, or notes
d) Pitch bible - I have a complete pitch bible (from collaborators or previous work)
e) Partial work - I've already started writing scenes or outlines
f) Let me describe my situation: [free text]
```

**What This Determines:**

**Answer a (Nothing):**
- Creates minimal structure
- Sets up exploration/ideation workflows
- No agents yet (too early)
- Focus: helping user develop the concept

**Answer b (Source material):**
- Determines source fidelity framework needed
- May need source mining agent
- Creative license tracking if canonical source
- Focus: mining and adaptation

**Answer c (Basic documents):**
- Creates structure for development
- Sets up character/world-building infrastructure
- Focus: expanding foundation into full concept

**Answer d (Pitch bible):**
- More advanced structure immediately
- Assumes characters/world established
- Focus: execution (writing episodes/pilot)
- May need deliverables export

**Answer e (Partial work):**
- Analyzes existing structure
- Offers to organize/standardize
- Focus: continuing/completing work

**Answer f (Free text):**
- Claude analyzes description
- Asks clarifying follow-ups
- Determines closest match or hybrid approach

#### Question 2: Project Goal

**Ask:**
```
What's your goal for this project?

a) Explore the concept - Create proof-of-concept outlines or treatments
b) Pitch package - Create pitch bible and sample materials for pitching
c) Complete pilot - Write a full pilot episode screenplay
d) Full season - Write multiple episodes (season arc)
e) Ongoing series - Long-running development (multiple seasons)
f) Not sure yet - Help me figure out the right goal
```

**What This Determines:**

**Answer a (Explore):**
- Lightweight structure
- Outline-focused workflows
- No screenplay format infrastructure yet
- May delay scene PREP agents

**Answer b (Pitch package):**
- Pitch bible structure
- Visual development likely needed
- Deliverables export (polished outputs)
- Sample scene writing (not full episodes)

**Answer c (Complete pilot):**
- Full screenplay infrastructure immediately
- Scene PREP agent
- Screenplay format templates
- Character arc tracking from start

**Answer d (Full season):**
- Episode-by-episode planning structure
- Season arc tracking
- Multi-episode character development
- Timeline verification tools

**Answer e (Ongoing series):**
- Archiving strategies from start
- Bible/canon management
- Continuity tracking systems
- Long-term session management

**Answer f (Not sure):**
- Claude asks follow-up questions
- Helps user clarify goals
- May recommend starting with (a) and evolving

#### Question 3: Experience Level

**Ask:**
```
What's your level of experience with screenwriting?

a) Complete beginner - Never written a screenplay before
b) Learning - Written some, but not professionally
c) Intermediate - Some professional experience or formal training
d) Advanced - Extensive professional experience

Note: This helps me calibrate how much guidance and structure to provide.
```

**What This Determines:**

**Answer a (Beginner):**
- **High scaffolding:** More guidance, more structure
- **Collaborative mode:** Structural enforcement (TDW-style)
- **Templates with guidance:** Extensive comments/instructions
- **Quality checklists:** More detailed (educational)
- **Offers explanations:** Why each tool exists, when to use it

**Answer b (Learning):**
- **Medium scaffolding:** Guidance available but less intrusive
- **Collaborative mode:** Narrative style (UCU-style)
- **Templates:** Standard with some guidance
- **Quality checklists:** Standard
- **Assumes some knowledge:** Screenplay format basics, etc.

**Answer c (Intermediate):**
- **Light scaffolding:** Tools available, assumes user knows when to use them
- **Collaborative mode:** Minimal (optional)
- **Templates:** Clean, minimal guidance
- **Quality checklists:** Concise
- **Focus on efficiency:** Automation over education

**Answer d (Advanced):**
- **Minimal scaffolding:** Provides infrastructure, user drives
- **Collaborative mode:** Optional/off by default
- **Templates:** Bare bones, customizable
- **Quality checklists:** Minimal
- **Maximum flexibility:** Don't constrain experienced user

#### Question 4: Collaboration Context

**Ask:**
```
Will you be working solo or with collaborators?

a) Solo - Just me and Claude
b) With occasional feedback - I'll share drafts for feedback sometimes
c) Active collaboration - Regular collaboration with writing partner(s)
d) Team/professional - Multiple stakeholders (producers, directors, etc.)
```

**What This Determines:**

**Answer a (Solo):**
- Standard session management
- No deliverables infrastructure
- Internal documentation only
- Personal workflow optimization

**Answer b (Occasional feedback):**
- Add /deliverables/ directory
- Export workflow (HTML, PDF)
- Version tracking for drafts
- Feedback incorporation workflow

**Answer c (Active collaboration):**
- Multi-user file naming (per-person session notes)
- Collaboration documentation
- Decision tracking (who decided what)
- May need conflict resolution workflows

**Answer d (Professional):**
- Polished deliverables infrastructure
- Version control with annotations
- Stakeholder feedback tracking
- Professional formatting/export
- May need approval workflows

#### Question 5: Visual Development Needs

**Ask:**
```
Do you need visual development for this project?

a) Yes - Need to create character/location visual references (concept art, etc.)
b) Maybe later - Not now, but might need it eventually
c) No - Text-only project
d) Already have - Existing visual materials I'll reference
```

**What This Determines:**

**Answer a (Yes):**
- Install Midjourney_Prompt_Skill.md (or generic Visual_Development_Skill.md)
- Create /visual-reference/ directory structure
- Set up image organization workflows
- May create visual consistency agent

**Answer b (Maybe later):**
- Don't set up now
- Create trigger: WHEN user mentions "Midjourney" or "visual" → offer setup

**Answer c (No):**
- Skip visual infrastructure entirely
- No visual-related skills or agents

**Answer d (Already have):**
- Create /visual-reference/ for storage/organization
- Set up reference management (not generation)

#### Question 6: Source Material Complexity

**Ask:**
```
Do you have source materials you're adapting or referencing?

a) No source materials - Original work
b) Single source - One canonical reference (book, historical event, etc.)
c) Multiple equal sources - Research from various sources, all equally valid
d) Multiple sources with hierarchy - Some are canonical, others are inspirational
e) Complex research - Academic/historical research with citations needed
```

**What This Determines:**

**Answer a (No source):**
- No source fidelity framework
- Pure creative work mode
- No research agents

**Answer b (Single source):**
- Install two-layer fidelity framework:
  - Layer 1: What source explicitly states (sacred)
  - Layer 2: Creative license to fill gaps (documented)
- Create creative-license-log template
- May install source-mining agent

**Answer c (Multiple equal):**
- Research organization structure
- Citation tracking
- No hierarchy enforcement needed

**Answer d (Multiple with hierarchy):**
- **CRITICAL:** Install source hierarchy framework
- Create Q-RESEARCH command with hierarchy enforcement
- PRIMARY vs SECONDARY designation
- Quality checklists verify proper source labeling
- Prevent catastrophic errors (treating inspiration as canon)

**Answer e (Complex research):**
- Academic citation system
- Source bibliography management
- Research synthesis workflows
- May need research-synthesis agent

#### Question 7: Current Repository State

**Ask:**
```
Are you setting this up in:

a) A new, empty repository - Starting from scratch
b) An existing repository with some files - Need to organize what's there
c) An existing Q-Command repository - Upgrading or adding domain features
```

**What This Determines:**

**Answer a (New):**
- Create complete directory structure
- Install all files fresh
- Standard setup flow

**Answer b (Existing files):**
- Analyze existing structure first
- Offer to organize/migrate files
- Ask permission before moving/renaming
- Preserve existing work

**Answer c (Existing Q-system):**
- Detect current Q-Command version
- Offer upgrade if older version
- Add domain features to existing setup
- Preserve customizations

---

## Configuration Profile Generation

After questions, Claude generates a **configuration profile**:

```json
{
  "domain": "screenplay",
  "config_name": "screenplay-pilot-beginner-solo",
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
      "scene-prep-agent"
    ],
    "custom_commands": [
      "Q-SCENE",
      "Q-RESEARCH"
    ],
    "collaborative_mode": "structural",
    "source_framework": "multiple_hierarchy",
    "session_notes_strategy": "individual_files",
    "quality_level": "high_scaffolding"
  },
  "triggers": [
    {
      "condition": "user_mentions:character_arcs",
      "offer": "episode_by_episode_arc_tracking",
      "priority": "high"
    },
    {
      "condition": "repo_size > 30 files",
      "offer": "file_structure_map",
      "priority": "medium"
    },
    {
      "condition": "scenes_written >= 5",
      "offer": "q_scene_command",
      "priority": "high"
    }
  ]
}
```

This profile is stored in `.q-system/domain-config.json`

---

## Setup Execution

### Phase 1: Immediate Infrastructure

Based on configuration profile, Claude:

**1. Creates Directory Structure**
```
Creates only directories needed for current configuration.
Does NOT create "just in case" directories.
```

**2. Installs Core Q-Command Files**
```
- CLAUDE.md (with domain-specific sections)
- SESSION-CHECKLIST.md
- GeneratedMDs/SHORTCUTS.md (base v2.0 + custom commands if applicable)
- .gitignore
```

**3. Installs Domain-Specific Skills**
```
IF visual_needs = yes:
  Install Midjourney_Prompt_Skill.md (or generic visual skill)

IF source_complexity requires:
  Install appropriate source fidelity framework docs
```

**4. Installs Agents**
```
IF goal = complete_pilot OR full_season:
  Install scene-prep-agent-instructions.md

IF starting_point = source_material:
  Install source-mining-agent.md

[Conditional based on configuration]
```

**5. Creates Custom Q-Commands**
```
IF goal = complete_pilot/full_season AND experience = beginner:
  Add Q-SCENE to SHORTCUTS.md

IF source_complexity = multiple_hierarchy:
  Add Q-RESEARCH to SHORTCUTS.md with hierarchy enforcement

[Conditional based on configuration]
```

**6. Configures Collaborative Mode**
```
IF experience = beginner AND goal involves creative work:
  Add COLLABORATIVE WORKING MODE section (structural enforcement)

IF experience = learning:
  Add Prep-Then-Collaborate description (narrative)

IF experience = intermediate/advanced:
  Minimal or optional collaborative mode
```

**7. Creates FILE-STRUCTURE-MAP.md**
```
IF starting_point = pitch_bible OR existing_repo:
  Create FILE-STRUCTURE-MAP.md immediately (already complex)

ELSE:
  Create trigger for later (when repo reaches ~30 files)
```

**8. Sets Up Session Management**
```
IF collaboration = solo:
  Standard individual files OR offer consolidated (user choice)

IF collaboration = team:
  Multi-user file naming
```

### Phase 2: Documentation & Guidance

After setup, Claude creates:

**1. DOMAIN-SETUP-SUMMARY.md**
```markdown
# Your Q-Screen System Setup

**Configuration:** Screenplay Pilot Development (Beginner, Solo with Feedback)
**Date:** 2025-11-17

## What I've Set Up For You

### Directory Structure
[Lists created directories with explanations]

### Skills Available
[Lists installed skills with when to use them]

### Agents Available
[Lists installed agents with how to invoke them]

### Custom Q-Commands
[Lists custom commands with usage examples]

### Collaborative Mode
[Explains configured collaborative mode]

## What Happens Next

As your project grows, I'll offer additional infrastructure:
- When you have 5+ scenes: Q-SCENE command (if not already installed)
- When repo grows: FILE-STRUCTURE-MAP.md (if not already created)
- When you mention character arcs: Episode-by-episode tracking
- [Other triggers based on configuration]

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

**2. Quick Reference Card**
```markdown
# Quick Reference: Your Q-Screen Commands

## Core Q-Commands (Always Available)
- Q-BEGIN - Start session
- Q-END - Complete session with documentation
- Q-CHECKPOINT - Save mid-session progress
- Q-STATUS - See current state and recommendations
- Q-VERIFY - Check that files were created correctly
- Q-SAVE - Quick exit (lightweight)

## Your Custom Q-Commands
[Lists only commands installed for this configuration]

## Agents You Can Invoke
[Lists only agents installed for this configuration]

## Skills Reference
[Lists only skills installed for this configuration]
```

### Phase 3: Progressive Scaffolding Triggers

Claude monitors session activity and offers next-level infrastructure when appropriate.

**Trigger System:**

```javascript
// Stored in .q-system/triggers.json

triggers: [
  {
    id: "offer_arc_tracking",
    condition: {
      type: "keyword_mention",
      keywords: ["character arc", "transformation", "character growth"],
      threshold: 2  // mentioned at least twice
    },
    offer: {
      title: "Episode-by-Episode Character Arc Tracking",
      description: "I notice you're discussing character arcs. Would you like me to set up episode-by-episode arc tracking? This helps prevent anachronistic character behavior (character doing things before they've learned how).",
      setup_actions: [
        "create /character-arcs/ directory",
        "install arc tracking template",
        "create example arc for one character",
        "add Q-CHARACTER command to SHORTCUTS.md"
      ]
    },
    priority: "high",
    offered: false,
    accepted: null
  },

  {
    id: "offer_file_structure_map",
    condition: {
      type: "repo_size",
      file_count: 30,
      check_frequency: "every_session_start"
    },
    offer: {
      title: "FILE-STRUCTURE-MAP.md for Agent Efficiency",
      description: "Your repository has grown to 30+ files. Would you like me to create a FILE-STRUCTURE-MAP.md? This helps agents navigate your repo efficiently and reduces context usage.",
      setup_actions: [
        "analyze current directory structure",
        "create FILE-STRUCTURE-MAP.md with reading strategies",
        "update agent instructions to reference map"
      ]
    },
    priority: "medium",
    offered: false,
    accepted: null
  },

  {
    id: "offer_q_scene_command",
    condition: {
      type: "file_pattern",
      directory: "/screenplay/scenes/",
      pattern: "*.md",
      count: 5  // 5+ scene files
    },
    offer: {
      title: "Q-SCENE Command for Standardized Workflow",
      description: "You've written 5+ scenes. Would you like me to add the Q-SCENE command? This provides a standardized 5-step workflow for scene development with collaborative beat discussion.",
      setup_actions: [
        "add Q-SCENE command to SHORTCUTS.md",
        "create scene workflow documentation",
        "add Q-SCENE to quick reference"
      ]
    },
    priority: "high",
    offered: false,
    accepted: null
  },

  {
    id: "offer_deliverables_export",
    condition: {
      type: "keyword_mention",
      keywords: ["feedback", "share", "send to", "show to"],
      threshold: 3
    },
    offer: {
      title: "Deliverables Export Workflow",
      description: "I notice you're sharing work for feedback. Would you like me to set up a deliverables export system? This creates polished HTML/PDF exports separate from your working files.",
      setup_actions: [
        "create /deliverables/ directory",
        "install export templates",
        "create export workflow documentation",
        "add Q-EXPORT command (optional)"
      ]
    },
    priority: "medium",
    offered: false,
    accepted: null
  },

  {
    id: "offer_visual_development",
    condition: {
      type: "keyword_mention",
      keywords: ["Midjourney", "character image", "visual", "concept art"],
      threshold: 1
    },
    offer: {
      title: "Visual Development Infrastructure",
      description: "I notice you're interested in visual development. Would you like me to set up visual development infrastructure with Midjourney skill and image organization?",
      setup_actions: [
        "install Midjourney_Prompt_Skill.md",
        "create /visual-reference/ directory structure",
        "create image organization workflow"
      ]
    },
    priority: "medium",
    offered: false,
    accepted: null
  }
]
```

**How Triggers Work:**

**1. At Q-BEGIN:**
```
Claude checks all triggers with check_frequency: "every_session_start"
If condition met and not yet offered:
  - Add to session recommendations
  - Offer at appropriate moment (not overwhelming user)
```

**2. During Session:**
```
Claude monitors conversation for keyword triggers
When threshold reached:
  - Mark trigger as ready
  - Offer at next natural pause in conversation
```

**3. Offering Process:**
```
Claude: "I notice [observation]. Would you like me to [offer]?
         This would help by [benefit explanation].

         I can set this up now, or we can do it later. What would you prefer?"

User options:
  a) Yes, set it up now
  b) Yes, but later (remind me)
  c) No, not needed
  d) Tell me more first
```

**4. Tracking Offers:**
```
When offered: trigger.offered = true, timestamp recorded
When accepted: trigger.accepted = true, setup_actions executed
When declined: trigger.accepted = false, removed from future checks
When deferred: remains in triggers, check again in future sessions
```

---

## Special Cases & Edge Cases

### Case 1: User Answers "Not Sure" to Multiple Questions

**Approach:**
```
Claude doesn't force decision.
Instead:
  - Set up minimal viable infrastructure
  - Explain: "We'll start simple and add more as your project evolves"
  - Set up more triggers (watch for signals)
  - Check in after 2-3 sessions: "Now that you've started, want to refine setup?"
```

### Case 2: User's Answers Seem Contradictory

**Example:**
- Experience: Complete beginner
- Goal: Full season (very ambitious)

**Approach:**
```
Claude asks clarifying question:
  "I notice you're a complete beginner but want to write a full season.
   That's ambitious! A few options:

   a) Start with pilot focus - Write pilot first, then expand if successful
   b) Full season with high support - Set up full infrastructure with lots of guidance
   c) Help me understand your timeline/plan better

   What makes most sense for your situation?"
```

### Case 3: Existing Repository with Partial Q-System

**Approach:**
```
1. Claude analyzes existing files
2. Detects current Q-Command version (if any)
3. Offers options:
   a) Upgrade existing Q-System and add domain features
   b) Start fresh (migrate existing work to new structure)
   c) Hybrid (preserve some, replace others)
4. Shows before/after preview
5. Gets explicit permission before making changes
```

### Case 4: User Changes Mind Mid-Project

**Example:**
- Started with "explore concept"
- Now wants to write full pilot

**Approach:**
```
User can run: Q-RECONFIGURE-DOMAIN

Claude:
  1. Reads current configuration
  2. Asks: "What's changed in your project?"
  3. Re-asks relevant questions
  4. Shows what will be added/changed
  5. Preserves existing work
  6. Upgrades infrastructure
  7. Updates .q-system/domain-config.json
```

---

## Implementation in SHORTCUTS.md

**Q-SETUP-DOMAIN Command:**

```markdown
## Q-SETUP-DOMAIN

**Purpose:** Set up domain-specific Q-Command System infrastructure adapted to your project context

**When to Use:**
- First time setting up Q-System in a repository
- Adding domain-specific features to existing Q-System
- Reconfiguring when project goals change

**Process:**

STEP 1: DOMAIN SELECTION
- Ask: "What domain are you working in?"
- Options: Screenplay/TV, Software, Legal, Research, Other
- Branch to domain-specific questions

STEP 2: CONTEXTUAL QUESTIONS (Domain-Specific)
- Ask 6-8 adaptive questions about:
  * Starting point (what you have now)
  * Project goal (what you're creating)
  * Experience level (how much guidance needed)
  * Collaboration context (solo vs team)
  * Special needs (visual, research, etc.)
  * Source material complexity
  * Repository state (new vs existing)
- Store answers in configuration profile

STEP 3: CONFIGURATION GENERATION
- Generate configuration profile based on answers
- Determine infrastructure to install immediately
- Set up progressive scaffolding triggers
- Show user what will be created

STEP 4: SETUP EXECUTION
- Create directory structure
- Install skills, agents, custom commands
- Configure collaborative mode (if applicable)
- Set up source frameworks (if applicable)
- Create documentation

STEP 5: DOCUMENTATION & GUIDANCE
- Create DOMAIN-SETUP-SUMMARY.md
- Create quick reference card
- Explain what was set up and why
- Explain what will be offered later (triggers)
- Provide recommended first steps

STEP 6: INITIALIZE FIRST SESSION
- Optionally run Q-BEGIN automatically
- Start first working session

**Output:**
- Complete domain-specific infrastructure
- Configuration profile (.q-system/domain-config.json)
- Triggers for progressive scaffolding
- Setup summary and quick reference
- Ready to start working

**Quality Checks:**
- [ ] All questions answered (or explicitly deferred)
- [ ] Configuration profile makes sense (no contradictions)
- [ ] Infrastructure matches configuration
- [ ] User understands what was set up
- [ ] User knows how to get started
- [ ] Triggers are appropriate for context
```

---

## Q-RECONFIGURE-DOMAIN Command

```markdown
## Q-RECONFIGURE-DOMAIN

**Purpose:** Update domain configuration when project needs change

**When to Use:**
- Project goals have evolved (concept → pilot, pilot → season)
- Experience level changed (more confident now)
- Collaboration context changed (adding team members)
- Need infrastructure that wasn't set up initially

**Process:**

STEP 1: READ CURRENT CONFIGURATION
- Load .q-system/domain-config.json
- Understand current setup
- Identify what's installed

STEP 2: IDENTIFY CHANGES
- Ask: "What's changed in your project or needs?"
- Re-ask relevant questions from Q-SETUP-DOMAIN
- Compare new answers to old answers

STEP 3: SHOW IMPACT
- List what will be added
- List what will be modified
- List what will be preserved
- Estimate effort/disruption

STEP 4: GET PERMISSION
- Show before/after comparison
- Ask explicit permission for changes
- Allow user to accept, modify, or cancel

STEP 5: EXECUTE UPGRADE
- Add new infrastructure
- Modify existing infrastructure (carefully)
- Preserve all existing work
- Update configuration profile
- Update documentation

STEP 6: VERIFY & DOCUMENT
- Run Q-VERIFY to check all changes
- Update DOMAIN-SETUP-SUMMARY.md
- Update quick reference
- Explain what changed and why

**Output:**
- Updated infrastructure
- Updated configuration profile
- Updated documentation
- All existing work preserved

**Quality Checks:**
- [ ] No work lost or damaged
- [ ] Configuration profile updated
- [ ] Documentation reflects changes
- [ ] User understands new capabilities
```

---

## Example Configurations

### Configuration 1: UCU Context (Early Exploration with Source Material)

**Profile Name:** `screenplay-concept-beginner-solo-visual`

**Answers:**
- Starting point: Source material (Urantia Papers)
- Goal: Explore concept (3-episode outlines)
- Experience: Complete beginner
- Collaboration: Solo
- Visual needs: Yes
- Source: Single canonical source
- Repo: New

**Immediate Setup:**
```
Directories:
  /docs/
  /GeneratedMDs/
  /world-building/characters/
  /episode-outlines/
  /visual-reference/
  /working-notes/

Skills:
  Midjourney_Prompt_Skill.md

Agents:
  character-worldbuilding-agent.md (source mining)

Custom Commands:
  None yet (too early)

Collaborative Mode:
  Narrative style (documented in CLAUDE.md)

Source Framework:
  Two-layer fidelity (sacred + creative license)
  Creative license logging template

Session Notes:
  Consolidated + archive (solo optimization)
```

**Triggers Set:**
```
- When mentions "writing scenes" → Offer scene PREP agent
- When repo > 30 files → Offer FILE-STRUCTURE-MAP.md
- When 3+ outlines complete → Offer arc tracking
- When mentions feedback → Offer deliverables export
```

### Configuration 2: TDW Context (Pilot Writing with Existing Materials)

**Profile Name:** `screenplay-pilot-beginner-feedback-research`

**Answers:**
- Starting point: Pitch bible (from collaborators)
- Goal: Complete pilot screenplay
- Experience: Complete beginner
- Collaboration: Occasional feedback
- Visual needs: No
- Source: Multiple with hierarchy (UB primary, Gospel secondary)
- Repo: New

**Immediate Setup:**
```
Directories:
  /docs/
  /GeneratedMDs/
    /character-profiles/
    /character-arcs/
    /episode-planning/
    /workflows/
  /screenplay/scenes/
  /deliverables/

Skills:
  None (no visual needs)

Agents:
  scene-prep-agent-instructions.md (writing scenes)

Special Files:
  FILE-STRUCTURE-MAP.md (starting with complex materials)

Custom Commands:
  Q-SCENE (5-step collaborative scene workflow)
  Q-RESEARCH (source hierarchy enforcement)

Collaborative Mode:
  Structural enforcement (top of SHORTCUTS.md)
  NEVER/ALWAYS lists, red flags

Source Framework:
  Multi-source hierarchy (PRIMARY/SECONDARY)
  Q-RESEARCH enforces hierarchy

Session Notes:
  Individual files (standard v2.0)
```

**Triggers Set:**
```
- When 5+ scenes written → Offer Q-CHARACTER command
- When mentions character arcs → Offer arc tracking (HIGH PRIORITY)
- When mentions timeline → Offer Q-TIMELINE command
- When frequent feedback → Offer export automation
```

### Configuration 3: Experienced Writer, Original Work

**Profile Name:** `screenplay-season-advanced-solo`

**Answers:**
- Starting point: Basic documents (treatment)
- Goal: Full season
- Experience: Advanced
- Collaboration: Solo
- Visual needs: Maybe later
- Source: Original work
- Repo: New

**Immediate Setup:**
```
Directories:
  /docs/
  /GeneratedMDs/
  /characters/
  /episodes/
  /season-arc/

Skills:
  None initially (will add if user requests)

Agents:
  None initially (experienced user will request if needed)

Custom Commands:
  None (user will define their own if wanted)

Collaborative Mode:
  Minimal/off (experienced user drives)

Source Framework:
  None (original work)

Session Notes:
  User choice (offer consolidated or standard)
```

**Triggers Set:**
```
- When mentions Midjourney/visual → Offer visual infrastructure
- When repo > 50 files → Offer FILE-STRUCTURE-MAP.md
- When mentions specific workflow pain point → Offer custom command creation
- Otherwise: Stay out of user's way, provide tools when asked
```

---

## Summary: Progressive Scaffolding in Action

**The System's Job:**

1. **Start appropriate to context** - Not too simple, not too complex
2. **Watch for growth signals** - User trying to do something new
3. **Offer just-in-time upgrades** - "I notice you're [doing X]. Want [tool Y]?"
4. **Respect user decisions** - Accept, decline, or defer offers
5. **Adapt continuously** - Re-configure as project evolves

**The User's Experience:**

**Week 1:**
- Simple structure, essential tools
- Learning the system
- Exploring their project

**Week 2-3:**
- System offers next-level tools as needs emerge
- "I notice you're writing scenes. Want scene PREP infrastructure?"
- User accepts what helps, declines what doesn't

**Month 2:**
- Full infrastructure grown organically
- System adapted to user's actual workflow
- No overwhelming setup on Day 1
- No missing tools when needed

**Result:**
> A one-on-one tutor that meets you where you are, grows with your project, and only offers what you need when you need it.

---

**END OF SPECIFICATION**

**Next Steps:**
1. Implement Q-SETUP-DOMAIN in SHORTCUTS.md
2. Create domain-specific question sets (screenplay, software, legal, etc.)
3. Build trigger system and monitoring
4. Test with real projects (UCU and TDW as validation)
