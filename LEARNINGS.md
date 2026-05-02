# Learnings

Validated discoveries from shaping Seed as a POC starter skill package.

---

### Intent-heavy scaffolding should be a skill, not a rigid binary

**Topic**: Product Shape

**Insight**: The valuable part of Seed is not file emission. It is interviewing the user, narrowing the proof target, challenging accidental app scope, and preserving context over iterations. A binary made that flexible judgment harder to maintain.

**Validated by**: The migration interview showed that the desired output depends on POC depth, target path, plan vs create mode, docs vs runnable skeleton, and the user's proof uncertainty. Those choices are better handled by an adaptive skill.

**Implication**: Future work should improve the skill workflow and examples, not rebuild generic scaffolding logic.

---

### A good POC starts with the vertical, not the file set

**Topic**: POC Design

**Insight**: The skill must help advise on what makes a good vertical slice. Weak verticals often describe implementation layers or product areas instead of proof-critical learning.

**Validated by**: During planning, the strongest tangent was that Seed should help identify a proof-critical, falsifiable, observable, decision-driving vertical before creating any files.

**Implication**: `poc-starter` includes candidate vertical generation, scoring, recommendation, and direct challenge questions.

---

### Information coverage still matters more than file presence

**Topic**: Context Systems

**Insight**: Agent-friendly POC context needs to preserve original intent, current proof step, decisions, evidence, non-goals, and drift history. The specific files are containers.

**Validated by**: The migration kept the earlier documentation insight but changed the default file set. `poc-starter` now chooses files based on the POC's needs rather than copying a fixed template set.

**Implication**: Context health checks should audit whether a fresh agent can recover the proof state, not whether specific filenames exist.

---

### Scope creep is evidence about framing

**Topic**: POC Iteration

**Insight**: When a user wants to expand or redirect a POC, the agent should not only resist. It should ask what the desired change reveals about the original hypothesis, missing constraints, or process that led to the POC.

**Validated by**: The migration discussion emphasized challenging full-app scope while extracting learnings from why the new scope feels necessary.

**Implication**: `poc-starter` and `poc-iteration-guard` treat material divergence as signal to examine before accepting a pivot.

---

### Examples should preserve quality without freezing structure

**Topic**: Skill Maintenance

**Insight**: A compact example helps future agents understand the intended output quality, but a full generated scaffold risks becoming a de facto template.

**Validated by**: The migration chose one illustrative output example rather than multiple complete generated projects.

**Implication**: Keep examples short, annotated, and explicitly non-prescriptive.
