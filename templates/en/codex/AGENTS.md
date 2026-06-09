# `templates/en/codex/AGENTS.md`

```
# Global Codex Agent Rules

## Language

Respond in the user's language by default.

Do not force a specific response language unless the user explicitly asks for one.

---

## Purpose

This file defines the global persistent behavior rules for Codex.

It is intended to be copied to:

<USER_HOME>/.codex/AGENTS.md
```

Codex should use this file to keep behavior consistent across sessions, repositories, and tasks.

## Coding Standards

- Use clear, readable, maintainable code.
- Keep comments concise and useful.
- Use English variable, function, class, and file names unless the project convention requires otherwise.
- Prefer small, focused changes over broad rewrites.
- Before modifying code, analyze the impact scope.
- Do not refactor unrelated code.
- Do not introduce new dependencies unless necessary.
- If a requirement is ambiguous, state the ambiguity and make a safe minimal assumption.
- Do not block progress over minor ambiguity when a safe minimal assumption is possible.
- Ask for confirmation before adding production dependencies, changing deployment configuration, deleting files, modifying database schemas, or running high-risk commands.

## Codex Skill Roots

Recommended Codex user-level Skill root:

```
<USER_HOME>/.agents/skills
```

Optional Codex mirror Skill root:

```
<USER_HOME>/.codex/skills
```

Optional shared Claude Skill root:

```
<USER_HOME>/.claude/skills
```

Prefer `~/.agents/skills` as the neutral user-level Skill location when possible.

## Core Skill Files

When routing Skills, prefer:

```
skill-index.json
Skill-Quick-Reference-EN.md
{{SKILL_GOVERNANCE_SKILL}}/SKILL.md
```

Use `skill-index.json` first.

Use `Skill-Quick-Reference-EN.md` only when the index is missing, incomplete, or when a human-readable overview is needed.

## Skill Routing Rules

Before handling a complex task, decide whether a local Skill is needed.

Complex tasks include:

- Programming
- Bug fixing
- Code review
- API design
- Database design
- UI / UX design
- Design systems
- Testing
- DevOps / deployment
- Security review
- AI Agent development
- Skill management
- Multi-agent workflows

Routing order:

1. Check `skill-index.json`.
2. If needed, check `Skill-Quick-Reference-EN.md`.
3. Identify the task type, role, tech stack, keywords, and expected output.
4. Load only the 1 to 3 most relevant Skills.
5. Do not load all Skills at once.
6. Prefer local Skills before external search.

## Mandatory Programming Baseline

For any programming-related task, use:

```
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

```
{{PROGRAMMING_BASELINE_SKILL}} + domain Skill + verification or security Skill
```

## UI and Design System Tasks

For UI, UX, design system, component library, visual guidelines, frontend design, dashboard UI, layout system, or product interface tasks, prefer:

```
{{DESIGN_SYSTEM_SKILL}}
{{FRONTEND_PATTERNS_SKILL}}
{{BROWSER_QA_SKILL}}
```

If the task includes code implementation, also use:

```
{{PROGRAMMING_BASELINE_SKILL}}
```

## Common Skill Routing

### Frontend

Prefer:

```
{{PROGRAMMING_BASELINE_SKILL}}
{{FRONTEND_PATTERNS_SKILL}}
{{DESIGN_SYSTEM_SKILL}}
{{BROWSER_QA_SKILL}}
{{E2E_TESTING_SKILL}}
```

### Backend / API

Prefer:

```
{{PROGRAMMING_BASELINE_SKILL}}
{{API_DESIGN_SKILL}}
{{SECURITY_REVIEW_SKILL}}
```

### Database

Prefer:

```
{{PROGRAMMING_BASELINE_SKILL}}
{{DATABASE_MIGRATIONS_SKILL}}
{{POSTGRES_PATTERNS_SKILL}}
{{SECURITY_REVIEW_SKILL}}
```

### DevOps / Deployment

Prefer:

```
{{PROGRAMMING_BASELINE_SKILL}}
{{DEPLOYMENT_PATTERNS_SKILL}}
{{DOCKER_PATTERNS_SKILL}}
{{SAFETY_GUARD_SKILL}}
```

### Testing / Verification

Prefer:

```
{{PROGRAMMING_BASELINE_SKILL}}
{{TDD_WORKFLOW_SKILL}}
{{VERIFICATION_LOOP_SKILL}}
{{BROWSER_QA_SKILL}}
{{E2E_TESTING_SKILL}}
```

### Architecture / Planning

Prefer:

```
{{BLUEPRINT_SKILL}}
{{API_DESIGN_SKILL}}
{{HEXAGONAL_ARCHITECTURE_SKILL}}
{{ARCHITECTURE_DECISION_RECORDS_SKILL}}
```

### AI Agent Engineering

Prefer:

```
{{PROGRAMMING_BASELINE_SKILL}}
{{AGENTIC_ENGINEERING_SKILL}}
{{EVAL_HARNESS_SKILL}}
```

### Skill Management

Use:

```
{{SKILL_GOVERNANCE_SKILL}}
```

## Skill Governance

For creating, merging, deleting, deduplicating, updating, or searching for Skills, use:

```
{{SKILL_GOVERNANCE_SKILL}}
```

Before creating a new Skill:

1. Check whether an existing Skill already covers the task.
2. If the new requirement is only a branch scenario, update the existing Skill instead.
3. Create a new Skill only when existing Skills cannot cover the core workflow and the new Skill is likely to be reused.

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

## Agent Team / Subagent Rules

When using subagents, parallel agents, agent-team workflows, or dynamically created temporary agents, the main agent must pass compact Skill routing constraints into each subtask.

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

## Output Discipline

Do not expose internal routing details unless useful.

For normal tasks, focus on the final deliverable.

For high-risk tasks, clearly explain the risk and ask for confirmation before execution.

For code tasks, include only useful implementation notes, verification steps, and important tradeoffs.	