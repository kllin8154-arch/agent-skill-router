~~~markdown
# Global Agent Rules

## Language

Respond in the user's language by default.

Do not force a specific output language unless the user explicitly requests one.

---

## Coding Standards

- Use clear, readable, maintainable code.
- Keep comments concise and useful.
- Use English variable and function names.
- Prefer small, focused changes over broad rewrites.
- Before modifying code, analyze the impact scope.
- After generating code, explain key design decisions only when helpful.
- If a requirement is ambiguous, state the ambiguity and make a reasonable minimal assumption.
- Do not block progress over minor ambiguity when a safe minimal assumption is possible.

---

## Skill Routing Rules

The agent must decide whether a local Skill is needed before handling complex tasks.

Typical Skill roots:

```text
<USER_HOME>/.claude/skills
<USER_HOME>/.codex/skills
<USER_HOME>/.agents/skills
~~~

Core files:

```text
skill-index.json
Skill-Quick-Reference-EN.md
{{SKILL_GOVERNANCE_SKILL}}/SKILL.md
```

For complex tasks, follow this order:

1. Check `skill-index.json`.
2. If needed, check `Skill-Quick-Reference-EN.md`.
3. Identify task type, role, tech stack, keywords, and expected output.
4. Load only the 1 to 3 most relevant Skills.
5. Do not load all Skills at once.

------

## Mandatory Programming Baseline

For any programming-related task, the agent must use:

```text
{{PROGRAMMING_BASELINE_SKILL}}
```

This applies to:

- Writing code
- Modifying code
- Refactoring
- Bug fixing
- Code review
- API design
- Database design
- Test writing
- Architecture design
- Technical planning
- Frontend development
- Backend development
- DevOps automation
- AI Agent development

Default programming combination:

```text
{{PROGRAMMING_BASELINE_SKILL}} + domain Skill + verification or security Skill
```

------

## UI and Design System Tasks

For UI, UX, design system, component library, visual guidelines, frontend design, dashboard UI, layout system, or product interface tasks, prefer:

```text
{{DESIGN_SYSTEM_SKILL}}
{{FRONTEND_PATTERNS_SKILL}}
{{BROWSER_QA_SKILL}}
```

If the task includes code implementation, also use:

```text
{{PROGRAMMING_BASELINE_SKILL}}
```

------

## Common Skill Routing

### Frontend

Prefer:

```text
{{PROGRAMMING_BASELINE_SKILL}}
{{FRONTEND_PATTERNS_SKILL}}
{{DESIGN_SYSTEM_SKILL}}
{{BROWSER_QA_SKILL}}
{{E2E_TESTING_SKILL}}
```

### Backend / API

Prefer:

```text
{{PROGRAMMING_BASELINE_SKILL}}
{{API_DESIGN_SKILL}}
{{SECURITY_REVIEW_SKILL}}
```

### Database

Prefer:

```text
{{PROGRAMMING_BASELINE_SKILL}}
{{DATABASE_MIGRATIONS_SKILL}}
{{POSTGRES_PATTERNS_SKILL}}
{{SECURITY_REVIEW_SKILL}}
```

### DevOps / Deployment

Prefer:

```text
{{PROGRAMMING_BASELINE_SKILL}}
{{DEPLOYMENT_PATTERNS_SKILL}}
{{DOCKER_PATTERNS_SKILL}}
{{SAFETY_GUARD_SKILL}}
```

### Testing / Verification

Prefer:

```text
{{PROGRAMMING_BASELINE_SKILL}}
{{TDD_WORKFLOW_SKILL}}
{{VERIFICATION_LOOP_SKILL}}
{{BROWSER_QA_SKILL}}
{{E2E_TESTING_SKILL}}
```

### Architecture / Planning

Prefer:

```text
{{BLUEPRINT_SKILL}}
{{API_DESIGN_SKILL}}
{{HEXAGONAL_ARCHITECTURE_SKILL}}
{{ARCHITECTURE_DECISION_RECORDS_SKILL}}
```

### AI Agent Engineering

Prefer:

```text
{{PROGRAMMING_BASELINE_SKILL}}
{{AGENTIC_ENGINEERING_SKILL}}
{{EVAL_HARNESS_SKILL}}
```

------

## Skill Governance

For creating, merging, deleting, deduplicating, updating, or searching for Skills, use:

```text
{{SKILL_GOVERNANCE_SKILL}}
```

Before creating a new Skill:

1. Check whether an existing Skill already covers the task.
2. If the new requirement is only a branch scenario, update the existing Skill instead.
3. Create a new Skill only when existing Skills cannot cover the core workflow and the new Skill is likely to be reused.

------

## External Skill Search

Only search GitHub or external sources when no suitable local Skill exists.

Do not directly install or copy external Skills without review.

Before adopting any external Skill, check whether it:

- Contains destructive commands.
- Reads secrets, tokens, cookies, SSH keys, or `.env` files.
- Uploads local files.
- Executes remote scripts.
- Contains obfuscated code.
- Depends on unknown MCP services.
- Bypasses user confirmation for high-risk actions.

After review, extract useful ideas and rewrite them as a local Skill draft.

------

## Agent Team / Subagent Rules

When using agent-team, subagents, parallel agents, or dynamically created temporary agents, the main agent must pass compact Skill routing constraints into each subtask.

This rule only applies to multi-agent scenarios and does not affect normal single-agent tasks.

The main agent should ensure each subagent understands:

- Its role.
- Its task boundary.
- Which Skills are relevant.
- Whether the task involves code.
- Whether `{{PROGRAMMING_BASELINE_SKILL}}` is required.
- Whether `{{SKILL_GOVERNANCE_SKILL}}` is required.
- That it must not load all Skills at once.

These constraints are internal execution requirements and do not need to be shown to the user unless requested.

The main agent must merge subagent results carefully:

- Remove duplicate suggestions.
- Resolve conflicting recommendations.
- Prefer simpler and safer solutions.
- Keep only content relevant to the user's goal.
- Avoid exposing unnecessary internal coordination details.

Do not split simple tasks into multiple agents just because this rule exists.

```
# `templates/en/codex/AGENTS.md`

```markdown
# Global Agent Rules

## Language

Respond in the user's language by default.

Do not force a specific output language unless the user explicitly requests one.

---

## Coding Standards

- Use clear, readable, maintainable code.
- Keep comments concise and useful.
- Use English variable and function names.
- Prefer small, focused changes over broad rewrites.
- Before modifying code, analyze the impact scope.
- After generating code, explain key design decisions only when helpful.
- If a requirement is ambiguous, state the ambiguity and make a reasonable minimal assumption.
- Do not block progress over minor ambiguity when a safe minimal assumption is possible.

---

## Skill Routing Rules

The agent must decide whether a local Skill is needed before handling complex tasks.

Typical Skill roots:

```text
<USER_HOME>/.codex/skills
<USER_HOME>/.agents/skills
<USER_HOME>/.claude/skills
```

Core files:

```text
skill-index.json
Skill-Quick-Reference-EN.md
{{SKILL_GOVERNANCE_SKILL}}/SKILL.md
```

For complex tasks, follow this order:

1. Check `skill-index.json`.
2. If needed, check `Skill-Quick-Reference-EN.md`.
3. Identify task type, role, tech stack, keywords, and expected output.
4. Load only the 1 to 3 most relevant Skills.
5. Do not load all Skills at once.

------

## Mandatory Programming Baseline

For any programming-related task, the agent must use:

```text
{{PROGRAMMING_BASELINE_SKILL}}
```

This applies to:

- Writing code
- Modifying code
- Refactoring
- Bug fixing
- Code review
- API design
- Database design
- Test writing
- Architecture design
- Technical planning
- Frontend development
- Backend development
- DevOps automation
- AI Agent development

Default programming combination:

```text
{{PROGRAMMING_BASELINE_SKILL}} + domain Skill + verification or security Skill
```

------

## UI and Design System Tasks

For UI, UX, design system, component library, visual guidelines, frontend design, dashboard UI, layout system, or product interface tasks, prefer:

```text
{{DESIGN_SYSTEM_SKILL}}
{{FRONTEND_PATTERNS_SKILL}}
{{BROWSER_QA_SKILL}}
```

If the task includes code implementation, also use:

```text
{{PROGRAMMING_BASELINE_SKILL}}
```

------

## Skill Governance

For creating, merging, deleting, deduplicating, updating, or searching for Skills, use:

```text
{{SKILL_GOVERNANCE_SKILL}}
```

Before creating a new Skill:

1. Check whether an existing Skill already covers the task.
2. If the new requirement is only a branch scenario, update the existing Skill instead.
3. Create a new Skill only when existing Skills cannot cover the core workflow and the new Skill is likely to be reused.

------

## External Skill Search

Only search GitHub or external sources when no suitable local Skill exists.

Do not directly install or copy external Skills without review.

Before adopting any external Skill, check whether it:

- Contains destructive commands.
- Reads secrets, tokens, cookies, SSH keys, or `.env` files.
- Uploads local files.
- Executes remote scripts.
- Contains obfuscated code.
- Depends on unknown MCP services.
- Bypasses user confirmation for high-risk actions.

After review, extract useful ideas and rewrite them as a local Skill draft.

------

## Agent Team / Subagent Rules

When using agent-team, subagents, parallel agents, or dynamically created temporary agents, the main agent must pass compact Skill routing constraints into each subtask.

This rule only applies to multi-agent scenarios and does not affect normal single-agent tasks.

The main agent should ensure each subagent understands:

- Its role.
- Its task boundary.
- Which Skills are relevant.
- Whether the task involves code.
- Whether `{{PROGRAMMING_BASELINE_SKILL}}` is required.
- Whether `{{SKILL_GOVERNANCE_SKILL}}` is required.
- That it must not load all Skills at once.

These constraints are internal execution requirements and do not need to be shown to the user unless requested.

The main agent must merge subagent results carefully:

- Remove duplicate suggestions.
- Resolve conflicting recommendations.
- Prefer simpler and safer solutions.
- Keep only content relevant to the user's goal.
- Avoid exposing unnecessary internal coordination details.

Do not split simple tasks into multiple agents just because this rule exists.

```
# `templates/en/shared/Skill-Quick-Reference-EN.md`

```markdown
# Skill Quick Reference

This file is a human-readable Skill manual.

Use it together with `skill-index.json`.

The agent should check this file only when the machine-readable index is insufficient or when a human needs to understand the available Skills.

---

## Core Skill Parameters

| Parameter | Suggested Skill | Purpose |
|---|---|---|
| `{{PROGRAMMING_BASELINE_SKILL}}` | `karpathy-guidelines` | Mandatory programming baseline |
| `{{SKILL_GOVERNANCE_SKILL}}` | `skill-governance` | Skill governance and deduplication |
| `{{DESIGN_SYSTEM_SKILL}}` | `design-system` | UI design systems |
| `{{FRONTEND_PATTERNS_SKILL}}` | `frontend-patterns` | Frontend patterns |
| `{{BROWSER_QA_SKILL}}` | `browser-qa` | Browser UI QA |
| `{{E2E_TESTING_SKILL}}` | `e2e-testing` | End-to-end testing |
| `{{TDD_WORKFLOW_SKILL}}` | `tdd-workflow` | Test-driven development |
| `{{VERIFICATION_LOOP_SKILL}}` | `verification-loop` | Verification workflow |
| `{{SECURITY_REVIEW_SKILL}}` | `security-review` | Security review |
| `{{SAFETY_GUARD_SKILL}}` | `safety-guard` | High-risk operation guard |
| `{{API_DESIGN_SKILL}}` | `api-design` | API design |
| `{{DATABASE_MIGRATIONS_SKILL}}` | `database-migrations` | Database migrations |
| `{{POSTGRES_PATTERNS_SKILL}}` | `postgres-patterns` | PostgreSQL patterns |
| `{{DEPLOYMENT_PATTERNS_SKILL}}` | `deployment-patterns` | Deployment patterns |
| `{{DOCKER_PATTERNS_SKILL}}` | `docker-patterns` | Docker patterns |
| `{{BLUEPRINT_SKILL}}` | `blueprint` | Planning and task breakdown |
| `{{ARCHITECTURE_DECISION_RECORDS_SKILL}}` | `architecture-decision-records` | Architecture decision records |
| `{{HEXAGONAL_ARCHITECTURE_SKILL}}` | `hexagonal-architecture` | Hexagonal architecture |
| `{{AGENTIC_ENGINEERING_SKILL}}` | `agentic-engineering` | Agent engineering |
| `{{EVAL_HARNESS_SKILL}}` | `eval-harness` | Evaluation harness |

---

## Quick Selection

### Any programming task

Use:

```text
{{PROGRAMMING_BASELINE_SKILL}} + domain Skill + verification or security Skill
```

### UI / Design System

Use:

```text
{{DESIGN_SYSTEM_SKILL}}
{{FRONTEND_PATTERNS_SKILL}}
{{BROWSER_QA_SKILL}}
```

If implementation is required, also use:

```text
{{PROGRAMMING_BASELINE_SKILL}}
```

### Frontend Implementation

Use:

```text
{{PROGRAMMING_BASELINE_SKILL}}
{{FRONTEND_PATTERNS_SKILL}}
{{DESIGN_SYSTEM_SKILL}}
{{BROWSER_QA_SKILL}}
```

### Backend / API

Use:

```text
{{PROGRAMMING_BASELINE_SKILL}}
{{API_DESIGN_SKILL}}
{{SECURITY_REVIEW_SKILL}}
```

### Database

Use:

```text
{{PROGRAMMING_BASELINE_SKILL}}
{{DATABASE_MIGRATIONS_SKILL}}
{{POSTGRES_PATTERNS_SKILL}}
```

### DevOps / Deployment

Use:

```text
{{PROGRAMMING_BASELINE_SKILL}}
{{DEPLOYMENT_PATTERNS_SKILL}}
{{DOCKER_PATTERNS_SKILL}}
{{SAFETY_GUARD_SKILL}}
```

### Testing

Use:

```text
{{PROGRAMMING_BASELINE_SKILL}}
{{TDD_WORKFLOW_SKILL}}
{{VERIFICATION_LOOP_SKILL}}
{{E2E_TESTING_SKILL}}
```

### Skill Management

Use:

```text
{{SKILL_GOVERNANCE_SKILL}}
```

------

## Notes

- Do not load all Skills at once.
- Prefer local Skills before external search.
- Merge similar Skills into branch scenarios.
- Use GitHub only when no local Skill fits.
- Review external Skills before adopting them.

```
# `templates/en/shared/skill-governance/SKILL.md`

```markdown
---
name: skill-governance
description: Manage Skill creation, merging, deduplication, routing index updates, quick reference updates, and safe external Skill review.
---

# Skill Governance

## Purpose

Use this Skill when working on:

- Creating Skills
- Updating Skills
- Merging Skills
- Deleting Skills
- Deduplicating Skills
- Updating `skill-index.json`
- Updating the Skill quick reference
- Reviewing external Skills
- Searching GitHub for reusable Skill ideas
- Designing Skill routing rules
- Reducing context waste caused by too many Skills

The goal is:

```text
Fewer high-quality Skills
+ clear triggers
+ maintainable routing index
+ branch scenarios for similar cases
+ external search only when local Skills are missing
```

------

## Local Files

Typical files:

```text
skill-index.json
Skill-Quick-Reference-EN.md
{{SKILL_GOVERNANCE_SKILL}}/SKILL.md
```

If the index and quick reference conflict, inspect actual Skill folders and `SKILL.md` files, then update both files.

------

## Deduplication Policy

Do not create a new Skill when:

- An existing Skill covers most of the workflow.
- The new requirement is only a branch of an existing Skill.
- The name is different but the input, output, and process are the same.
- The requirement is only a business-specific version of a general Skill.
- The Skill is unlikely to be reused.
- The need can be solved by adding a branch scenario to an existing Skill.

Create a new Skill only when:

- Existing Skills cannot cover the core workflow.
- It is not a small branch of an existing Skill.
- It is not just a renamed concept.
- It is likely to be reused.
- It has clear triggers, inputs, outputs, workflow, and avoid conditions.
- There is a clear reason why it cannot be merged into an existing Skill.

------

## Similarity Check

Before creating a new Skill, compare:

| Dimension  | Question                                  |
| ---------- | ----------------------------------------- |
| Goal       | Does it solve the same class of problems? |
| Input      | Does it accept similar inputs?            |
| Output     | Does it produce similar outputs?          |
| Workflow   | Are the steps mostly the same?            |
| Tech stack | Is it just a renamed framework or tool?   |
| Tooling    | Does it rely on the same tools?           |
| Risk       | Does it have the same risk profile?       |
| Reuse      | Will it be reused often?                  |

------

## Branch Scenario Rule

If a new requirement is similar to an existing Skill but has a meaningful branch difference, do not create a new Skill.

Add a branch scenario to the existing Skill instead.

Branch scenario template:

```markdown
## Branch Scenarios

### Branch: <name>

Applies when:

Does not apply when:

Trigger keywords:

Workflow:

Risks:

Recommended Skills:
```

------

## External Skill Review

Only search GitHub or external sources when no suitable local Skill exists.

Do not directly install or copy external Skills without review.

Check whether the external Skill:

- Contains destructive commands.
- Reads `.env`, SSH keys, tokens, cookies, or browser data.
- Uploads local files.
- Executes remote scripts.
- Contains obfuscated code.
- Depends on unknown MCP services.
- Requests excessive permissions.
- Bypasses user confirmation for high-risk operations.

After review:

1. Extract useful ideas.
2. Rewrite them as a local Skill draft.
3. Run deduplication analysis.
4. Decide whether to create a new Skill or merge into an existing one.
5. Update `skill-index.json`.
6. Update the quick reference.

------

## Required Output for Skill Changes

When changing Skills, summarize:

```text
Result:
- Created new Skill:
- Merged into existing Skill:
- Updated files:
- Reason:
- Future trigger:
```

Do not expose unnecessary internal analysis in normal user-facing answers.

```
# `templates/en/shared/skill-template/SKILL.md`

```markdown
---
name: skill-name
description: Describe what this Skill does and when it should be used.
---

# Skill Name

## Purpose

Explain the core purpose of this Skill.

## When to Use

Use this Skill when:

- Scenario 1
- Scenario 2
- Scenario 3

## When Not to Use

Do not use this Skill when:

- Avoid condition 1
- Avoid condition 2

## Trigger Keywords

- keyword-1
- keyword-2
- keyword-3

## Recommended Skill Combination

- {{PROGRAMMING_BASELINE_SKILL}}
- related-skill-a
- related-skill-b

## Inputs

Typical inputs:

- Input 1
- Input 2

## Outputs

Expected outputs:

- Output 1
- Output 2

## Workflow

### Step 1: Understand the task

Describe how to understand the task.

### Step 2: Choose the minimal useful approach

Describe how to choose the implementation or reasoning approach.

### Step 3: Execute

Describe execution rules.

### Step 4: Verify

Describe verification rules.

## Branch Scenarios

### Branch: Example

Applies when:

Does not apply when:

Workflow:

Risks:

Recommended Skills:

## Risk Controls

- Risk control 1
- Risk control 2

## Completion Criteria

- Criterion 1
- Criterion 2
```