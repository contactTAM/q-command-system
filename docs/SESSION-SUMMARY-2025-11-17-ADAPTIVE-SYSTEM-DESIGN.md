# Session Summary: Adaptive Domain System Design

**Date:** 2025-11-17
**Duration:** Extended brainstorming and design session
**Participant:** Gabriel Rymberg
**Focus:** Designing adaptive, context-aware Q-Command System for domain-specific applications

---

## Session Overview

This session represented a major conceptual breakthrough for the Q-Command System project. We evolved from thinking about "fixed tiers" (Lite vs Full) to **adaptive, progressive scaffolding** based on user context, project stage, and experience level.

**Key Reframe:**
> "The Q-Command System is a one-on-one tutor/coach for [domain] that adapts its teaching style, scaffolding, and complexity to where you're starting from, what you're trying to create, and how much you know."

---

## What We Built

### 1. Comprehensive System Analyses

**Created Three Major Analysis Documents:**

#### UCU-SCREENPLAY-SYSTEM-ANALYSIS.md (~30KB)
- Complete analysis of the UCU-dev repository
- 14 sessions of evolution documented
- Skills: Midjourney_Prompt_Skill.md, character-worldbuilding-agent.md
- Q-Command customizations: v2.0+UCU-1.0
- Consolidated session notes + archiving strategy
- Character-centric organization
- Visual development pipeline

#### TDW-SCREENPLAY-SYSTEM-ANALYSIS.md (Pre-existing, referenced)
- Complete analysis of TDW repository
- scene-prep-agent with 12-step protocol
- Custom Q-commands: Q-SCENE, Q-CHARACTER, Q-TIMELINE, Q-RESEARCH
- Collaborative mode with structural enforcement
- Source hierarchy framework (PRIMARY/SECONDARY)
- FILE-STRUCTURE-MAP.md for agent navigation

#### SCREENPLAY-SYSTEMS-COMPARISON.md (~37KB)
- Side-by-side comparison of UCU vs TDW
- Identified 8 major patterns:
  1. Agent Architecture (touchpoint systems)
  2. Domain-Specific Q-Commands (when to create)
  3. Source Material Management (single vs multiple)
  4. Character Development Stages (foundation → arc tracking)
  5. Collaborative Mode Configuration (narrative vs structural)
  6. File Organization (organic vs planned)
  7. Session Notes Strategy (individual vs consolidated)
  8. Skills vs Agents (knowledge vs execution)
- Extracted generalized 11-phase sequence for domain creation
- Harmonization recommendations

### 2. Adaptive System Architecture

**Created Two Foundational Specifications:**

#### Q-SETUP-DOMAIN-WIZARD-SPECIFICATION.md (~45KB)
- Complete wizard specification for adaptive setup
- Domain-specific question engine (7 contextual questions for screenplay)
- Configuration profile generation (JSON format)
- Progressive scaffolding trigger system
- Just-in-time infrastructure offers
- Q-RECONFIGURE-DOMAIN for project evolution
- Example configurations (3 scenarios)

**Key Innovation:** Context-aware questions that determine appropriate infrastructure, not user choosing "tiers"

**Screenplay Questions:**
1. What are you starting with? (nothing / source material / pitch bible / partial work)
2. What's your goal? (explore / pitch package / pilot / season / ongoing)
3. Experience level? (beginner / learning / intermediate / advanced)
4. Collaboration context? (solo / feedback / active / professional)
5. Visual development needs? (yes / maybe / no / have it)
6. Source material complexity? (none / single / multiple equal / hierarchy / academic)
7. Repository state? (new / existing files / existing Q-system)

**Trigger System:**
- File pattern triggers (5+ scenes → offer Q-SCENE)
- Keyword mention triggers ("character arc" → offer arc tracking)
- Repo size triggers (30 files → offer FILE-STRUCTURE-MAP)
- User growth signals (increased proficiency → reduce scaffolding)
- Project stage transitions (outlines → scenes → offer scene infrastructure)

#### Q-SCREEN-ADAPTIVE-DOMAIN-SPEC.md (~55KB)
- Complete Q-Screen (screenplay domain) specification
- Adaptive component descriptions:
  - Directory structures (context-dependent)
  - Skills (installed based on needs)
  - Agents (progressive addition)
  - Custom Q-commands (added based on workflow)
  - Collaborative mode (calibrated to experience)
  - Source frameworks (based on source complexity)
  - Character development (stage-appropriate)
  - Session management (configuration choice)
- Experience level calibration (beginner → advanced)
- Progressive scaffolding triggers (detailed)
- 3 complete scenario walkthroughs

**Key Innovation:** Same system configures differently based on context:
- UCU context → Lightweight, organic growth, visual development focus
- TDW context → Full-featured, structured, source hierarchy enforcement
- Advanced user → Minimal scaffolding, maximum flexibility

---

## Major Conceptual Breakthroughs

### Breakthrough 1: Not Fixed Tiers, Adaptive Scaffolding

**Before:**
- Thinking: "Should we have Q-Screen-Lite and Q-Screen-Full?"
- Problem: Same user, different projects, different needs

**After:**
- Reframe: "One adaptive system that configures based on context"
- Solution: Progressive scaffolding that grows with project

**Analogy:**
> Like a tutor who adapts their teaching style:
> - Beginner: High structure, detailed guidance, collaborative discovery
> - Intermediate: Medium structure, efficiency focus
> - Advanced: Minimal structure, tools available when requested

### Breakthrough 2: Context Determines Configuration

**UCU and TDW are different not because they need different "systems"**

**They're different because of context:**

| Context Dimension | UCU | TDW |
|-------------------|-----|-----|
| Starting Point | Vision document | Pitch bible |
| Goal | Concept outlines | Pilot screenplay |
| Stage | Early exploration | Advanced execution |
| Visual Needs | High (no reference) | None documented |
| Source Complexity | Single (UB) | Multiple with hierarchy |
| Collaboration | Solo | Occasional feedback |

**Same system, configured differently.**

### Breakthrough 3: Progressive Disclosure Prevents Overwhelm

**Problem:**
- Setting up "everything" on Day 1 overwhelms beginners
- Waiting until user asks misses teachable moments

**Solution:**
- Set up only what's needed for current stage
- Monitor for signals (keywords, file patterns, repo size, user behavior)
- Proactively offer next level when appropriate
- Let user accept, decline, or defer

**Example:**
```
Week 1: Basic structure, essential tools
        User writes first few scenes

Week 2: System notices 5 scenes written
        Offers Q-SCENE command
        User accepts → standardized workflow established

Week 3: Repo reaches 30 files
        Offers FILE-STRUCTURE-MAP.md
        User accepts → agents become more efficient

Week 4: User mentions character arc issues
        Offers episode-by-episode arc tracking
        User accepts → prevents anachronistic behavior
```

### Breakthrough 4: Claude Skills Integration

**Realization:**
- Skills are NOT agents (different purposes)
- Skills: Reusable knowledge frameworks (reference)
- Agents: Autonomous execution protocols (action)

**Skills Examples:**
- Midjourney_Prompt_Skill.md (knowledge framework for visual development)
- Screenplay_Format_Skill.md (industry formatting reference)
- Source_Fidelity_Skill.md (two-layer framework for adaptation)

**Agents Examples:**
- character-worldbuilding-agent.md (autonomous character research + deliverable creation)
- scene-prep-agent-instructions.md (autonomous scene preparation)

**Integration:**
- Skills stored in /docs/ (stable reference)
- Agents invoke skills when needed
- Both installed based on project needs, not upfront

### Breakthrough 5: Experience Calibration

**Same infrastructure, different calibration:**

**Template Example - Scene PREP:**

**Beginner Version:**
```markdown
## SECTION 1: SCENE IDENTIFICATION

**What this section does:** Identifies which scene we're preparing for.

**Episode:** [Which episode number?]
**Act:** [Which act: 1, 2, or 3?]
...

**Why we need this:** Ensures we're looking at the right character states...

Common Beginner Mistakes to Avoid:
- Writing dialogue in PREP
- Making creative decisions unilaterally
- ...
```

**Advanced Version:**
```markdown
## SCENE ID
EP[X] / ACT[X] / SCENE[X]
```

**Same tool, different level of guidance.**

---

## Key Patterns Extracted

### Pattern 1: Agent Architecture (Universal)
```
AUTONOMOUS AGENT =
  Detailed Instructions (step-by-step) +
  Conditional Logic (IF-THEN reading) +
  Touchpoint System (when to involve user) +
  Output Template (structured deliverable) +
  Quality Control (checklist, verification)
```

### Pattern 2: Domain-Specific Q-Commands (When to Create)
```
CREATE CUSTOM Q-COMMAND IF:
  - Workflow repeated frequently
  - Workflow has specific domain logic
  - Workflow needs enforcement
  - User wants convenient shorthand

DON'T CREATE IF:
  - Too early (let patterns emerge)
  - Base commands sufficient
  - Workflow is rare
```

### Pattern 3: Source Material Management
```
SINGLE SOURCE:
  Two layers: Sacred (explicit) + Creative License (documented)

MULTIPLE SOURCES:
  Explicit hierarchy: PRIMARY (canonical) + SECONDARY (inspirational)
  Encode in Q-RESEARCH command
  Multiple enforcement points
```

### Pattern 4: Collaborative Mode (Creative Domains)
```
BEGINNER:
  Structural enforcement (NEVER/ALWAYS/RED FLAGS lists)
  Top of SHORTCUTS.md
  Multi-layer enforcement

INTERMEDIATE:
  Narrative description (in CLAUDE.md)
  "Prep-Then-Collaborate" method

ADVANCED:
  Optional/minimal
  User drives
```

### Pattern 5: Progressive Scaffolding Triggers
```
TRIGGER TYPES:
  - File patterns (5+ scenes → offer Q-SCENE)
  - Keyword mentions ("arc" 2x → offer arc tracking)
  - Repo size (30 files → offer FILE-STRUCTURE-MAP)
  - User growth (proficiency increase → reduce scaffolding)
  - Stage transitions (outlines → scenes → offer scene infrastructure)

OFFER PROCESS:
  1. Detect condition
  2. Present at natural pause
  3. Explain benefit
  4. Let user accept/decline/defer
  5. Execute if accepted
  6. Document in triggers.json
```

---

## Implementation Roadmap

### Phase 1: Core Wizard Implementation
1. Implement Q-SETUP-DOMAIN in base SHORTCUTS.md
2. Create screenplay question set (7 questions with branching)
3. Build configuration profile generator
4. Test with UCU and TDW scenarios

### Phase 2: Trigger System
1. Design .q-system/triggers.json format
2. Implement trigger monitoring (Q-BEGIN checks)
3. Create offer presentation format
4. Build trigger tracking and state management

### Phase 3: Q-Screen Domain Pack
1. Create Q-Screen domain pack with all components:
   - Skills (Midjourney, Screenplay Format, Source Fidelity)
   - Agents (character-worldbuilding, scene-prep, source-mining)
   - Templates (PREP files, creative license logs, arc tracking)
   - Custom commands (Q-SCENE, Q-CHARACTER, Q-TIMELINE, Q-RESEARCH)
2. Create experience level variations (beginner → advanced)
3. Test with both UCU and TDW contexts

### Phase 4: Additional Domains
1. Extract generalizable patterns from Q-Screen
2. Create Q-Dev domain (software development)
3. Create Q-Research domain (academic/scientific)
4. Create Q-Legal domain (legal work)
5. Document domain creation process

### Phase 5: Refinement
1. Validate with real-world usage
2. Refine trigger conditions
3. Optimize question flow
4. Add more domain-specific Q-commands as patterns emerge
5. Create video walkthrough guides

---

## Files Created This Session

1. **docs/UCU-SCREENPLAY-SYSTEM-ANALYSIS.md** (~30KB)
   - Complete UCU repository analysis
   - Skills, agents, customizations documented
   - Session evolution tracked

2. **docs/SCREENPLAY-SYSTEMS-COMPARISON.md** (~37KB)
   - Side-by-side UCU vs TDW comparison
   - 8 major patterns extracted
   - 11-phase generalized sequence
   - Harmonization recommendations

3. **docs/Q-SETUP-DOMAIN-WIZARD-SPECIFICATION.md** (~45KB)
   - Complete wizard specification
   - Contextual question engine
   - Configuration profile system
   - Progressive scaffolding triggers
   - Q-RECONFIGURE-DOMAIN spec

4. **docs/Q-SCREEN-ADAPTIVE-DOMAIN-SPEC.md** (~55KB)
   - Complete Q-Screen domain specification
   - Adaptive component descriptions
   - Experience calibration details
   - 3 scenario walkthroughs
   - Progressive scaffolding in action

5. **docs/SESSION-SUMMARY-2025-11-17-ADAPTIVE-SYSTEM-DESIGN.md** (this file)
   - Session overview and outcomes
   - Key breakthroughs documented
   - Implementation roadmap

**Total Documentation Created:** ~167KB of comprehensive specifications

---

## Key Decisions Made

### Decision 1: No Fixed Tiers
**Context:** Should we create Q-Screen-Lite and Q-Screen-Full?

**Decision:** No. One adaptive system that configures based on context.

**Rationale:**
- Same user, different projects = different needs
- Configuration should be based on context questions, not user choosing tiers
- Progressive scaffolding allows system to grow with project

### Decision 2: Progressive Disclosure by Default
**Context:** How much to set up initially?

**Decision:** Start minimal, appropriate to current stage. Offer upgrades as needed.

**Rationale:**
- Prevents overwhelm on Day 1
- Doesn't miss teachable moments (watches for signals)
- Respects user agency (can accept or decline offers)

### Decision 3: Experience-Based Calibration
**Context:** How to handle beginners vs experts?

**Decision:** Same infrastructure, different levels of guidance/scaffolding.

**Rationale:**
- Beginners need educational checklists, detailed templates, structural enforcement
- Experts need efficiency, minimal guidance, maximum flexibility
- Calibration happens during Q-SETUP-DOMAIN questions

### Decision 4: Skills as First-Class Domain Components
**Context:** How do Claude Skills fit into domain systems?

**Decision:** Skills are knowledge frameworks (reference), distinct from agents (execution).

**Rationale:**
- Skills: Reusable domain knowledge (Midjourney parameters, formatting rules)
- Agents: Autonomous protocols (research + deliverable creation)
- Both installed based on needs, not upfront
- Skills invoked manually, agents via Task tool

### Decision 5: Source Hierarchy Must Be Encoded
**Context:** How to prevent catastrophic errors (treating inspiration as canon)?

**Decision:** Explicitly encode source hierarchy in Q-RESEARCH command + multiple enforcement points.

**Rationale:**
- TDW showed this is critical (UB = PRIMARY, Gospel = SECONDARY)
- Can't rely on Claude remembering hierarchy
- Must be structural (command steps, workflow checks, quality checklists)
- Prevents errors before they happen

---

## Insights for Future Development

### Insight 1: Domain-Specific Means Context-Specific
Domain customization isn't just "what domain" (screenplay vs software).

It's also:
- What stage (exploration vs execution)
- What experience (beginner vs expert)
- What resources (starting from scratch vs existing materials)
- What goal (concept vs production)

**Q-SETUP-DOMAIN must ask ALL these questions, not just "what domain?"**

### Insight 2: Triggers Are the Secret Sauce
Progressive scaffolding only works if the system watches for signals and offers at the right time.

**Trigger system needs:**
- Multiple trigger types (file patterns, keywords, repo size, user growth)
- Smart timing (natural pauses, not interruptions)
- Respectful offering (accept/decline/defer options)
- State tracking (don't re-offer declined triggers)

### Insight 3: Collaborative Mode Is Critical for Creative Domains
For domains involving artistic/creative decisions:
- AI must prepare questions, not answers
- Human makes creative decisions
- Multiple enforcement layers prevent AI overreach

**Structural enforcement (TDW style) works better than narrative (UCU style) for:**
- Complete beginners
- High risk of AI overstepping
- Complex creative work

### Insight 4: The Tutor Metaphor Is Powerful
Thinking of Q-Command System as a "tutor" rather than a "system" clarifies design decisions:

**Good tutors:**
- Adapt teaching style to student (experience calibration)
- Start with appropriate scaffolding (not too much, not too little)
- Watch for growth signals (offer next level when ready)
- Respect student decisions (accept or decline guidance)
- Provide structure without constraining creativity

**This metaphor guides all design choices.**

### Insight 5: Same User, Different Projects, Different Needs
Gabriel is the same person with the same knowledge level, but:
- UCU needed lightweight, organic growth (starting from scratch)
- TDW needed full-featured, structured (starting with pitch bible)

**This validates that context determines configuration, not user "skill level" alone.**

---

## Next Session Priorities

### Immediate (Week 1):
1. Implement Q-SETUP-DOMAIN command in base SHORTCUTS.md
2. Create screenplay question set with branching logic
3. Test wizard with hypothetical scenarios
4. Refine questions based on testing

### Short-term (Weeks 2-3):
1. Build trigger monitoring system
2. Create .q-system/triggers.json format specification
3. Implement trigger checking in Q-BEGIN
4. Create offer presentation templates

### Medium-term (Month 1):
1. Assemble complete Q-Screen domain pack
2. Test with real UCU and TDW contexts
3. Validate that configuration matches actual systems
4. Refine based on validation

### Longer-term (Months 2-3):
1. Create additional domain packs (Q-Dev, Q-Research, Q-Legal)
2. Extract truly universal patterns
3. Create domain creation guide
4. Build Q-Command System v3.0 with adaptive domains

---

## Reflections

### What Went Well

1. **Reframing from tiers to context**
   - The shift from "Lite vs Full" to "adaptive based on context" was immediate and clear
   - Gabriel's insight about being "the same person" using both systems differently was key

2. **Comprehensive analysis**
   - Analyzing both UCU and TDW revealed patterns that wouldn't be visible from one system alone
   - Side-by-side comparison extracted generalizable patterns effectively

3. **Progressive scaffolding concept**
   - The tutor metaphor resonated immediately
   - Trigger system provides concrete mechanism for "watching and offering"

4. **Skills integration**
   - Clarifying distinction between skills (knowledge) and agents (execution) was important
   - Both are domain components, but serve different purposes

5. **Experience calibration**
   - Same infrastructure, different guidance levels makes sense
   - Prevents both overwhelm (beginners) and frustration (experts)

### Challenges Identified

1. **Implementation complexity**
   - Trigger system needs careful design (state management, timing, tracking)
   - Configuration profile generation requires robust logic
   - Multiple enforcement layers (collaborative mode) need coordination

2. **Question flow design**
   - 7 questions is a lot (but each is important)
   - Branching logic could get complex
   - Need to balance thoroughness vs user patience

3. **Trigger timing**
   - "Natural pause" is subjective (when exactly to offer?)
   - Don't want to interrupt flow
   - But don't want to miss opportunity either

4. **Edge cases**
   - Contradictory answers (beginner + full season goal)
   - "Not sure" to multiple questions
   - User changes mind mid-project (Q-RECONFIGURE-DOMAIN helps)

### Open Questions

1. **Trigger granularity:**
   - How many triggers is too many?
   - Should triggers be domain-specific or universal?

2. **Offer frequency:**
   - How often to check triggers (every Q-BEGIN? every session? continuous monitoring?)
   - How many offers per session before it's overwhelming?

3. **Configuration updates:**
   - When should system suggest Q-RECONFIGURE-DOMAIN?
   - Automatic detection of context shifts vs waiting for user request?

4. **Multi-domain repositories:**
   - Can one repo have multiple domains? (screenplay + documentation + software?)
   - How would that work?

5. **Team vs solo:**
   - How does collaborative context affect file organization?
   - Multi-user session notes strategy?

---

## Outcomes & Value

### Documentation Created
- 5 major documents (~167KB)
- Complete specifications ready for implementation
- Real-world examples (UCU and TDW) validate approach

### Conceptual Clarity
- Adaptive system architecture defined
- Progressive scaffolding mechanism specified
- Experience calibration approach documented
- Trigger system designed

### Immediate Applicability
- Can implement Q-SETUP-DOMAIN immediately
- Specifications are detailed enough to code from
- UCU and TDW provide validation test cases

### Long-Term Impact
- Foundation for Q-Command System v3.0
- Pattern for all future domain packs
- Framework for domain creation process
- Truly transforms "assistant" into "tutor/coach"

---

## Meta-Notes

**This Session Demonstrates:**

1. **The power of the Q-Command System managing its own development**
   - Used Q-BEGIN to restore context after crash
   - TodoWrite tracked complex multi-step design process
   - Will use Q-END to document session comprehensively

2. **Brainstorming → Specification**
   - Started with open-ended exploration
   - Converged on concrete, implementable design
   - Produced actionable specifications

3. **User-Claude collaboration**
   - Gabriel's insights (context matters, not tiers) shaped architecture
   - Claude structured and documented those insights
   - True co-creation of system design

4. **Meta-development**
   - Building a system for building domain-specific systems
   - Using the system to develop itself
   - Dogfooding at its finest

---

**END OF SESSION SUMMARY**

**Ready for Q-END to complete session documentation.**
