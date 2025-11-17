# UCU-DEV REPOSITORY: COMPREHENSIVE SYSTEM ANALYSIS

**Analysis Date:** 2025-11-17
**Repository Path:** `/Users/gabriel/Q-Lingua Dropbox/Gabriel Rymberg/Mac/Documents/GitHub/ucu-dev`
**Project:** Urantia Cinematic Universe (UCU) - "The First Choice" Season One Development
**Analysis Purpose:** Complete system documentation for comparison with TDW screenplay repository

---

## EXECUTIVE SUMMARY

The ucu-dev repository represents a **mature, sophisticated screenplay development system** that has evolved over 14+ documented sessions (November 4-13, 2025) from initial vision document to complete three-episode proof-of-concept. The project successfully integrates:

- Q-Command System v2.0 with custom UCU extensions
- Specialized skills (Midjourney prompt generation)
- Autonomous agents (character world-building)
- Comprehensive visual development pipeline
- Structured session management with archiving
- Detailed character and world-building documentation

**Key Achievement:** Progressed from Phase 1 (story mining from Urantia Papers) through Phase 2 (complete episode outlines) in approximately 10 days of 30-60 minute sessions.

---

## 1. REPOSITORY STRUCTURE ANALYSIS

### 1.1 Root Directory Organization

```
ucu-dev/
├── .git/                           # Git repository
├── .gitignore                      # System and editor files excluded
├── .mcp.json                       # MCP (Model Context Protocol) configuration
├── CLAUDE.md                       # Primary AI briefing document (492 lines)
├── SESSION-CHECKLIST.md            # Q-command workflow guide (285 lines)
├── docs/                           # Skills, agents, source materials
├── GeneratedMDs/                   # Q-system session management
└── UCU-Development/                # All creative work products
```

### 1.2 Documentation Directory (`/docs/`)

**Purpose:** Skills, agents, and source material reference

```
docs/
├── agents/
│   ├── AGENT-INVOCATION-TEMPLATE.md
│   └── character-worldbuilding-agent.md (14,466 bytes)
├── Midjourney_Prompt_Skill.md (24,473 bytes)
├── paper61.txt                     # Urantia Book Paper 61
├── papers-62-63.txt                # Papers 62-63 (Andon & Fonta primary source)
├── UB-TOC.txt                      # Urantia Book Table of Contents
├── UCU Concept v1.md
├── UCU_Creative_Vision_Andon_Fonta.md
├── UCU_Development_Work_Plan.md
├── UCU_World_Building_Plan.md
└── Urantia Book timeline.md (242,340 bytes)
```

**Key Documents:**
- **Midjourney_Prompt_Skill.md:** Comprehensive framework for generating consistent character/location prompts with v7 parameters
- **character-worldbuilding-agent.md:** Autonomous agent specification for character development
- **papers-62-63.txt:** Primary source material for Andon & Fonta story

### 1.3 Generated Session Files (`/GeneratedMDs/`)

**Q-Command System v2.0+UCU-1.0 Implementation:**

```
GeneratedMDs/
├── .q-system/
│   ├── base/                       # Base v2.0 SHORTCUTS reference
│   ├── customizations/             # UCU-specific modifications
│   └── VERSION.md                  # Version tracking
├── transcripts/
│   ├── 2025-11-04-0850-Gabriel.md  # Session 1
│   ├── 2025-11-05-1001-Gabriel.md  # Session 2
│   └── ... (14 transcripts through 2025-11-13)
├── session-notes/                  # Individual session summaries (empty - uses consolidated)
├── checkpoints/                    # Mid-session snapshots (empty - not used yet)
├── SHORTCUTS.md                    # Active Q-commands (592 lines)
└── MIGRATION-LOG.md                # v2.0 migration documentation
```

**File Naming Convention:** `YYYY-MM-DD-HHmm-[PersonName].md`
- Example: `2025-11-13-0918-Gabriel.md`
- Prevents collisions when multiple team members work same day
- Sortable by date/time

**UCU Customization (v1.0):**
- Uses consolidated session notes at `UCU-Development/session-notes.md` (not individual files)
- Q-BEGIN reads from consolidated file for fast context
- Q-END appends to consolidated file + creates individual file
- Archiving every 10 sessions to keep file <800 lines

### 1.4 Creative Work Directory (`/UCU-Development/`)

**Purpose:** All creative deliverables, not session management

```
UCU-Development/
├── archives/
│   └── session-notes-archive-sessions-01-14.md  # Sessions 1-14 archived
├── episode-outlines/
│   ├── episode-01-awakening.md (25,328 bytes)
│   ├── episode-02-prep-notes.md
│   ├── episode-02-the-first-victory.md (48,491 bytes)
│   └── episode-03-the-first-child.md (36,003 bytes)
├── visual-reference/
│   ├── characters/
│   │   ├── andon/ (9 PNG images + PDF compilation)
│   │   └── fonta/ (11 PNG images + PDF compilation)
│   ├── midjourney-prompts-ages-9-11.md
│   ├── REMIX-GUIDE-Age-Deaging.md
│   └── VISUAL-DEVELOPMENT-NOTES.md
├── working-notes/
│   ├── consolidated-story-moments.md
│   ├── fonta-phase1-research-prep.md
│   └── story-mining-session-2.md
├── world-building/
│   ├── andon-fonta-vocabulary-working.md
│   └── characters/
│       ├── Andon/
│       │   ├── andon-urantia-book-descriptions.md
│       │   └── ANDON-REFERENCE-IMAGE.md
│       ├── Fonta/
│       │   ├── fonta-urantia-book-descriptions.md (18,571 bytes)
│       │   ├── creative-license-log.md (19,371 bytes)
│       │   ├── fonta-midjourney-prompts.md (18,243 bytes)
│       │   ├── FONTA-COMPLETE-PACKAGE-SUMMARY.md
│       │   ├── FONTA-REFERENCE-IMAGE.md
│       │   ├── age-timeline-and-versions-needed.md
│       │   └── PROMPTS-QUICK-REFERENCE.md
│       └── primates/
└── session-notes.md                # Consolidated active session notes
```

**Notable Organization:**
- **Separation of concerns:** Session management (GeneratedMDs/) vs. creative work (UCU-Development/)
- **Character-centric organization:** Each character has complete subdirectory with all reference materials
- **Visual development pipeline:** From Midjourney prompts → images → compiled PDFs
- **Archiving strategy:** Session notes moved to archives/ every 10 sessions

---

## 2. Q-COMMAND SYSTEM IMPLEMENTATION

### 2.1 Version Information

**Base System:** Q-Command System v2.0 (2025-11-13)
**Customization:** UCU v1.0 (2025-11-13)
**Full Version:** v2.0+UCU-1.0

**Source Repository:** github.com/contactTAM/q-command-system

### 2.2 Available Q-Commands

**Session Management:**
- **Q-BEGIN** - Start session (reads consolidated session notes, not individual files)
- **Q-END** - Complete session (creates transcript, individual notes, AND appends to consolidated)
- **Q-SAVE** - Lightweight quick exit (transcript + commit only)
- **Q-CHECKPOINT** - Mid-session progress snapshot
- **Q-STATUS** - Show session state, context health, recommendations
- **Q-VERIFY** - Check that Q-END/Q-CHECKPOINT actually worked

**Documentation:**
- **Q-DUMP** - Create session transcript manually
- **Q-COMMIT** - Stage and commit all changes (no push)
- **Q-LEARNINGS** - Summarize session learnings

### 2.3 UCU Customizations to Base v2.0

**1. Consolidated Session Notes (Q-BEGIN modification):**
- Base v2.0 reads: `GeneratedMDs/session-notes/[most-recent-file]`
- UCU v1.0 reads: `UCU-Development/session-notes.md` (consolidated file)
- **Rationale:** Faster context loading with single file instead of scanning multiple files

**2. Dual Session Notes Output (Q-END modification):**
- Base v2.0: Creates individual file only
- UCU v1.0: Creates individual file AND appends to consolidated file
- **Rationale:** Maintains v2.0 compliance while serving custom workflow

**3. Session Notes Archiving (NEW in UCU v1.0):**
- Periodic archiving every 10 sessions (~800 lines)
- Archives stored: `UCU-Development/archives/session-notes-archive-sessions-[range].md`
- Q-END warns when threshold reached
- **Rationale:** Keeps active file fast to load for Q-BEGIN

**4. Work Plan Integration:**
- Q-END checks and updates `work-plan/work-plan.md` if applicable
- Not present in current repo structure (may have been removed/relocated)

---

## 3. SKILLS & AGENTS

### 3.1 Midjourney Prompt Skill

**File:** `/docs/Midjourney_Prompt_Skill.md` (24,473 bytes, 604 lines)
**Purpose:** Comprehensive framework for generating consistent, high-quality Midjourney prompts for UCU visual development

**Structure:**

**Quality Tiers:**
1. **Tier 1 - Sketch/Concept:** Quick exploration, multiple options (`--s 50-250`)
2. **Tier 2 - Concept Art:** Development reference, presentation (`--s 250-500`)
3. **Tier 3 - Photorealistic:** Hero images, pitch deck (`--s 150-400`)

**Category Templates:**
1. **Characters:**
   - Face Close-Up (establish identity, show consciousness)
   - Full Body (posture, build, physical capability)
   - In Action (specific story moments)
   - Relationship Dynamic (partnership, intimacy)

2. **Locations:**
   - Establishing Shot (scale, environment)
   - Specific Structure/Place (human-made or natural)
   - Intimate Interior (living spaces)

3. **Objects & Implements:**
   - Hero Close-Up (construction detail, innovation)
   - In Context/Use (function, scale)

4. **Atmosphere & Mood:**
   - Environmental Mood (emotional landscape)
   - Specific Moment (exact story beat feeling)

5. **Celestial Realm:**
   - Life Carriers/Beings (luminous, non-literal)
   - Cosmic Context (terrestrial + cosmic overlay)

**Midjourney v7 Parameters (November 2025):**

**Character Consistency - --oref (Omni Reference):**
- Replaces v6 --cref system
- Maintains character facial features across generations
- Costs 2x GPU time
- **--ow (Omni Weight):** 1-1000 (default 100)
  - **Low (100-200):** Best for age variations (younger/older versions)
  - **Medium (400-600):** Strong facial consistency, same age
  - **High (700-1000):** Maximum similarity

**Critical Discovery - Age Variation Workflow:**
- High --ow (400+) preserves age along with facial features
- Low --ow (50-150) lets prompt override age while maintaining facial similarity
- **For age progressions:** Use --ow 100-200 (not 400+)
- Document warns: "Simply lowering weight and describing different ages usually doesn't work well"

**Style References:**
- **Film:** The Revenant, Quest for Fire, Arrival, Tree of Life, Interstellar
- **Cinematography:** Emmanuel Lubezki, Roger Deakers, Chivo
- **Avoid:** Thor, MCU, fantasy aesthetic, caveman stereotypes

**UCU-Specific Pitfalls to Avoid:**
1. Too modern/clean (use "weathered," "scarred," "primitive")
2. Stereotypical caveman (emphasize "intelligent eyes," "consciousness visible")
3. Fantasy aesthetic (reference The Revenant, use "photorealistic")
4. Campy celestial realm (reference Arrival/Tree of Life, not angels/wings)
5. Too dark/desaturated (specify lighting)
6. Wrong time period markers (specify "one million years ago")

### 3.2 Character World-Building Agent

**File:** `/docs/agents/character-worldbuilding-agent.md` (14,466 bytes, 383 lines)
**Purpose:** Autonomous research, compilation, and visual development for UCU characters

**Three-Phase Workflow:**

**PHASE 1: Deep Research (Autonomous)**

Inputs:
- Character name (e.g., "Fonta," "The Father")
- Episode context
- Specific priorities

Tasks:
1. Identify relevant Papers (use @docs/UB-TOC.txt)
2. Mine all physical descriptions (EXPLICIT vs. IMPLIED vs. UNSPECIFIED)
3. Mine psychological/behavioral traits
4. Identify evolutionary/historical context
5. Map creative license territory (what Papers DON'T specify)
6. Identify key life moments for visualization

**Deliverable:** Comprehensive research document (not shown to project lead yet)

**TOUCHPOINT 1:** Present findings + initial questions (2-3 pages)
- What Papers explicitly state (with citations)
- What Papers imply
- What Papers don't specify (creative license territory)
- Evolutionary/historical context
- 5-7 targeted questions for project lead

**PHASE 2: Creative Direction (Interactive)**

Wait for project lead responses, then:
1. Synthesize visual strategy (combine explicit facts + creative direction)
2. Draft creative license documentation
3. Identify character's visual "north star" (one-sentence essence)

**TOUCHPOINT 2:** Present visual strategy + specific questions (if needed)
- Visual strategy summary (1 page)
- Key visual elements to emphasize
- Pitfalls to avoid
- Clarifying questions (3-5 max, only if unclear)

**PHASE 3: Deliverable Creation (Autonomous)**

Create:
1. **Comprehensive character description document**
   - File: `/UCU-Development/world-building/characters/[character-name]/[character-name]-urantia-book-descriptions.md`
   - Contents: Identity, physical capabilities (EXPLICIT from Papers), mental/emotional qualities, evolutionary context, relationships, key life moments, spiritual significance, what Papers DON'T specify

2. **Evolutionary context document** (if applicable)
   - File: `/UCU-Development/world-building/characters/[ancestor-category]/[character-name]-evolutionary-ancestors-complete.md`
   - Complete lineage from earliest ancestors

3. **Midjourney prompt variations (3)**
   - Variation 1: Emphasize consciousness/intelligence
   - Variation 2: Emphasize evolutionary positioning
   - Variation 3: Emphasize survival/weathering
   - Each includes ALL explicit facts + quality tier + style parameters

4. **Creative license documentation**
   - File: `/UCU-Development/world-building/characters/[character-name]/creative-license-log.md`
   - Format: "CREATIVE LICENSE: [what invented] to illuminate [what revealed]"
   - Organized by category

5. **File organization**
   - Create proper directory structure under `/UCU-Development/world-building/characters/`

**TOUCHPOINT 3:** Deliver complete package
- Summary of files created
- Quick visual strategy recap
- Next steps recommendation (ready for Midjourney testing)

**Critical Constraints:**

**LAYER 1: SOURCE MATERIAL IS SACRED (Maximum Accuracy)**
- Any descriptions explicitly mentioned in Papers are non-negotiable
- Examples: "black eyes," "swarthy complexion," specific ages, timeline events
- Cannot contradict what Papers state

**LAYER 2: CREATIVE LICENSE TO FILL GAPS (Document Everything)**
- Exercise creative license freely for unspecified details
- **Must document every instance:** `CREATIVE LICENSE: [what invented] to illuminate [what revealed]`
- Examples: specific facial structure, scar placement, hair styling, emotional expression

---

## 4. SESSION HISTORY & PROJECT EVOLUTION

**Project Start:** November 4, 2025
**Current Status:** November 13, 2025 (Session 15 placeholder)
**Sessions Documented:** 14 complete sessions
**Total Duration:** ~10 days of development
**Session Length:** 30-90 minutes per session (typically 30-45 min)

**PHASE 1: Validate & Prepare (Sessions 1-4, Nov 4-7)**
- Story mining from Urantia Papers 62-63
- Establishing collaborative workflow ("Prep-Then-Collaborate Method")
- Source material fidelity principles established
- Notion database integration (Story Moments That Matter)

**PHASE 2: Build Episode Outlines (Sessions 5-14, Nov 8-13)**
- Episode 1 complete outline created (Session 5)
- World-building infrastructure and agent framework (Sessions 6-7)
- Fonta character development (Sessions 7-8)
- Midjourney Remix mode workflow for age variations (Session 9)
- Character age progressions complete (Session 10)
- Episode 2 preparation and outline (Sessions 11-13)
- Episode 3 complete outline (Session 14)
- **Three-episode proof-of-concept COMPLETE**

**PHASE 3: Strategic Deployment (Not yet begun)**
- Finalize presentation package
- Identify target contacts
- Staged rollout

---

## 5. SYSTEM STRENGTHS & INNOVATIONS

### 5.1 Collaborative Workflow ("Prep-Then-Collaborate Method")

**Innovation:** Established in Session 2 after Gabriel's correction

**Method:**
1. Claude does prep work privately (mines Papers, takes notes, prepares questions)
2. Claude leads Gabriel with targeted questions
3. Gabriel discovers and reacts emotionally to material
4. They synthesize together to create final work
5. All deliverables go into Notion/files (Claude uses MCP tools directly)

**Why It Works:**
- Claude brings structure and thoroughness (prep work)
- Gabriel brings emotional truth and creative choice (reactions)
- Collaboration feels genuine (Gabriel discovering, not just approving)
- Background prep files can be reference but aren't the deliverable
- Final deliverables are true co-creation

### 5.2 Source Material Fidelity Framework

**TWO-LAYER APPROACH:**

**LAYER 1: SOURCE MATERIAL IS SACRED (Maximum Accuracy)**
- Urantia Book is SOLE source material
- Any descriptions explicitly mentioned in Papers are non-negotiable
- Examples: "black eyes," "19 years old when fled tribe," "died at age 42"
- Cannot contradict what Papers state

**LAYER 2: CREATIVE LICENSE TO FILL GAPS (Document Everything)**
- Exercise creative license freely for unspecified details
- **Must document every instance:** `CREATIVE LICENSE: [what invented] to illuminate [what revealed]`
- Examples: specific facial structure, scar placement, hair styling, emotional expression
- Maintains transparency about what's revealed vs. invented

**Benefits:**
- Serves both Urantia community (respects source) and mainstream audiences (fills gaps)
- Prevents contradictions while enabling dramatic interpretation
- Documentation provides audit trail for creative choices
- Future collaborators know exactly where creative license exercised

### 5.3 Autonomous Agent Framework

**character-worldbuilding-agent.md** provides complete specification for autonomous character development

**Innovation:** Agent handles research, synthesis, and deliverable creation with minimal touchpoints

**Three-Phase Process:**
1. **Phase 1 (Autonomous):** Deep research of all Papers mentioning character
2. **Touchpoint 1:** Present findings + targeted questions (2-3 pages)
3. **Phase 2 (Interactive):** Wait for responses, synthesize visual strategy
4. **Touchpoint 2:** Present strategy + clarifying questions if needed
5. **Phase 3 (Autonomous):** Create complete deliverable package

**Deliverables Produced:**
- Comprehensive character descriptions
- Evolutionary context documents
- Midjourney prompt variations (3)
- Creative license documentation
- Proper file organization

**Benefits:**
- Reduces Gabriel's time investment (only answers questions, doesn't do research)
- Ensures thoroughness (agent has checklist of all required elements)
- Maintains consistency (same framework for all characters)
- Complete documentation (all sources cited, all creative choices logged)

### 5.4 Visual Development Pipeline

**Integrated Midjourney Workflow:**

**Midjourney_Prompt_Skill.md provides:**
- Quality tier selection (sketch, concept, photorealistic)
- Category templates (characters, locations, objects, atmosphere, celestial)
- UCU-specific pitfalls to avoid
- v7 parameter guidance (--oref, --ow, --s, --style)
- Film references for tone consistency
- Prompt construction workflow

**Age Progression Innovation:**
- Discovered optimal --ow values for age variations (100-200, not 400+)
- Documented in REMIX-GUIDE-Age-Deaging.md
- Successfully generated age progressions: 9, 11, 13, 16, 19
- Maintains facial consistency while allowing age changes

### 5.5 Session Management & Archiving

**UCU v1.0 Customization of Q-Command System:**

**Consolidated Session Notes:**
- Single file: `UCU-Development/session-notes.md`
- Q-BEGIN reads from this file (faster context loading)
- Q-END appends to this file (continuous narrative)
- Also creates individual files (v2.0 compliance)

**Archiving Strategy:**
- Every 10 sessions (~800 lines)
- Archives stored: `UCU-Development/archives/session-notes-archive-[range].md`
- Q-END warns when threshold reached
- Active file stays fast for Q-BEGIN

**Benefits:**
- Fast context loading (single file vs. scanning multiple)
- Continuous narrative of project evolution
- Organized history (archives by session range)
- Dual compliance (individual files + consolidated)

---

## 6. KEY TAKEAWAYS

**What UCU-DEV Demonstrates:**

1. **Q-System Customization is Possible:**
   - Base v2.0 + custom UCU v1.0 modifications
   - Consolidated session notes work well
   - Archiving strategy manageable
   - Version tracking enables updates

2. **Skills Can Be Domain-Specific:**
   - Midjourney_Prompt_Skill highly specialized for UCU visual style
   - Contains domain-specific pitfalls, style references, parameter guidance
   - Reusable framework across all visual development

3. **Agents Can Be Highly Effective:**
   - character-worldbuilding-agent produced complete packages
   - Three-phase workflow with touchpoints optimal
   - Autonomous research with targeted questions
   - Complete documentation ensured

4. **Visual Development Can Be Systematic:**
   - Skill framework prevents inconsistency
   - Age progression workflow documented and repeatable
   - Reference image organization clear
   - Prompt reuse enabled

5. **Collaboration Method Matters:**
   - "Prep-Then-Collaborate" prevents AI solo work
   - User discovery process preserves emotional truth
   - Clear division of labor (Claude structure, Gabriel emotion)
   - Documented for future instances

6. **Long Projects Need Archiving:**
   - 14 sessions generated substantial history
   - Consolidated + archiving strategy works
   - Fast context loading critical for Q-BEGIN
   - Continuous narrative valuable

---

**END OF UCU-DEV SYSTEM ANALYSIS**

**Document Generated:** 2025-11-17
**Total Analysis Depth:** Complete repository structure, Q-system implementation, skills/agents, session history, content organization, system strengths

**Ready for TDW comparison and harmonization planning.**
