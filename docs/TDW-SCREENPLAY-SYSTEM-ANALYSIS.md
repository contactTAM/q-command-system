# TDW Streaming Series Q-Command System Analysis

**Analysis Date:** 2025-11-17
**Repository:** `/Users/gabriel/Q-Lingua Dropbox/Gabriel Rymberg/Mac/Documents/GitHub/tdw-streaming-series`
**Project:** "The Divine Within: The Lost Gospel of Women" - Prestige dual-timeline drama series pilot
**Purpose:** Reference implementation study for Q-Command System v3.0 domain-specific extensions

---

## Executive Summary

This analysis examines a real-world implementation of a domain-specific Q-Command System for screenplay development. The TDW project demonstrates how the Q-Command System (v2.0) has been customized with screenplay-specific extensions to create what is effectively **screenplay development software running inside Claude Code**.

**Key Finding:** The system successfully guides a non-professional screenwriter (Gabriel) to produce high-quality screenplay work through:
- Custom agent infrastructure with scene prep automation
- Domain-specific Q-commands (Q-SCENE, Q-CHARACTER, Q-TIMELINE, Q-RESEARCH)
- Collaborative mode that prevents AI creative overreach
- Smart file navigation system optimizing context window usage
- Episode-granular character arc tracking

**Total Files Analyzed:** 72 markdown files (~1.5MB documentation)

---

## 1. Repository Structure

### Root Level Organization

```
tdw-streaming-series/
├── CLAUDE.md                    # 24KB - Domain-specific project instructions
├── SESSION-CHECKLIST.md         # Session workflow guide
├── docs/                        # Core reference materials (stable)
│   ├── FILE-STRUCTURE-MAP.md    # 14KB - Agent navigation system (CRITICAL)
│   ├── pitch-bible.md           # Series concept and vision
│   ├── the-gospel-of-mary.md    # Source material (thematic)
│   └── Urantia-Book-References.md # Source material (canonical)
├── GeneratedMDs/                # Development materials (evolving)
│   ├── analysis/                # Comparative analysis
│   ├── character-arcs/          # 9 files - Episode-by-episode development
│   ├── character-profiles/      # 4 files - Canonical character references
│   ├── checkpoints/             # 2 files - Mid-session snapshots
│   ├── corrections/             # 1 file - Project corrections log
│   ├── episode-planning/        # 6 files - Scene structure documents
│   ├── planning/                # 2 files - Strategic planning
│   ├── session-notes/          # 14 files - Session summaries
│   ├── transcripts/            # 12 files - Full conversation logs
│   ├── workflows/              # 4 files - Process documentation
│   └── SHORTCUTS.md            # 33KB - Q-command specifications (v2.2)
├── screenplay/                  # Actual screenplay output
│   └── scenes/                 # Individual scene files and PREP files
└── deliverables/               # External review materials (HTML)
```

### Three-Tier Organization Pattern

**Tier 1: Stable Reference Materials** (`docs/`)
- Source materials (UB references, Gospel of Mary)
- File structure map (agent navigation)
- Pitch bible (series vision)
- **Purpose:** Canonical truth, rarely changes

**Tier 2: Evolving Development Materials** (`GeneratedMDs/`)
- Character profiles and arcs
- Episode planning documents
- Session notes and transcripts
- Workflow documentation
- **Purpose:** Working materials, frequently updated

**Tier 3: Deliverables** (`screenplay/`, `deliverables/`)
- Actual screenplay scenes
- HTML exports for external review
- **Purpose:** Output artifacts, version controlled

**Design Insight:** This separation prevents confusion about what's canonical vs. working vs. deliverable.

---

## 2. Agent Infrastructure

### A. FILE-STRUCTURE-MAP.md - The Navigation System

**Location:** `/docs/FILE-STRUCTURE-MAP.md` (14KB)

**Purpose:** Master reference document that agents read FIRST before any scene prep work

**Key Features:**

1. **Complete Directory Structure Overview**
   - All directories explained
   - File purposes documented
   - Size warnings for large files

2. **Reading Priority System**

```markdown
ALWAYS READ (Every Scene):
1. Episode-1-Scene-Structure.md - Identify your scene
2. screenplay-scene-writing-workflow.md - Follow the process
3. pitch-bible.md - Series context and tone

READ BASED ON TIMELINE:
If ANCIENT: Urantia-Book-References.md + the-gospel-of-mary.md
If MODERN: (No timeline-specific docs currently)

READ BASED ON CHARACTERS IN SCENE:
For Sarah: PROFILE + awakening-arc (ALWAYS)
For Mary: PROFILE + awakening-arc + source-prep (ALWAYS)
For Laporte: PROFILE + (if Sarah present: relationship doc)
For Henri: PROFILE + timeline doc
```

3. **Smart Reading Strategy**

**Example - Sarah Scene with Laporte:**
```
TOTAL FILES TO READ: 5-6 files
ESTIMATED TOKENS: ~150KB

ALWAYS READ:
- Episode-1-Scene-Structure.md (identify scene)
- screenplay-scene-writing-workflow.md (process)
- pitch-bible.md (context)
- Sarah-Jones-PROFILE.md
- Sarah-Jones-awakening-arc.md
- Laporte-PROFILE.md
- Sarah-Laporte-relationship.md

SKIP:
- Session notes/transcripts (historical only)
- Unrelated character materials
- Gospel of Mary (modern scene)
- All Mary Magdalene materials
```

4. **Efficiency Calculations**

The file map includes token/context calculations to help agents understand the cost of their reading choices.

**Design Insight:** This prevents agents from wasting context window reading unnecessary materials. Critical for large repositories.

### B. Scene PREP Agent Instructions

**Location:** `/GeneratedMDs/workflows/scene-prep-agent-instructions.md` (610 lines)

**Purpose:** Complete autonomous agent instructions for creating scene PREP files

**Structure:**

#### 1. Mission Definition (Lines 1-40)
```markdown
MISSION: Create comprehensive PREP file for specific scene

INPUT YOU WILL RECEIVE:
- Scene number (e.g., "Scene 2")
- Timeline (ANCIENT or MODERN)
- Basic scene description

OUTPUT YOU WILL PRODUCE:
- Complete PREP file following 12-section template
- 10 specific questions for Gabriel
- All relevant context integrated
```

#### 2. Execution Steps (12 Steps)

**Conditional Reading Logic:**
```markdown
STEP 1: Read FILE-STRUCTURE-MAP.md (understand repository)
STEP 2: Read Episode-1-Scene-Structure.md (identify target scene)
STEP 3: Read screenplay-scene-writing-workflow.md (process)
STEP 4: IF ANCIENT timeline → Read UB + Gospel of Mary
STEP 5: IF Sarah appears → Read profile + arc + relationships
        IF Mary appears → Read profile + arc + source-prep
STEP 6: IF Henri backstory → Read Henri-Laporte-timeline.md
STEP 7: Read pitch-bible.md (series vision)
STEP 8: Read relevant relationship docs
STEP 9: Create 12-section PREP file
STEP 10: Generate 10 specific questions for Gabriel
STEP 11: Quality check against checklist
STEP 12: Submit PREP file
```

**Design Insight:** Conditional logic prevents reading unnecessary files, saving ~50-70% of potential context usage.

#### 3. PREP File Template (12 Sections)

```markdown
# SCENE [NUMBER] - [TITLE] - [TIMELINE] - PREP

## 1. SCENE PURPOSE (From Episode Structure)
- What this scene must accomplish
- Why it exists in episode flow

## 2. CHARACTER STATE AT THIS MOMENT
- Where each character is in their arc
- Physical/emotional/relational markers
- What they can/cannot do at this point

## 3. SCENE CONTEXT
- What came before (previous scene)
- What comes after (next scene)
- Episode position and pacing

## 4. ENVIRONMENT/LOCATION DETAILS
- Setting description
- Atmospheric elements
- Visual opportunities

## 5. SCENE BEATS & STRUCTURE
- 3-5 beats that create scene arc
- Emotional/tension progression
- Key turning points

## 6. KEY QUESTIONS FOR GABRIEL (10 Specific Questions)
- Choreography decisions
- Emotional visibility choices
- Dialogue vs. silence
- Visual approach preferences
- Subtext interpretation
- **CRITICAL: This section transforms prep from prescription to collaboration**

## 7. THEMATIC CONNECTIONS
- How scene serves series themes
- "The Divine Within" resonance
- Dual-timeline parallels (if applicable)

## 8. DIALOGUE CONSIDERATIONS
- Character voice patterns
- What each character would/wouldn't say
- Subtext opportunities

## 9. TECHNICAL NOTES
- Scene length target
- Pacing considerations
- Visual storytelling opportunities

## 10. CONNECTION TO ESSENTIAL BEATS
- How this scene connects to pilot must-haves
- Stakes establishment
- Arc progression markers

## 11. ANCIENT TIMELINE UB REFERENCES (If Applicable)
- Specific UB citations relevant to scene
- Historical accuracy requirements
- Canonical events to honor

## 12. WRITER'S REMINDERS
- What this scene IS
- What this scene IS NOT (common pitfalls)
- Character arc boundaries at this point
```

**Design Insight - Section 6 is Critical:**

The "10 Questions for Gabriel" section forces the agent to identify where human creative judgment is needed rather than prescribing solutions. This transforms the PREP from a directive into a collaborative invitation.

**Example Questions:**
- "Should Sarah's reaction be visible or suppressed in this moment?"
- "How much of Laporte's guilt should he verbalize vs. show through body language?"
- "Does Sarah walk away or force herself to stay in this conversation?"

#### 4. Quality Standards

**MUST Requirements:**
- All 12 sections complete
- Character states accurate to arc position
- UB references cited (ancient scenes)
- 10 specific questions included
- Tone is collaborative, not prescriptive

**MUST NOT Violations:**
- Making creative decisions for Gabriel
- Suggesting dialogue lines
- Prescribing choreography
- Anachronistic character behavior
- Missing sections or TBD placeholders

#### 5. Special Considerations

**Character-Specific Warnings:**

**For Sarah:**
- Episodes 1-3: Fortress intact, clinical precision, no vulnerability
- Episodes 4-5: Cracks appearing, exhaustion visible
- Episodes 6-8: Awakening, compassion, groundedness
- **WARNING:** Don't let her be too self-aware too early

**For Mary:**
- Always use UB references for historical accuracy
- Gospel of Mary = thematic inspiration only
- Track her teaching evolution episode-by-episode

#### 6. Error Prevention Checklist

```markdown
Before Submitting PREP File, Verify:
- [ ] Correct scene number and title
- [ ] All characters have state analysis
- [ ] Character states match arcs at episode point
- [ ] UB references cited (ancient scenes)
- [ ] 10 specific questions for Gabriel
- [ ] All sections complete (no TBD)
- [ ] No creative decisions made, only preparation
- [ ] Tone is collaborative, not prescriptive
```

### C. Example Scene PREP File

**Location:** `/screenplay/scenes/Scene-02-Sarah-NYU-Lecture-MODERN-PREP.md` (24KB)

This demonstrates the template in action. The file follows all 12 sections, includes character arc-accurate state descriptions, and provides 10 specific questions like:

- "How visible should Sarah's exhaustion be in the lecture?"
- "Should students be disengaged, challenging, or reverential?"
- "Does Sarah deflect the student's question clinically or with barely-contained frustration?"

**Design Insight:** The questions reveal creative choices that only Gabriel (the storyteller) can make. The AI prepares the context but doesn't make the artistic decisions.

---

## 3. Q-Command Customization

### A. SHORTCUTS.md Customizations

**Location:** `/GeneratedMDs/SHORTCUTS.md` (33KB, 1076 lines)

**Version:** 2.2 (Collaborative screenplay development)

**Structure:**

1. **Lines 10-42:** COLLABORATIVE WORKING MODE (CRITICAL)
2. **Lines 43-628:** Standard Q-Commands (Q-BEGIN, Q-END, Q-CHECKPOINT, Q-STATUS, Q-VERIFY, etc.)
3. **Lines 629-943:** Project-Specific Commands (Q-SCENE, Q-CHARACTER, Q-TIMELINE, Q-RESEARCH)

### B. Collaborative Working Mode - THE KEY INNOVATION

**Lines 10-42 of SHORTCUTS.md:**

```markdown
## COLLABORATIVE WORKING MODE

You are working with Gabriel to develop a prestige streaming series through
deeply collaborative creative work. This is NOT a traditional coding session.

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
- Start: Ask Gabriel what to explore today
- Prepare: Create questions/options about that topic
- Present: Share with Gabriel for discussion
- Collaborate: Work through together with frequent dialogue
- Document: Capture decisions as we make them
- Never: Go work independently and return with completed analysis

### Why This Matters:
- Story intuition comes from Gabriel
- Your role: Organize, structure, question, suggest
- Gabriel's role: Creative decisions, artistic judgment, story truth
- Together: High-quality development through dialogue

### Red Flags (Stop Immediately If You Catch Yourself):
- Completing arc analysis without Gabriel's input
- Making creative decisions unilaterally
- Returning with "finished" work on creative topics
- Assuming you know what Gabriel wants without asking
```

**Design Insight:** This is the KEY to domain-specific Q-Command systems for creative work. It structurally prevents AI from overstepping into creative authority.

**Enforcement Mechanisms:**
1. Placed at top of SHORTCUTS.md (read first)
2. Repeated in workflow documents
3. Embedded in PREP template (Section 6: Questions)
4. Scene workflow requires discussion before drafting

### C. Domain-Specific Q-Commands

#### Q-SCENE (Lines 635-686)

**Purpose:** Guided scene development workflow

**5-Step Process:**

```markdown
STEP 1: GATHER SCENE BASICS
Ask Gabriel:
- Which scene number?
- Timeline (ANCIENT or MODERN)?
- Location and characters?
- Scene purpose?

STEP 2: DEVELOP BEAT OUTLINE (COLLABORATIVELY)
- Present 3-5 potential beats
- Discuss with Gabriel
- Refine based on feedback
- Document agreed beats

STEP 3: WRITE FIRST DRAFT
- Based on Gabriel's guidance from Step 2
- Follow screenplay format
- Match character voices
- Never draft without prior discussion

STEP 4: REVIEW AGAINST CHECKLIST
- Character arcs accurate?
- Voice consistency?
- Scene purpose achieved?
- Essential beats included?

STEP 5: REFINE BASED ON FEEDBACK
- Incorporate Gabriel's notes
- Iterate until approved
```

**Key Feature:** Never drafts autonomously - always after collaborative beat discussion.

#### Q-CHARACTER [name] (Lines 688-751)

**Purpose:** Character analysis and voice consistency check

**5-Step Analysis:**

```markdown
STEP 1: REVIEW PITCH BIBLE PROFILE
- Read canonical character description
- Note core traits, biography, arc

STEP 2: ANALYZE ALL SCENES FEATURING CHARACTER
- Read every scene with this character
- Track behavior, dialogue, decisions

STEP 3: CHECK VOICE CONSISTENCY
- Compare dialogue across scenes
- Flag inconsistencies
- Note voice evolution (if arc-appropriate)

STEP 4: IDENTIFY ARC PROGRESSION IN PILOT
- Where do they start?
- Key transformation moments?
- Where do they end?

STEP 5: SUGGEST IMPROVEMENTS
- Areas of inconsistency?
- Missed opportunities?
- Arc clarity issues?
```

**Output:** Character analysis report + voice guide for future scenes

#### Q-TIMELINE [ancient|modern] (Lines 755-834)

**Purpose:** Timeline consistency verification and pacing analysis

**7-Step Verification:**

```markdown
STEP 1: LIST ALL SCENES IN TIMELINE
- Scene numbers and locations
- Character appearances
- Time markers

STEP 2: CHECK CHRONOLOGICAL FLOW
- Does time progress logically?
- Any jumps that need explanation?
- Pacing issues?

STEP 3: VERIFY ACCURACY
- ANCIENT: Historical accuracy via UB references
- MODERN: Contemporary plausibility

STEP 4: ENSURE VISUAL MOTIFS CONNECT TIMELINES
- Matched compositions
- Thematic resonances
- Parallel moments

STEP 5: IDENTIFY PACING ISSUES
- Too many ancient scenes in a row?
- Modern timeline dragging?
- Balance between timelines?

STEP 6: CHECK ESSENTIAL BEATS
- All pilot must-haves included?
- Stakes established?
- Questions raised?

STEP 7: SUGGEST STRUCTURAL IMPROVEMENTS
- Scene order adjustments?
- Missing connective tissue?
- Pacing refinements?
```

**Output:** Timeline analysis report with specific recommendations

#### Q-RESEARCH [topic] (Lines 838-942)

**Purpose:** Research support with proper source hierarchy

**CRITICAL INNOVATION - Source Hierarchy Protocol:**

```markdown
STEP 1: IDENTIFY RESEARCH NEED
- What topic/question?
- Which timeline (ancient or modern)?
- What decision does this inform?

STEP 2: APPLY SOURCE HIERARCHY (CRITICAL FOR ANCIENT TIMELINE)

PRIMARY SOURCE - The Urantia Book (UB):
- Check Urantia-Book-References.md FIRST
- If topic is in UB, use as canonical fact
- ALWAYS cite specific UB references (e.g., UB 150:1.1)
- Treat as historical truth, not interpretation

SECONDARY SOURCE - Gospel of Mary:
- Check the-gospel-of-mary.md for thematic inspiration
- Use for emotional/spiritual depth, NOT historical events
- ALWAYS label as "inspired by Gospel of Mary"
- Apply to character psychology, not plot facts

DISTINCTION:
- UB = "What historically happened" (plot, events, dialogue, dates)
- Gospel of Mary = "Thematic/emotional resonance" (character interiority)

WHY THIS MATTERS:
- Prevents treating thematic material as historical fact
- Maintains ancient timeline integrity
- Honors Gabriel's source credence hierarchy

STEP 3: CONDUCT RESEARCH
- Search relevant documents based on hierarchy
- Extract key information
- Cite all sources properly

STEP 4: PRESENT FINDINGS TO GABRIEL
- Summary of findings
- Source hierarchy clearly labeled
- Questions for Gabriel about application

STEP 5: DOCUMENT DECISION
- Capture Gabriel's decision
- Update relevant planning docs
```

**Design Insight:** This encodes Gabriel's personal credence hierarchy into the Q-command, preventing catastrophic errors where AI might treat thematic inspiration as historical fact.

**Example Usage:**
```
User: Q-RESEARCH Mary's teaching methods

Claude:
1. Checking Urantia-Book-References.md (PRIMARY SOURCE)
   - UB 150:1.1 describes Jesus teaching women
   - UB 150:2.3 mentions Mary's role
   - [Citations with page references]

2. Checking the-gospel-of-mary.md (SECONDARY SOURCE)
   - Thematic inspiration: Women as equal teachers
   - Emotional resonance: Mary's authority challenged
   - [Label as inspiration, not historical fact]

3. Presenting findings:
   - CANONICAL (from UB): [Historical events]
   - THEMATIC (from Gospel of Mary): [Emotional/spiritual themes]

Questions for Gabriel:
- How much of the UB teaching scenes do you want to dramatize?
- Should we incorporate the Gospel's thematic elements as Mary's interiority?
```

---

## 4. Templates and Patterns

### A. Character Profile Template

**Files:** 4 character profiles in `/GeneratedMDs/character-profiles/`

**Structure (Inferred from Sarah-Jones-PROFILE.md):**

```markdown
# [CHARACTER NAME] - CHARACTER PROFILE

**Created:** [Date]
**Status:** Canonical reference

## CHARACTER OVERVIEW
[Quick summary - who they are in one paragraph]

## BIOGRAPHY
[Life history relevant to series]
- Childhood and formative experiences
- Education and career path
- Key relationships and losses
- Current life situation

## PERSONALITY TRAITS
[Core characteristics]
- Strengths and capabilities
- Wounds and defensive mechanisms
- Contradictions and complexity
- How they relate to others

## EPISODE 1 STATE
[CRITICAL: Specific starting point for arc tracking]
- Emotional state
- Relationship status
- Professional situation
- Physical markers (posture, energy, presence)

## PROFESSIONAL EXPERTISE / MINISTRY ROLE
[What they do, their competence, their approach]

## VOICE & DIALOGUE PATTERNS
[How they speak]
- Vocabulary and diction
- Speech rhythms
- What they say vs. avoid
- Verbal defensive mechanisms

## RELATIONSHIPS
[Key connections]
- Family dynamics
- Professional relationships
- Romantic relationships (past/present)
- Conflicts and tensions

## ARC SUMMARY
[Season 1 transformation overview]
- Where they start (Episode 1)
- Key turning points (Episodes 2-7)
- Where they end (Episode 8)
- Transformation theme
```

**Design Insight - Episode 1 State Section:**

This is CRITICAL for arc tracking. It provides agents with the character's precise starting point, including:
- Physical markers: "Controlled posture, tight jaw, fortress body language"
- Emotional markers: "Exhausted but won't admit it, clinical precision, no vulnerability"
- Relational markers: "Keeps everyone at distance, including Eileen"

This allows PREP agents to accurately portray character behavior at any episode point.

**Example from Sarah's Profile:**

```markdown
## EPISODE 1 STATE

Sarah is in full fortress mode - her protective mechanisms are at maximum strength
because her father has just died and she refuses to feel it.

Physical State:
- Exhausted (hasn't slept properly in weeks)
- Controlled posture and movement
- Tight jaw, guarded body language
- Professional "on" at all times

Emotional State:
- Completely shut down to grief
- Channeling everything into work
- Clinical precision as armor
- Rage at father buried deep

Relational State:
- Keeps even Eileen (best friend) at distance
- Professional detachment with students
- Avoidance of Laporte (father wound)
- Isolated, self-sufficient fortress

This is the STARTING POINT. She cannot be more self-aware, vulnerable, or
awakened than this in Episode 1. Her awakening journey begins from this place.
```

### B. Character Arc Template

**Files:** 9 awakening arcs in `/GeneratedMDs/character-arcs/`

**Structure (from Sarah-Jones-awakening-arc.md, 43KB):**

```markdown
# [CHARACTER NAME] - AWAKENING ARC

**Arc Type:** Spiritual Awakening Journey
**Scope:** Season 1, Episodes 1-8
**Core Transformation:** [From → To]

## OVERVIEW
[Summary of transformation journey]

## THE HIDDEN ARCHITECTURE: "THE DIVINE WITHIN"
[Why series has this name, what it means for this character]
- Dual awakening structure (Sarah + Mary parallel)
- Thematic soul of series
- Ultimate destination of arc

## FOUNDATION: THE FORTRESS
[Character's starting protective mechanisms]
- Core wounds
- Defensive structures
- Inherited patterns
- What they're protecting

## WHAT CRACKS THE FORTRESS
[Crisis mechanisms that force transformation]
- External triggers
- Internal breaking points
- Forced confrontations

## THE EVOLUTION: AWAKENING STAGES

### Stage 1: Unconscious Automaton (Episodes 1-3)
[Character operating on autopilot, fortress intact]

**Episode 1: [Episode Title]**

Physical Markers:
- Controlled posture
- Exhaustion hidden
- Professional "on"

Emotional Markers:
- Completely shut down
- Clinical precision
- No vulnerability visible

Relational Markers:
- Keeps everyone at distance
- Professional detachment
- Avoidance of intimacy

Key Scenes:
- [Scene number]: [What happens, what it reveals]
- [Scene number]: [What happens, what it reveals]

What Sarah CAN do at this point:
✅ Function professionally
✅ Maintain control
✅ Analyze texts intellectually

What Sarah CANNOT do yet:
❌ Feel her grief
❌ Show vulnerability
❌ Let anyone help her
❌ Connect spiritually

**Episode 2: [Episode Title]**
[Similar structure]

**Episode 3: [Episode Title]**
[Similar structure]

### Stage 2: Awareness (Episodes 4-5)
[Cracks appearing, can't maintain fortress]

**Episode 4: [Title] - THE BREAKING POINT**
[Detailed markers and scenes]

### Stage 3: Awakening (Episodes 6-8)
[Transformation visible, new way of being]

**Episode 6: [Title] - FORGIVENESS**
[Detailed markers and scenes]

**Episode 7: [Title] - THE AWAKENED WITNESS**
[Detailed markers and scenes]

**Episode 8: [Title] - CLAIMING VOICE**
[Detailed markers and scenes]

## THE PARALLEL: MARY'S AWAKENING
[How Sarah's arc mirrors Mary's in ancient timeline]

## THE DIVINE WITHIN: ULTIMATE AWAKENING
[Season arc endpoint, series-long journey]
```

**Design Insight - Episode-by-Episode Markers:**

Breaking arcs down by episode with specific physical/emotional/relational markers allows PREP agents to know EXACT character state at any point in the season.

**Example - Sarah Episode 1 vs. Episode 7:**

**Episode 1 (Automaton):**
- Physical: Controlled posture, tight jaw, exhaustion hidden
- Emotional: Fortress intact, clinical precision, no vulnerability
- Relational: Everyone at distance, avoidance, isolation

**Episode 7 (Awakened):**
- Physical: Grounded presence, open posture, visible exhaustion but owned
- Emotional: Witness instead of react, compassion, self-awareness
- Relational: Chooses connection, allows vulnerability, offers forgiveness

**This prevents anachronistic behavior** - PREP agents can't write Sarah as too self-aware in Episode 2 or still shut down in Episode 7.

### C. Relationship Arc Template

**Files:** Several relationship docs in `/GeneratedMDs/character-arcs/`

**Example:** `Sarah-Laporte-relationship.md` (26KB)

**Structure:**

```markdown
# [CHARACTER A] - [CHARACTER B] RELATIONSHIP

**Relationship Type:** [Father-daughter, mentor-student, etc.]
**Core Dynamic:** [Power balance, emotional charge]
**Arc:** [How it transforms across season]

## RELATIONSHIP HISTORY
[Complete backstory]
- How they met
- Key positive moments
- The betrayal/wound
- Years of estrangement
- Current status at series start

## THE WOUND
[Core betrayal or hurt that defines relationship]

Example from Sarah-Laporte:
- Henri took Sarah's college fund to pay for affair
- Sarah found out, felt betrayed twice (infidelity + theft)
- 16 years of estrangement
- Sarah calls this "the title of my crash" (defining wound)

## POWER DYNAMICS BY EPISODE

**Episode 1:**
- Power: Sarah holds all power (distance, refusal)
- Laporte: Powerless, seeking forgiveness
- Dynamic: Fortress vs. Suppliant

**Episode 2:**
[Evolution]

**Episode 6:**
- Power: Shifting, Sarah begins releasing control
- Laporte: Humble, no longer seeking, just being
- Dynamic: Forgiveness emerging

## KEY SCENES
[Each scene where relationship shifts]

**Scene [number]: [Title]**
- What happens
- Power dynamic in this moment
- Emotional stakes
- What changes

## TRANSFORMATION ARC
[How relationship evolves from Episode 1 → Episode 8]

## DIALOGUE PATTERNS
[How they speak to each other]
- Episode 1 patterns (cold, formal, avoidant)
- Mid-season shifts
- Episode 8 patterns (warm, honest, connected)

## THEMATIC SIGNIFICANCE
[Why this relationship matters to series themes]
```

**Design Insight:** Tracking power dynamics episode-by-episode ensures relationship evolution feels earned and gradual, not sudden.

---

## 5. Generated Content Organization

### A. GeneratedMDs Directory Structure

```
GeneratedMDs/
├── analysis/                    # 1 file - Comparative analysis
├── character-arcs/              # 9 files - Episode-by-episode transformation tracking
│   ├── [Character]-awakening-arc.md
│   └── [Character A]-[Character B]-relationship.md
├── character-profiles/          # 4 files - Canonical character references
│   └── [Character]-PROFILE.md
├── checkpoints/                 # 2 files - Mid-session snapshots (Q-CHECKPOINT)
├── corrections/                 # 1 file - Project corrections log
├── episode-planning/            # 6 files - Scene structure documents
│   └── Episode-[N]-Scene-Structure.md
├── planning/                    # 2 files - Strategic planning
│   ├── dual-timeline-transition-toolkit.md
│   └── episode-1-essential-beats.md
├── session-notes/              # 14 files - Session summaries
│   └── YYYY-MM-DD-HHmm-Gabriel.md
├── transcripts/                # 12 files - Full conversation logs
│   └── YYYY-MM-DD-HHmm-Gabriel.md
├── workflows/                  # 4 files - Process documentation
│   ├── scene-prep-agent-instructions.md
│   ├── screenplay-scene-writing-workflow.md
│   ├── episode-scene-structure-workflow.md
│   └── character-relationship-exploration.md
└── SHORTCUTS.md                # 33KB - Q-command specifications (v2.2)
```

### B. Domain-Specific Subdirectories

**Unique to Screenplay Development:**

1. **character-arcs/**
   - Not just profiles, but episode-by-episode transformation tracking
   - Includes relationship arcs
   - Physical/emotional/relational markers per episode

2. **episode-planning/**
   - Scene-by-scene beat breakdowns
   - Essential beats per episode
   - Pacing and structure documents

3. **workflows/**
   - Process documentation for screenplay-specific workflows
   - Agent instructions
   - Writing workflows
   - Exploration methodologies

**Standard Q-Command System:**

4. **checkpoints/** - Mid-session progress snapshots (Q-CHECKPOINT)
5. **session-notes/** - Session summaries (Q-END)
6. **transcripts/** - Full conversation logs (Q-DUMP)

### C. Session Notes Format

**Files:** 14 session notes from 2025-11-14 to 2025-11-17

**Naming Convention:** `YYYY-MM-DD-HHmm-Gabriel.md` (per-person-per-session format from Q-Command v2.0)

**Content Structure (Creative + Technical):**

Unlike pure software development sessions, screenplay session notes blend creative decisions with technical implementation:

```markdown
# Session Notes - [Date] - Gabriel

## Session Overview
- Duration: X hours
- Focus: [Scene development / Character arcs / Episode structure]

## Creative Accomplishments
- Developed Sarah's awakening arc Episodes 1-8
- Defined Episode 1 essential beats
- Explored Sarah-Laporte relationship dynamics
- Incorporated Santiago/Reza feedback on structure

## Files Created/Modified
- [List of files]

## Key Creative Decisions
- Sarah's fortress must be intact through Episode 3
- Laporte forgiveness happens Episode 6, not earlier
- Ancient timeline UB references are canonical
- Gospel of Mary provides thematic inspiration only

## Technical Notes
- Created scene PREP file for Scene 2
- Updated FILE-STRUCTURE-MAP.md with new files
- Refined scene-prep-agent-instructions.md

## Next Session Focus
- [What to work on next]
```

**Design Insight:** Session notes capture BOTH artistic decisions (arc timing, thematic choices) AND technical development (files created, processes refined).

---

## 6. Key Files Inventory

### A. The File Map (CRITICAL)

**File:** `/docs/FILE-STRUCTURE-MAP.md` (14KB)

**Purpose:** Master navigation document for agents preparing scene PREP files

**Why It's Critical:**
- Agents read this FIRST before any scene prep work
- Prevents reading unnecessary materials (saves ~50-70% context)
- Provides smart reading strategies
- Calculates context window costs
- Enables conditional reading logic

**Structure:**
1. Repository overview
2. Directory-by-directory breakdown
3. File-by-file descriptions with sizes
4. Reading priority system (ALWAYS / IF-THEN / SKIP)
5. Efficiency calculations
6. Smart reading strategies per scene type

**Example Smart Strategy:**

```markdown
### TYPICAL SARAH SCENE (Modern Timeline)

MUST READ (5-6 files, ~150KB):
- Episode-1-Scene-Structure.md (find scene)
- screenplay-scene-writing-workflow.md (process)
- pitch-bible.md (context)
- Sarah-Jones-PROFILE.md (character)
- Sarah-Jones-awakening-arc.md (arc position)
- [Relationship doc if other character present]

CAN SKIP (~400KB saved):
- All Mary Magdalene materials (wrong timeline)
- All ancient timeline sources (UB, Gospel of Mary)
- Session notes (historical only)
- Other character materials (not in scene)
```

**Maintenance:** Must be updated when files added/removed/restructured

### B. Agent Prompt Files

**Primary Agent Instruction:**
- `/GeneratedMDs/workflows/scene-prep-agent-instructions.md` (610 lines)
  - Complete autonomous agent instructions
  - 12-step execution protocol
  - Conditional reading logic
  - Quality checklist
  - Error prevention

**Supporting Workflow Documents:**
- `/GeneratedMDs/workflows/screenplay-scene-writing-workflow.md` (367 lines)
  - How Gabriel and Claude write scenes together
  - Collaborative process steps
  - Review checklist

- `/GeneratedMDs/workflows/episode-scene-structure-workflow.md`
  - How to build episode scene breakdowns
  - Essential beats tracking

- `/GeneratedMDs/workflows/character-relationship-exploration.md`
  - How to explore relationship dynamics
  - Methodology for relationship arcs

**Design Insight:** These are procedural prompts that could be fed to AI agents (via Task tool) OR followed by human assistants. They're domain-specific process documentation.

### C. Setup/Configuration Files

**Core Configuration:**

1. **CLAUDE.md** (24KB)
   - Project context and creative vision
   - Source material hierarchy
   - Collaborative policies
   - Q-command workflow
   - Team and stakeholders

2. **SESSION-CHECKLIST.md**
   - User workflow guide
   - Q-BEGIN / Q-END procedures
   - Session best practices

3. **GeneratedMDs/SHORTCUTS.md** (33KB, 1076 lines)
   - Q-command v2.0 specifications
   - Collaborative working mode (lines 10-42)
   - Domain-specific commands (Q-SCENE, Q-CHARACTER, Q-TIMELINE, Q-RESEARCH)

**Design Insight:** No traditional config files (JSON/YAML). This is **document-driven configuration** where markdown files ARE the configuration.

### D. Templates in Action

**Character Profile Template:**
Inferred from 4 existing profiles:
- Character Overview
- Biography
- Personality Traits
- **Episode 1 State** (critical for arc tracking)
- Professional Expertise
- Voice & Dialogue Patterns
- Relationships
- Arc Summary

**Scene PREP Template:**
12-section structure in `scene-prep-agent-instructions.md`:
1. Scene Purpose
2. Character State at This Moment
3. Scene Context
4. Environment/Location Details
5. Scene Beats & Structure
6. **Key Questions for Gabriel** (10 questions)
7. Thematic Connections
8. Dialogue Considerations
9. Technical Notes
10. Connection to Essential Beats
11. Ancient Timeline UB References (if applicable)
12. Writer's Reminders (IS/IS NOT)

**Character Arc Template:**
- Overview
- The Hidden Architecture
- Foundation (wounds)
- What Cracks the Fortress
- The Evolution: Episode-by-episode stages with physical/emotional/relational markers
- Parallel to other timeline
- Ultimate awakening

---

## 7. Distinctive Patterns and Innovations

### A. Dual-Timeline Screenplay Architecture

**Ancient Timeline (30-33 CE):**
- Setting: Galilee, Magdala, Jerusalem
- Character: Mary Magdalene's awakening journey
- Source: UB = canonical historical events
- Source: Gospel of Mary = thematic inspiration
- Tone: Historical drama with spiritual depth

**Modern Timeline (2025):**
- Setting: New York City
- Character: Sarah Jones' awakening journey
- Source: Contemporary psychology
- Tone: Archaeological thriller with personal crisis

**Connection Between Timelines:**

Documented in `/GeneratedMDs/planning/dual-timeline-transition-toolkit.md`:

1. **Matched Compositions**
   - Visual parallels (Mary teaching → Sarah lecturing)
   - Similar frame compositions
   - Echoing blocking and movement

2. **Thematic Resonances**
   - Both characters awakening to divine within
   - Both challenged by patriarchal authority
   - Both claiming voice and teaching authority

3. **Transition Techniques**
   - Match cuts on objects (clay lamp → desk lamp)
   - Audio bridges (ancient chant → modern music)
   - Thematic bridges (question asked in one timeline, answered in other)

**Design Insight:** The parallel awakening structure requires careful arc tracking in BOTH timelines to ensure transformations mirror thematically while remaining distinct narratively.

### B. Source Hierarchy Encoding

**The Problem:**
- Gabriel uses The Urantia Book as canonical historical source for ancient timeline
- Gabriel uses Gospel of Mary as thematic inspiration, NOT historical fact
- Without clear hierarchy, AI might confuse the two
- Risk: Treating thematic material as historical plot points

**The Solution (Q-RESEARCH Command):**

```markdown
PRIMARY SOURCE - The Urantia Book (UB):
✅ Use for: Plot, events, dialogue, dates, historical facts
✅ Cite: Specific UB references (e.g., UB 150:1.1)
✅ Treat as: Canonical truth for ancient timeline

SECONDARY SOURCE - Gospel of Mary:
✅ Use for: Thematic inspiration, character interiority, spiritual themes
✅ Label: "Inspired by Gospel of Mary"
❌ DO NOT use for: Historical events, plot facts, dialogue

CRITICAL DISTINCTION:
- UB = "What happened" (external events)
- Gospel of Mary = "What it meant" (internal experience)
```

**Enforcement:**
1. Encoded in Q-RESEARCH command (lines 838-942 of SHORTCUTS.md)
2. Repeated in scene-prep-agent-instructions.md
3. Documented in CLAUDE.md
4. Included in FILE-STRUCTURE-MAP.md reading priorities

**Design Insight:** Domain-specific knowledge hierarchies should be encoded in commands, not assumed. This prevents catastrophic creative errors.

### C. Collaborative Mode as Core Design

**Traditional AI Usage Pattern:**
1. User asks for something
2. AI goes away and does work
3. AI returns with completed result
4. User approves or requests changes

**This System's Pattern:**
1. User indicates creative focus
2. AI prepares questions and options
3. User and AI work through material together interactively
4. AI documents user's decisions in real-time
5. AI never makes creative decisions autonomously

**Enforcement Mechanisms:**

1. **COLLABORATIVE WORKING MODE Section** (top of SHORTCUTS.md)
   ```markdown
   ### Never Work Autonomously On:
   - Character arc extraction or analysis
   - Scene breakdowns
   - Any major creative/analytical work
   ```

2. **Workflow Documents** (screenplay-scene-writing-workflow.md)
   ```markdown
   STEP 2: DEVELOP BEAT OUTLINE (COLLABORATIVELY)
   - Present 3-5 potential beats
   - Discuss with Gabriel
   - Refine based on feedback
   - Document agreed beats

   STEP 3: WRITE FIRST DRAFT
   - Based on Gabriel's guidance from Step 2
   - Never draft without prior discussion
   ```

3. **PREP Template Section 6: Questions for Gabriel**
   - Forces agent to identify creative choice points
   - Prepares questions, not answers
   - Example: "Should Sarah's reaction be visible or suppressed?"

4. **Quality Checklist**
   ```markdown
   - [ ] No creative decisions made, only preparation
   - [ ] Tone is collaborative, not prescriptive
   ```

**Why This Matters for Creative Work:**

- Story intuition comes from human storyteller
- AI provides structure, organization, context
- Creative decisions require artistic judgment AI doesn't have
- Collaboration captures human wisdom in real-time

**Design Insight:** For creative domains, collaboration mode must be **structural, not optional**. It needs to be enforced at multiple levels (commands, workflows, templates, checklists).

### D. Episode-Granular Arc Tracking

**Innovation:** Character arcs broken down by episode with specific markers

**Traditional Approach:**
- Character profile: Who they are
- Arc summary: Where they start → Where they end

**This System's Approach:**
- Character profile: Who they are
- Arc document: Episode-by-episode transformation with measurable markers

**Example - Sarah's Awakening Arc:**

```markdown
## EPISODE 1: UNCONSCIOUS AUTOMATON

Physical Markers:
- Controlled posture, tight jaw
- Exhaustion present but hidden
- Professional "on" constantly

Emotional Markers:
- Completely shut down to grief
- Clinical precision as armor
- No vulnerability visible

Relational Markers:
- Keeps everyone at distance
- Professional detachment even with students
- Avoidance of Laporte (father wound)

Key Scenes:
- Scene 2: NYU lecture (intellectual fortress visible)
- Scene 5: Laporte confrontation (cold, refusing connection)

What Sarah CAN do at this point:
✅ Function professionally with high competence
✅ Analyze texts intellectually
✅ Maintain control and composure

What Sarah CANNOT do yet:
❌ Feel her grief about father's death
❌ Show vulnerability to anyone
❌ Let Eileen or anyone help her
❌ Connect spiritually with ancient texts

---

## EPISODE 4: AWARENESS (Hospital Breakdown)

Physical Markers:
- Exhausted, body forcing a stop
- Posture less controlled, fortress cracking
- Visible trembling in hands

Emotional Markers:
- Pandora's box cracking open
- Can't maintain clinical precision
- Fear of what she's feeling

Relational Markers:
- Allows Eileen to see her vulnerable
- Still keeping Laporte distant
- Beginning to need others

What Sarah CAN do at this point:
✅ Recognize she's not okay
✅ Accept help from Eileen
✅ Feel grief starting to surface

What Sarah CANNOT do yet:
❌ Forgive Laporte (not until Episode 6)
❌ Fully embrace spiritual awakening (Episode 7)
❌ Claim teaching voice (Episode 8)
```

**Why This Matters:**

1. **Prevents Anachronistic Behavior**
   - PREP agents know EXACT character state at any episode point
   - Can't write Sarah as too self-aware in Episode 2
   - Can't write Sarah as still shut down in Episode 7

2. **Ensures Transformation Feels Earned**
   - Gradual progression visible episode-by-episode
   - Each stage builds on previous
   - No sudden unrealistic changes

3. **Guides Scene Writing**
   - Writer knows what character can/cannot do at this point
   - Scenes show appropriate level of transformation
   - Arc progression feels organic

**Design Insight:** For serialized storytelling, track character state per episode with measurable markers (physical, emotional, relational), not just start/end points.

### E. Agent-Ready File Organization

**The Problem:**
- Large repository (72 markdown files, ~1.5MB)
- Agent needs specific materials for Scene X prep
- Without guidance, agent might read everything (waste context) or guess (miss critical info)

**The Solution: FILE-STRUCTURE-MAP.md**

**Provides:**

1. **Complete Repository Map**
   - Every directory explained
   - Every file described
   - File sizes noted (context cost awareness)

2. **Decision Tree for Reading**
   ```markdown
   IF scene has Sarah + Laporte:
     THEN read:
       - Sarah-Jones-PROFILE.md
       - Sarah-Jones-awakening-arc.md
       - Laporte-PROFILE.md
       - Sarah-Laporte-relationship.md
     SKIP:
       - All Mary Magdalene materials
       - All ancient timeline sources
   ```

3. **Reading Priority Levels**
   - **ALWAYS READ:** Essential for every scene
   - **READ IF TIMELINE:** Ancient vs. Modern specific materials
   - **READ IF CHARACTER:** Character-specific materials
   - **SKIP:** Historical/irrelevant materials

4. **Efficiency Calculations**
   ```markdown
   Typical Sarah Scene:
   - 6-7 files to read
   - ~150KB context used
   - ~400KB context saved (by skipping irrelevant files)
   ```

**Result:**
- Agents read only what's needed
- Context window used efficiently
- No wasted reading
- Consistent prep quality

**Design Insight:** For large repositories, a meta-document describing "what to read when" is essential for agent efficiency.

### F. Quality Checklist Integration

**Pattern:** Every template includes embedded quality checklist

**Example 1 - Scene PREP Agent Instructions:**

```markdown
## ERROR PREVENTION - Before Submitting PREP File, Verify:

- [ ] Correct scene number and title
- [ ] Timeline specified (ANCIENT or MODERN)
- [ ] All characters in scene have state analysis
- [ ] Character states match arc position at this episode
- [ ] UB references cited (if ancient scene)
- [ ] Gospel of Mary labeled as inspiration (if used)
- [ ] 10 specific questions for Gabriel (Section 6)
- [ ] All 12 sections complete (no TBD)
- [ ] No creative decisions made, only preparation
- [ ] Tone is collaborative, not prescriptive
- [ ] File follows naming convention
```

**Example 2 - Scene PREP Template (Section 12: Writer's Reminders):**

```markdown
## 12. WRITER'S REMINDERS

What This Scene IS:
✅ Establishes Sarah's fortress intact
✅ Shows professional competence
✅ Introduces father wound through Laporte
✅ Plants seeds for awakening (but not awakening itself)

What This Scene IS NOT:
❌ Sarah's awakening moment (too early - Episode 7)
❌ Forgiveness of Laporte (not until Episode 6)
❌ Sarah showing vulnerability (fortress intact through Episode 3)
❌ Spiritual awareness (she's still intellectual/clinical)

Arc Boundaries at This Point:
- Sarah MUST be in fortress mode (Episode 1)
- Sarah CANNOT be self-aware about her shutdown
- Sarah CANNOT show vulnerability or need others
- This is her STARTING point, not her destination
```

**Example 3 - Character Arc Common Pitfalls:**

```markdown
### RED FLAGS - Stop If You Catch Yourself:

Sarah Arc Pitfalls:
❌ Making her too self-aware too early
❌ Showing vulnerability before Episode 4
❌ Forgiveness before Episode 6
❌ Spiritual awakening before Episode 7

Mary Arc Pitfalls:
❌ Using Gospel of Mary as historical fact
❌ Anachronistic modern feminism in ancient timeline
❌ Teaching authority before she's earned it in arc
```

**Benefits:**

1. **Prevents Common Failures**
   - Missing sections (no TBD allowed)
   - Wrong character states (arc position verified)
   - Prescriptive tone (collaborative verified)
   - Anachronistic behavior (arc boundaries specified)

2. **Ensures Consistency**
   - Every PREP file checks same items
   - Quality standard maintained
   - Common pitfalls avoided

3. **Self-Correction**
   - Agent/writer can verify before submitting
   - Catches errors early
   - Reduces revision cycles

**Design Insight:** Quality control embedded in templates prevents errors at creation time, not after the fact.

### G. Deliverables Workflow (External Collaboration)

**File:** `/deliverables/html-generation-workflow.md` (412 lines)

**Purpose:** Generate polished HTML episode structures for external reviewers (producers, writers, collaborators)

**The Challenge:**
- Internal development materials (GeneratedMDs/) are complex, messy, evolutionary
- External collaborators need clean, navigable episode summaries
- Need version control (Episode 1 structure v1, v2, v3 as it evolves)

**The Solution: HTML Export Workflow**

**10-Step Process:**

```markdown
STEP 1: PREPARE SOURCE MATERIAL
- Gather episode scene structure
- Gather character profiles
- Gather relevant arcs

STEP 2: DETERMINE VERSION NUMBER
- Check deliverables/ for existing versions
- Increment: Episode-1-Structure-v1.html → v2.html

STEP 3: GENERATE HTML FILE
- Beautiful, readable formatting
- Color-coded timelines (ancient gold, modern blue)
- Navigable table of contents
- Scene cards with key info
- Print-friendly CSS

STEP 4: VERIFY HTML OUTPUT
- All scenes included
- Links work
- Formatting correct
- Self-contained (works offline)

STEP 5: REVIEW CONTENT ACCURACY
- Scene descriptions accurate
- Character arcs correct at this episode
- Thematic connections clear

STEP 6: FINAL PREPARATION FOR SHARING
- Add version notes
- Include contact info for feedback
- Generate PDF if needed

STEP 7: SHARE WITH REVIEWERS
- Email to Santiago, Reza, or other collaborators
- Include context (what episode, what feedback needed)

STEP 8: COLLECT AND ORGANIZE FEEDBACK
- Create feedback document
- Organize by scene/theme
- Prioritize feedback

STEP 9: INCORPORATE FEEDBACK (New Session)
- Review feedback with Gabriel
- Decide what to incorporate
- Update source materials
- Generate new version

STEP 10: ARCHIVE AND VERSION CONTROL
- Keep all versions
- Document what changed version to version
```

**HTML Features:**

```html
<!DOCTYPE html>
<html>
<head>
    <style>
        /* Color-coded timelines */
        .ancient { background: #f4e4c1; border-left: 4px solid #d4af37; }
        .modern { background: #e6f2ff; border-left: 4px solid #4a90e2; }

        /* Navigable TOC */
        nav { position: sticky; top: 0; }

        /* Scene cards */
        .scene-card { margin: 2em 0; padding: 1.5em; }

        /* Print-friendly */
        @media print { /* optimized */ }
    </style>
</head>
<body>
    <h1>Episode 1: [Title] - Structure v2.1</h1>
    <nav><!-- scene links --></nav>

    <section class="ancient scene-card">
        <h2>Scene 1: [Title] (ANCIENT)</h2>
        <p><strong>Location:</strong> Magdala, Mary's home</p>
        <p><strong>Characters:</strong> Mary Magdalene, Jesus</p>
        <p><strong>Purpose:</strong> Establish Mary pre-awakening</p>
        <!-- Scene details -->
    </section>

    <section class="modern scene-card">
        <h2>Scene 2: [Title] (MODERN)</h2>
        <!-- Scene details -->
    </section>
</body>
</html>
```

**Why This Matters:**

1. **Separates Internal vs. External Materials**
   - Internal: Messy, evolutionary, full context
   - External: Polished, navigable, focused

2. **Enables External Collaboration**
   - Producers can review without seeing internal complexity
   - Writers can provide feedback on clean structure
   - Stakeholders can understand vision

3. **Version Control**
   - Track how episode structure evolves
   - Document feedback incorporation
   - Show decision evolution

4. **Professional Presentation**
   - Beautiful formatting shows care
   - Easy navigation respects reviewer time
   - Print/PDF options for different contexts

**Design Insight:** Domain-specific Q-Command systems may need **export workflows** to transform internal working materials into polished external deliverables.

### H. Workflow as Living Documentation

**Files in `/GeneratedMDs/workflows/`:**

1. **screenplay-scene-writing-workflow.md** (367 lines)
   - How Gabriel and Claude write scenes together
   - Collaborative process
   - Review checklist
   - Quality standards

2. **episode-scene-structure-workflow.md**
   - How to build episode scene breakdowns
   - Essential beats identification
   - Timeline balance
   - Pacing considerations

3. **character-relationship-exploration.md**
   - How to explore relationship dynamics
   - Methodology for relationship arcs
   - Power dynamic tracking

4. **scene-prep-agent-instructions.md** (610 lines)
   - How agents prepare PREP files
   - Execution protocol
   - Quality standards

**Purpose:**
- Document "how we work" as living documentation
- Updated as process improves
- Can be referenced in future sessions
- Can be shared with new collaborators

**Benefits:**

1. **Process Refinement**
   - Capture what works
   - Refine based on experience
   - Build institutional knowledge

2. **Consistency**
   - Every scene uses same workflow
   - Standards maintained
   - Quality predictable

3. **Onboarding**
   - New collaborators can read workflows
   - Understand process without extensive explanation
   - Join productive work faster

4. **AI Context**
   - Q-BEGIN can load relevant workflows
   - Mid-session reference if process forgotten
   - Agents can follow documented protocols

**Design Insight:** "How we work" should be captured as markdown documentation that evolves alongside the creative work, not separate static process docs.

---

## 8. Insights for Q-Command System v3.0

### A. Domain-Specific Extensions Work

**Evidence from TDW:**
- Q-SCENE, Q-CHARACTER, Q-TIMELINE, Q-RESEARCH commands tailored to screenplay needs
- Source hierarchy encoding (UB canonical, Gospel of Mary thematic)
- Collaborative mode enforcement for creative work
- Scene PREP template with 12 screenplay-specific sections
- Episode-granular arc tracking

**Validation:**
✅ Base Q-Command System provides session management (Q-BEGIN, Q-END, Q-CHECKPOINT)
✅ Domain extensions add specialized functionality
✅ Extensions don't conflict with base system
✅ Result: Powerful specialized workflow built on universal foundation

**Lesson:** Two-tier architecture (universal base + domain extensions) is proven viable.

### B. File Map as Agent Navigation System

**Problem Solved:**
- Large repositories (72 files, 1.5MB) overwhelm agents
- Agents waste context reading irrelevant materials
- Agents miss critical materials without guidance

**Solution Validated:**
- FILE-STRUCTURE-MAP.md provides master navigation
- Reading priority levels (ALWAYS / IF-THEN / SKIP)
- Conditional logic (IF character X, THEN read Y)
- Efficiency calculations (~50-70% context saved)

**Lesson:** For v3.0, domain-specific Q-Command systems should include:
1. Automated file map generation (script scans repo)
2. Template for file descriptions
3. Reading strategy builder (IF-THEN-ELSE logic)
4. Context cost calculator

### C. Collaborative Mode Prevents AI Overreach

**Creative Work Risk:**
- AI makes artistic decisions autonomously
- Creative choices require human intuition/judgment
- AI lacks storytelling instinct

**Solution Validated:**
- "COLLABORATIVE WORKING MODE" section at top of SHORTCUTS.md
- Enforced in workflows (discuss before drafting)
- Embedded in templates (Section 6: Questions for Gabriel)
- Quality checklist verifies (no creative decisions made)

**Enforcement Mechanisms:**
1. **Structural:** Mode defined in SHORTCUTS.md, read at Q-BEGIN
2. **Procedural:** Workflows require discussion steps
3. **Templated:** PREP files must include questions, not answers
4. **Verified:** Checklist confirms collaborative tone

**Lesson:** For creative domains (screenplay, legal, medical, research), v3.0 should:
1. Offer "Collaborative Mode" as domain configuration option
2. Automatically adjust Q-commands to require human decision points
3. Embed "Questions for User" sections in relevant templates
4. Add checklist items verifying non-prescriptive tone

### D. Dual-Purpose Documentation

**Observation:**
Documents in TDW serve TWO audiences simultaneously:

1. **Claude Code (AI)** - Procedural instructions, reading protocols, execution steps
2. **Human Collaborators** - Context, artistic vision, creative philosophy

**Example - CLAUDE.md:**
- Lines 1-127: Creative vision, collaborative philosophy (human-readable)
- Lines 128-356: Core materials, characters, sources (both)
- Lines 357-641: Q-command workflow, technical procedures (AI-readable)

**Example - scene-prep-agent-instructions.md:**
- Structured enough for AI to follow autonomously
- Readable enough for human assistant to follow
- Could be executed by either

**Lesson:** v3.0 documentation templates should:
1. Design for dual audience (AI + human)
2. Use clear hierarchical structure (both can navigate)
3. Avoid separating "AI docs" from "human docs"
4. Markdown format (universally readable)

### E. Source Hierarchy as Domain Configuration

**Brilliance of Q-RESEARCH Command:**

Instead of expecting Claude to remember Gabriel's personal credence hierarchy, **encode it in the command**:

```markdown
PRIMARY SOURCE: The Urantia Book (UB)
- Use for: Historical facts, plot, dialogue, dates
- Cite: Specific references
- Treat as: Canonical truth

SECONDARY SOURCE: Gospel of Mary
- Use for: Thematic inspiration, character interiority
- Label: "Inspired by..."
- Treat as: Emotional/spiritual themes, NOT historical fact

CRITICAL: NEVER confuse the two
```

**Why This Works:**
- Prevents catastrophic errors (thematic material as plot fact)
- Encodes domain-specific knowledge hierarchy
- Makes Gabriel's personal research methodology explicit
- Can be enforced across all sessions

**Lesson:** v3.0 should support "Source Hierarchy" as domain configuration:

**Template:**
```markdown
## Research Source Hierarchy

PRIMARY SOURCES (Canonical Truth):
- [Source 1]: Use for [purposes]
- [Source 2]: Use for [purposes]
- Citation format: [format]

SECONDARY SOURCES (Supporting/Inspiration):
- [Source 3]: Use for [purposes]
- Citation format: [format]
- LABEL AS: [how to indicate it's not primary]

EXCLUDED SOURCES:
- [Source 4]: DO NOT USE because [reason]

CRITICAL DISTINCTIONS:
- [Explain how sources differ and why it matters]
```

This should be part of Q-SETUP-DOMAIN wizard for research-heavy domains (academic, legal, medical, journalism).

### F. Templates with Built-in Quality Control

**Pattern Observed:**
Every template in TDW includes embedded quality checklist

**Scene PREP Template:**
- Pre-submission checklist (12 items)
- IS/IS NOT sections (prevent scope creep)
- Arc boundary warnings (prevent anachronisms)
- Common pitfall alerts (character-specific)

**Benefits Demonstrated:**
- Prevents errors at creation time
- Ensures consistency across instances
- Enables self-correction
- Reduces revision cycles

**Lesson:** v3.0 template system should:

1. **Every template includes quality section:**
   ```markdown
   ## Quality Checklist - Verify Before Completing
   - [ ] [Requirement 1]
   - [ ] [Requirement 2]
   - [ ] [Common pitfall avoided]
   ```

2. **IS/IS NOT pattern:**
   ```markdown
   ## What This [Document Type] IS:
   ✅ [Expected element 1]
   ✅ [Expected element 2]

   ## What This [Document Type] IS NOT:
   ❌ [Common mistake 1]
   ❌ [Scope creep example]
   ```

3. **Domain-specific warnings:**
   ```markdown
   ## Common Pitfalls for [Domain]:
   ⚠️ [Pitfall 1]: [How to avoid]
   ⚠️ [Pitfall 2]: [How to avoid]
   ```

4. **Self-verification prompts:**
   ```markdown
   Before marking complete, ask yourself:
   - [ ] Does this achieve [stated purpose]?
   - [ ] Have I avoided [common mistake]?
   - [ ] Is tone [appropriate for domain]?
   ```

### G. Episode-Granular Arc Tracking for Serialized Work

**Innovation Demonstrated:**

Instead of:
- Character profile: Who they are
- Arc summary: Start → End

TDW uses:
- Character profile: Who they are + Episode 1 state
- Arc document: Episode-by-episode transformation with physical/emotional/relational markers
- Clear CAN/CANNOT boundaries per episode

**Benefits Proven:**
1. Prevents anachronistic behavior (character too advanced too early)
2. Ensures transformation feels earned (gradual progression)
3. Guides scene writing (writer knows what character can/cannot do at this point)
4. Enables accurate agent prep (PREP agents know exact character state)

**Lesson:** v3.0 should support "Milestone Tracking" for serialized work:

**For Screenplay/TV:**
- Episode-by-episode character states
- Physical/emotional/relational markers per episode
- CAN/CANNOT boundaries

**For Software Development:**
- Sprint-by-sprint feature capabilities
- What works / what's not implemented yet per version
- API capabilities per release

**For Legal:**
- Case development stage-by-stage
- What arguments available at this point
- What evidence introduced by when

**For Medical:**
- Patient treatment timeline
- Symptoms/diagnosis/treatment evolution
- What's known vs. unknown at each point

**Template Pattern:**
```markdown
# [Entity] - [Transformation Type] Tracking

## Overview
[Overall transformation arc]

## [Milestone 1]: [Description]
[State Description]:
- [Aspect 1 marker]
- [Aspect 2 marker]
- [Aspect 3 marker]

What [Entity] CAN do at this point:
✅ [Capability 1]
✅ [Capability 2]

What [Entity] CANNOT do yet:
❌ [Future capability 1]
❌ [Future capability 2]

Key Events/Scenes/Moments:
- [Event 1]: [What it reveals]

## [Milestone 2]: [Description]
[Similar structure]
```

### H. Agent-Ready File Organization

**Problem Validated:**
- Large repos need navigation system
- Agents waste context without guidance
- Manual reading strategies inconsistent

**Solution Proven:**
FILE-STRUCTURE-MAP.md with:
- Complete repository map
- File descriptions with sizes (context cost)
- Decision tree for reading (IF-THEN-SKIP)
- Efficiency calculations

**Lesson:** v3.0 should provide:

1. **Auto-Generate File Map:**
   ```bash
   q-system generate-file-map
   ```
   Scans repo, creates initial FILE-STRUCTURE-MAP.md with:
   - Directory tree
   - File list with sizes
   - Placeholders for descriptions

2. **File Map Template:**
   ```markdown
   # Repository File Structure Map

   ## Directory: /[name]/
   **Purpose:** [User fills in]

   ### [filename].md ([size])
   **Purpose:** [User fills in]
   **Read when:** [User defines conditional logic]
   **Priority:** [ALWAYS / IF-condition / SKIP]
   ```

3. **Reading Strategy Builder:**
   ```markdown
   ## Reading Strategies by Agent Task Type

   ### For [Task Type 1] (e.g., Scene Prep):
   ALWAYS READ:
   - [File 1]
   - [File 2]

   READ IF [CONDITION]:
   - IF [condition] THEN [file list]

   SKIP:
   - [File list with reason]

   ESTIMATED CONTEXT: ~[X]KB
   ```

4. **Maintenance Reminders:**
   - Q-VERIFY checks if file map is current
   - Q-END suggests updating file map if new files created
   - Warning if file map last updated >7 days ago

### I. Workflow as Living Documentation

**Pattern Observed:**
`/GeneratedMDs/workflows/` contains process documentation that:
- Describes how Gabriel and Claude work together
- Is referenced during sessions
- Is updated based on experience
- Can be followed by AI agents or human assistants

**Benefits Demonstrated:**
1. Process refinement (capture what works)
2. Consistency (same workflow each time)
3. Onboarding (new collaborators understand process)
4. AI context (Q-BEGIN loads workflows, agents follow protocols)

**Lesson:** v3.0 should encourage workflow documentation:

1. **Q-SETUP-DOMAIN creates workflows/ directory**

2. **Workflow Template:**
   ```markdown
   # [Process Name] Workflow

   **Purpose:** [What this workflow accomplishes]
   **When to use:** [Trigger conditions]
   **Participants:** [Who's involved: User, Claude, Agents]

   ## Process Steps

   ### Step 1: [Name]
   **Participant:** [User/Claude/Agent]
   **Action:** [What happens]
   **Output:** [What's produced]

   ### Step 2: [Name]
   [Similar structure]

   ## Quality Checklist
   - [ ] [Success criterion 1]
   - [ ] [Success criterion 2]

   ## Common Pitfalls
   - ⚠️ [Pitfall 1]: [How to avoid]

   ## Revision History
   - [Date]: [What changed and why]
   ```

3. **Q-END prompts:**
   "Did we follow an undocumented workflow today? Should we capture it?"

4. **Q-BEGIN loads relevant workflows:**
   "Today we're working on [task type]. Here's the relevant workflow: [workflow file]"

### J. Deliverables Export System

**Innovation Demonstrated:**
Internal working materials ≠ External deliverables

**TDW Solution:**
- `/deliverables/` directory separate from `/GeneratedMDs/`
- HTML export workflow (10 steps)
- Version control (v1, v2, v3)
- Polished formatting for external review

**Lesson:** Some domains need export/transform capabilities:

**Screenplay:** Internal structure → Polished HTML → PDF
**Software:** Internal docs → API documentation → Published docs
**Legal:** Internal case notes → Client summary → Court filings
**Medical:** Internal notes → Patient summary → Insurance report
**Academic:** Internal research notes → Paper draft → Submission format

**v3.0 Should Support:**

1. **Deliverables Configuration:**
   ```markdown
   ## Deliverables Configuration

   INTERNAL: /GeneratedMDs/ (working materials)
   EXTERNAL: /deliverables/ (polished outputs)

   Export Workflows:
   - [Internal format] → [External format]: [Workflow file]
   ```

2. **Q-EXPORT Command:**
   ```markdown
   Q-EXPORT [type]

   Types:
   - html (generate HTML from markdown)
   - pdf (generate PDF from HTML)
   - [domain-specific formats]

   Process:
   1. Identify source materials
   2. Apply formatting template
   3. Generate output file
   4. Verify quality
   5. Version control
   ```

3. **Export Templates:**
   - HTML template with CSS (professional styling)
   - PDF generation (print-friendly)
   - Domain-specific formats (screenplay = Final Draft format, legal = court filing format, etc.)

---

## 9. Recommendations for Q-Command System v3.0

### A. Architecture: Two-Tier System (Validated)

**Tier 1: Universal Foundation** (Current Q-Command System v2.0)
- Session management (Q-BEGIN, Q-END, Q-CHECKPOINT, Q-STATUS, Q-VERIFY, Q-SAVE)
- File organization (GeneratedMDs/transcripts/, session-notes/, checkpoints/)
- Per-person-per-session naming (YYYY-MM-DD-HHmm-PersonName.md)
- Git integration (optional)
- Context monitoring

**Tier 2: Domain Extensions** (New in v3.0)
- Custom Q-commands (Q-SCENE, Q-CHARACTER, Q-RESEARCH, etc.)
- Domain-specific file structures
- Agent prompts and templates
- Workflow documentation
- Source hierarchies
- Collaborative mode configurations
- Export/deliverables workflows

### B. Q-SETUP-DOMAIN Wizard (New Command)

**Purpose:** Guide users through customizing Q-Command System for specific domain

**Wizard Flow:**

```markdown
Q-SETUP-DOMAIN

STEP 1: SELECT DOMAIN
What domain will you be working in?
1. Software Development
2. Screenplay/Creative Writing
3. Legal Work
4. Medical/Clinical
5. Academic Research
6. Content Creation
7. Data Analysis
8. Custom (I'll ask you questions)

STEP 2: DOMAIN-SPECIFIC QUESTIONS
[Based on domain selection, ask relevant questions]

For Screenplay:
- Feature film, TV series, or documentary?
- Solo writer or collaborative team?
- Do you use specific source materials?

For Software:
- Web app, mobile app, or library?
- Tech stack?
- Team size?

For Legal:
- Litigation, contracts, or research?
- Jurisdiction?
- Document management needs?

STEP 3: CREATE DIRECTORY STRUCTURE
[Generate domain-appropriate directories]

For Screenplay:
- /characters/
- /world/
- /scenes/
- /arcs/
- /structure/

For Software:
- /architecture/
- /features/
- /api-docs/

STEP 4: INSTALL DOMAIN COMMANDS
[Add domain-specific Q-commands to SHORTCUTS.md]

For Screenplay:
- Q-SCENE (guided scene development)
- Q-CHARACTER (character analysis)
- Q-TIMELINE (timeline verification)
- Q-RESEARCH (research with source hierarchy)

For Software:
- Q-FEATURE (feature development workflow)
- Q-ARCHITECT (architecture decisions)
- Q-TEST (testing workflow)

STEP 5: CREATE TEMPLATES
[Generate template files for common document types]

For Screenplay:
- character-profile-template.md
- scene-prep-template.md
- arc-tracking-template.md

STEP 6: SETUP AGENT INFRASTRUCTURE (OPTIONAL)
Would you like to configure agents for automated prep work?
[If yes, create agent prompt templates and file map]

STEP 7: CONFIGURE COLLABORATIVE MODE
Does this domain require collaborative mode (AI prepares, human decides)?
[Typical for creative, legal, medical domains]
[If yes, add collaborative mode enforcement to SHORTCUTS.md]

STEP 8: CONFIGURE SOURCE HIERARCHY (OPTIONAL)
Does your work use specific source materials with hierarchy?
[If yes, create source hierarchy configuration]

STEP 9: CREATE WORKFLOW DOCUMENTATION
[Generate workflow template files in GeneratedMDs/workflows/]

STEP 10: UPDATE CLAUDE.md
[Add domain-specific sections to CLAUDE.md]

STEP 11: VERIFICATION
[Run Q-VERIFY to ensure setup complete]

Your Q-Command System is now customized for [domain]!

Next steps:
1. Review generated templates and customize as needed
2. Update FILE-STRUCTURE-MAP.md as you add content
3. Start your first session with Q-BEGIN
```

### C. Domain Template Packs (Shareable)

**Structure:**

```
q-command-domains/
├── screenplay/
│   ├── domain-config.yaml
│   ├── directory-structure.txt
│   ├── commands/
│   │   ├── Q-SCENE.md
│   │   ├── Q-CHARACTER.md
│   │   ├── Q-TIMELINE.md
│   │   └── Q-RESEARCH.md
│   ├── templates/
│   │   ├── character-profile-template.md
│   │   ├── scene-prep-template.md
│   │   └── arc-tracking-template.md
│   ├── agents/
│   │   └── scene-prep-agent-instructions.md
│   ├── workflows/
│   │   ├── scene-writing-workflow.md
│   │   └── character-development-workflow.md
│   ├── CLAUDE-addon.md
│   └── README.md
├── legal/
│   └── [similar structure]
├── medical/
│   └── [similar structure]
└── software-dev/
    └── [similar structure]
```

**domain-config.yaml:**
```yaml
domain: screenplay
version: 1.0
author: Gabriel Rymberg
description: Screenplay development with character arcs and dual timelines

directories:
  - characters/
  - world/
  - scenes/
  - arcs/
  - structure/
  - research/

commands:
  - name: Q-SCENE
    description: Guided scene development workflow
    file: commands/Q-SCENE.md
  - name: Q-CHARACTER
    description: Character analysis and voice consistency
    file: commands/Q-CHARACTER.md

templates:
  - name: character-profile
    purpose: Canonical character reference
    file: templates/character-profile-template.md
  - name: scene-prep
    purpose: Agent-generated scene preparation
    file: templates/scene-prep-template.md

collaborative_mode: true
source_hierarchy: true

agents:
  - name: scene-prep
    purpose: Prepare scene PREP files from repository materials
    instruction_file: agents/scene-prep-agent-instructions.md

workflows:
  - name: scene-writing
    file: workflows/scene-writing-workflow.md
```

**Installation:**
```bash
q-system install-domain screenplay
```

Would:
1. Read domain-config.yaml
2. Create directory structure
3. Copy templates
4. Add commands to SHORTCUTS.md
5. Install agent instructions
6. Copy workflow docs
7. Update CLAUDE.md
8. Run Q-VERIFY

**Community Sharing:**
- Domain packs on GitHub
- Users can share customizations
- Vote/rate domain packs
- Submit improvements via PR

### D. Enhanced File Map System

**Auto-Generation:**

```bash
q-system generate-file-map
```

Scans repository, creates FILE-STRUCTURE-MAP.md with:
- Complete directory tree
- File list with sizes
- Placeholders for user descriptions
- Template for reading strategies

**Template Generated:**

```markdown
# Repository File Structure Map

**Purpose:** Guide agents and humans through repository structure

**Last Updated:** [Auto-generated date]
**Total Files:** [Count]
**Total Size:** [Size]

---

## Directory: /characters/

**Purpose:** [USER: Describe purpose]

### Sarah-Jones-PROFILE.md (32KB)
**Purpose:** [USER: Describe content]
**Read when:** [USER: Define conditional logic]
**Priority:** [USER: ALWAYS / IF-condition / SKIP]

---

## Reading Strategies by Task Type

### For Scene Prep Agents:

**ALWAYS READ:**
- [USER: List files]

**READ IF [CONDITION]:**
- IF [USER: Define condition] THEN [USER: List files]

**SKIP:**
- [USER: List files with reasons]

**ESTIMATED CONTEXT:** ~[USER: Calculate]KB
```

**Maintenance:**
- Q-VERIFY checks if map is current
- Warns if new files not in map
- Suggests update if map >7 days old

### E. Collaborative Mode as Configuration

**In domain-config.yaml:**

```yaml
collaborative_mode: true

collaborative_mode_config:
  never_work_autonomously_on:
    - Character arc analysis
    - Scene breakdowns
    - Creative decisions
    - Strategic planning

  always_collaborate_by:
    - Preparing questions or options
    - Presenting choices for guidance
    - Working interactively
    - Documenting decisions in real-time

  session_pattern:
    start: Ask user what to focus on
    prepare: Create questions/options
    present: Share for discussion
    collaborate: Work through together
    document: Capture decisions

  red_flags:
    - Completing analysis without user input
    - Making creative decisions unilaterally
    - Returning with "finished" work on creative topics
```

**Enforcement:**
- Added to top of SHORTCUTS.md during Q-SETUP-DOMAIN
- Repeated in workflow documents
- Embedded in template quality checklists
- Q-BEGIN reminds Claude of collaborative mode

### F. Source Hierarchy Configuration

**In CLAUDE.md (added by Q-SETUP-DOMAIN):**

```markdown
## Research Source Hierarchy

### PRIMARY SOURCES (Canonical Truth)

**The Urantia Book (UB):**
- **Use for:** Historical events, plot facts, dialogue, dates (ancient timeline)
- **Citation format:** UB [Paper]:[Section].[Paragraph] (e.g., UB 150:1.1)
- **Treat as:** Canonical historical truth

### SECONDARY SOURCES (Supporting/Inspiration)

**Gospel of Mary:**
- **Use for:** Thematic inspiration, character interiority, spiritual themes
- **Citation format:** "Inspired by Gospel of Mary, [section]"
- **Treat as:** Emotional/spiritual resonance, NOT historical fact
- **NEVER:** Use for plot events or historical claims

### CRITICAL DISTINCTIONS

**UB = "What happened"** (external events, dialogue, chronology)
**Gospel of Mary = "What it meant"** (internal experience, themes)

**WHY THIS MATTERS:**
Prevents catastrophic errors where thematic material is treated as historical plot fact.

### RESEARCH WORKFLOW

Q-RESEARCH command enforces this hierarchy:
1. Check PRIMARY sources first
2. Use SECONDARY sources for thematic depth only
3. Always label which source information came from
4. Never confuse the two
```

**Q-RESEARCH Command Implementation:**

```markdown
## Q-RESEARCH [topic]

Research support with proper source hierarchy enforcement

### PROCESS

**STEP 1: IDENTIFY RESEARCH NEED**
- What topic/question?
- What decision does this inform?

**STEP 2: APPLY SOURCE HIERARCHY**
[Reads hierarchy configuration from CLAUDE.md]
[Searches PRIMARY sources first]
[Then SECONDARY sources]
[Labels each finding by source type]

**STEP 3: PRESENT FINDINGS TO USER**
CANONICAL (from PRIMARY sources):
- [Findings with citations]

THEMATIC (from SECONDARY sources):
- [Findings with "inspired by" labels]

Questions for [User]:
- [How to apply findings]

**STEP 4: DOCUMENT DECISION**
[Capture user's decision]
[Update relevant planning docs]
```

### G. Export/Deliverables System

**Q-EXPORT Command:**

```markdown
## Q-EXPORT [format]

Generate polished deliverables from internal working materials

### SUPPORTED FORMATS

For Screenplay Domain:
- html: Episode structure as navigable HTML
- pdf: Print-friendly PDF from HTML
- fountain: Fountain screenplay format

For Software Domain:
- api-docs: Generate API documentation
- readme: Generate README from docs
- architecture: Architecture diagram export

For Legal Domain:
- case-summary: Client-facing case summary
- filing: Court filing format

### PROCESS

**STEP 1: IDENTIFY SOURCE MATERIALS**
What internal materials to export?

**STEP 2: SELECT TEMPLATE**
[Loads domain-specific export template]

**STEP 3: GENERATE OUTPUT**
[Applies formatting, styles, transformations]

**STEP 4: VERSION CONTROL**
[Checks for existing versions, increments]

**STEP 5: VERIFY QUALITY**
[Runs quality checks]

**STEP 6: SAVE TO DELIVERABLES**
[Saves in /deliverables/ directory]

Output: /deliverables/[filename]-v[N].[format]
```

**Export Templates** (per domain):
- HTML template with professional CSS
- PDF generation settings
- Domain-specific format transformers

### H. Implementation Roadmap

**Phase 1: Foundation (Q-Command System v3.0 Core)**
- [ ] Design two-tier architecture formally
- [ ] Create domain extension specification
- [ ] Build Q-SETUP-DOMAIN wizard command
- [ ] Implement domain-config.yaml support
- [ ] Create domain template pack structure

**Phase 2: First Domain Pack (Q-Screen)**
- [ ] Extract TDW screenplay system into template pack
- [ ] Document installation process
- [ ] Test Q-SETUP-DOMAIN with screenplay domain
- [ ] Refine based on experience
- [ ] Create Q-Screen domain pack v1.0

**Phase 3: Additional Domain Packs**
- [ ] Q-Dev (Software Development) - extract from existing repos
- [ ] Q-Legal (Legal Work) - design and document
- [ ] Q-Med (Medical/Clinical) - design and document
- [ ] Q-Research (Academic Research) - design and document

**Phase 4: Enhanced Features**
- [ ] Auto-generate FILE-STRUCTURE-MAP.md
- [ ] Collaborative mode enforcement system
- [ ] Source hierarchy configuration
- [ ] Q-EXPORT command with templates
- [ ] Reading strategy builder

**Phase 5: Community & Sharing**
- [ ] Domain pack repository (GitHub)
- [ ] Installation/update tools
- [ ] Community contributions process
- [ ] Domain pack marketplace/directory
- [ ] Rating and review system

---

## 10. Key Takeaways

### What TDW Demonstrates

1. **Q-Command System as Platform**
   - Base system provides session management
   - Domain extensions add specialized capabilities
   - Result: Specialized application (screenplay software) built on universal foundation

2. **Screenplay Writing as Software**
   - File structure = screenplay writing environment
   - Templates = screenplay patterns
   - Agents = scene prep automation
   - Q-commands = screenplay workflows
   - Result: Non-professional screenwriter producing high-quality work

3. **Agent Infrastructure Pattern**
   - File map for navigation (efficiency)
   - Detailed agent instructions (autonomy)
   - Conditional reading logic (context optimization)
   - Quality checklists (consistency)
   - Result: Agents can operate autonomously while maintaining quality

4. **Collaborative Mode for Creative Work**
   - AI prepares questions, not answers
   - Human makes artistic decisions
   - Real-time documentation of decisions
   - Result: AI enhances creativity without overstepping

5. **Episode-Granular Arc Tracking**
   - Character state per episode with measurable markers
   - CAN/CANNOT boundaries at each point
   - Result: Accurate character behavior, earned transformations

6. **Source Hierarchy Encoding**
   - Domain-specific knowledge hierarchy in Q-command
   - PRIMARY vs. SECONDARY sources explicitly defined
   - Result: Prevents catastrophic creative errors

7. **Dual-Purpose Documentation**
   - Written for both AI and human readers
   - Procedural (AI can execute) + Conceptual (human can understand)
   - Result: Documentation serves all stakeholders

8. **Workflow as Living Documentation**
   - Process captured as evolving documents
   - Referenced during work, updated based on experience
   - Result: Institutional knowledge builds over time

### What This Means for v3.0

The TDW screenplay system is **the reference implementation** for Q-Command System v3.0 domain-specific extensions.

It proves:
✅ Two-tier architecture works
✅ Domain customization is viable
✅ Non-technical users can build sophisticated workflows
✅ Q-Command System can support completely different domains (not just software)
✅ Agents + templates + Q-commands = powerful specialized applications

**v3.0 Mission:**
Make it easy for any user to replicate what Gabriel did with TDW screenplay system, but for their own domain (legal work, medical practice, academic research, content creation, etc.).

**How:**
1. Q-SETUP-DOMAIN wizard guides customization
2. Domain template packs provide starting points
3. File map system optimizes agent efficiency
4. Collaborative mode enforces appropriate human-AI balance
5. Source hierarchy prevents domain-specific errors
6. Export system enables external collaboration

**Vision:**
Q-Command System becomes the **platform for building domain-specific AI co-pilot applications** inside Claude Code, transforming it from a general-purpose assistant into specialized software for any knowledge work domain.

---

## Appendix: File Inventory

### Core Configuration Files
1. `/CLAUDE.md` (24KB) - Project context, source hierarchy, Q-workflow
2. `/SESSION-CHECKLIST.md` - User workflow guide
3. `/GeneratedMDs/SHORTCUTS.md` (33KB, 1076 lines) - Q-commands v2.2

### Navigation & Infrastructure
4. `/docs/FILE-STRUCTURE-MAP.md` (14KB) - Agent navigation system

### Agent Instructions
5. `/GeneratedMDs/workflows/scene-prep-agent-instructions.md` (610 lines)
6. `/GeneratedMDs/workflows/screenplay-scene-writing-workflow.md` (367 lines)
7. `/GeneratedMDs/workflows/episode-scene-structure-workflow.md`
8. `/GeneratedMDs/workflows/character-relationship-exploration.md`

### Character Profiles (4 files)
9. `Sarah-Jones-PROFILE.md` (32KB)
10. `Mary-Magdalene-PROFILE.md` (60KB)
11. `Laporte-PROFILE.md` (26KB)
12. `Henri-Laporte-PROFILE.md`

### Character Arcs (9 files)
13. `Sarah-Jones-awakening-arc.md` (43KB)
14. `Mary-Magdalene-awakening-arc.md` (43KB)
15. `Sarah-Laporte-relationship.md` (26KB)
16-21. [Additional character arcs and relationships]

### Episode Planning (6 files)
22. `Episode-1-Scene-Structure.md`
23-27. [Additional episode planning documents]

### Source Materials (in /docs/)
28. `pitch-bible.md` - Series concept and vision
29. `Urantia-Book-References.md` - Canonical historical source
30. `the-gospel-of-mary.md` - Thematic inspiration source

### Session Documentation
31-44. Session notes (14 files, 2025-11-14 to 2025-11-17)
45-56. Transcripts (12 files)
57-58. Checkpoints (2 files)

### Planning & Analysis
59. `/GeneratedMDs/planning/dual-timeline-transition-toolkit.md`
60. `/GeneratedMDs/planning/episode-1-essential-beats.md`
61. `/GeneratedMDs/analysis/[comparative-analysis-file].md`

### Deliverables
62. `/deliverables/html-generation-workflow.md` (412 lines)
63+. [Generated HTML files for external review]

### Screenplay Output
64+. `/screenplay/scenes/` - Individual scene files and PREP files

**Total:** 72+ markdown files, ~1.5MB of documentation

---

**End of Analysis Report**

**Next Steps:**
1. Review this analysis with Gabriel
2. Discuss which v3.0 features to prioritize
3. Decide on implementation approach
4. Begin building Q-SETUP-DOMAIN wizard or extracting Q-Screen domain pack

**Questions for Gabriel:**
- Does this analysis accurately capture your TDW system?
- Which v3.0 features are most valuable?
- Should we extract Q-Screen pack first, or build wizard first?
- Are there patterns I missed that should be documented?
