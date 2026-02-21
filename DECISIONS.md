# Decisions

Record architectural choices so future contributors (and agents) understand why.

---

### Working practices over structural rules in AGENTS.md

**Context**: Initial AGENTS.md focused on file structure and section checklists. Docs drifted anyway because structure without habit enforcement doesn't hold.
**Decision**: Encode the habits that keep docs alive — atomic commits, docs-with-code, coherence checks before committing, pruning stale placeholders — as a "Working Practices" section in AGENTS.md, rather than prescribing structure.
**Impact**: Habits are more durable than structure. Docs rot from neglected practices, not from missing sections. Scaffolded projects inherit the practices from day one.

---

### TODO.md as live working context and crash recovery

**Context**: Needed a lightweight way to track active work that survives agent context loss between sessions.
**Decision**: Define TODO.md's "Doing Now" section as dual-purpose: crash recovery (the next session knows what was in progress) and commit message source (completed items flow directly into the commit message, then get cleared). Explicitly position the file as a stepping stone — graduate to a proper issue tracker once the project has momentum.
**Impact**: Keeps TODO.md alive as a working document rather than a stale list. Aligns agent behaviour across sessions without requiring persistent memory.

---

### Ultra-minimal templates

**Context**: Initial templates included TechStack fields, Author, "Last Updated" timestamps, format sections, and verbose guidelines. Contributors were expected to fill in extensive boilerplate.
**Decision**: Strip templates to the minimum useful skeleton — clean examples, minimal placeholders, navigation links. Remove everything that requires information agents or developers don't have at project start.
**Impact**: Templates serve as scaffolding to grow into, not documentation homework. Reduces friction at project start and eliminates stale placeholder debt.

---

### Embedded filesystem for templates and skills

**Context**: Could distribute templates as separate files alongside the binary, or fetch them from a remote source at runtime.
**Decision**: Embed all templates and skills in the binary at compile time via `//go:embed`.
**Impact**: Binary is fully self-contained — no external files, no network calls, no version mismatch between binary and templates. Trade-off: adding a template requires a rebuild.

---

### Programmatic JSON for devcontainer config

**Context**: Devcontainer config could be generated using text/template like all other files.
**Decision**: Generate devcontainer.json programmatically via `encoding/json`, not text/template.
**Impact**: JSON with conditional fields is fragile in text/template (trailing commas, escaping). Programmatic generation guarantees valid JSON. Trade-off: devcontainer structure lives in Go code, not a template file.

---

### Extensions volume via staging path and symlink

**Context**: Need to persist VS Code extensions across container rebuilds using a named Docker volume. Mounting the volume directly at `.vscode-server/extensions` causes Docker to create `.vscode-server/` as root, blocking VS Code from writing sibling files (`extensions.json`, `bin/`, `data/`).
**Decision**: Mount the volume at a staging path outside the sensitive parent (`~/.vscode-extensions-cache`), then symlink it into `.vscode-server/extensions` in `postCreateCommand`/`setup.sh`. The Dockerfile pre-creates the staging dir with correct ownership so the volume mount inherits it.
**Impact**: VS Code can write to `.vscode-server/` normally. Applies to both seed's own devcontainer and the devcontainers it scaffolds for new projects.

---

### Single external dependency

**Context**: Go projects can accumulate dependencies quickly. Considered libraries for argument parsing, config management, and output formatting.
**Decision**: Limit external dependencies to one: `github.com/charmbracelet/huh` for the TUI wizard. Everything else uses the Go standard library.
**Impact**: Minimal supply chain surface. Standard library is stable and well-understood. If the TUI requirement disappears, the project becomes dependency-free.

---

### Two-layer VS Code extension installation

**Context**: When the user selects coding-agent extensions (Claude Code, Codex) during scaffolding, there are two VS Code mechanisms: `devcontainer.json` `customizations.vscode.extensions` (silently auto-installs when the container opens) and `.vscode/extensions.json` (shows an "Install recommended extensions?" prompt in any workspace context, local or container).
**Decision**: Generate both. Add selected extension IDs to `devcontainer.json` customizations for auto-install in the container, and also write `.vscode/extensions.json` for the workspace recommendation prompt. Both only generated when devcontainer is opted in and at least one extension is selected.
**Impact**: Users get the prompt when they first open the project locally (before entering the container), and silent auto-install once inside the container. Both files are driven by the same `VSCodeExtensions` slice — single source of truth.

---

### Flat package structure over cmd/internal layout

**Context**: Considered restructuring to `cmd/seed/`, `internal/wizard/`, `internal/scaffold/` to follow the multi-package Go convention.
**Decision**: Keep the flat `package main` layout. At ~1400 lines across 4 source files, this is a single-binary CLI with no reusable library code. The Go team explicitly recommends flat layouts for small commands; the `cmd/internal/pkg` convention is for multi-binary repos or projects with importable libraries.
**Impact**: Less boilerplate, no unnecessary export boundaries. Revisit if we add a second binary, extract a library, or grow past ~3000 lines.

---

### Two-tier tool structure: target-project skills vs. seed dev commands

**Context**: Needed agent-facing tools at two distinct scopes — skills to install into projects seeded by seed (so agents in those projects have useful capabilities), and development tools for agents working on seed itself (to support the feedback loop and pre-change validation). Both are markdown instruction files for agents, so conflating them into one directory would make it unclear what gets installed where.
**Decision**: `skills/` for target-project tools (embedded in the binary, installed during scaffolding); `.claude/commands/` for seed development slash commands (committed to the repo, available only when working on seed itself, never installed into target projects).
**Impact**: Clear boundary: anything in `skills/` ships to every seeded project; anything in `.claude/commands/` is seed-internal. When adding a new agent-facing capability, the directory choice communicates the intended audience.

---

### Selective .gitignore for .claude/ — settings.local.json only

**Context**: The `.claude/` directory initially contained only machine-local IDE settings (`settings.local.json`) and was blanket-gitignored. Adding `.claude/commands/` as seed development slash commands broke this assumption — those files need to be committed and travel with the repo across machines.
**Decision**: Gitignore only `.claude/settings.local.json` (machine-specific) rather than the whole `.claude/` directory. Project-wide content (commands, shared settings) is committed normally.
**Impact**: Development slash commands are portable across machines. Machine-local configuration remains excluded. This is the standard pattern for tools that have both per-project and per-machine configuration (cf. VS Code's `.vscode/settings.json` vs `.vscode/*.local.*`).

---

### Feedback loop gated on maintainer triage

**Context**: Agent-feedback issues submitted by agents in seeded projects are a useful signal but require human judgement before becoming code changes. Unchecked, feedback could drive changes that benefit one project type while regressing others, or address noise rather than genuine gaps.
**Decision**: The feedback loop is explicitly gated: `seed-ux-eval` (evaluation in target projects) → `seed-feedback` (submission to GH issues) → `/triage-feedback` (maintainer reviews and prioritises before any changes land). The `/triage-feedback` command makes no changes itself — it informs a decision that the maintainer takes.
**Impact**: Prevents feedback from bypassing judgement. The triage step is where contradictory signals get resolved, project-specific noise gets filtered, and patterns across multiple reports get surfaced. Changes to the user surface (templates, wizard, skills) are only made after this gate.

---

### Entropy guard as working practice + skill, not skill alone

**Context**: Needed post-work doc maintenance (capturing decisions, learnings, fixing drift) to happen naturally after every task, not as a separate chore agents forget. A skill alone requires explicit invocation — agents have to remember it exists and choose to run it.
**Decision**: Two-part pattern: a one-line working practice in AGENTS.md states when and why (making it part of standing instructions always in context); a skill file provides the structured checklist for how. The practice is the trigger; the skill is the content.
**Impact**: Agents following AGENTS.md working practices incorporate entropy-guard without needing to remember it separately. The skill can be as detailed as needed without cluttering the working practices list. The same pattern applies to any agent behaviour that should be habitual — encode the trigger in AGENTS.md, the detail in a skill file.

---

### seed-ux-eval uses a universal checklist, not persona scenarios

**Context**: Considered two approaches for the fresh-perspective evaluation skill: persona-based (agent adopts a role — "you are a Python developer who just received this repo") vs. checklist-based (fixed questions applied regardless of project type).
**Decision**: Checklist-based. Seed's templates are intentionally language-agnostic and minimal — the primary evaluation axis should be universal scaffolding quality (clarity, density, working practice fit), not language-specific expectations. Persona framing would add an order of magnitude of complexity and shift focus to the wrong axis.
**Impact**: Consistent, comparable evaluations across any project type. Feedback is about the scaffold itself, not about what a specific kind of developer wants. Revisit if seed ever gains language-specific template variants.

---
