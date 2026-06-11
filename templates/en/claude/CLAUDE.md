# Global Agent Rules

## Language

Respond in the user's language by default.

Do not force a specific output language unless the user explicitly requests one.

## Coding Standards

- Use clear, readable, maintainable code.
- Keep comments concise and useful.
- Use English variable and function names.
- Prefer small, focused changes over broad rewrites.
- Before modifying code, analyze the impact scope.
- If a requirement is ambiguous, state the ambiguity and make a reasonable minimal assumption.

## Skill Routing Rules

Typical Skill roots:

```
<USER_HOME>/.claude/skills
<USER_HOME>/.codex/skills
<USER_HOME>/.agents/skills
```

Core files:

```
skill-index.json
Skill-Quick-Reference-EN.md
{{SKILL_GOVERNANCE_SKILL}}/SKILL.md
```

For complex tasks:

1. Check skill-index.json
2. If needed, check Skill-Quick-Reference-EN.md
3. Identify task type, role, tech stack, keywords
4. Load only the 1-3 most relevant Skills
5. Do not load all Skills at once

## Mandatory Programming Baseline

For any programming task, the agent must use:

```
{{PROGRAMMING_BASELINE_SKILL}}
```

Applies to: writing code, modifying code, refactoring, bug fixing, code review, API design, database design, test writing, architecture design, technical planning, frontend, backend, DevOps, AI Agent development.

Default combination:

```
{{PROGRAMMING_BASELINE_SKILL}} + domain Skill + verification or security Skill
```

## UI and Design System Tasks

```
{{DESIGN_SYSTEM_SKILL}}  {{FRONTEND_PATTERNS_SKILL}}  {{BROWSER_QA_SKILL}}
```

## Common Skill Routing

### Frontend

```
{{PROGRAMMING_BASELINE_SKILL}} {{FRONTEND_PATTERNS_SKILL}} {{DESIGN_SYSTEM_SKILL}} {{BROWSER_QA_SKILL}} {{E2E_TESTING_SKILL}}
```

### Backend / API

```
{{PROGRAMMING_BASELINE_SKILL}} {{API_DESIGN_SKILL}} {{SECURITY_REVIEW_SKILL}}
```

### Database

```
{{PROGRAMMING_BASELINE_SKILL}} {{DATABASE_MIGRATIONS_SKILL}} {{POSTGRES_PATTERNS_SKILL}} {{SECURITY_REVIEW_SKILL}}
```

### DevOps / Deployment

```
{{PROGRAMMING_BASELINE_SKILL}} {{DEPLOYMENT_PATTERNS_SKILL}} {{DOCKER_PATTERNS_SKILL}} {{SAFETY_GUARD_SKILL}}
```

### Testing / Verification

```
{{PROGRAMMING_BASELINE_SKILL}} {{TDD_WORKFLOW_SKILL}} {{VERIFICATION_LOOP_SKILL}} {{BROWSER_QA_SKILL}} {{E2E_TESTING_SKILL}}
```

### Architecture / Planning

```
{{BLUEPRINT_SKILL}} {{API_DESIGN_SKILL}} {{HEXAGONAL_ARCHITECTURE_SKILL}} {{ARCHITECTURE_DECISION_RECORDS_SKILL}}
```

### AI Agent Engineering

```
{{PROGRAMMING_BASELINE_SKILL}} {{AGENTIC_ENGINEERING_SKILL}} {{EVAL_HARNESS_SKILL}}
```

## Skill Governance

For creating, merging, deduplicating, updating, or searching for Skills, use:

```
{{SKILL_GOVERNANCE_SKILL}}
```

Before creating a new Skill: check for existing coverage, update existing if branch scenario, create only when genuinely new and reusable.
