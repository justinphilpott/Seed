# Skill: Seed Coherence Guard

Delta-only check for changes to Seed itself. Run before finishing meaningful work on this repo to keep the skill package coherent, portable, and focused on POC intent preservation.

## Use This When

- A skill, README, example, decision, learning, or agent instruction changed.
- The change affects how Seed explains or maintains the POC starter workflow.
- Work is about to be committed or handed off.

## Check

- **Skill-first**: Does the change preserve `poc-starter` as the product, not a binary, installer, generated template pack, or app framework?
- **Vendor-neutral**: Does it avoid assuming a specific agent runtime, IDE, package manager, hosted service, or proprietary memory system unless the skill asks the user first?
- **POC discipline**: Does it strengthen proof-critical vertical selection, falsifiable done criteria, non-goals, evidence, or drift resistance?
- **No app creep**: Does it avoid turning Seed into product planning, MVP generation, architecture ceremony, or full-app scaffolding?
- **Smallest context**: Are files/support skills justified by signal preservation, not by symmetry, completeness, or template habit?
- **Support skill fit**: Are support skills optional, targeted, and clearly useful? Remove or narrow any generic ceremony.
- **Example restraint**: Do examples show quality and judgment without becoming mandatory structure.
- **Archive boundary**: Is old CLI context archival only, not front-and-center or treated as active direction?
- **Doc alignment**: If behavior changed, do README, AGENTS, DECISIONS, LEARNINGS, TODO, examples, and affected skills still agree?
- **Stale work**: Is TODO current, with completed work cleared and only useful next steps retained?

## Persist Only If Useful

Update docs only when future agents need the signal:

- DECISIONS: consequential product or repo direction.
- LEARNINGS: validated insight that should shape future changes.
- TODO: active work or concrete next step.
- README/AGENTS: user-facing behavior, entry points, key files, or validation changed.

## Required Validation

- Read changed skills end to end.
- Check README and AGENTS links/references.
- Run `git diff --check`.

## Output

```text
Seed coherence: [clean / fixed / risk]
Product drift: [none / describe]
Docs updated: [files or none]
Next signal-preserving step: [one line or none]
```
