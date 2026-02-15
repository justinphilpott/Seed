# Learnings

Capture discoveries as we build. Focus on what we validated, not just opinions.

---

### Doc Stability for Agentic Development

**Topic**: Documentation Architecture

**What**: The value of project docs for agents isn't in having a specific file set — it's in covering the right informational landscape: temporal context (what changed and why), logical relationships (constraints, decisions, trade-offs), and code-spatial mapping (what's where and how it connects). The specific files are containers; the relationships are what matter.

**How validated**: Audited seed's own docs and found CONTEXT.md naturally absorbed what a DECISIONS.md would cover. Seed's doc set (CLAUDE.md, AGENTS.md, CONTEXT.md, BUILD.md) differs from what seed scaffolds for users (AGENTS.md, DECISIONS.md, TODO.md, README.md) — and both are correct for their context. A brownfield tool that gap-filled against the starter set would add noise, not value.

**Impact**: Confirms that seed's templates should scaffold *structure to grow into*, not a prescriptive file set. The brownfield/upgrade skill should assess informational gaps, not file gaps.

---

### Maintenance Instructions Prevent Doc Drift

**Topic**: Documentation Architecture

**What**: Without an explicit "when X changes, update Y" instruction in the docs themselves, agents silently let docs go stale. Baking a maintenance section into AGENTS.md from project creation is more effective than retrofitting it later.

**How validated**: Found seed's own docs had drifted (missing files in architecture lists, stale line counts, removed fields still documented). Added maintenance instructions to CLAUDE.md, CONTEXT.md, and AGENTS.md. Also added the maintenance section to the AGENTS.md template so new projects get it from day one.

**Impact**: Agents now have a checklist to follow when modifying the codebase. Template change means all new seed-scaffolded projects inherit this pattern.

---

### Brittle References Accelerate Drift

**Topic**: Documentation Architecture

**What**: Line-number references in docs (e.g., `scaffold.go:28-35`) go stale as soon as code changes. Function and type name references (`the TemplateData struct in scaffold.go`) are stable anchors that survive refactoring.

**How validated**: BUILD.md had five line-number references that were all wrong relative to the current code. Replaced with function/type name references.

**Impact**: BUILD.md's "Customizing the Tool" guide now stays accurate through code changes without requiring doc updates.

---

### Cross-Agent Compatibility via AGENTS.md

**Topic**: Project Setup

**What**: AGENTS.md is the most universal cross-agent context file. Tool-specific files (.cursorrules, CODEX.md, etc.) add maintenance burden without proportional value for small projects. AGENTS.md covers Claude Code, Codex, Copilot, and Cursor.

**How validated**: Seed had CLAUDE.md (Claude-specific) but no cross-agent file. Added AGENTS.md mirroring the essential info. Decided against .cursorrules/.windsurfrules/CODEX.md — too much surface area for one project.

**Impact**: Seed is now accessible to any AI coding agent, not just Claude Code.
