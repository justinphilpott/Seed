# Decisions

Record product and repository decisions so future agents understand why Seed is shaped this way.

---

### Skill replaces CLI as the primary product

**Context**: The Go CLI encoded a human intent-gathering exercise into a rigid binary, then produced a small generic scaffold. The binary added maintenance cost while constraining the part of the workflow that most needs judgment: selecting the right POC vertical and preserving intent.

**Decision**: Pivot Seed into a vendor-agnostic skill package. The primary artifact is `skills/poc-starter.md`, not a compiled binary.

**Impact**: The repo no longer carries Go code, embedded templates, installer scripts, or release automation. Future work should improve the interview, POC guardrails, and context-preservation loop.

---

### Archive before hard cutover

**Context**: The CLI was useful history even though it is no longer the desired abstraction.

**Decision**: Preserve the pre-pivot CLI state with local tag `cli-archive-2026-05-02`, then remove binary implementation files from `main`.

**Impact**: The repo can cut down hard without losing a recovery point. The archive tag is local unless explicitly pushed.

---

### POC vertical selection is core skill behavior

**Context**: Starting a useful POC is less about choosing files and more about choosing what to prove. Weak verticals like "build the dashboard" or "set up the backend" often hide full-app scope.

**Decision**: Make vertical-slice advising a central phase of `poc-starter`: generate candidate proof slices when useful, compare them by learning value and scope risk, recommend one, and challenge weak or oversized slices.

**Impact**: The skill helps shape what a good POC is, while still asking the user to confirm the product direction.

---

### Markdown-first persistence

**Context**: POCs need portable memory across agent sessions, but heavier stores such as databases, vector indexes, or tool-native memory add complexity and vendor coupling.

**Decision**: Use Markdown files as the default persistence mechanism for intent, decisions, evidence, and next proof steps. Let the agent propose heavier memory only when the POC context clearly justifies it.

**Impact**: The default output stays inspectable, local, and durable. The skill can still adapt when the POC itself needs richer memory.

---

### Smallest sufficient context system

**Context**: The old scaffold implied a fixed file set. The interview showed that the real need is information coverage: intent, proof target, non-goals, evidence, decisions, drift, and current next step.

**Decision**: `poc-starter` should choose the smallest file set that preserves those categories for the specific POC. Defaults are suggestions, not requirements.

**Impact**: Generated projects should not inherit documentation homework. A tiny POC may need only a few files; a longer POC may need explicit evidence or decision logs.

---

### Support skills are optional and targeted

**Context**: Signal clarity over time matters, but installing generic process files can create ceremony.

**Decision**: Keep two reusable support skills in this repo: `poc-iteration-guard.md` and `context-health-check.md`. `poc-starter` may propose copying or adapting support skills into a target POC when they clearly help.

**Impact**: The repo preserves the useful loop from the old entropy/doc-health ideas without forcing every POC to carry the same support files.

---

### AGENTS.md is canonical project context

**Context**: Vendor-specific agent files duplicate guidance and drift. `AGENTS.md` is the broadest cross-agent convention available here.

**Decision**: Keep `AGENTS.md` as canonical context. Tool-specific files, if present, should point to it rather than duplicate instructions.

**Impact**: The repo remains portable across agents while still giving tool-specific runtimes a lightweight entry point.

---

### Examples show shape, not templates

**Context**: Examples can help preserve the quality bar, but they can also freeze the output into another rigid scaffold.

**Decision**: Include one compact example of interview synthesis and proposed file set. Do not provide a full generated project as the default pattern.

**Impact**: Future agents get a concrete reference without treating the example as mandatory structure.
