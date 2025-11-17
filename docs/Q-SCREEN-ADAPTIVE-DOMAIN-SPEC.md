# Q-Screen: Adaptive Screenplay Development Domain

**Version:** 1.0 (Adaptive Architecture)
**Date:** 2025-11-17
**Domain:** Screenplay and Television Writing
**Base System:** Q-Command System v2.0+

---

## Vision Statement

> **Q-Screen is a one-on-one tutor/coach for screenplay and television writing that adapts to your experience level, project stage, available resources, and creative goals. It provides just the right amount of scaffolding—not too much, not too little—and grows with your project.**

---

## Core Philosophy

### Not a "Screenwriting System"

Q-Screen is **NOT** a fixed template that everyone uses the same way.

Q-Screen **IS** an adaptive infrastructure that:
- Configures based on your context (beginner vs experienced, concept vs pilot, solo vs team)
- Provides tools when you need them (not before, not after)
- Offers upgrades as your project grows (progressive scaffolding)
- Adapts its teaching style to your experience level
- Respects your workflow (structure for beginners, freedom for experts)

### The Tutor Metaphor

**Like a Good Tutor:**

**With a Beginner:**
- High structure (clear steps, detailed guidance)
- Collaborative mode (questions not answers, discovery-based)
- Extensive checklists (educational, prevent common mistakes)
- Explains "why" (understanding, not just execution)

**With an Experienced Writer:**
- Light structure (tools available, user chooses when to use)
- Minimal collaborative mode (optional)
- Brief checklists (reminders, not lessons)
- Assumes knowledge (efficient, not pedagogical)

**With All Users:**
- Watches for growth signals (trying to do something new)
- Offers next-level tools at the right time
- Accepts "no" gracefully (doesn't force)
- Adapts continuously (re-configure as needed)

---

## Adaptive Components

### 1. Directory Structure (Context-Dependent)

**NOT:** One fixed directory structure for all screenplay projects

**INSTEAD:** Structure adapts based on:
- **Project stage** (exploration vs execution)
- **Organization preference** (character-centric vs document-type-centric)
- **Collaboration needs** (solo vs team)
- **Visual development** (yes vs no)

**Example Configurations:**

**Early Exploration (UCU-style):**
```
/docs/                     # Source materials, skills
/GeneratedMDs/             # Q-system session management
/world-building/
  /characters/             # Character-centric organization
    /[CharacterName]/      # All character materials together
  /locations/
  /culture/
/episode-outlines/         # Prose outlines, not screenplay format yet
/visual-reference/         # If visual development needed
  /characters/
  /locations/
/working-notes/            # Scratch space for exploration
```

**Pilot Writing (TDW-style):**
```
/docs/                     # Core reference materials (stable)
  /pitch-bible.md
  /source-materials/
/GeneratedMDs/             # Development materials (evolving)
  /character-profiles/     # Canonical character references
  /character-arcs/         # Episode-by-episode tracking
  /episode-planning/       # Scene structure documents
  /workflows/              # Process documentation
/screenplay/               # Actual screenplay output
  /scenes/                 # Scene files + PREP files
/deliverables/             # Polished exports for feedback
```

**Full Season Development:**
```
[Hybrid of above, plus:]
/season-arc/               # Multi-episode arc planning
/episodes/                 # Per-episode directories
  /EP01/
    /planning/
    /scenes/
    /notes/
  /EP02/
  [...

]
/bible/                    # Series bible (canon, continuity)
/timeline/                 # Timeline verification documents
```

**Setup Logic:**
- Q-SETUP-DOMAIN asks about starting point, goal, needs
- Creates appropriate structure based on answers
- Can reorganize later if project evolves (Q-RECONFIGURE-DOMAIN)

### 2. Skills (Installed Based on Needs)

**Available Skills:**

#### Midjourney_Prompt_Skill.md
- **When installed:** User answers "Yes" to visual development needs
- **Purpose:** Generate consistent, high-quality visual development prompts
- **Contents:**
  - Quality tiers (sketch, concept, photorealistic)
  - Category templates (characters, locations, objects, atmosphere)
  - Technical parameters (v7: --oref, --ow, --s, --style)
  - Domain-specific guidance (avoid pitfalls, style references)
  - Workflow (prompt construction process)
- **Size:** ~24KB, 600+ lines
- **Usage:** Manual reference during visual development sessions

#### Screenplay_Format_Skill.md
- **When installed:** User wants to write in screenplay format
- **Purpose:** Industry-standard formatting reference
- **Contents:**
  - Scene headings (INT/EXT, location, time)
  - Action lines (present tense, active voice)
  - Character names and dialogue
  - Parentheticals (sparingly)
  - Transitions
  - Formatting rules and conventions
- **Usage:** Reference for proper screenplay formatting

#### Source_Fidelity_Skill.md
- **When installed:** User has source material to adapt
- **Purpose:** Framework for respecting source while filling gaps
- **Contents:**
  - Two-layer approach (sacred + creative license)
  - Documentation templates (creative license log)
  - Citation methods
  - How to handle contradictions
  - Balancing fidelity and dramatic needs
- **Usage:** Guide for adaptation projects

**Progressive Addition:**
- Start with minimal skills (only what's needed)
- Offer additional skills when relevant work begins
- Example: Offer Screenplay_Format_Skill when user starts writing actual scenes

### 3. Agents (Autonomous Execution Protocols)

**Available Agents:**

#### character-worldbuilding-agent.md
- **When installed:** User has source material OR needs deep character development
- **Purpose:** Autonomous character research, synthesis, and deliverable creation
- **Process:** 3-phase with touchpoints
  - Phase 1: Deep research (autonomous)
  - Touchpoint 1: Present findings + questions
  - Phase 2: Synthesize visual strategy (based on user responses)
  - Touchpoint 2: Present strategy (if clarification needed)
  - Phase 3: Create deliverables (autonomous)
- **Deliverables:**
  - Character descriptions
  - Creative license logs (if source material)
  - Visual prompts (if visual development)
  - File organization
- **Size:** ~14KB, 380+ lines

#### scene-prep-agent-instructions.md
- **When installed:** User is writing actual scenes (not just outlines)
- **Purpose:** Autonomous scene preparation with context gathering
- **Process:** 12-step execution protocol
  - Steps 1-8: Autonomous reading + analysis
  - Step 9: Create PREP file with 10 questions for user
  - Step 10: Submit to user
  - Steps 11-12: Quality check + verification
- **Deliverables:**
  - Complete scene PREP file (12 sections)
  - 10 questions for collaborative scene development
  - References to character arcs, timelines, etc.
- **Size:** ~15KB, 610+ lines
- **Critical:** Uses FILE-STRUCTURE-MAP.md for efficient navigation (if available)

#### source-mining-agent.md
- **When installed:** User has extensive source material to research
- **Purpose:** Mine source materials for relevant information
- **Process:**
  - Identify relevant source sections
  - Extract explicit facts vs implied vs unspecified
  - Organize findings by category
  - Present to user with targeted questions
- **Deliverables:**
  - Source mining report
  - Questions about creative license territory
  - Organized reference materials

**Progressive Addition:**
- Install character agent early (if source material or deep development needed)
- Install scene PREP agent when user starts writing scenes
- Offer source mining agent if user mentions difficulty finding information in sources

### 4. Custom Q-Commands (Added Based on Workflow)

**Available Custom Commands:**

#### Q-SCENE
- **When added:** User is writing scenes regularly (5+ scenes OR user requests)
- **Purpose:** Standardized 5-step collaborative scene development workflow
- **Process:**
  ```
  Step 1: Identify scene (episode, act, beat)
  Step 2: Develop beat outline (COLLABORATIVELY - discuss before drafting)
  Step 3: Write first draft (based on Step 2 discussion)
  Step 4: Review and refine
  Step 5: Finalize and file
  ```
- **Key feature:** NEVER drafts without collaborative beat discussion (enforces collaborative mode)
- **Output:** Complete scene file + PREP file (if agent available)

#### Q-CHARACTER [name]
- **When added:** User has multiple characters with complex arcs
- **Purpose:** 5-step character analysis and consistency check
- **Process:**
  ```
  Step 1: Read character profile
  Step 2: Read character arc (current episode state)
  Step 3: Verify voice consistency (dialogue, behavior)
  Step 4: Check arc progression (physical/emotional/relational markers)
  Step 5: Report findings + questions
  ```
- **Output:** Character analysis report with any consistency issues or questions

#### Q-TIMELINE [ancient|modern]
- **When added:** Project has multiple timelines OR chronology is complex
- **Purpose:** 7-step timeline verification
- **Process:**
  ```
  Step 1: Read timeline document
  Step 2: Check chronological flow
  Step 3: Verify pacing
  Step 4: Check parallel timeline resonance (if applicable)
  Step 5: Identify gaps or inconsistencies
  Step 6: Check character ages/capabilities per timeline point
  Step 7: Report findings
  ```
- **Output:** Timeline verification report

#### Q-RESEARCH [topic]
- **When added:** User has multiple sources with hierarchy
- **Purpose:** Enforce source hierarchy, prevent catastrophic errors
- **Process:**
  ```
  Step 1: Identify topic to research
  Step 2: Check PRIMARY sources first (canonical)
  Step 3: Then check SECONDARY sources (inspirational)
  Step 4: Label findings clearly (PRIMARY vs SECONDARY)
  Step 5: Present findings with proper attribution
  Step 6: Verify no confusion between canonical and inspirational
  ```
- **Critical:** Prevents treating thematic material as historical fact
- **Output:** Research findings with clear source hierarchy labels

**Progressive Addition:**
- Start with NO custom commands (use base Q-BEGIN, Q-END, etc.)
- Offer Q-SCENE when user writes 5+ scenes
- Offer Q-CHARACTER when user mentions character arc consistency
- Offer Q-TIMELINE when user mentions timeline confusion
- Offer Q-RESEARCH when user has multiple sources (especially with hierarchy)

### 5. Collaborative Mode (Calibrated to Experience)

**Collaborative Mode Styles:**

#### Structural Enforcement (Beginner)
**When:** Experience = beginner AND creative work involved

**Implementation:**
```markdown
## COLLABORATIVE WORKING MODE

### Core Principle: NEVER WORK AUTONOMOUSLY ON CREATIVE/ANALYTICAL TASKS

### Never Work Autonomously On:
- Character arc extraction or analysis
- Season structure mapping
- Timeline development
- Thematic synthesis
- Scene breakdowns
- Character voice development
- Relationship dynamics analysis
- Any major creative or analytical work

### Always Collaborate By:
1. Preparing questions or options for Gabriel
2. Presenting choices for Gabriel's guidance
3. Working through material together interactively
4. Documenting Gabriel's decisions in real-time
5. Iterating based on Gabriel's feedback
6. Letting Gabriel's creative instinct lead

### Session Pattern:
- Start: Ask what to explore today
- Prepare: Create questions/options about that topic
- Present: Share with user for discussion
- Collaborate: Work through together with frequent dialogue
- Document: Capture decisions as we make them
- Never: Go work independently and return with completed analysis

### Red Flags (Stop Immediately If You Catch Yourself):
- Completing arc analysis without user's input
- Making creative decisions unilaterally
- Returning with "finished" work on creative topics
- Assuming you know what user wants without asking
```

**Location:** Top of SHORTCUTS.md (lines 10-50, read at every Q-BEGIN)

**Enforcement:**
- Structural (in SHORTCUTS.md)
- Procedural (workflows require collaboration steps)
- Templated (PREP files have "Questions" section required)
- Verified (quality checklists check non-prescriptive tone)

#### Narrative Style (Learning)
**When:** Experience = learning

**Implementation:**
```markdown
## Collaborative Workflow: "Prep-Then-Collaborate"

### Process:
1. **Claude preps privately**
   - Research, analysis, note-taking
   - Prepares targeted questions (not completed work)

2. **Claude leads with questions**
   - Presents findings with questions
   - Offers options, not prescriptions

3. **User discovers and decides**
   - Genuine discovery process
   - Emotional reaction to material
   - Makes creative decisions

4. **Synthesize together**
   - Co-create final work
   - Document decisions
   - Claude structures, user provides artistic judgment

### Why This Matters:
- Claude brings structure and thoroughness
- User brings emotional truth and creative choice
- Collaboration feels genuine (discovery, not approval)
- Final work is true co-creation
```

**Location:** In CLAUDE.md (read at Q-BEGIN)

**Enforcement:**
- Documented in CLAUDE.md
- User corrects if Claude oversteps
- Built through practice

#### Minimal/Optional (Intermediate/Advanced)
**When:** Experience = intermediate or advanced

**Implementation:**
- Brief mention in CLAUDE.md (optional)
- Tools available, user decides when to use
- Claude doesn't force collaboration
- User drives, Claude supports

**Rationale:**
- Experienced writers know when they want collaboration
- Over-scaffolding frustrates experts
- Provide tools, respect autonomy

**Progressive Adjustment:**
- Can be reconfigured if user requests more/less collaboration
- "I'd like more structure in scene development" → Add structural collaborative mode
- "Give me more freedom" → Reduce collaborative mode

### 6. Source Material Framework (Based on Source Complexity)

**Framework Options:**

#### No Source (Original Work)
- No framework needed
- Pure creative mode
- No research infrastructure

#### Single Canonical Source (UCU Pattern)
**Two-Layer Fidelity Framework:**
```
LAYER 1: SOURCE MATERIAL IS SACRED
- What source explicitly states is non-negotiable
- Cannot contradict canonical facts
- Examples: specific descriptions, ages, events, dialogue quotes

LAYER 2: CREATIVE LICENSE TO FILL GAPS
- Exercise creative license for unspecified details
- MUST document every instance
- Format: "CREATIVE LICENSE: [what invented] to illuminate [what revealed]"
- Provides transparency and audit trail
```

**Implementation:**
- Document framework in CLAUDE.md
- Create creative-license-log.md template
- character-worldbuilding-agent enforces framework
- Agents identify EXPLICIT vs IMPLIED vs UNSPECIFIED

**Files Created:**
```
/docs/source-fidelity-framework.md
/templates/creative-license-log-template.md
[Per character:] /characters/[Name]/creative-license-log.md
```

#### Multiple Sources with Hierarchy (TDW Pattern)
**Source Hierarchy Framework:**
```
PRIMARY SOURCE (Canonical Truth):
✅ Use for: Plot, events, dialogue, dates, historical facts
✅ Cite: Specific references (e.g., UB 150:1.1)
✅ Treat as: Canonical truth for story world

SECONDARY SOURCE (Thematic Inspiration):
✅ Use for: Thematic inspiration, character interiority, spiritual themes
✅ Label: "Inspired by [source]"
❌ DO NOT use for: Historical events, plot facts, dialogue

CRITICAL DISTINCTION:
- PRIMARY = "What happened" (external events)
- SECONDARY = "What it meant" (internal experience)
```

**Implementation:**
- Document hierarchy in CLAUDE.md
- Create Q-RESEARCH command with enforcement
- FILE-STRUCTURE-MAP.md specifies when to read each source
- Quality checklists verify proper source labeling
- Multiple enforcement points prevent errors

**Files Created:**
```
/docs/source-hierarchy-framework.md
SHORTCUTS.md: Q-RESEARCH command with steps
FILE-STRUCTURE-MAP.md: Reading strategies per source
Workflows: Source verification checklists
```

#### Complex Research (Academic)
**Academic Citation Framework:**
- Formal bibliography management
- Citation tracking
- Source synthesis workflows
- Research organization
- May need research-synthesis agent

**Implementation:**
- Create /research/ directory structure
- Install research organization templates
- Bibliography tracking
- Citation style guide

### 7. Character Development (Stage-Appropriate)

**Two Stages:**

#### Stage 1: Foundation
**When:** Early in project (concept, early development)

**Structure:**
```
/characters/[CharacterName]/
├── [name]-profile.md              # Who they are
├── [name]-source-descriptions.md  # Facts from source (if applicable)
├── creative-license-log.md        # Documented creative choices (if source)
├── [name]-visual-prompts.md       # Visual development (if applicable)
└── [NAME]-REFERENCE-IMAGE.md      # Hero image (if visual dev)
```

**Contents:**
- **Profile:**
  - Character overview
  - Biography
  - Personality traits
  - Relationships
  - Professional expertise (if applicable)
  - Voice & dialogue patterns (basic)

- **Source Descriptions** (if adapting):
  - EXPLICIT facts from source (with citations)
  - IMPLIED characteristics
  - UNSPECIFIED (creative license territory)

- **Creative License Log** (if source material):
  - Every invented detail documented
  - Format: "CREATIVE LICENSE: [what] to illuminate [why]"

- **Visual Development** (if applicable):
  - Midjourney prompts (3 variations)
  - Generated images
  - Hero image selection

**Process:**
- Use character-worldbuilding-agent (if source material)
- Create foundation before writing episodes
- Focus: Establishing who character IS

#### Stage 2: Arc Tracking
**When:** Writing actual episodes/chapters (transformation tracking needed)

**Structure:**
```
/character-arcs/
├── [CharacterName]-[season/book]-arc.md    # Episode-by-episode tracking
└── [CharA]-[CharB]-relationship-arc.md     # Relationship evolution
```

**Contents:**
- **Per Episode/Chapter:**
  ```markdown
  ## EPISODE X: [Title]

  Physical Markers:
  - [Observable physical state, appearance, energy]

  Emotional Markers:
  - [Internal emotional state, visible or hidden]

  Relational Markers:
  - [How character relates to others, power dynamics]

  What Character CAN Do at This Point:
  ✅ [Capabilities, skills, understanding they have now]

  What Character CANNOT Do Yet:
  ❌ [Capabilities not yet developed, understanding not yet gained]

  Key Moment This Episode:
  - [Pivotal moment that moves arc forward]
  ```

- **Relationship Arcs:**
  - Power dynamics per episode
  - Intimacy progression
  - Trust evolution
  - How relationship changes

**Process:**
- Created after foundation is established
- Updated as episodes are planned/written
- Used for consistency checks (prevents anachronisms)
- Q-CHARACTER command can verify arc adherence

**Purpose:**
- **Prevents:** Character doing things before they've learned how
- **Ensures:** Visible, trackable transformation
- **Provides:** Reference for scene writing (what CAN/CANNOT character do at this point?)

**Progressive Transition:**
- **Trigger:** When user has 3+ episode outlines OR starts writing scenes
- **Offer:** "I notice you're developing multiple episodes. Would you like to set up episode-by-episode character arc tracking? This helps prevent anachronistic behavior (character too advanced too early)."
- **If accepted:** Create arc structure, populate first character as example, explain how to use

### 8. Session Management (Configuration Choice)

**Two Strategies:**

#### Individual Files (Standard v2.0)
**When:** Team projects, strict v2.0 compliance, or user preference

**Structure:**
```
/GeneratedMDs/session-notes/
├── 2025-11-04-0850-Gabriel.md
├── 2025-11-05-1001-Gabriel.md
├── 2025-11-06-1430-Gabriel.md
└── ...
```

**Q-BEGIN:** Reads most recent individual file
**Q-END:** Creates new individual file

**Benefits:**
- Standard v2.0 compliance
- Discrete session units
- Easy to find specific session by date
- Team-friendly (per-person naming prevents collisions)

#### Consolidated + Archive (UCU Optimization)
**When:** Solo projects, long-running projects, or user preference for speed

**Structure:**
```
/[domain-dir]/session-notes.md              # Active consolidated
/[domain-dir]/archives/
└── session-notes-archive-sessions-01-10.md
└── session-notes-archive-sessions-11-20.md
```

**Q-BEGIN:** Reads consolidated file (faster context loading)
**Q-END:** Creates individual file AND appends to consolidated

**Archiving:**
- Every 10 sessions (~800 lines)
- Moves to archives/
- Q-END warns when threshold approaching

**Benefits:**
- Fast Q-BEGIN context loading (one file vs scanning)
- Continuous narrative of project
- Still v2.0 compliant (individual files created)

**Configuration:**
- Q-SETUP-DOMAIN asks user preference
- Can be changed later with Q-RECONFIGURE-DOMAIN

---

## Progressive Scaffolding Triggers

**Built-in Intelligence:**

Q-Screen monitors session activity and offers infrastructure upgrades at appropriate moments.

### Trigger Categories:

#### 1. File Pattern Triggers
```
WHEN repo has 5+ files matching pattern:
  - /screenplay/scenes/*.md → Offer Q-SCENE command
  - /episodes/*.md → Offer season arc tracking
  - /character-profiles/*.md → Offer arc tracking
```

#### 2. Keyword Mention Triggers
```
WHEN user mentions keywords N+ times:
  - "character arc" (2x) → Offer episode-by-episode arc tracking
  - "timeline" "chronology" (2x) → Offer Q-TIMELINE command
  - "Midjourney" "visual" (1x) → Offer visual development infrastructure
  - "feedback" "share" (3x) → Offer deliverables export
  - "inconsistency" "contradiction" (2x) → Offer FILE-STRUCTURE-MAP.md
```

#### 3. Repo Size Triggers
```
WHEN repo reaches size threshold:
  - 30 files → Offer FILE-STRUCTURE-MAP.md
  - 50 files → Offer advanced archiving
  - 100 files → Offer repo organization review
```

#### 4. User Growth Signals
```
WHEN user behavior changes:
  - Writing speed increases → May be ready for less scaffolding
  - Asking fewer questions → May be ready for intermediate mode
  - Mentions "I know how to..." → Acknowledge growth, offer mode adjustment
```

#### 5. Project Stage Transitions
```
WHEN project transitions:
  - Outlines → Scenes: Offer scene PREP infrastructure
  - Concept → Pilot: Offer full screenplay infrastructure
  - Pilot → Season: Offer multi-episode tracking
  - Solo → Team: Offer collaboration infrastructure
```

### Offering Process:

**1. Detection:**
- Trigger condition met
- Not yet offered (check .q-system/triggers.json)

**2. Timing:**
- Don't interrupt active work
- Offer at natural pause (end of task, before Q-END, at Q-BEGIN)

**3. Presentation:**
```
Claude: "I notice [observation].

Would you like me to [offer]? This would help by [benefit].

I can set this up now, or we can do it later. What would you prefer?

Options:
a) Yes, set it up now
b) Yes, but remind me later
c) No thanks, not needed
d) Tell me more about what this does"
```

**4. Execution:**
- If accepted: Execute setup actions
- If deferred: Keep trigger active, offer again in future
- If declined: Remove from trigger list

**5. Documentation:**
- Update .q-system/triggers.json
- Log in session notes
- Update DOMAIN-SETUP-SUMMARY.md if significant addition

---

## Experience Level Calibration

**How System Adapts to User Experience:**

### Complete Beginner

**Scaffolding Level:** HIGH

**Characteristics:**
- Extensive guidance in templates
- Detailed quality checklists (educational)
- Structural collaborative mode enforcement
- Explains "why" for decisions
- Prevents common mistakes proactively

**Example - Scene PREP Template:**
```markdown
## SECTION 1: SCENE IDENTIFICATION

**What this section does:** Identifies which scene we're preparing for.

**Episode:** [Which episode number?]
**Act:** [Which act: 1, 2, or 3?]
**Scene Number:** [Sequential scene number in episode]
**Scene Slug:** [INT/EXT. LOCATION - TIME]

**Why we need this:** Ensures we're looking at the right character states,
timeline position, and arc placement for this specific scene.
```

**Quality Checklist:**
```
Scene PREP Quality Checklist:

[ ] Scene identified correctly (episode, act, scene number)
[ ] All relevant character arcs read (understand where characters are emotionally)
[ ] Timeline verified (no chronological errors)
[ ] Source material respected (if applicable - check for contradictions)
[ ] Questions prepared (10 questions for collaborative development)
[ ] Tone is collaborative (questions not prescriptions)
[ ] No creative decisions made without user input

Common Beginner Mistakes to Avoid:
- Writing dialogue in PREP (save for actual scene writing)
- Making creative decisions unilaterally (always ask user)
- Forgetting to check character arc CAN/CANNOT boundaries
- Not verifying timeline position
```

### Learning (Intermediate)

**Scaffolding Level:** MEDIUM

**Characteristics:**
- Standard guidance in templates
- Standard quality checklists
- Narrative collaborative mode (optional enforcement)
- Assumes basic knowledge (screenplay format, story structure)
- Focuses on quality, less on education

**Example - Scene PREP Template:**
```markdown
## SECTION 1: SCENE IDENTIFICATION

**Episode:** [Number]
**Act:** [1, 2, 3]
**Scene:** [Number]
**Slug:** [INT/EXT. LOCATION - TIME]
```

**Quality Checklist:**
```
[ ] Scene identified
[ ] Character arcs referenced
[ ] Timeline verified
[ ] Questions prepared (collaborative development)
[ ] No unilateral creative decisions
```

### Intermediate

**Scaffolding Level:** LIGHT

**Characteristics:**
- Minimal guidance in templates
- Concise quality checklists
- Optional collaborative mode
- Assumes professional knowledge
- Efficiency over education

**Example - Scene PREP Template:**
```markdown
## SCENE ID
EP[X] / ACT[X] / SCENE[X]
[Slug]
```

**Quality Checklist:**
```
[ ] Arcs checked
[ ] Timeline verified
[ ] Collaborative approach maintained
```

### Advanced

**Scaffolding Level:** MINIMAL

**Characteristics:**
- Bare-bones templates (customizable)
- Minimal/no checklists
- No collaborative mode (unless requested)
- Maximum flexibility
- System stays out of the way

**Example:**
- May not even use templates
- Custom workflows defined by user
- Claude provides tools when asked
- User drives completely

**Approach:**
"I see you're experienced. I've set up basic infrastructure. Let me know what you need, and I'll get out of your way."

---

## Q-Screen in Action: Example Scenarios

### Scenario 1: Complete Beginner, Original Pilot

**Context:**
- User: Complete beginner, never written screenplay
- Project: Original pilot episode idea
- Goal: Write complete pilot
- Starting point: Just an idea

**Q-SETUP-DOMAIN Session:**

```
Q: What domain?
A: Screenplay

Q: Starting with?
A: Nothing yet - just an idea

Q: Project goal?
A: Complete pilot episode

Q: Experience level?
A: Complete beginner

Q: Collaboration?
A: Solo

Q: Visual needs?
A: Maybe later

Q: Source materials?
A: Original work

Q: Repo state?
A: New
```

**Immediate Setup:**
```
Directories:
  /docs/
  /GeneratedMDs/
  /concept-development/    # For early ideation
  /character-profiles/     # Will create characters
  /episode-planning/       # Will plan structure
  /screenplay/scenes/      # For when ready to write

Skills:
  Screenplay_Format_Skill.md (will need formatting guidance)

Agents:
  None yet (too early, will offer when writing scenes)

Custom Commands:
  None yet (will offer Q-SCENE when user starts writing)

Collaborative Mode:
  Structural enforcement (beginner needs strong guardrails)

Session Notes:
  User preference (offer both options)
```

**Recommended First Steps:**
```
1. Run Q-BEGIN to start first session
2. Let's develop your concept together:
   - What's the core idea?
   - Who's the protagonist?
   - What's the central conflict?
3. Create basic character profiles
4. Develop episode structure (three-act)
5. Plan scene breakdown

As you progress:
- When you have 3+ characters → I'll offer character arc tracking
- When you start writing scenes → I'll offer scene PREP agent + Q-SCENE command
- When you mention visual ideas → I'll offer visual development infrastructure
```

**Week 1 Experience:**
- High guidance on story structure
- Collaborative character development (Claude asks questions, user discovers)
- Scene planning with detailed beat discussions
- Heavy scaffolding, educational approach

**Week 3 Trigger:**
```
Claude: "I notice you've written 5 scenes now, and you're getting into a rhythm.

Would you like me to set up the Q-SCENE command? This provides a standardized
workflow for scene development with collaborative beat discussion before drafting.

Benefits:
- Ensures we discuss beats before I draft
- Maintains collaborative approach
- Quality checklist prevents common mistakes
- Faster scene development once you're comfortable

I can set it up now, or wait. What do you prefer?"
```

### Scenario 2: Beginner Adapting Source Material (UCU-like)

**Context:**
- User: Beginner screenwriter
- Project: Adapt canonical source (Urantia Book)
- Goal: 3-episode proof-of-concept outlines
- Starting point: Source material (Papers 62-63)
- Visual needs: Yes (character concept art)

**Q-SETUP-DOMAIN Session:**

```
Q: What domain?
A: Screenplay

Q: Starting with?
A: Source material to adapt

Q: Project goal?
A: Explore concept - 3-episode outlines

Q: Experience?
A: Complete beginner

Q: Collaboration?
A: Solo

Q: Visual needs?
A: Yes - character/location concept art

Q: Source materials?
A: Single canonical source (must respect)

Q: Repo state?
A: New
```

**Immediate Setup:**
```
Directories:
  /docs/                       # Source materials
    /source-materials/
      papers-62-63.txt
  /GeneratedMDs/
  /world-building/
    /characters/[Name]/        # Character-centric organization
  /episode-outlines/           # Prose outlines
  /visual-reference/
    /characters/
    /locations/
  /working-notes/              # Exploration space

Skills:
  Midjourney_Prompt_Skill.md  # Visual development
  Source_Fidelity_Skill.md    # Two-layer framework

Agents:
  character-worldbuilding-agent.md  # Source mining + visual prompts

Custom Commands:
  None yet (outlining stage, not scripting)

Collaborative Mode:
  Narrative style (Prep-Then-Collaborate documented in CLAUDE.md)

Source Framework:
  Two-layer fidelity (sacred + creative license)
  Creative license logging template

Session Notes:
  Consolidated + archive (solo, optimization)
```

**Recommended First Steps:**
```
1. Q-BEGIN to start
2. Let's mine the source material together:
   - I'll read Papers 62-63
   - Prepare questions about key story moments
   - You react emotionally to material
   - We synthesize together
3. Use character-worldbuilding-agent for Andon:
   - Agent mines Papers for explicit descriptions
   - Agent asks you questions about creative license territory
   - Agent creates complete character package
4. Develop episode outlines collaboratively
5. Generate visual development (Midjourney prompts)

As you progress:
- When you have outlines complete → I'll offer to move to screenplay format
- When you start writing actual scenes → I'll offer scene PREP infrastructure
- When repo grows → I'll offer FILE-STRUCTURE-MAP.md
```

**Character Development Example:**
```
User: "Let's develop Andon"

Claude: "I'll invoke the character-worldbuilding-agent for Andon.
         This will:
         1. Mine Papers 62-63 for all explicit descriptions of Andon
         2. Identify what's EXPLICIT vs UNSPECIFIED (creative license territory)
         3. Ask you targeted questions about how to fill gaps
         4. Create complete character package

         [Invokes agent via Task tool]

[Agent works autonomously, returns in ~2-3 minutes]

Agent: "TOUCHPOINT 1: Findings & Questions

Here's what Papers 62-63 explicitly state about Andon:
- Age 19 when fled tribe (Paper 63:3.1)
- Swarthy complexion (Paper 63:4.1)
- Superior intelligence (Paper 63:1.2)
- ... [more explicit facts with citations]

Creative License Territory (Papers DON'T specify):
- Exact facial structure
- Body build (beyond 'over 4 feet tall')
- Scars or markings
- Hair length/styling
- Specific emotional expressions

Questions for you:
1. Should Andon show visible weathering (scars, etc.) or be more 'clean'?
2. How much physical power vs agility should his build suggest?
3. Should his intelligence be visible in his expression/eyes?
4. Any specific survival markers you want visible?
5. How old should he LOOK (vs chronological age 19)?

[User answers questions]

[Agent proceeds to Phase 2, synthesizes, then Phase 3 creates deliverables]

Agent: "TOUCHPOINT 3: Complete Package Delivered

Files created:
- /world-building/characters/Andon/andon-urantia-book-descriptions.md
- /world-building/characters/Andon/creative-license-log.md
- /world-building/characters/Andon/andon-midjourney-prompts.md (3 variations)

Ready for Midjourney testing.

Shall we do Fonta next, or would you like to test Andon's visual prompts first?"
```

**Week 2 Experience:**
- Collaboratively mining source material
- Character development with agent support
- Visual development workflow established
- Episode outlines taking shape
- Continuous narrative in consolidated session notes

### Scenario 3: Beginner with Existing Pitch Bible (TDW-like)

**Context:**
- User: Beginner screenwriter
- Project: Write pilot from existing pitch bible
- Goal: Complete pilot screenplay
- Starting point: Pitch bible from collaborators (Santiago, Reza)
- Source complexity: Multiple sources with hierarchy (UB canonical, Gospel inspirational)
- Collaboration: Will share for feedback occasionally

**Q-SETUP-DOMAIN Session:**

```
Q: What domain?
A: Screenplay

Q: Starting with?
A: Pitch bible from collaborators

Q: Project goal?
A: Complete pilot screenplay

Q: Experience?
A: Complete beginner

Q: Collaboration?
A: Occasional feedback - will share drafts

Q: Visual needs?
A: No (or already done in pitch bible)

Q: Source materials?
A: Multiple sources with hierarchy

Q: Repo state?
A: New
```

**Immediate Setup:**
```
Directories:
  /docs/                          # Stable reference
    /pitch-bible.md
    /source-materials/
      urantia-book-references.md  # PRIMARY source
      gospel-of-mary.md           # SECONDARY source
  /GeneratedMDs/                  # Evolving development
    /character-profiles/          # From pitch bible
    /character-arcs/              # Will create for tracking
    /episode-planning/            # Scene structure
    /workflows/
  /screenplay/scenes/             # Actual scenes
  /deliverables/                  # For feedback sharing

Skills:
  Screenplay_Format_Skill.md      # Needs formatting guidance

Agents:
  scene-prep-agent-instructions.md  # Writing scenes immediately

Special Files:
  FILE-STRUCTURE-MAP.md           # Already complex repo

Custom Commands:
  Q-SCENE                         # Scene development workflow
  Q-RESEARCH                      # Source hierarchy enforcement

Collaborative Mode:
  Structural enforcement (beginner + complex project = strong guardrails)

Source Framework:
  Multi-source hierarchy (PRIMARY/SECONDARY)
  Q-RESEARCH enforces hierarchy
  Quality checklists verify proper labeling

Session Notes:
  Individual files (may share repo with collaborators)
```

**Recommended First Steps:**
```
1. Q-BEGIN
2. Let's review the pitch bible together
3. Create character profiles (from pitch bible)
4. Plan pilot episode structure
5. When ready to write scenes:
   - Use scene-prep-agent
   - Agent reads character arcs, timelines, source materials
   - Agent creates PREP file with 10 questions
   - We develop scene collaboratively
   - I draft based on our discussion

Critical: Source Hierarchy
- UB = PRIMARY (canonical truth for plot, events, facts)
- Gospel of Mary = SECONDARY (thematic inspiration only)
- Q-RESEARCH command enforces this (prevents errors)
- Always label findings clearly

As you progress:
- When 5+ scenes written → I'll offer Q-CHARACTER command
- When character arcs need tracking → I'll offer arc tracking
- When you mention timeline → I'll offer Q-TIMELINE command
- Before sharing work → I'll help create polished export
```

**Scene Development Example:**
```
User: "I want to write Scene 3 - Sarah's office confrontation"

Claude: "Great! Let me invoke the scene-prep-agent to prepare for this scene.

[Invokes scene-prep-agent via Task tool]

[Agent executes 12-step protocol autonomously]

Agent: Complete PREP file created: /screenplay/scenes/EP01-ACT01-SC03-PREP.md

[PREP file includes 12 sections:]
1. Scene Identification
2. Character States (from arc tracking)
3. Timeline Position
4. Source Material References (UB + Gospel, properly labeled)
5. Emotional Beats Available
6. What Can/Cannot Happen (based on character arcs)
7. Thematic Resonance
8. Technical Considerations
9. Dialogue Considerations
10. Blocking/Visual Notes
11. Continuity Checks
12. Key Questions for Gabriel (10 questions)

Claude: "I've read the character arcs, timeline, and source materials.

Here are 10 questions to guide our scene development:

1. Should Sarah's reaction to Laporte's revelation be visible or suppressed?
2. How much of Laporte's guilt should he verbalize vs show physically?
3. Should their shared grief moment be spoken or silent?
4. [... 7 more specific questions]

Let's discuss the beat outline before I draft. What's your instinct for how
this scene should unfold emotionally?"

[User answers, they develop beat outline collaboratively]

Claude: "Based on our discussion, here's the beat outline:
[Lists 4-5 beats]

Does this feel right? Any adjustments before I draft?"

[User approves or requests changes]

Claude: [Drafts scene based on collaborative beat discussion]

[Shares draft]

Claude: "Here's the first draft. What's working? What needs adjustment?"

[Collaborative revision process]
```

**Quality Enforcement:**
- Collaborative mode prevents Claude from drafting without discussion
- scene-prep-agent ensures all context gathered
- Q-RESEARCH prevents Gospel being treated as historical canon
- Quality checklists verify proper source labeling
- FILE-STRUCTURE-MAP.md keeps agent efficient (doesn't read unnecessary files)

**Week 4 Trigger:**
```
Claude: "I notice you've written scenes for 3 different characters now.

Would you like me to set up episode-by-episode character arc tracking?

This helps prevent anachronistic behavior - for example, Sarah showing
vulnerability before she's emotionally ready, or Laporte trusting before
his protective walls have started to crack.

The arc tracking documents:
- Physical/emotional/relational markers per episode
- What character CAN do at each point (capabilities gained)
- What character CANNOT do yet (capabilities not yet developed)

Example: In Episode 1, Sarah CANNOT feel grief yet (completely shut down),
but by Episode 3, she CAN allow moments of vulnerability with Ruth.

Would this be helpful?"
```

---

## Summary: The Adaptive Q-Screen System

**What Q-Screen Provides:**

1. **Context-Aware Setup**
   - Not "Lite vs Full"
   - Configured based on where you're starting, what you're creating, what you know

2. **Progressive Scaffolding**
   - Start simple, appropriate to current stage
   - Offer next-level tools when signals indicate readiness
   - Grow with your project organically

3. **Experience Calibration**
   - High scaffolding for beginners (education + structure)
   - Medium scaffolding for learning writers (guidance available)
   - Light scaffolding for intermediate (efficiency focus)
   - Minimal scaffolding for advanced (maximum flexibility)

4. **Just-in-Time Infrastructure**
   - Don't set up tools before you need them
   - Don't delay tools when you do need them
   - Watch for signals, offer at right moment

5. **Respectful Adaptation**
   - Offers can be accepted, declined, or deferred
   - User maintains control
   - System adapts to feedback

**The Result:**

> **A one-on-one tutor for screenplay writing that:**
> - Meets you where you are
> - Teaches what you need when you need it
> - Grows with your project
> - Respects your learning pace
> - Provides structure without constraining creativity
> - Adapts continuously based on your evolving needs

**Not a system. A tutor.**

---

**END OF Q-SCREEN ADAPTIVE DOMAIN SPECIFICATION**

**Next Steps:**
1. Implement Q-SETUP-DOMAIN wizard (from other spec)
2. Create Q-Screen question set
3. Build trigger monitoring system
4. Test with real projects (UCU and TDW as validation)
5. Refine based on actual usage
