# Skill: Entropy Guard

A post-work micro-ritual. Run this when you finish a meaningful piece of work, before you consider it done.

> **Scope**: what changed in *this session* — not a full project audit. This takes 2-5 minutes. If you find yourself doing a comprehensive review of the whole codebase, you've scope-crept into doc-health-check territory. Stay focused on the delta.

## When to Run

- You've completed a task and are about to commit
- You've resolved a non-trivial problem and the solution has implications beyond the immediate fix
- A session is ending and you want to leave the project in a clean state

## When NOT to Run

- After trivial changes (typo fixes, minor formatting) — use judgement
- As a replacement for a full doc audit — use doc-health-check for that
- More than once per logical piece of work

## Checklist

Work through each question in the context of what you just did. Most answers will be "no, nothing to do" — that's fine and expected.

### 1. Decisions
- Did you choose between two approaches and pick one?
- Did you decide *against* something (a library, a pattern, a structure)?
- Did you discover a constraint that will shape future choices?

If yes to any: does it appear in DECISIONS.md? Add it if not. One entry, concise.

### 2. Learnings
- Did you discover a non-obvious behaviour, gotcha, or pattern?
- Did something fail in an unexpected way and you found out why?
- Would "future you" benefit from knowing this, even if it seems obvious now?

If yes to any: does it appear in LEARNINGS.md? Add it if not. Insight + what validated it + implication.

### 3. Key Files / Architecture
- Were any files added, removed, or renamed?
- Was a significant responsibility moved from one file to another?

If yes: is this reflected in AGENTS.md (Key Files section) and any other architecture docs? Update if not.

### 4. Stale Placeholders
- Are there any `[Add X here]` or `[TBD]` sections that you can now fill in?
- Are there empty sections in docs that the work you just did actually answers?

If yes: fill them in or remove them. Stale scaffolding is worse than no scaffolding.

### 5. Cross-References
- Did you rename, move, or delete anything that docs link to?
- Are there references to line numbers, counts, or file lists that are now wrong?

If yes: fix the broken references. Don't leave dead links.

### 6. TODO.md
- Is "Doing Now" cleared?
- Are any completed items still marked as active?
- Did this work surface anything that should be in "Next Up"?

Update TODO.md to reflect the current state before committing.

## Output

After working through the checklist, note briefly what was updated (or "entropy check clean"). Include this in your commit message if anything changed.

## What This Is Not

- A replacement for `doc-health-check` (which audits full informational coverage)
- A replacement for `seed-ux-eval` (which evaluates scaffolding quality from a fresh perspective)
- A reason to delay committing — if the check surfaces a large gap, file it in TODO.md and fix it in a follow-up commit rather than expanding scope mid-task
