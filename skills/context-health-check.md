# Skill: Context Health Check

Audit whether a POC has enough durable context for a fresh agent to recover the proof state and continue without accidentally expanding scope. This checks information coverage, not file names.

## Use This When

- A POC has gone through several iterations.
- A new agent or human is about to pick up the work.
- The project feels noisy, stale, or over-planned.
- The user wants to know whether the context system is preserving signal.

## Do Not Use This When

- You only need the end-of-iteration micro-check. Use `poc-iteration-guard.md` instead.
- You are evaluating production readiness.
- You are enforcing a fixed documentation template.

## Coverage Categories

Look for whether each category is discoverable somewhere. The location can be `README.md`, `AGENTS.md`, `POC.md`, `TODO.md`, `DECISIONS.md`, `EVIDENCE.md`, logs, comments, issues, or another appropriate place.

### 1. Intent

- What is the POC trying to prove?
- Why does this proof matter?
- What decision will the result inform?

### 2. Vertical Slice

- What is the chosen proof-critical vertical?
- Why was it chosen over other possible slices?
- What is deliberately out of scope?

### 3. Definition Of Done

- What observable condition means the POC has done its job?
- What evidence would increase confidence?
- What evidence would decrease confidence or stop the idea?

### 4. Current State

- What has been built or explored?
- What is the current next proof step?
- Are there setup or run commands if implementation exists?

### 5. Evidence And Learnings

- What signals have been gathered?
- What changed confidence?
- What learnings should affect future POCs or the next iteration?

### 6. Decisions And Constraints

- What consequential decisions were made?
- What constraints shaped those decisions?
- Are reversals or tradeoffs explained?

### 7. Drift And Scope Boundaries

- Has the POC drifted from its original intent?
- If yes, is the drift explained and approved?
- Are full-product features being added without proof value?

### 8. Fresh-Agent Handoff

- Can a new agent understand the goal, current state, and next step in under five minutes?
- Is there too much stale plan detail?
- Is there enough context to resist scope creep?

## Process

1. Read the likely context files and any obvious current-work artifacts.
2. Assess each category as Covered, Partial, Missing, or Noisy.
3. Identify contradictions, stale plans, or unexplained drift.
4. Recommend the smallest context change that would restore signal.
5. Do not rewrite files unless the user asks.

## Output Format

```text
## Context Health Check

Coverage:
Intent: [status] - [location or gap]
Vertical slice: [status] - [location or gap]
Definition of done: [status] - [location or gap]
Current state: [status] - [location or gap]
Evidence and learnings: [status] - [location or gap]
Decisions and constraints: [status] - [location or gap]
Drift and scope boundaries: [status] - [location or gap]
Fresh-agent handoff: [status] - [location or gap]

Highest-risk gap:
[One concise statement]

Smallest useful fix:
[One to three actions]
```

## Bias

Prefer deleting stale or over-specific planning detail over adding more files. The goal is signal clarity, not documentation volume.
