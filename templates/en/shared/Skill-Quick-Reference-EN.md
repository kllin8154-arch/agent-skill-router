# `templates/en/shared/Skill-Quick-Reference-EN.md`

```
# Skill Quick Reference

This file is a human-readable Skill manual.

Use it together with `skill-index.json`.

The agent should check `skill-index.json` first.  
Only use this file when the index is missing, incomplete, or when a human-readable overview is needed.

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

```
{{DESIGN_SYSTEM_SKILL}}
{{FRONTEND_PATTERNS_SKILL}}
{{BROWSER_QA_SKILL}}
```

If implementation is required, also use:

```
{{PROGRAMMING_BASELINE_SKILL}}
```

### Frontend Implementation

Use:

```
{{PROGRAMMING_BASELINE_SKILL}}
{{FRONTEND_PATTERNS_SKILL}}
{{DESIGN_SYSTEM_SKILL}}
{{BROWSER_QA_SKILL}}
```

### Backend / API

Use:

```
{{PROGRAMMING_BASELINE_SKILL}}
{{API_DESIGN_SKILL}}
{{SECURITY_REVIEW_SKILL}}
```

### Database

Use:

```
{{PROGRAMMING_BASELINE_SKILL}}
{{DATABASE_MIGRATIONS_SKILL}}
{{POSTGRES_PATTERNS_SKILL}}
{{SECURITY_REVIEW_SKILL}}
```

### DevOps / Deployment

Use:

```
{{PROGRAMMING_BASELINE_SKILL}}
{{DEPLOYMENT_PATTERNS_SKILL}}
{{DOCKER_PATTERNS_SKILL}}
{{SAFETY_GUARD_SKILL}}
```

### Testing / Verification

Use:

```
{{PROGRAMMING_BASELINE_SKILL}}
{{TDD_WORKFLOW_SKILL}}
{{VERIFICATION_LOOP_SKILL}}
{{E2E_TESTING_SKILL}}
```

### Architecture / Planning

Use:

```
{{BLUEPRINT_SKILL}}
{{API_DESIGN_SKILL}}
{{HEXAGONAL_ARCHITECTURE_SKILL}}
{{ARCHITECTURE_DECISION_RECORDS_SKILL}}
```

### AI Agent Engineering

Use:

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

## Notes

- Do not load all Skills at once.
- Prefer local Skills before external search.
- Merge similar Skills into branch scenarios.
- Use GitHub only when no local Skill fits.
- Review external Skills before adopting them.
- Keep user-facing output focused on the actual task result.

```

```