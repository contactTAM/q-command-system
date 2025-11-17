# Screenplay Systems Comparison: UCU vs TDW

**Analysis Date:** 2025-11-17
**Purpose:** Cross-system pattern extraction for generalized domain-specific Q-System creation
**Repositories Analyzed:**
- UCU-dev (Urantia Cinematic Universe) - Early stage, pitch bible development
- TDW (The Divine Within) - Advanced stage, pilot screenplay development

---

## Executive Summary

This document compares two real-world screenplay development systems built on Q-Command System v2.0, identifying common patterns, unique innovations, and extracting a generalized process for creating domain-specific Q-Systems.

**Key Finding:** Despite different project stages and content types, both systems evolved similar core patterns while adapting uniquely to their specific needs. This validates that certain patterns are universal to screenplay development, while others are context-dependent.

---

## 1. System Overview Comparison

### 1.1 Project Stage & Scope

| Aspect | UCU | TDW |
|--------|-----|-----|
| **Stage** | Early - Pitch bible development | Advanced - Pilot screenplay |
| **Timeline** | 14 sessions (Nov 4-13, 2025) | 14+ sessions (Nov 14-17, 2025) |
| **Output** | 3-episode proof-of-concept outlines | Full pilot with scenes |
| **Format** | Episode outlines (prose) | Screenplay format + PREP files |
| **Source Material** | Urantia Book (canonical) | UB (canonical) + Gospel of Mary (thematic) |
| **Visual Development** | Extensive (Midjourney) | Minimal/none documented |
| **Sessions** | 30-60 min, high velocity | Similar cadence |

### 1.2 Repository Size Comparison

| Metric | UCU | TDW |
|--------|-----|-----|
| **Total Files** | ~40 markdown files | 72+ markdown files |
| **Documentation Size** | ~500KB | ~1.5MB |
| **Q-Command Version** | v2.0+UCU-1.0 | v2.2 (Collaborative) |
| **SHORTCUTS.md Size** | 592 lines (19KB) | 1,076 lines (33KB) |
| **CLAUDE.md Size** | 492 lines (31KB) | 24KB |

**Insight:** TDW is ~3x larger due to being further along (actual screenplay vs. outlines) and having more detailed character arc documentation.

---

## 2. Skills & Agents Comparison

### 2.1 UCU Skills/Agents

**Skills:**
1. **Midjourney_Prompt_Skill.md** (24KB, 604 lines)
   - Quality tiers (sketch, concept, photorealistic)
   - Category templates (characters, locations, objects, atmosphere, celestial)
   - v7 parameters (--oref, --ow for character consistency)
   - Age progression workflow
   - UCU-specific style references and pitfalls

**Agents:**
2. **character-worldbuilding-agent.md** (14KB, 383 lines)
   - Three-phase workflow (Research → Interactive → Deliverable)
   - Autonomous research from Urantia Papers
   - Touchpoint system (present findings → get feedback → create package)
   - Produces: descriptions, creative license logs, Midjourney prompts, file organization

**Integration:**
- Skills stored in `/docs/`
- Agents stored in `/docs/agents/`
- Invoked manually during sessions
- No custom Q-commands wrapping skills/agents (yet)

### 2.2 TDW Skills/Agents

**Agents:**
1. **scene-prep-agent-instructions.md** (610 lines)
   - 12-step execution protocol
   - Conditional reading logic (IF character X THEN read Y)
   - 12-section PREP template
   - Quality checklist with error prevention
   - Produces: Complete scene PREP files with 10 questions for Gabriel

**Integration:**
- Agent instructions in `/GeneratedMDs/workflows/`
- FILE-STRUCTURE-MAP.md provides navigation system for agents
- No custom Q-commands wrapping agents (yet)
- Agents invoked via Task tool manually

**NO Midjourney/Visual Skills:**
- TDW doesn't document visual development (if any)
- Focus is on screenplay text, character arcs, scene structure

### 2.3 Key Differences

| Aspect | UCU | TDW |
|--------|-----|-----|
| **Visual Development** | ✅ Extensive (Midjourney skill) | ❌ Not documented |
| **Character Development** | ✅ Research agent (Papers mining) | ✅ Built into scene-prep workflow |
| **Scene Preparation** | ❌ Not formalized | ✅ Detailed agent with 12-section template |
| **Agent Autonomy** | High (3-phase touchpoint) | High (12-step execution) |
| **Agent Navigation** | Not documented | ✅ FILE-STRUCTURE-MAP.md system |
| **Quality Control** | Embedded in agent spec | ✅ Extensive checklists + IS/IS NOT |

### 2.4 Pattern Identified: Agent Architecture

**Common Pattern:**
```
AUTONOMOUS AGENT =
  Detailed Instructions (step-by-step protocol) +
  Conditional Logic (IF-THEN reading) +
  Quality Checklist (error prevention) +
  Touchpoint System (when to involve user) +
  Output Template (structured deliverable)
```

**UCU Agent Example:**
```
Phase 1: Autonomous research → Touchpoint 1: Present findings
Phase 2: Synthesize strategy → Touchpoint 2: Present strategy (if needed)
Phase 3: Create deliverables → Touchpoint 3: Deliver package
```

**TDW Agent Example:**
```
Steps 1-8: Autonomous reading + analysis
Step 9: Create PREP file (with questions)
Step 10: Submit to user
Steps 11-12: Quality check + verification
```

**Key Insight:** Both systems discovered that agents need:
1. **Autonomy** for heavy lifting (reading, research, synthesis)
2. **Touchpoints** for creative decisions (questions, not answers)
3. **Quality gates** before delivery (checklists, verification)
4. **Structured output** (templates with required sections)

---

## 3. Q-Command Customization Comparison

### 3.1 UCU Q-Command Customizations

**Base Commands Modified:**
- **Q-BEGIN:** Reads consolidated session notes (not individual files)
- **Q-END:** Creates individual file AND appends to consolidated
- **Session Notes:** Consolidated in `UCU-Development/session-notes.md`
- **Archiving:** Every 10 sessions (~800 lines)

**Custom Commands:**
- None yet (uses base v2.0 commands only)

**Version:** v2.0+UCU-1.0 (base + customization layer)

### 3.2 TDW Q-Command Customizations

**Base Commands:** Standard v2.0 (Q-BEGIN, Q-END, Q-CHECKPOINT, Q-STATUS, Q-VERIFY, Q-SAVE)

**Custom Commands:**
1. **Q-SCENE** (Lines 635-686)
   - 5-step scene development workflow
   - Collaborative beat outline before drafting
   - Never drafts without discussion

2. **Q-CHARACTER [name]** (Lines 688-751)
   - 5-step character analysis
   - Voice consistency check
   - Arc progression verification

3. **Q-TIMELINE [ancient|modern]** (Lines 755-834)
   - 7-step timeline verification
   - Chronological flow check
   - Pacing analysis
   - Parallel timeline resonance check

4. **Q-RESEARCH [topic]** (Lines 838-942)
   - Source hierarchy enforcement (UB = canonical, Gospel = thematic)
   - PRIMARY vs SECONDARY source protocol
   - Prevents treating thematic material as historical fact

**Collaborative Working Mode:** (Lines 10-42 of SHORTCUTS.md)
- NEVER work autonomously on creative/analytical tasks
- ALWAYS collaborate (prepare questions, present choices, work interactively)
- RED FLAGS section (stop if completing work without user input)

**Version:** v2.2 (Collaborative screenplay development)

### 3.3 Key Differences

| Aspect | UCU | TDW |
|--------|-----|-----|
| **Custom Q-Commands** | None | 4 (SCENE, CHARACTER, TIMELINE, RESEARCH) |
| **Collaborative Mode** | Implicit (via workflow) | ✅ Explicit (top of SHORTCUTS.md) |
| **Session Notes** | Consolidated file | Individual files (standard v2.0) |
| **Source Hierarchy** | Implicit (one source) | ✅ Explicit (encoded in Q-RESEARCH) |
| **Domain Commands** | Not yet | ✅ Screenplay-specific workflows |

### 3.4 Pattern Identified: Customization Layers

**UCU Approach: File-Level Customization**
- Customize HOW base commands work (consolidated vs. individual files)
- Don't add new commands
- Focus on session management efficiency

**TDW Approach: Command-Level Customization**
- Keep base commands as-is
- Add domain-specific commands (Q-SCENE, Q-CHARACTER, etc.)
- Encode domain knowledge in commands (source hierarchy, collaborative mode)

**Generalized Pattern:**
```
DOMAIN CUSTOMIZATION =
  Base Commands (universal session management) +
  File Structure Modifications (optional - UCU style) +
  Domain-Specific Commands (optional - TDW style) +
  Domain Knowledge Encoding (source hierarchies, workflows) +
  Collaborative Mode Configuration (for creative domains)
```

**Key Insight:** Two valid approaches:
1. **Lightweight:** Customize file organization, use base commands (UCU)
2. **Full-Featured:** Add domain commands encoding workflows (TDW)

Both work. Choice depends on project complexity and user preference.

---

## 4. Directory Structure Comparison

### 4.1 UCU Directory Structure

```
ucu-dev/
├── docs/                          # Skills, agents, source materials
│   ├── agents/
│   │   └── character-worldbuilding-agent.md
│   ├── Midjourney_Prompt_Skill.md
│   └── [source materials: papers, timeline, etc.]
├── GeneratedMDs/                  # Q-system session management
│   ├── .q-system/                 # Version tracking
│   ├── transcripts/
│   ├── session-notes/             # Empty (uses consolidated)
│   ├── checkpoints/
│   └── SHORTCUTS.md
└── UCU-Development/               # All creative work
    ├── archives/                  # Archived session notes
    ├── episode-outlines/          # Episode outlines (3 files)
    ├── visual-reference/
    │   └── characters/            # Midjourney images + PDFs
    ├── working-notes/
    ├── world-building/
    │   └── characters/            # Character docs + prompts
    └── session-notes.md           # Consolidated active notes
```

**Key Features:**
- **Separation:** Session management (GeneratedMDs) vs. creative work (UCU-Development)
- **Skills in /docs/:** Stable reference materials
- **Visual pipeline:** Integrated into directory structure
- **Character-centric:** Each character has subdirectory with all materials

### 4.2 TDW Directory Structure

```
tdw-streaming-series/
├── CLAUDE.md
├── SESSION-CHECKLIST.md
├── docs/                          # Core reference (stable)
│   ├── FILE-STRUCTURE-MAP.md      # Agent navigation (CRITICAL)
│   ├── pitch-bible.md
│   ├── the-gospel-of-mary.md
│   └── Urantia-Book-References.md
├── GeneratedMDs/                  # Development materials (evolving)
│   ├── analysis/
│   ├── character-arcs/            # Episode-by-episode tracking
│   ├── character-profiles/        # Canonical character references
│   ├── checkpoints/
│   ├── corrections/
│   ├── episode-planning/          # Scene structure documents
│   ├── planning/
│   ├── session-notes/             # Individual session files
│   ├── transcripts/
│   ├── workflows/                 # Process documentation
│   │   └── scene-prep-agent-instructions.md
│   └── SHORTCUTS.md
├── screenplay/                    # Actual screenplay output
│   └── scenes/                    # Scene files + PREP files
└── deliverables/                  # External review materials (HTML)
```

**Key Features:**
- **Three-tier:** Stable reference (docs) vs. evolving materials (GeneratedMDs) vs. deliverables
- **FILE-STRUCTURE-MAP.md:** Agent navigation system (doesn't exist in UCU)
- **Workflows in GeneratedMDs:** Process documentation as living docs
- **Character arcs:** Episode-by-episode tracking with physical/emotional/relational markers
- **Deliverables:** Separate directory for polished exports

### 4.3 Key Differences

| Aspect | UCU | TDW |
|--------|-----|-----|
| **Tiers** | 2 (session mgmt + creative work) | 3 (stable + evolving + deliverables) |
| **Skills/Agents Location** | `/docs/` | `/GeneratedMDs/workflows/` |
| **Visual Reference** | ✅ Integrated | Not documented |
| **File Navigation System** | Not documented | ✅ FILE-STRUCTURE-MAP.md |
| **Character Organization** | Character-centric subdirectories | Flat profiles + arcs |
| **Episode Materials** | Outlines in one directory | Separated: planning + scenes |
| **Deliverables** | Not separate | ✅ Separate `/deliverables/` |
| **Working Notes** | ✅ `/working-notes/` | Embedded in other directories |

### 4.4 Pattern Identified: Organic vs. Planned Structure

**UCU Pattern: Organic Growth**
- Directory structure emerged organically session-by-session
- Added directories as needed for new capabilities
- Character-centric organization (each character = subdirectory)
- Visual development integrated from the start

**TDW Pattern: Structured from Experience**
- Three-tier separation (stable/evolving/deliverable)
- FILE-STRUCTURE-MAP.md for navigation
- Workflows documented as process emerged
- Deliverables separated for external collaboration

**Generalized Pattern:**
```
DOMAIN-SPECIFIC DIRECTORY STRUCTURE =
  [Q-System Standard] (GeneratedMDs/ with transcripts, session-notes, checkpoints) +
  [Stable References] (docs/ or similar) +
  [Domain Artifacts] (screenplay/, code/, research/, etc.) +
  [Optional: Deliverables] (for external collaboration) +
  [Optional: Working Notes] (scratch/iteration space) +
  [Optional: Visual/Media] (if applicable to domain)
```

**Key Insight:** Structure should:
1. **Separate Q-system management from domain work** (both do this)
2. **Distinguish stable vs. evolving materials** (TDW explicit, UCU implicit)
3. **Organize by domain logic** (UCU = character-centric, TDW = document-type-centric)
4. **Provide navigation system for agents** (TDW has FILE-STRUCTURE-MAP, UCU doesn't need it yet due to size)

---

## 5. Session Management Comparison

### 5.1 UCU Session Management

**File Strategy:**
- **Consolidated session notes:** `UCU-Development/session-notes.md`
- **Archiving:** Every 10 sessions → `archives/session-notes-archive-sessions-[range].md`
- **Individual files:** Still created (v2.0 compliance) but not primary
- **Q-BEGIN reads:** Consolidated file (faster context loading)
- **Q-END writes:** Both individual file AND appends to consolidated

**Benefits:**
- Fast Q-BEGIN context loading (one file vs. scanning multiple)
- Continuous narrative of project evolution
- Archiving keeps active file manageable

**Rationale:**
- Early decision to optimize for speed
- Single file easier to reference mid-session
- Archiving prevents file bloat

### 5.2 TDW Session Management

**File Strategy:**
- **Standard v2.0:** Individual session notes in `GeneratedMDs/session-notes/`
- **File naming:** `YYYY-MM-DD-HHmm-Gabriel.md`
- **Q-BEGIN reads:** Most recent individual file
- **Q-END writes:** Individual file only
- **No archiving:** (project not old enough yet?)

**Benefits:**
- Standard v2.0 compliance
- Each session is discrete unit
- Easy to find specific session by date/time

**Rationale:**
- Follows v2.0 specification exactly
- No need for consolidation (yet?)
- Separate files may be easier for multi-person teams

### 5.3 Pattern Identified: Session Notes Strategy

**Two Valid Approaches:**

**Approach 1: Consolidated + Archive (UCU)**
- Fast context loading
- Continuous narrative
- Requires archiving discipline
- Better for: Long-running solo projects where Q-BEGIN speed matters

**Approach 2: Individual Files (TDW)**
- Standard v2.0
- Discrete session units
- No archiving needed
- Better for: Team projects, shorter projects, strict v2.0 compliance

**Generalized Pattern:**
```
SESSION NOTES STRATEGY =
  CHOOSE:
    - Consolidated (with archiving) for speed + narrative
    - Individual files for compliance + team use

  HYBRID (UCU):
    - Create both (dual output)
    - Maintains compliance while optimizing workflow
```

**Key Insight:** This is a **configuration choice**, not a pattern. Q-SETUP-DOMAIN should ask:
```
Session notes strategy:
1. Individual files (standard, team-friendly)
2. Consolidated + archive (faster Q-BEGIN, solo-optimized)
3. Hybrid (both - maintains compliance)
```

---

## 6. Character Development Comparison

### 6.1 UCU Character Development

**Structure:**
```
world-building/characters/[CharacterName]/
├── [name]-urantia-book-descriptions.md  # Source material facts
├── creative-license-log.md               # Documented creative choices
├── [name]-midjourney-prompts.md          # 3 prompt variations
├── age-timeline-and-versions-needed.md   # Age progression plan
├── PROMPTS-QUICK-REFERENCE.md            # Quick reference
└── [NAME]-REFERENCE-IMAGE.md             # Hero image selection
```

**Content:**
- **Source fidelity:** Explicit facts from Urantia Papers (with citations)
- **Creative license log:** Every invented detail documented
- **Visual development:** Integrated (Midjourney prompts + generated images)
- **Age progression:** Ages 9, 11, 13, 16, 19 documented

**Process:**
- Use character-worldbuilding-agent.md
- Agent mines Papers for explicit descriptions
- Agent identifies creative license territory
- Agent generates Midjourney prompts
- Gabriel runs prompts, stores images
- Complete package: text + visual + creative license documentation

**No Episode-by-Episode Arcs:**
- Characters defined at project start
- Arc documents not created yet (only 3 episodes outlined)
- Focus on establishing character foundation

### 6.2 TDW Character Development

**Structure:**
```
GeneratedMDs/
├── character-profiles/
│   └── [CharacterName]-PROFILE.md     # Canonical reference
└── character-arcs/
    ├── [CharacterName]-awakening-arc.md     # Episode-by-episode
    └── [CharA]-[CharB]-relationship.md      # Relationship arcs
```

**Content:**

**Character Profile:**
- Character Overview
- Biography
- Personality Traits
- **Episode 1 State** (critical for arc tracking)
- Professional Expertise
- Voice & Dialogue Patterns
- Relationships
- Arc Summary

**Awakening Arc (Episode-by-Episode):**
```markdown
## EPISODE 1: UNCONSCIOUS AUTOMATON

Physical Markers:
- Controlled posture, tight jaw
- Exhaustion present but hidden

Emotional Markers:
- Completely shut down to grief
- Clinical precision as armor

Relational Markers:
- Keeps everyone at distance
- Professional detachment

What Character CAN do at this point:
✅ Function professionally
✅ Maintain control

What Character CANNOT do yet:
❌ Feel grief
❌ Show vulnerability
```

**Process:**
- Start with character profile (foundation)
- Create awakening arc with episode-by-episode markers
- Define physical/emotional/relational markers per episode
- Specify CAN/CANNOT boundaries
- Track relationship arcs separately

**No Visual Development:**
- Not documented (may not exist or not needed for pitch stage)

### 6.3 Key Differences

| Aspect | UCU | TDW |
|--------|-----|-----|
| **Organization** | Character-centric subdirectories | Flat profiles + arcs |
| **Source Fidelity** | ✅ Explicit (with creative license logs) | Implicit (UB references in arcs) |
| **Visual Development** | ✅ Integrated (Midjourney) | Not documented |
| **Episode-by-Episode Tracking** | ❌ Not yet (too early) | ✅ Detailed markers per episode |
| **Arc Documentation** | Not created | ✅ Physical/emotional/relational per episode |
| **CAN/CANNOT Boundaries** | Not documented | ✅ Explicit per episode |
| **Relationship Tracking** | Implicit | ✅ Separate relationship arc docs |
| **Voice & Dialogue** | In prompts (visual focus) | ✅ Dedicated section in profile |

### 6.4 Pattern Identified: Character Development Stages

**Stage 1: Foundation (UCU's current stage)**
```
FOUNDATION =
  Character Profile (who they are) +
  Source Material Facts (explicit descriptions) +
  Creative License Documentation (what's invented) +
  Visual Development (if applicable) +
  Voice/Dialogue Patterns (basic)
```

**Stage 2: Arc Development (TDW's current stage)**
```
ARC DEVELOPMENT =
  Foundation (from Stage 1) +
  Episode-by-Episode Transformation Tracking +
  Physical/Emotional/Relational Markers per Episode +
  CAN/CANNOT Boundaries per Episode +
  Relationship Arcs (power dynamics over time)
```

**Generalized Pattern:**
```
CHARACTER DEVELOPMENT =
  Stage 1: FOUNDATION (establish who they are)
    - Profile
    - Source material facts
    - Creative license documentation
    - Visual reference (if applicable)

  Stage 2: ARC TRACKING (track transformation)
    - Episode/milestone-by-episode markers
    - Physical/emotional/relational state per point
    - Capability boundaries (CAN/CANNOT)
    - Relationship dynamics over time
```

**Key Insight:**
- **Early projects** (UCU): Focus on foundation
- **Advanced projects** (TDW): Need detailed arc tracking
- **Both are necessary** for complete character development
- **Arc tracking prevents anachronistic behavior** (character too advanced too early)

---

## 7. Source Material Handling Comparison

### 7.1 UCU Source Material Handling

**Source:**
- **Primary (only):** The Urantia Book
- **No secondary sources** for this project

**Fidelity Framework:**
```
LAYER 1: SOURCE MATERIAL IS SACRED (Maximum Accuracy)
- Any descriptions explicitly in Papers are non-negotiable
- Examples: "black eyes," "swarthy complexion," specific ages
- Cannot contradict what Papers state

LAYER 2: CREATIVE LICENSE TO FILL GAPS (Document Everything)
- Exercise creative license for unspecified details
- MUST document: "CREATIVE LICENSE: [what invented] to illuminate [what revealed]"
- Examples: facial structure, scar placement, hair styling, expression
```

**Implementation:**
- **character-worldbuilding-agent.md enforces framework**
- Agent mines Papers for EXPLICIT vs. IMPLIED vs. UNSPECIFIED
- Agent creates creative-license-log.md for every character
- **Format:** "CREATIVE LICENSE: [invented detail] to illuminate [story truth]"

**No Hierarchy Needed:**
- Only one source (UB)
- All canonical

### 7.2 TDW Source Material Handling

**Sources:**
- **Primary (canonical):** The Urantia Book (historical facts)
- **Secondary (thematic):** Gospel of Mary (inspiration only)

**Source Hierarchy (CRITICAL):**
```
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

**Implementation:**
- **Q-RESEARCH command enforces hierarchy** (lines 838-942 of SHORTCUTS.md)
- **FILE-STRUCTURE-MAP.md specifies** when to read each source
- **scene-prep-agent-instructions.md includes** source hierarchy checks
- **Quality checklists verify** proper source labeling

**Why This Matters:**
- Prevents catastrophic errors (treating thematic material as historical fact)
- Gabriel's personal credence hierarchy encoded in system
- Future Claude instances automatically apply correct hierarchy

### 7.3 Key Differences

| Aspect | UCU | TDW |
|--------|-----|-----|
| **Number of Sources** | 1 (UB only) | 2 (UB + Gospel of Mary) |
| **Source Hierarchy** | Not needed (one source) | ✅ Explicit PRIMARY vs SECONDARY |
| **Hierarchy Encoding** | N/A | ✅ In Q-RESEARCH command |
| **Creative License** | ✅ Documented per character | Implicit (not separate logs) |
| **Citations** | In character docs | ✅ UB references in arcs |
| **Quality Checks** | In agent template | ✅ In multiple locations (commands, workflows, checklists) |

### 7.4 Pattern Identified: Source Material Management

**Single Source (UCU Pattern):**
```
SINGLE SOURCE FIDELITY =
  Two-Layer Framework:
    Layer 1: What source explicitly states (sacred)
    Layer 2: What's unspecified (creative license, documented)

  Implementation:
    - Agent mines source for EXPLICIT vs IMPLIED vs UNSPECIFIED
    - Creative license log documents every invented detail
    - Format: "CREATIVE LICENSE: [what] to illuminate [why]"
```

**Multiple Sources (TDW Pattern):**
```
MULTI-SOURCE HIERARCHY =
  Define Hierarchy:
    PRIMARY: Canonical truth (plot, facts, events)
    SECONDARY: Inspiration (themes, interiority)
    [Additional tiers as needed]

  Encode in Q-Commands:
    Q-RESEARCH enforces hierarchy
    Steps: Check PRIMARY first → Then SECONDARY → Label findings

  Enforce in Workflows:
    Agents check hierarchy before using materials
    Quality checklists verify proper labeling
    FILE-STRUCTURE-MAP specifies when to read each source
```

**Generalized Pattern:**
```
SOURCE MATERIAL MANAGEMENT =
  IF single source:
    Use Two-Layer Fidelity Framework
    Document creative license explicitly

  IF multiple sources:
    Define explicit hierarchy (PRIMARY/SECONDARY/etc.)
    Encode hierarchy in Q-RESEARCH or custom command
    Enforce in workflows and checklists
    Prevent confusion through multiple enforcement points
```

**Key Insight:** Source hierarchy should be **encoded in the system**, not assumed. This is domain-specific knowledge that must be explicit to prevent errors.

---

## 8. Collaborative Workflow Comparison

### 8.1 UCU Collaborative Workflow

**Method: "Prep-Then-Collaborate"**

**Established:** Session 2 (after Gabriel's correction when Claude worked too autonomously)

**Process:**
```
1. Claude does prep work privately
   (mines Papers, takes notes, prepares questions)

2. Claude leads Gabriel with targeted questions
   (not presenting completed work, but asking for guidance)

3. Gabriel discovers and reacts emotionally to material
   (genuine discovery process, not just approval)

4. They synthesize together to create final work
   (co-creation, not Claude solo + Gabriel approval)

5. All deliverables go into Notion/files
   (Claude uses MCP tools directly)
```

**Documentation:**
- In CLAUDE.md (lines 149-172)
- Described as critical to partnership
- Prevents Claude from working solo

**Enforcement:**
- Not explicitly encoded in commands
- Documented in CLAUDE.md (Claude reads at Q-BEGIN)
- Established as workflow through practice

### 8.2 TDW Collaborative Workflow

**Method: "Collaborative Working Mode" (Structural)**

**Established:** Built into system from start (documented in SHORTCUTS.md)

**COLLABORATIVE WORKING MODE Section (Lines 10-42 of SHORTCUTS.md):**
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
- Start: Ask Gabriel what to explore today
- Prepare: Create questions/options about that topic
- Present: Share with Gabriel for discussion
- Collaborate: Work through together with frequent dialogue
- Document: Capture decisions as we make them
- Never: Go work independently and return with completed analysis

### Red Flags (Stop Immediately If You Catch Yourself):
- Completing arc analysis without Gabriel's input
- Making creative decisions unilaterally
- Returning with "finished" work on creative topics
- Assuming you know what Gabriel wants without asking
```

**Enforcement Mechanisms:**

**1. Structural (SHORTCUTS.md):**
- Collaborative mode defined at top of SHORTCUTS.md
- Read by Claude at every Q-BEGIN
- Cannot be missed

**2. Procedural (Workflows):**
- screenplay-scene-writing-workflow.md:
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

**3. Templated (PREP Files):**
- Section 6: Key Questions for Gabriel (10 questions)
- Forces agent to prepare questions, not answers
- Examples:
  - "Should Sarah's reaction be visible or suppressed?"
  - "How much of Laporte's guilt should he verbalize vs. show?"

**4. Verified (Quality Checklists):**
```markdown
- [ ] No creative decisions made, only preparation
- [ ] Tone is collaborative, not prescriptive
```

### 8.3 Key Differences

| Aspect | UCU | TDW |
|--------|-----|-----|
| **Formalization** | Documented (CLAUDE.md) | ✅ Structural (top of SHORTCUTS.md) |
| **Enforcement** | Narrative description | ✅ Multi-layered (commands, workflows, templates, checklists) |
| **Discovery** | After correction (Session 2) | Built-in from start |
| **Specificity** | General principle | ✅ Detailed lists (NEVER/ALWAYS/RED FLAGS) |
| **Integration** | Workflow description | ✅ Embedded in commands and templates |
| **Questions Emphasis** | Implicit | ✅ Explicit (Section 6 of PREP template) |

### 8.4 Pattern Identified: Collaborative Mode for Creative Domains

**UCU Approach: Narrative/Descriptive**
```
COLLABORATIVE MODE =
  Document in CLAUDE.md:
    - Describe the "Prep-Then-Collaborate" method
    - Explain why it matters (emotional truth, discovery)
    - Provide examples of good/bad collaboration

  Rely on:
    - Claude reading CLAUDE.md at Q-BEGIN
    - User correcting if Claude overreaches
    - Building practice through sessions
```

**TDW Approach: Structural/Enforced**
```
COLLABORATIVE MODE =
  Define at top of SHORTCUTS.md:
    - Core principle
    - NEVER list (what not to do)
    - ALWAYS list (how to collaborate)
    - Session pattern
    - Red flags (self-monitoring)

  Enforce in multiple layers:
    1. Commands (Q-SCENE requires discussion before draft)
    2. Workflows (collaborative steps required)
    3. Templates (questions required, not answers)
    4. Checklists (verify non-prescriptive tone)
```

**Generalized Pattern:**
```
COLLABORATIVE MODE (For Creative Domains) =

  MINIMUM (UCU-style):
    - Document in CLAUDE.md
    - Describe process and rationale
    - User corrects if needed

  MAXIMUM (TDW-style):
    - Structural definition (top of SHORTCUTS.md)
    - Multi-layer enforcement:
      * Commands require collaboration steps
      * Workflows embed discussion points
      * Templates require questions (Section 6)
      * Checklists verify tone

  CHOOSE based on:
    - Risk of AI overreach (high → use MAXIMUM)
    - Complexity of creative work (high → use MAXIMUM)
    - User comfort with correction (low → use MAXIMUM)
```

**Key Insight:** For creative domains where AI might overstep into artistic decisions:
1. **Collaborative mode must be structural, not optional**
2. **Multi-layer enforcement** prevents AI from "forgetting"
3. **Questions, not answers** should be the default output
4. **Self-monitoring red flags** help AI catch itself

---

## 9. Key Patterns Extracted

### Pattern 1: Agent Architecture

**Universal Agent Structure:**
```
AUTONOMOUS AGENT =

  1. DETAILED INSTRUCTIONS
     - Step-by-step execution protocol
     - Conditional logic (IF-THEN reading strategies)
     - Clear inputs/outputs

  2. READING STRATEGY
     - What to read (ALWAYS / IF-condition / SKIP)
     - Efficiency calculations (context cost awareness)
     - FILE-STRUCTURE-MAP.md for navigation (if large repo)

  3. TOUCHPOINT SYSTEM
     - When to involve user (creative decisions)
     - What to present (questions, not answers)
     - How to get feedback

  4. OUTPUT TEMPLATE
     - Structured deliverable format
     - Required sections
     - Quality standards

  5. QUALITY CONTROL
     - Pre-delivery checklist
     - Common pitfalls warnings
     - Self-verification steps
```

**Examples:**
- UCU: character-worldbuilding-agent.md (3 phases with touchpoints)
- TDW: scene-prep-agent-instructions.md (12 steps with quality checklist)

### Pattern 2: Domain-Specific Q-Commands

**When to Create Custom Q-Commands:**
```
CREATE CUSTOM Q-COMMAND IF:
  - Workflow is repeated frequently (e.g., Q-SCENE for every scene)
  - Workflow has specific domain logic (e.g., Q-RESEARCH with source hierarchy)
  - Workflow needs enforcement (e.g., Q-SCENE requires discussion before draft)
  - User wants shorthand (e.g., Q-TIMELINE instead of manual verification)

DON'T CREATE IF:
  - Workflow is one-off or rare
  - Base Q-commands sufficient (Q-BEGIN, Q-END work fine)
  - Too early in project (let patterns emerge organically)
```

**Command Structure:**
```
DOMAIN Q-COMMAND =

  NAME: Q-[ACTION] [optional-parameter]

  PURPOSE: One-line description

  PROCESS:
    Step 1: [Action] (ALWAYS/IF-condition)
    Step 2: [Action] (collaborative if creative)
    ...
    Step N: [Action] (verification)

  OUTPUT: What user receives

  QUALITY: Verification checklist
```

**Examples:**
- TDW: Q-SCENE (5 steps with collaborative beat discussion)
- TDW: Q-RESEARCH (source hierarchy enforcement)

### Pattern 3: Source Material Management

**Single Source:**
```
SINGLE SOURCE FIDELITY =
  Two Layers:
    Layer 1: SACRED (what source explicitly states)
    Layer 2: CREATIVE LICENSE (what's unspecified, documented)

  Implementation:
    - Agent mines source for EXPLICIT vs UNSPECIFIED
    - Creative license log: "CREATIVE LICENSE: [what] to illuminate [why]"
    - Transparency about what's revealed vs invented
```

**Multiple Sources:**
```
MULTI-SOURCE HIERARCHY =
  Define Hierarchy:
    PRIMARY: Canonical truth (use for plot, facts, events)
    SECONDARY: Inspiration (use for themes, interiority)

  Encode in System:
    - Q-RESEARCH command enforces hierarchy
    - FILE-STRUCTURE-MAP specifies when to read each
    - Workflows include source verification
    - Checklists verify proper labeling

  Critical Distinction:
    - PRIMARY = "What happened" (external)
    - SECONDARY = "What it meant" (internal)
```

### Pattern 4: Character Development Stages

**Stage 1: Foundation**
```
CHARACTER FOUNDATION =
  - Profile (who they are)
  - Source material facts (explicit descriptions)
  - Creative license documentation (what's invented)
  - Visual reference (if applicable)
  - Voice/dialogue patterns (basic)
```

**Stage 2: Arc Tracking**
```
CHARACTER ARC TRACKING =
  Episode/Milestone-by-Episode:
    - Physical markers
    - Emotional markers
    - Relational markers

  Capability Boundaries:
    - What character CAN do at this point: ✅
    - What character CANNOT do yet: ❌

  Relationship Dynamics:
    - Power balance per episode
    - How relationship evolves
```

**When to Move from Stage 1 → Stage 2:**
- When you start writing actual episodes/chapters
- When you need to prevent anachronistic behavior
- When tracking transformation is critical

### Pattern 5: Collaborative Mode Configuration

**For Creative Domains:**
```
COLLABORATIVE MODE =

  Core Principle:
    AI prepares questions, human makes creative decisions

  Define:
    NEVER work autonomously on: [list creative/analytical tasks]
    ALWAYS collaborate by: [list collaboration methods]
    Session pattern: [start/prepare/present/collaborate/document]
    Red flags: [self-monitoring criteria]

  Enforce in Multiple Layers:
    1. Structural: Top of SHORTCUTS.md (read at Q-BEGIN)
    2. Procedural: Workflows require collaboration steps
    3. Templated: Templates require questions, not answers
    4. Verified: Checklists check non-prescriptive tone

  Result:
    AI provides structure, human provides artistic judgment
```

### Pattern 6: File Organization

**Universal Q-System Layer:**
```
/GeneratedMDs/
  transcripts/       # Full conversation logs
  session-notes/     # Session summaries
  checkpoints/       # Mid-session snapshots
  SHORTCUTS.md       # Q-command specifications
```

**Domain-Specific Layers:**
```
Choose organization by domain logic:

For Screenplay (character-centric - UCU style):
  /characters/[CharacterName]/
    [all character materials in subdirectory]

For Screenplay (document-type-centric - TDW style):
  /character-profiles/
  /character-arcs/
  /episode-planning/

For Software (feature-centric):
  /features/[FeatureName]/
    [all feature materials]

For Legal (case-centric):
  /cases/[CaseName]/
    [all case materials]
```

**Navigation System (for large repos):**
```
/docs/FILE-STRUCTURE-MAP.md
  - Complete directory structure
  - File descriptions with sizes
  - Reading strategies (ALWAYS/IF-THEN/SKIP)
  - Context cost calculations
```

### Pattern 7: Session Notes Strategy

**Two Valid Approaches:**

**Individual Files (Standard v2.0):**
```
INDIVIDUAL FILES =
  Files: /GeneratedMDs/session-notes/YYYY-MM-DD-HHmm-PersonName.md
  Q-BEGIN: Reads most recent file
  Q-END: Creates new individual file
  Benefits: Standard v2.0, team-friendly, discrete sessions
```

**Consolidated + Archive (UCU Optimization):**
```
CONSOLIDATED =
  Files:
    - /[domain-dir]/session-notes.md (active consolidated)
    - /[domain-dir]/archives/session-notes-archive-sessions-[range].md
  Q-BEGIN: Reads consolidated (faster)
  Q-END: Creates individual + appends to consolidated
  Archiving: Every 10 sessions (~800 lines)
  Benefits: Fast context loading, continuous narrative
```

**Configuration Choice:**
```
Q-SETUP-DOMAIN should ask:
  "Session notes strategy?"
  1. Individual files (standard, team-friendly)
  2. Consolidated + archive (faster Q-BEGIN, solo-optimized)
  3. Hybrid (both - maintains compliance + optimization)
```

### Pattern 8: Skills vs Agents

**Skills:**
```
SKILL =
  Type: Reusable domain-specific knowledge framework

  Content:
    - Domain-specific templates
    - Parameter guidance
    - Best practices
    - Pitfalls to avoid

  Example (UCU):
    Midjourney_Prompt_Skill.md
    - Quality tiers
    - Category templates
    - v7 parameters
    - Style references
    - Workflow

  Invocation: Manually referenced during work

  Storage: /docs/ (stable reference)
```

**Agents:**
```
AGENT =
  Type: Autonomous execution protocol

  Content:
    - Step-by-step instructions
    - Conditional logic
    - Touchpoint system
    - Output template
    - Quality checklist

  Example (TDW):
    scene-prep-agent-instructions.md
    - 12-step protocol
    - IF-THEN reading
    - 12-section PREP template
    - Quality verification

  Invocation: Via Task tool (autonomous execution)

  Storage: /docs/agents/ or /GeneratedMDs/workflows/
```

**Key Distinction:**
- **Skill:** Knowledge framework (reference)
- **Agent:** Execution protocol (autonomous action)

---

## 10. Generalized Sequence for Domain-Specific Q-System Creation

Based on UCU and TDW evolution, here is the extracted sequence:

### Phase 1: Foundation Setup

**1.1 Install Base Q-Command System v2.0**
```
- Set up GeneratedMDs/ directory structure
- Create CLAUDE.md
- Create SESSION-CHECKLIST.md
- Install SHORTCUTS.md (base v2.0)
- Test Q-BEGIN / Q-END
```

**1.2 Identify Domain**
```
Ask:
- What domain? (screenplay, software, legal, medical, research, etc.)
- What are you creating? (pilot script, MVP, case brief, research paper, etc.)
- Solo or team?
- Do you have source materials with hierarchy?
```

### Phase 2: Domain-Specific Structure

**2.1 Create Domain-Appropriate Directory Structure**
```
Let structure emerge organically OR plan based on domain:

For Screenplay:
  - /characters/ or /character-profiles/ + /character-arcs/
  - /episodes/ or /episode-planning/
  - /scenes/ or /screenplay/scenes/
  - /world-building/ (if applicable)
  - /visual-reference/ (if applicable)

For Software:
  - /architecture/
  - /features/
  - /api-docs/
  - /tests/

For Legal:
  - /cases/
  - /research/
  - /filings/

[Add directories as needs emerge]
```

**2.2 Document Initial Source Materials**
```
IF single source:
  - Create two-layer fidelity framework
  - Document in CLAUDE.md
  - Create creative license logging template

IF multiple sources:
  - Define hierarchy (PRIMARY/SECONDARY/etc.)
  - Document in CLAUDE.md
  - Create source hierarchy section
  - Will encode in Q-RESEARCH later
```

### Phase 3: Workflow Emergence (Organic)

**3.1 Start Working**
```
- Use base Q-BEGIN / Q-END
- Do actual domain work
- Notice repetitive workflows
- Identify pain points
- Document decisions as you go
```

**3.2 Identify Workflow Patterns**
```
After 5-10 sessions, notice:
- What tasks repeat frequently?
- What workflows need structure?
- What mistakes happen repeatedly?
- Where does AI overstep into creative territory?
- What takes too much time?
```

**3.3 Create Workflow Documentation**
```
For repeated workflows:
  - Create /workflows/[workflow-name].md
  - Document step-by-step process
  - Include quality checklist
  - Note common pitfalls
```

### Phase 4: Agent Infrastructure (Optional)

**4.1 Identify Agent Opportunities**
```
Look for:
- Repetitive prep work (scene prep, research synthesis, etc.)
- Multi-file context gathering
- Heavy reading/analysis followed by structured output
- Tasks that don't require creative decisions
```

**4.2 Create Agent Instructions**
```
For each agent:
  1. Write detailed step-by-step instructions
  2. Define conditional reading logic (IF-THEN)
  3. Create touchpoint system (when to involve user)
  4. Design output template
  5. Add quality checklist
  6. Document common pitfalls

Store in:
  - /docs/agents/ OR /GeneratedMDs/workflows/
```

**4.3 Create FILE-STRUCTURE-MAP.md (if repo is large)**
```
When repo >30 files or agents need navigation:
  1. Generate (or manually create) FILE-STRUCTURE-MAP.md
  2. Document all directories and files
  3. Add file descriptions
  4. Create reading strategies (ALWAYS/IF-THEN/SKIP)
  5. Calculate context costs
  6. Update as repo grows
```

### Phase 5: Skills Creation (Optional)

**5.1 Identify Skill Opportunities**
```
Look for:
- Domain-specific knowledge that's referenced repeatedly
- Templates or patterns that need consistency
- Technical parameters or configurations (e.g., Midjourney)
- Best practices that need documentation
```

**5.2 Create Skill Documents**
```
For each skill:
  1. Create comprehensive framework document
  2. Include templates/patterns
  3. Document parameters/configurations
  4. List best practices
  5. Warn about pitfalls
  6. Provide examples

Store in:
  - /docs/[SkillName]_Skill.md
```

### Phase 6: Custom Q-Commands (Optional)

**6.1 Decide If Custom Commands Needed**
```
Create custom Q-commands IF:
  - Workflow repeated very frequently (every session)
  - Workflow has specific domain logic to enforce
  - User wants convenient shorthand
  - Workflow needs structural enforcement

DON'T create if:
  - Too early (let patterns emerge first)
  - Base commands sufficient
  - Workflow is rare
```

**6.2 Design Custom Commands**
```
For each command:
  1. Name: Q-[ACTION] [optional-parameter]
  2. Purpose: One-line description
  3. Process: Step-by-step (with collaborative steps if creative)
  4. Output: What user receives
  5. Quality: Verification checklist

Add to SHORTCUTS.md:
  - After base v2.0 commands
  - In "Project-Specific Commands" section
```

**6.3 Special: Q-RESEARCH (if multiple sources)**
```
IF multiple sources with hierarchy:
  - Create Q-RESEARCH command
  - Encode source hierarchy in command steps
  - Enforce PRIMARY → SECONDARY → label findings
  - Verify in quality checklists
```

### Phase 7: Collaborative Mode (For Creative Domains)

**7.1 Assess Need for Collaborative Mode**
```
IF domain involves:
  - Creative decisions (story, design, strategy)
  - Artistic judgment (what "feels right")
  - High risk of AI overreach

THEN: Implement collaborative mode
```

**7.2 Define Collaborative Mode**
```
Create section in SHORTCUTS.md (lines 10-50):
  ## COLLABORATIVE WORKING MODE

  Core Principle: [statement]

  Never Work Autonomously On:
    - [List creative/analytical tasks]

  Always Collaborate By:
    1. [Methods]

  Session Pattern:
    - Start: [process]
    - Prepare: [process]
    - Present: [process]
    - Collaborate: [process]
    - Document: [process]

  Red Flags:
    - [Self-monitoring criteria]
```

**7.3 Enforce Collaborative Mode**
```
Add enforcement layers:
  1. Structural: Top of SHORTCUTS.md (read at Q-BEGIN)
  2. Procedural: Workflows require collaboration steps
  3. Templated: Agent templates require questions section
  4. Verified: Checklists verify non-prescriptive tone
```

### Phase 8: Character/Entity Development (If Applicable)

**8.1 Stage 1: Foundation**
```
For each character/entity:
  - Create profile (who they are)
  - Document source material facts
  - Create creative license log (if applicable)
  - Generate visual reference (if applicable)
  - Define voice/dialogue patterns
```

**8.2 Stage 2: Arc Tracking (When Writing Begins)**
```
For serialized work (episodes, chapters, phases):
  - Create arc document with episode-by-episode tracking
  - Define physical/emotional/relational markers per episode
  - Specify CAN/CANNOT boundaries per episode
  - Track relationship dynamics separately
```

### Phase 9: Session Notes Optimization (Optional)

**9.1 Choose Session Notes Strategy**
```
Option 1: Individual Files (Standard v2.0)
  - Keep default behavior
  - Good for teams, standard compliance

Option 2: Consolidated + Archive (UCU-style)
  - Modify Q-BEGIN to read consolidated file
  - Modify Q-END to create individual + append to consolidated
  - Implement archiving every N sessions
  - Good for solo, fast Q-BEGIN context loading

Option 3: Hybrid
  - Create both (maintains compliance + optimization)
```

**9.2 Implement Chosen Strategy**
```
IF consolidated:
  1. Create /[domain-dir]/session-notes.md
  2. Modify Q-BEGIN in SHORTCUTS.md (read consolidated)
  3. Modify Q-END in SHORTCUTS.md (create individual + append)
  4. Add archiving logic (warn when >800 lines)
  5. Create /[domain-dir]/archives/ directory
```

### Phase 10: Refinement & Iteration

**10.1 Continuous Improvement**
```
After every 5-10 sessions:
  - Review what's working
  - Identify new patterns
  - Refine workflows
  - Update FILE-STRUCTURE-MAP.md
  - Add to skills/agent instructions
  - Document learnings
```

**10.2 Quality Checks**
```
Periodically:
  - Run Q-VERIFY (check file creation)
  - Review session notes for insights
  - Update CLAUDE.md with new learnings
  - Refine agent instructions based on output quality
  - Add new pitfalls to checklists
```

### Phase 11: External Collaboration (Optional)

**11.1 Create Deliverables Workflow**
```
IF sharing work externally:
  1. Create /deliverables/ directory
  2. Create export workflow (internal → polished external)
  3. Design export templates (HTML, PDF, domain-specific format)
  4. Implement version control (v1, v2, v3)
  5. Document feedback incorporation process
```

**11.2 Optional: Q-EXPORT Command**
```
IF frequent exports:
  - Create Q-EXPORT [format] command
  - Steps: identify source → apply template → generate → version → verify
```

---

## 11. Recommendations for Harmonization

### What UCU Should Adopt from TDW

**1. FILE-STRUCTURE-MAP.md (When Repo Grows)**
```
WHEN: Repo reaches ~30-40 files
WHY: Agents will need navigation guidance
HOW: Create /docs/FILE-STRUCTURE-MAP.md
  - Document all directories and files
  - Add reading strategies for agents
  - Calculate context costs
```

**2. Episode-by-Episode Arc Tracking (When Writing Episodes)**
```
WHEN: Start writing full episode scripts (not just outlines)
WHY: Prevent anachronistic character behavior
HOW: Enhance character arcs with episode markers
  - Physical/emotional/relational markers per episode
  - CAN/CANNOT boundaries
  - Track character capability evolution
```

**3. Scene PREP Agent (When Writing Scenes)**
```
WHEN: Start writing actual scenes (not just outlines)
WHY: Consistent scene preparation with context gathering
HOW: Create scene-prep-agent-instructions.md
  - Adapt TDW's 12-step protocol
  - Customize for UCU's structure (character subdirectories)
  - Include questions section (collaborative mode)
```

**4. Custom Q-Commands (If Frequent Workflows Emerge)**
```
IF workflows become repetitive:
  - Consider Q-SCENE (scene development)
  - Keep Q-RESEARCH simple (single source, no hierarchy needed)
  - Add others as patterns solidify
```

**5. Collaborative Mode Formalization**
```
CURRENT: Documented in CLAUDE.md
ENHANCE: Move to top of SHORTCUTS.md
  - Add NEVER/ALWAYS lists
  - Add red flags
  - More structural enforcement
WHY: More reliable than narrative description
```

### What TDW Should Adopt from UCU

**1. Visual Development Integration**
```
IF TDW adds visual development:
  - Adopt UCU's Midjourney_Prompt_Skill.md framework
  - Create /visual-reference/characters/ structure
  - Document age progression workflow (if applicable)
```

**2. Creative License Logging**
```
ENHANCE: Make creative license explicit
HOW: Add creative-license-log.md per character
  - Format: "CREATIVE LICENSE: [what] to illuminate [why]"
  - Transparency about invented vs. revealed
  - Audit trail for creative choices
WHY: TDW currently has implicit creative license; making it explicit helps future collaboration
```

**3. Character-Centric Organization (Consider)**
```
CURRENT: Flat character-profiles/ + character-arcs/
ALTERNATIVE: /characters/[CharacterName]/ subdirectories
PROS: All character materials in one place
CONS: Requires reorganization, may not be worth it at this stage
DECISION: Probably not worth changing now, but consider for future projects
```

**4. Consolidated Session Notes (Consider)**
```
IF Q-BEGIN context loading becomes slow:
  - Test UCU's consolidated + archive approach
  - Compare Q-BEGIN speed
  - Decide if optimization is worth complexity
CURRENT: Standard v2.0 works fine
FUTURE: Consider if project continues for many more sessions
```

### Universal Patterns to Preserve in Both

**1. Source Material Fidelity**
```
UCU: Two-layer framework (sacred + creative license)
TDW: Source hierarchy (PRIMARY + SECONDARY)
PRESERVE: Both are correct for their contexts
```

**2. Collaborative Workflows**
```
UCU: "Prep-Then-Collaborate"
TDW: "Collaborative Working Mode"
PRESERVE: Both achieve same goal (AI preps, human decides)
ENHANCE: Both should formalize further
```

**3. Agent Architecture**
```
UCU: character-worldbuilding-agent (3-phase touchpoints)
TDW: scene-prep-agent (12-step protocol)
PRESERVE: Both use touchpoint system and quality checklists
PATTERN: Autonomous research + structured questions + quality verification
```

**4. Session Management**
```
UCU: Consolidated + archive optimization
TDW: Standard v2.0 individual files
PRESERVE: Both are valid configuration choices
GENERALIZE: Make this a Q-SETUP-DOMAIN option
```

---

## 12. Conclusion: Key Takeaways

### What We've Learned

**1. Two-Tier Architecture Works**
- Base Q-Command System (session management)
- Domain extensions (screenplay-specific features)
- Both UCU and TDW prove this architecture is viable

**2. Multiple Paths to Success**
- UCU: Lightweight customization (file organization)
- TDW: Full-featured customization (custom Q-commands)
- Both produce high-quality work

**3. Patterns Emerge Organically**
- Don't over-engineer upfront
- Let 5-10 sessions reveal patterns
- Then formalize what's repetitive

**4. Collaborative Mode is Critical for Creative Work**
- AI must prepare questions, not answers
- Human makes artistic decisions
- Multiple enforcement layers prevent AI overreach

**5. Source Material Management Must Be Explicit**
- Single source: Two-layer fidelity framework
- Multiple sources: Encoded hierarchy (PRIMARY/SECONDARY)
- Prevent catastrophic errors through explicit encoding

**6. Agents + Skills = Powerful Automation**
- Skills: Knowledge frameworks (reference)
- Agents: Execution protocols (autonomous action)
- Both reduce repetitive work while maintaining quality

**7. Character Development Has Stages**
- Stage 1: Foundation (who they are)
- Stage 2: Arc tracking (how they transform)
- Both UCU and TDW will need both stages eventually

**8. File Organization Should Match Domain Logic**
- UCU: Character-centric (subdirectories per character)
- TDW: Document-type-centric (profiles, arcs, planning separate)
- No universal "right" answer; choose what fits domain

### What This Means for Q-Command System v3.0

**1. Q-SETUP-DOMAIN Wizard Should Offer Choices**
```
Session notes strategy?
  [ ] Individual files (standard)
  [ ] Consolidated + archive (fast Q-BEGIN)
  [ ] Hybrid (both)

Custom Q-commands?
  [ ] No (keep lightweight, UCU-style)
  [ ] Yes (add domain workflows, TDW-style)
  [ ] Let me decide later (start lightweight, add later)

Collaborative mode?
  [ ] No (technical domains)
  [ ] Yes, narrative (creative domains, UCU-style)
  [ ] Yes, structural (creative domains, TDW-style)
```

**2. Domain Template Packs Should Include Both Styles**
```
Q-Screen-Lite (UCU-inspired):
  - File organization customization
  - Skills (Midjourney, character worldbuilding)
  - Agents (character development)
  - No custom Q-commands
  - Fast setup, organic growth

Q-Screen-Full (TDW-inspired):
  - Custom Q-commands (SCENE, CHARACTER, TIMELINE, RESEARCH)
  - Collaborative mode enforcement
  - FILE-STRUCTURE-MAP.md
  - Scene PREP agent
  - Comprehensive, structured from start
```

**3. Both Approaches Should Be Supported**
- Some users prefer lightweight (UCU)
- Some users prefer full-featured (TDW)
- Both are valid; neither is "better"
- Let users choose or evolve from one to other

---

**END OF COMPARISON ANALYSIS**

**Next Steps:**
1. Review with Gabriel
2. Extract the generalized creation sequence
3. Design harmonization recommendations
4. Decide implementation priorities

**Files Referenced:**
- `/docs/UCU-SCREENPLAY-SYSTEM-ANALYSIS.md`
- `/docs/TDW-SCREENPLAY-SYSTEM-ANALYSIS.md`
- `/docs/SCREENPLAY-SYSTEMS-COMPARISON.md` (this file)
