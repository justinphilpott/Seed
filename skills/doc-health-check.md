# Skill: Documentation Health Check

Audit a project's documentation for informational coverage. This is a diagnostic tool — it identifies gaps and suggests where to add information, but does not rewrite docs.

> This skill was created by [seed](https://github.com/justinphilpott/seed), a tool that scaffolds agentic POC documentation and basic dev environment setup. Seed itself serves as a test case: its own docs diverge from its starter templates, and that's healthy — see [LEARNINGS.md in the seed repo](https://github.com/justinphilpott/seed/blob/main/LEARNINGS.md) for the reasoning behind this.

## Core Information Categories

Assess whether each category is **discoverable** somewhere in the project's documentation. It doesn't matter which file contains it — only that an agent or human can find it.

### 1. Entry Point
- [ ] Is there a clear starting document for agents? (AGENTS.md, CLAUDE.md, or equivalent)
- [ ] Does it orient the reader to the project's purpose in 1-2 sentences?
- [ ] Does it link to other relevant docs?

### 2. Commands
- [ ] Are build commands documented?
- [ ] Are test commands documented?
- [ ] Are run/dev commands documented?

### 3. Architecture
- [ ] Are key files listed with their purposes?
- [ ] Is the separation of concerns clear? (what knows about what)
- [ ] Can an agent understand where to make changes for common tasks?

### 4. Constraints
- [ ] Are key dependencies called out?
- [ ] Are there code comments explaining "why not X" that should be surfaced into docs?
- [ ] If the codebase is small enough: scan for patterns that look inconsistent and check if the reasoning is documented anywhere

### 5. Cross-References
- [ ] Do docs link to each other? (not isolated islands)
- [ ] Can you navigate from the entry point to all other docs?
- [ ] Are there dead links to files that no longer exist?

### 6. Maintenance
- [ ] Is there a "when X changes, update Y" instruction?
- [ ] Are there references that will go stale? (line numbers, counts, dates)
- [ ] Is it clear who/what is responsible for keeping docs current?

## Process

1. **Scan**: List all markdown files in the project root (and one level of subdirectories if relevant). Read each one.
2. **Assess**: For each category above, determine whether the information is present and discoverable. Note which file(s) cover it.
3. **Report**: Output a coverage summary using the format below.
4. **Suggest**: For any gaps, suggest where to add the missing information — preferring existing files over creating new ones.

## Output Format

```
## Doc Health Check: [Project Name]

### Coverage Summary
| Category        | Status | Location |
|-----------------|--------|----------|
| Entry Point     | ...    | ...      |
| Commands        | ...    | ...      |
| Architecture    | ...    | ...      |
| Constraints     | ...    | ...      |
| Cross-References| ...    | ...      |
| Maintenance     | ...    | ...      |

Status: Covered / Partial / Missing

### Gaps & Suggestions
[For each gap, suggest where and what to add]
```

## Scope

- **Do**: Identify what's missing and where to add it
- **Do**: Note stale references, dead links, or contradictions
- **Do**: Acknowledge when information exists but in an unexpected location
- **Don't**: Rewrite existing docs
- **Don't**: Create new files without asking
- **Don't**: Flag missing files — flag missing *information*
