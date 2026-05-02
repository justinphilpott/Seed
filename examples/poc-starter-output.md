# Example: POC Starter Output

This is illustrative. It shows the shape and quality bar for `skills/poc-starter.md`, not a template every POC should copy.

## Interview Synthesis

Problem space: A support team wants to know whether an agent can triage inbound customer emails into actionable categories before a human replies.

Decision to inform: Whether to invest in an automated triage workflow or keep improving manual routing.

Riskiest assumption: The agent can produce categories and confidence notes that a support lead trusts enough to review quickly.

Observable signal: A support lead reviews 20 historical emails and agrees with at least 15 suggested categories, with useful rationale on disagreements.

Time budget: Two short iterations, no production integration.

## Candidate Verticals

| Candidate | Learning Value | Scope Risk | Notes |
| --- | --- | --- | --- |
| Triage 20 pasted historical emails into categories with rationale | High | Low | Tests trust in the core judgment loop without integration work. |
| Build an inbox dashboard | Medium | High | Mostly UI and workflow plumbing; weak proof of triage quality. |
| Connect to Gmail and auto-label messages | Medium | High | Integration-heavy; useful later if triage quality is proven. |

Recommended vertical: triage 20 pasted historical emails into categories with rationale.

Why: It tests the riskiest assumption with the least surrounding product work.

## Definition Of Done

The POC is done when a support lead can review a fixed set of 20 historical emails, inspect each suggested category and rationale, and decide whether the output is trustworthy enough to justify a second POC with live inbox data.

## Non-Goals

- No Gmail or helpdesk integration.
- No authentication.
- No dashboard beyond the smallest interface needed to inspect results.
- No model fine-tuning.
- No automatic customer replies.

## Proposed File Set

- `README.md`: current status, how to run the POC, and what decision it informs.
- `AGENTS.md`: agent context, non-goals, commands, and drift rules.
- `POC.md`: intent, hypothesis, vertical slice, done criteria, and rejected verticals.
- `EVIDENCE.md`: review results, disagreements, confidence changes, and decision notes.
- `TODO.md`: current next proof step and a short parking lot.

Not creating `DECISIONS.md` yet. There are no consequential technical decisions beyond the POC framing; add it if architecture choices start affecting later work.

## First Next Proof Step

Collect or synthesize 20 representative historical emails, define the initial category list, and run the smallest triage loop that produces category plus rationale for each message.
