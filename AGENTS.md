# Agent Context for Seed

Vendor-agnostic skill package for starting focused POCs. The primary product is `skills/poc-starter.md`, an interview-driven workflow that helps a user choose a proof-critical vertical and set up the smallest useful local context system.

## Quick Links

- [README.md](README.md) - Project overview and usage
- [skills/poc-starter.md](skills/poc-starter.md) - Primary POC starter workflow
- [skills/poc-iteration-guard.md](skills/poc-iteration-guard.md) - Iteration coherence and drift check
- [skills/context-health-check.md](skills/context-health-check.md) - POC context coverage audit
- [DECISIONS.md](DECISIONS.md) - Product and repository decisions
- [LEARNINGS.md](LEARNINGS.md) - Validated discoveries
- [TODO.md](TODO.md) - Active work and next steps

## Working Practices

- **Keep the skill vendor-agnostic**: Do not assume a specific agent runtime, IDE, package manager, or hosted service unless a skill explicitly asks the user.
- **Preserve intent over structure**: File names can change. The important coverage is intent, proof target, evidence, decisions, non-goals, and next proof step.
- **Challenge accidental product scope**: Changes that turn a POC into an app should be challenged and mined for learnings before being accepted.
- **Keep examples illustrative**: Examples should show quality and shape without becoming rigid templates.
- **Use support skills only when useful**: Add or recommend targeted support skills when they preserve signal; do not create generic ceremony.
- **Docs travel with skill changes**: If a skill changes the product behavior, update README, DECISIONS, LEARNINGS, or TODO as appropriate.
- **Run a context check before finishing meaningful work**: Use `skills/context-health-check.md` on this repo's own docs when changes affect the skill surface.

## Project Constraints

- No binary implementation or installer.
- No generated template pack as the primary abstraction.
- Markdown-first, portable skill instructions.
- `AGENTS.md` is canonical cross-agent context.
- Proprietary or tool-specific files should point here rather than duplicate guidance.

## Key Files

- `skills/poc-starter.md`: primary skill for interviewing, advising on the POC vertical, and planning or creating local starter files.
- `skills/poc-iteration-guard.md`: optional support skill for end-of-iteration coherence, evidence, decisions, and drift handling.
- `skills/context-health-check.md`: optional support skill for auditing whether POC context preserves the proof state.
- `examples/poc-starter-output.md`: compact example of interview synthesis and proposed output.
- `README.md`: public usage and philosophy.
- `DECISIONS.md`: why the repo pivoted from CLI to skill package and how the new surface is shaped.
- `LEARNINGS.md`: validated insights that should influence future skill changes.
- `TODO.md`: active migration/follow-up context.

## Validation

There is no build or test suite after the hard pivot. Validate changes by:

- Reading the changed skills end to end.
- Checking links and file references in README and AGENTS.
- Running `skills/context-health-check.md` against this repo's docs for meaningful user-surface changes.
- Running `git diff --check` before committing.

## Archive

The old Go CLI state is preserved at tag `cli-archive-2026-05-02`. Do not reintroduce CLI implementation files unless the product direction changes explicitly.
