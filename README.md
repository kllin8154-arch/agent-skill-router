# `README.md`

~~~markdown
# Agent Skill Router

A local Skill routing and governance template for Claude Code, Codex, and other coding agents.

Agent Skill Router helps AI agents choose the right local Skill based on task type, role, tech stack, and keywords. It also provides governance rules to prevent duplicate Skills, reduce context waste, and safely review external Skills before adoption.

[中文文档](./README-ZH.md)

---

## Why This Project Exists

Many AI coding workflows eventually face the same problems:

- Agents do not proactively find the right Skill.
- New sessions forget role-specific rules.
- Skills become duplicated, overlapping, or hard to maintain.
- Coding agents lack a consistent engineering baseline.
- New Skills are added without updating an index or manual.
- Agents may blindly copy external Skills from GitHub.
- Claude Code and Codex rules are difficult to keep consistent.

This project provides a reusable bilingual template system for both international and Chinese users.

---

## English vs Chinese Templates

This repository provides two template sets:

```text
templates/en
templates/zh
~~~

### English Templates

The English templates are designed for international users.

They do **not** force any specific response language.

Agents should respond in the user's language by default.

### Chinese Templates

The Chinese templates are designed for Chinese users and Chinese development teams.

They default to Chinese responses and include Chinese documentation conventions.

------

## Recommended Structure

```text
agent-skill-router/
├─ README.md
├─ README-ZH.md
├─ LICENSE
├─ .gitignore
├─ templates/
│  ├─ en/
│  │  ├─ claude/
│  │  │  └─ CLAUDE.md
│  │  ├─ codex/
│  │  │  └─ AGENTS.md
│  │  └─ shared/
│  │     ├─ skill-index.json
│  │     ├─ Skill-Quick-Reference-EN.md
│  │     ├─ skill-governance/
│  │     │  └─ SKILL.md
│  │     └─ skill-template/
│  │        └─ SKILL.md
│  └─ zh/
│     ├─ claude/
│     │  └─ CLAUDE.md
│     ├─ codex/
│     │  └─ AGENTS.md
│     └─ shared/
│        ├─ skill-index.json
│        ├─ 技能速查手册-ZH.md
│        ├─ skill-governance/
│        │  └─ SKILL.md
│        └─ skill-template/
│           └─ SKILL.md
├─ scripts/
└─ docs/
```

------

## Core Files

| File                          | Purpose                                                      |
| ----------------------------- | ------------------------------------------------------------ |
| `CLAUDE.md`                   | Global rules for Claude Code                                 |
| `AGENTS.md`                   | Global rules for Codex                                       |
| `skill-index.json`            | Machine-readable Skill routing index                         |
| `Skill-Quick-Reference-EN.md` | English human-readable Skill manual                          |
| `技能速查手册-ZH.md`          | Chinese human-readable Skill manual                          |
| `skill-governance/SKILL.md`   | Skill creation, merging, deduplication, and external review rules |
| `skill-template/SKILL.md`     | Standard template for new Skills                             |

------

## Skill Name Parameters

This project uses parameters instead of hard-coded Skill names.

You can keep the default names or replace them with your own Skill names.

| Parameter                                 | Default Suggested Skill         | Purpose                                                      |
| ----------------------------------------- | ------------------------------- | ------------------------------------------------------------ |
| `{{PROGRAMMING_BASELINE_SKILL}}`          | `karpathy-guidelines`           | Mandatory baseline for programming tasks                     |
| `{{SKILL_GOVERNANCE_SKILL}}`              | `skill-governance`              | Skill creation, merging, deduplication, and external Skill review |
| `{{DESIGN_SYSTEM_SKILL}}`                 | `design-system`                 | UI design systems, visual consistency, component guidelines  |
| `{{FRONTEND_PATTERNS_SKILL}}`             | `frontend-patterns`             | Frontend architecture, component patterns, UI implementation |
| `{{BROWSER_QA_SKILL}}`                    | `browser-qa`                    | Browser-based UI validation and visual QA                    |
| `{{E2E_TESTING_SKILL}}`                   | `e2e-testing`                   | End-to-end testing workflows                                 |
| `{{TDD_WORKFLOW_SKILL}}`                  | `tdd-workflow`                  | Test-driven development workflow                             |
| `{{VERIFICATION_LOOP_SKILL}}`             | `verification-loop`             | Build, test, and verification loops                          |
| `{{SECURITY_REVIEW_SKILL}}`               | `security-review`               | Security review and risk analysis                            |
| `{{SAFETY_GUARD_SKILL}}`                  | `safety-guard`                  | High-risk operation protection                               |
| `{{API_DESIGN_SKILL}}`                    | `api-design`                    | API design and REST conventions                              |
| `{{DATABASE_MIGRATIONS_SKILL}}`           | `database-migrations`           | Database schema changes and migration planning               |
| `{{POSTGRES_PATTERNS_SKILL}}`             | `postgres-patterns`             | PostgreSQL and compatible database patterns                  |
| `{{DEPLOYMENT_PATTERNS_SKILL}}`           | `deployment-patterns`           | Deployment, rollback, health checks, production readiness    |
| `{{DOCKER_PATTERNS_SKILL}}`               | `docker-patterns`               | Docker and Docker Compose patterns                           |
| `{{BLUEPRINT_SKILL}}`                     | `blueprint`                     | Planning and task breakdown                                  |
| `{{ARCHITECTURE_DECISION_RECORDS_SKILL}}` | `architecture-decision-records` | Architecture decision records                                |
| `{{HEXAGONAL_ARCHITECTURE_SKILL}}`        | `hexagonal-architecture`        | Hexagonal architecture and ports/adapters                    |
| `{{AGENTIC_ENGINEERING_SKILL}}`           | `agentic-engineering`           | AI Agent engineering workflow                                |
| `{{EVAL_HARNESS_SKILL}}`                  | `eval-harness`                  | Evaluation-driven development for agents                     |

------

## How It Works

### 1. Skill Routing

Before handling a complex task, the agent should:

1. Check `skill-index.json`.
2. If needed, check the human-readable Skill manual.
3. Identify the task type, role, tech stack, keywords, and expected output.
4. Load only the 1 to 3 most relevant Skills.
5. Avoid loading all Skills at once.

------

### 2. Mandatory Programming Baseline

For programming-related work, the agent must use:

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

Default combination:

```text
{{PROGRAMMING_BASELINE_SKILL}} + domain Skill + verification or security Skill
```

------

### 3. Skill Governance

Before creating a new Skill, the agent must check whether a similar Skill already exists.

If an existing Skill covers most of the workflow, do not create a new Skill.

If the new requirement is only a branch scenario, update the existing Skill instead.

A new Skill should only be created when:

- Existing Skills cannot cover the core workflow.
- It is not a small branch of an existing Skill.
- It is not just a renamed concept.
- It is likely to be reused.
- It has clear triggers, inputs, outputs, workflow, and avoid conditions.

------

### 4. External Skill Review

GitHub or external search should only be used when no suitable local Skill exists.

Do not directly install or copy external Skills without review.

Before adopting an external Skill, check whether it:

- Contains destructive commands.
- Reads secrets, tokens, cookies, SSH keys, or `.env` files.
- Uploads local files.
- Executes remote scripts.
- Contains obfuscated code.
- Depends on unknown MCP services.
- Bypasses user confirmation for high-risk actions.

After review, extract useful ideas and rewrite them as a local Skill draft.

------

## Installation

Installation scripts can be added under `scripts/`.

Recommended future scripts:

```text
install-claude-en.ps1
install-claude-zh.ps1
install-codex-en.ps1
install-codex-zh.ps1
sync-skills.ps1
```

------

## Security Notice

Do not commit:

- API keys
- Tokens
- Cookies
- SSH keys
- `.env` files
- Internal IP addresses
- Private project configuration
- Database connection strings
- Real server inspection reports
- Company internal documents
- User personal information
- Production environment configuration

This repository should contain templates, rules, sanitized examples, and installation scripts only.

------

## License

MIT License
