# Seed

Seed is now a vendor-agnostic skill package for starting short-lived proof-of-concept work.

The old Go CLI tried to encode a flexible human intent-gathering exercise into a rigid binary, then produced a small set of generic files. That was the wrong abstraction. The useful artifact is the interview and judgment: clarify what needs proving, choose a good vertical slice, preserve intent, and set up just enough local context for a few dozen POC iterations.

The pre-pivot CLI state is preserved locally at tag `cli-archive-2026-05-02`.

## Use

Ask an agent with access to this repo to use the primary skill:

```text
Use skills/poc-starter.md to help me plan or create a local POC starter.
```

The skill will ask whether you want:

- Quick, standard, or thorough discovery.
- A plan only, or direct creation of POC support files.
- Docs/context only, or an optional minimal runnable skeleton.
- A target location inferred from context or explicitly provided.

## What It Optimizes For

- A proof-critical vertical slice, not an accidental MVP.
- A falsifiable hypothesis and clear definition of done.
- Explicit non-goals and scope boundaries.
- Preservation of intent, evidence, decisions, and current proof state.
- Drift resistance when the POC starts turning into a full app.
- Small, useful context files instead of template volume.

## Skills

- `skills/poc-starter.md`: primary interview-to-plan/create workflow.
- `skills/poc-iteration-guard.md`: end-of-iteration intent, evidence, decision, and drift check.
- `skills/context-health-check.md`: audit whether a fresh agent can recover the POC proof state.

## Examples

- `examples/poc-starter-output.md`: illustrative output shape for a POC starter interview. It is not a template to copy mechanically.

## Repository Shape

This repo intentionally contains no binary implementation, installer, embedded templates, or release workflow. It is a small skill package plus documentation about the product philosophy and maintenance loop.

## License

MIT. See [LICENSE](LICENSE).
