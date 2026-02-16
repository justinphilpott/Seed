# Skill: Seed Feedback

Submit a suggestion or issue back to [seed](https://github.com/justinphilpott/seed), the tool that scaffolded this project's documentation.

> This is entirely optional. Only use this when you genuinely notice something about the scaffolding that could be better — a missing template section, a working practice that caused friction, a doc structure that didn't fit your project, or an idea for improvement.

## When to Use This

- A scaffolded file was missing something you had to add manually in every project
- A working practice in AGENTS.md didn't fit well and you had to override it
- The doc structure caused confusion or needed reorganising early on
- You found a pattern that would benefit other seed-scaffolded projects
- Something about the templates or skills could be clearer or more useful

## When NOT to Use This

- Don't submit feedback about your specific project — this is about the scaffolding tool itself
- Don't submit vague or speculative suggestions — focus on concrete observations
- Don't use this as a workaround for fixing your own docs — fix those directly

## Process

1. **Identify the category**:
   - `template` — A scaffolded file (README, AGENTS, TODO, DECISIONS, LEARNINGS) needs changes
   - `working-practice` — A practice in AGENTS.md should be adjusted or added
   - `skill` — An existing skill needs improvement, or a new skill would be useful
   - `structure` — The overall doc structure or file organisation could be better
   - `other` — Anything else

2. **Draft the issue** with this structure:
   - **Title**: Short, specific summary (e.g., "AGENTS.md: add section for API conventions")
   - **Category**: One of the above
   - **What happened**: What you observed or experienced
   - **Suggestion**: What you think should change
   - **Context**: Briefly, what kind of project this was (language, framework, domain) — enough to understand whether the suggestion is general or niche

3. **Submit via GitHub CLI**:
   ```bash
   gh issue create \
     --repo justinphilpott/seed \
     --title "<title>" \
     --label "agent-feedback" \
     --body "<body>"
   ```

4. **If `gh` is not available or not authenticated**, output the formatted issue to the user so they can submit it manually.

## Issue Body Template

```
## Category
[template | working-practice | skill | structure | other]

## What I Observed
[Concrete description of what happened or what was missing]

## Suggestion
[What you think should change and why]

## Project Context
[Language/framework/domain — just enough to assess generalisability]

---
Submitted by an AI agent working in a seed-scaffolded project.
```

## Scope

- **Do**: Submit focused, actionable observations from real usage
- **Do**: Check existing issues first to avoid duplicates (`gh issue list --repo justinphilpott/seed --label agent-feedback`)
- **Don't**: Submit more than one issue per session unless they're clearly distinct
- **Don't**: Submit feature requests that only benefit your specific project
- **Don't**: Editorialize — state what happened and what you'd suggest, not lengthy arguments
