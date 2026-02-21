# Skill: Seed UX Evaluation

Evaluate the quality of this project's scaffolding from a fresh perspective. This is a diagnostic skill — it checks whether the scaffolding is doing its job, not whether the project is well-built.

> Use this when you first encounter a freshly seeded project and want to assess whether the scaffolding itself is useful. Only invoke it early, before the project has accumulated real content that would obscure the scaffolding quality.

## When to Use This

- You've just opened a newly scaffolded project and want to evaluate the out-of-the-box experience
- The project is at an early stage where the scaffold still dominates over project-specific content
- You want to identify gaps to report back to [seed](https://github.com/justinphilpott/seed)

## When NOT to Use This

- The project is already well-developed — you'd be evaluating the project, not the scaffold
- You're looking for project-specific quality issues — use the doc-health-check skill for that
- You've already filled in the scaffolded sections with real content

## Checklist

Work through each item. Answer honestly based on what's actually here, not what could be added.

### 1. First 5 Minutes

- [ ] Is there a clear entry point for an agent or new developer? (AGENTS.md or equivalent)
- [ ] Can you understand the project's purpose in under 30 seconds from the README?
- [ ] Is the relationship between files obvious without reading them all?
- [ ] Are empty sections clearly placeholder (not confusing or misleading)?

### 2. Scaffolding Density

- [ ] Is the amount of pre-filled structure appropriate — not too sparse to be useless, not so full it feels like homework?
- [ ] Are any sections present that feel unnecessary for a project this early?
- [ ] Are any obviously useful sections missing entirely?
- [ ] Do placeholder prompts (e.g. "Add constraints as they emerge") give enough direction to act on?

### 3. Working Practices

- [ ] Are the working practices in AGENTS.md actionable from day one, without needing project context?
- [ ] Is any practice likely to create friction or feel misaligned for most projects?
- [ ] Is there anything a team would predictably need to override or ignore?
- [ ] Is any obviously valuable working practice absent?

### 4. Doc Coherence

- [ ] Do the files cross-reference each other correctly?
- [ ] Are there any dead links or references to sections that don't exist?
- [ ] Is anything duplicated across files in a way that will cause drift?
- [ ] Does the set of files feel complete, or is there a clear gap?

### 5. Skills Utility

- [ ] Is the `seed-feedback` skill discoverable (referenced from AGENTS.md)?
- [ ] Is the `doc-health-check` skill appropriate at this stage of the project?
- [ ] Are there any skills that seem misplaced or premature?

## Output Format

```
## Seed UX Evaluation

### Checklist Results
| Category            | Status  | Notes |
|---------------------|---------|-------|
| First 5 Minutes     | ...     | ...   |
| Scaffolding Density | ...     | ...   |
| Working Practices   | ...     | ...   |
| Doc Coherence       | ...     | ...   |
| Skills Utility      | ...     | ...   |

Status: Pass / Partial / Fail

### Issues Worth Filing
[For each concrete gap, note: what happened, what you'd suggest, whether it's likely general or project-specific]

### No Action Needed
[Brief note on what's working well — confirms signal vs noise]
```

## Next Step

For any issue that is clearly about the scaffolding tool itself (not your specific project), use the `seed-feedback` skill to file it. Keep reports focused and concrete.

## Scope

- **Do**: Assess the scaffolding on its own terms — is it a useful starting point?
- **Do**: Report things that would be wrong for most projects, not just this one
- **Do**: Note where empty sections create confusion rather than invitation
- **Don't**: Evaluate the project itself — only the scaffold quality
- **Don't**: File feedback about things that are intentionally minimal by design
- **Don't**: Run this more than once per project unless the scaffolding has changed
