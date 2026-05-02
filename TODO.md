# TODO

Active work and follow-up context for the Seed skill package.

## Doing Now

- Pivot Seed from a Go CLI scaffolder into a vendor-agnostic POC starter skill package.
- Preserve the pre-pivot CLI state with local tag `cli-archive-2026-05-02`, then remove binary implementation, templates, release/install machinery, and obsolete command docs.
- Add `skills/poc-starter.md` plus minimal support skills for intent coherence, evidence preservation, drift checks, and context health.
- Update project docs so they describe the skill-first repo shape and the philosophy behind replacing the rigid binary.
- Done when the remaining docs and skills are internally coherent, stale CLI references are removed except archive notes, and `git diff --check` passes.

## Next Up

- [ ] Dogfood `skills/poc-starter.md` on one real or synthetic POC and record any friction in `LEARNINGS.md`.
- [ ] Decide whether to push the local archive tag `cli-archive-2026-05-02` to the remote.
- [ ] Review whether `CLAUDE.md` should remain as a pointer file or be removed in favor of `AGENTS.md` only.

## Parking Lot

- [ ] Consider a domain-specific support skill only after a real POC shows repeated need.
