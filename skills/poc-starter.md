# Skill: POC Starter

Create a focused local proof-of-concept starter through an interview that clarifies intent, identifies the proof-critical vertical slice, and sets up just enough context for a short-lived POC to survive multiple agent sessions.

This skill replaces rigid binary scaffolding. The useful product is not a fixed set of files; it is the disciplined translation of human intent into a small, durable context system.

## Use This When

- A user wants to start a new POC, proof slice, spike, or exploratory implementation.
- A user has an idea but has not yet isolated the smallest useful thing to prove.
- A user wants local support files, agent instructions, or a minimal runnable skeleton tailored to their POC.
- An existing early project needs better intent, evidence, decision, and handoff context.

## Do Not Use This When

- The user is ready to build a production app with known requirements.
- The work is a small one-off change inside an established repo.
- The user only needs a generic template copied without interpretation.
- The agent cannot safely inspect or write the target location and the user wants direct file creation.

## Core Principles

- **POC over product**: Bias toward proving one crucial vertical, not specifying a whole application.
- **Intent before structure**: Files are containers. The durable asset is preserved intent, evidence, decisions, and current proof state.
- **Falsifiable over impressive**: The POC should be able to fail, pass, or materially change confidence.
- **Smallest sufficient context**: Create the fewest files that let a future agent recover the essential signal quickly.
- **Challenge scope creep**: Treat material expansion as a learning opportunity and possible sign the proof target was unclear.
- **Markdown first**: Use simple repo files by default. Propose heavier memory only when it clearly serves the POC.
- **Vendor agnostic**: Do not assume Claude, OpenCode, Codex, Cursor, VS Code, GitHub, or any specific agent runtime.

## Conversation Flow

Interview progressively. Do not dump every question at once. Ask enough to move forward, summarize what you heard, then tighten the POC.

### 1. Establish Mode

Ask these first unless the user already answered them:

- How deep should we go: quick, standard, or thorough?
- Do you want a plan first, or should I create the POC support files directly after confirming the plan?
- Should this create docs/context only, or should it also create a minimal runnable app skeleton if the stack is clear?
- Where should the POC live? If the context strongly implies a target, infer it and ask for confirmation.

If the user asks for direct creation, still produce a short proposed file set and get confirmation before writing.

### 2. Capture Minimum Intent

Get the minimum viable charter before advising on files or implementation:

- What problem space are we exploring?
- What decision should this POC help make?
- What is the riskiest assumption or unknown?
- Who or what needs to observe the result?
- What signal would increase confidence?
- What signal would decrease confidence or stop the idea?
- What constraints matter now: time, integrations, data, platform, privacy, cost, team skills, deployment, or demo needs?

If the answers describe a full app, pause and narrow before continuing.

### 3. Advise On The Vertical

This is a central responsibility of the skill. Help the user choose a good proof vertical without pretending to know their product better than they do.

A good POC vertical is:

- **Proof-critical**: It tests the riskiest meaningful assumption.
- **Falsifiable**: It can clearly succeed, fail, or change confidence.
- **Small**: It fits the agreed POC budget.
- **Observable**: A user, stakeholder, or agent can inspect the outcome.
- **Decision-driving**: The result changes what happens next.
- **End-to-end enough**: It crosses the important boundary of the problem without building completeness around it.
- **Evidence-oriented**: It defines what signal will count as learning.

Generate two to four candidate verticals when useful. Compare them by learning value, cost, uncertainty reduction, evidence clarity, and scope risk. Recommend one, explain why, and ask the user to confirm or revise.

Challenge weak verticals directly. Examples of weak verticals:

- Build the whole dashboard.
- Set up the architecture.
- Implement auth first.
- Create a basic MVP.
- Support all user types.
- Build the backend.

Useful challenge question: "What would this prove that a smaller slice would not?"

### 4. Define Done And Non-Goals

Before any file creation, clarify:

- The chosen vertical slice.
- The falsifiable hypothesis or proof question.
- The definition of done.
- The evidence expected at done.
- The time, iteration, or complexity budget.
- The anti-requirements: what this POC deliberately will not do.
- The first next proof step.

The done statement should be easy to say out loud. If it is vague, keep interviewing.

### 5. Select The Smallest Context System

Choose files based on information coverage, not convention. The system must help a fresh agent recover:

- Original intent and proof target.
- Current vertical slice and done criteria.
- Non-goals and scope boundaries.
- Current next proof step.
- Consequential decisions and rationale.
- Evidence gathered and confidence changes.
- Open questions and constraints.
- Commands or setup steps, if implementation exists.
- Drift history when the POC materially changes.

Default toward a small set such as:

- `README.md`: human entry point and current status.
- `AGENTS.md`: canonical agent context and working practices.
- `POC.md`: intent, hypothesis, vertical slice, done criteria, non-goals, and drift policy.
- `TODO.md`: current next proof step and short backlog, not a full roadmap.
- `DECISIONS.md`: consequential decisions, if decisions will matter across sessions.
- `EVIDENCE.md`: proof signals, demos, test results, observations, and confidence changes.
- `skills/`: optional support skills only when they will preserve signal.

Use fewer files if the POC is tiny. Add files only when they reduce context loss or prevent drift. Explain the chosen file set briefly.

### 6. Consider Support Skills

Offer targeted support skills when they clearly help the POC. Ask before creating them.

Good support skill candidates:

- Iteration guard: end-of-iteration intent, evidence, decision, and drift check.
- Context health check: audit whether a fresh agent can recover the proof state.
- Domain-specific review: evaluate the POC against the particular evidence target.

Do not install generic skills just because this repo contains examples. The generated POC should get only what it can use.

### 7. Plan Or Create

If the user chose plan mode, output:

- Interview synthesis.
- Candidate verticals considered.
- Recommended vertical and why.
- Definition of done.
- Non-goals.
- Proposed file set.
- Optional support skills.
- First next proof step.
- Open questions.

If the user chose create mode:

- Inspect or infer the target path.
- Confirm the target before writing.
- Check whether it exists and whether files would be overwritten.
- Never overwrite user files without explicit approval.
- Create only the agreed files.
- If creating an app skeleton, keep it minimal and proof-oriented.
- After creation, report what was created and what the first proof step is.

If the environment cannot write files, produce the plan and say what could not be done.

## Scope Creep And Intent Changes

Treat material divergence as important signal, not just a request to obey.

Material divergence includes:

- Changed hypothesis or proof target.
- Scope expansion into full product features.
- New architecture that does not serve the proof slice.
- Reversal of a consequential decision without rationale.
- Changed definition of done.

When this happens:

- Challenge the change directly and respectfully.
- Ask what the requested change would prove that the current slice would not.
- Ask what the desire to change reveals about the original framing.
- Suggest pausing to review learnings and evidence before changing intent.
- Encourage starting a new POC for genuine direction changes.
- If the user insists, record the divergence and rationale before proceeding.

## Iteration Reporting

Use agent judgment on what to persist. Do not write routine chat summaries into files unless they preserve future signal.

Persist when there is:

- New evidence.
- A meaningful confidence change.
- A consequential decision.
- A drift event.
- A changed next proof step.
- A learning that should affect future POCs.

Checkpoint reports should be adaptive and short. A useful default is:

```text
Intent status: [same / clarified / challenged / drifted]
What changed: [one or two lines]
Evidence: [signal gathered or missing]
Decision or learning: [if any]
Next proof step: [smallest useful next action]
```

## Stop Conditions

Stop and ask before creating files if:

- The user has not confirmed plan vs create mode.
- The target path is ambiguous or risky.
- The POC vertical is not falsifiable.
- The definition of done is too vague.
- The requested scope is clearly a product build rather than a POC.
- Existing files would be overwritten.

## Final Response After Creation

Keep the final response brief:

- State the chosen vertical and definition of done.
- List files created or updated.
- State any files deliberately not created.
- State the first next proof step.
- Mention any unresolved risk or open question.
