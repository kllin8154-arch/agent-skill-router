# Global Codex Agent Rules

## Language

Respond in the user's language by default.

Do not force a specific response language unless the user explicitly asks for one.

## Purpose

This file defines the global persistent behavior rules for Codex.

It is intended to be copied to: `<USER_HOME>/.codex/AGENTS.md`

## Coding Standards

- Use clear, readable, maintainable code.
- Use English variable, function, class, and file names unless the project convention requires otherwise.
- Prefer small, focused changes over broad rewrites.
- Before modifying code, analyze the impact scope. Do not refactor unrelated code.
- Do not introduce new dependencies unless necessary.
- Ask for confirmation before adding production dependencies, changing deployment configuration, deleting files, modifying database schemas, or running high-risk commands.

## Codex Skill Roots

```
<USER_HOME>/.agents/skills    (recommended neutral root)
<USER_HOME>/.codex/skills     (optional mirror)
<USER_HOME>/.claude/skills    (optional shared)
```

## Core Skill Files

```
skill-index.json
Skill-Quick-Reference-EN.md
{{SKILL_GOVERNANCE_SKILL}}/SKILL.md
```

## Skill Routing Rules

Complex tasks include: programming, bug fixing, code review, API design, database design, UI/UX design, design systems, testing, DevOps, security review, AI Agent development, Skill management, multi-agent workflows.

Routing order:

1. Check skill-index.json
2. If needed, check Skill-Quick-Reference-EN.md
3. Identify task type, role, tech stack, keywords, expected output
4. Load only the 1-3 most relevant Skills
5. Do not load all Skills at once
6. Prefer local Skills before external search

## Mandatory Programming Baseline

For any programming task: `{{PROGRAMMING_BASELINE_SKILL}}`

Default: `{{PROGRAMMING_BASELINE_SKILL}} + domain Skill + verification or security Skill`

## UI and Design System Tasks

`{{DESIGN_SYSTEM_SKILL}}  {{FRONTEND_PATTERNS_SKILL}}  {{BROWSER_QA_SKILL}}`

## Common Skill Routing

| Task Type | Recommended Skills |
|-----------|-------------------|
| Frontend | `{{PROGRAMMING_BASELINE_SKILL}} {{FRONTEND_PATTERNS_SKILL}} {{DESIGN_SYSTEM_SKILL}} {{BROWSER_QA_SKILL}} {{E2E_TESTING_SKILL}}` |
| Backend/API | `{{PROGRAMMING_BASELINE_SKILL}} {{API_DESIGN_SKILL}} {{SECURITY_REVIEW_SKILL}}` |
| Database | `{{PROGRAMMING_BASELINE_SKILL}} {{DATABASE_MIGRATIONS_SKILL}} {{POSTGRES_PATTERNS_SKILL}} {{SECURITY_REVIEW_SKILL}}` |
| DevOps | `{{PROGRAMMING_BASELINE_SKILL}} {{DEPLOYMENT_PATTERNS_SKILL}} {{DOCKER_PATTERNS_SKILL}} {{SAFETY_GUARD_SKILL}}` |
| Testing | `{{PROGRAMMING_BASELINE_SKILL}} {{TDD_WORKFLOW_SKILL}} {{VERIFICATION_LOOP_SKILL}} {{BROWSER_QA_SKILL}} {{E2E_TESTING_SKILL}}` |
| Architecture | `{{BLUEPRINT_SKILL}} {{API_DESIGN_SKILL}} {{HEXAGONAL_ARCHITECTURE_SKILL}} {{ARCHITECTURE_DECISION_RECORDS_SKILL}}` |
| AI Agent | `{{PROGRAMMING_BASELINE_SKILL}} {{AGENTIC_ENGINEERING_SKILL}} {{EVAL_HARNESS_SKILL}}` |

## Skill Governance

For creating, merging, deduplicating, updating, or searching for Skills: `{{SKILL_GOVERNANCE_SKILL}}`

Before creating a new Skill: check for existing coverage, update existing if branch scenario, create only when genuinely new and reusable.
