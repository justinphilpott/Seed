# Skill: POC Iteration Guard

Run this at the end of a meaningful POC iteration, before a handoff, or before accepting a material change in direction. It keeps the POC aligned with its proof target without turning it into project management overhead.

## Use This When

- A proof step has just finished.
- New evidence, user feedback, test output, or demo signal appeared.
- The user asks to expand scope or change direction.
- A fresh agent needs to leave the POC easy to resume.

## Do Not Use This When

- The change was trivial and produced no durable signal.
- You are trying to audit every file in the repo.
- You want to create a long status report with no decision impact.

## Check The Current Proof State

Read the POC context files that exist in this project. Do not require specific filenames. Look for:

- Original intent and proof target.
- Chosen vertical slice.
- Definition of done.
- Non-goals and scope boundaries.
- Current next proof step.
- Evidence gathered so far.
- Consequential decisions.
- Open questions and constraints.

If you cannot find these, note the gap and propose the smallest fix.

## Iteration Checklist

Answer each question in the context of the work just completed:

- Did the original intent stay stable, get clarified, or materially change?
- Did the current work produce evidence? If yes, what confidence changed?
- Was a consequential decision made or reversed?
- Did the work add scope that does not serve the proof slice?
- Did the definition of done change?
- Is the next proof step still the smallest useful next action?
- Would a fresh agent understand what to do next in under five minutes?

## Drift Handling

Material drift includes changed hypothesis, expanded feature scope, architecture that does not serve the proof, reversed decisions without rationale, or changed done criteria.

When drift appears:

- Challenge whether the new request proves something the current slice cannot.
- Ask what the desire to drift reveals about the original framing.
- Suggest pausing to review evidence and learnings before changing intent.
- Encourage a new POC for a genuine direction change.
- If the user confirms the change, record the drift and rationale clearly.

## What To Persist

Use judgment. Persist only information that helps future work:

- Evidence that changes confidence.
- Consequential decisions and rationale.
- Material drift and why it was accepted or rejected.
- New constraints that affect the proof.
- The next proof step when it changed.
- A learning that should improve this or a future POC.

Do not persist routine progress noise.

## Output

Return a concise checkpoint:

```text
Intent status: [same / clarified / challenged / drifted]
Evidence: [what was learned or what signal is missing]
Decision: [if any]
Drift check: [clean / risk / accepted with rationale]
Next proof step: [smallest useful next action]
Files updated: [or "none"]
```

If the check is clean, say so directly.
