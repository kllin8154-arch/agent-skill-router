# Agent Skill Router

A local skill routing and governance template for Claude Code and Codex.

## Overview

Agent Skill Router is a local template and rule system for managing AI Agent Skills.

Its goal is to help coding agents such as Claude Code and Codex automatically choose the right Skill before starting a task, based on the task type, role, tech stack, keywords, and expected output.

This project focuses on solving the following problems:

- Agents do not proactively find the right Skill
- New sessions often forget role-specific Skill rules
- Too many Skills lead to duplication and maintenance issues
- Coding agents lack a shared code quality baseline
- New Skills are added without updating the index or manual
- When no local Skill exists, agents do not know how to safely search GitHub
- Claude Code and Codex rules are hard to maintain consistently

This project provides a reusable, extensible, and maintainable local template.

------

## Key Features

- Task-based Skill routing
- Role-based Skill routing
- Mandatory `karpathy-guidelines` for programming tasks
- New Skill admission review
- Merge similar Skills into branch scenarios
- Maintain `skill-index.json`
- Maintain `Skill-Quick-Reference-EN.md`
- Claude Code and Codex support
- GitHub external Skill security review workflow
- Context budget control by avoiding loading all Skills at once

------

## Supported Targets

This template is designed for:

- Claude Code
- Codex CLI
- Codex IDE Extension
- Local Skills
- User-level agent rules
- Project-level agent rules
- Skill index management
- Skill deduplication
- Skill merging
- Skill governance
- Agent rule templates

------

## Recommended Repository Structure

```text
agent-skill-router/
├─ README.md
├─ README-ZH.md
├─ LICENSE
├─ .gitignore
├─ docs/
│  ├─ concept-zh.md
│  ├─ claude-setup-zh.md
│  ├─ codex-setup-zh.md
│  ├─ skill-governance-zh.md
│  └─ security-zh.md
├─ templates/
│  ├─ claude/
│  │  ├─ CLAUDE.md
│  │  └─ skills/
│  ├─ codex/
│  │  ├─ AGENTS.md
│  │  └─ skills/
│  └─ shared/
│     ├─ skill-index.json
│     ├─ Skill-Quick-Reference-EN.md
│     ├─ skill-governance/
│     │  └─ SKILL.md
│     └─ skill-template/
│        └─ SKILL.md
├─ scripts/
│  ├─ install-claude.ps1
│  ├─ install-codex.ps1
│  ├─ sync-skills.ps1
│  └─ validate-skill-index.ps1
└─ examples/
   ├─ minimal-example/
   ├─ claude-example/
   └─ codex-example/
```

------

## Core Files

| File                           | Description                                                  |
| ------------------------------ | ------------------------------------------------------------ |
| `CLAUDE.md`                    | Global rule entry for Claude Code                            |
| `AGENTS.md`                    | Global rule entry for Codex                                  |
| `skill-index.json`             | Machine-readable Skill routing index                         |
| `Skill-Quick-Reference-EN.md`  | Human-readable Skill manual                                  |
| `skill-governance/SKILL.md`    | Rules for creating, merging, deduplicating, and maintaining Skills |
| `skill-template/SKILL.md`      | Standard template for creating a new Skill                   |
| `karpathy-guidelines/SKILL.md` | Mandatory baseline guidelines for programming agents         |

------

## How It Works

### 1. Skill Routing

Before starting a task, the agent selects Skills based on:

- User-specified role
- Task type
- Tech stack
- Keywords
- Expected output
- Risk level

By default, only 1 to 3 relevant Skills should be loaded to avoid wasting context.

------

### 2. Mandatory Programming Baseline

Any programming-related task must load:

```text
karpathy-guidelines
```

This applies to:

- Writing code
- Modifying code
- Fixing bugs
- Refactoring
- Code review
- API design
- Database design
- Testing
- Architecture design
- Technical planning
- Frontend development
- Backend development
- DevOps automation
- AI Agent development

Default combination:

```text
karpathy-guidelines + domain Skill + verification / security Skill
```

Examples:

```text
Java / Spring Boot:
karpathy-guidelines + springboot-patterns + springboot-security

Frontend:
karpathy-guidelines + frontend-patterns + browser-qa

Database:
karpathy-guidelines + database-migrations + postgres-patterns

DevOps:
karpathy-guidelines + deployment-patterns + safety-guard

Bug fixing:
karpathy-guidelines + tdd-workflow + verification-loop
```

------

### 3. Skill Governance

Before adding a new Skill, the agent must check whether a similar Skill already exists.

If an existing Skill can cover the task, do not create a new Skill.

If the new requirement is only a branch scenario, add it to the existing Skill.

A new Skill should only be created when:

- Existing Skills cannot cover the core workflow
- It is not a small branch of an existing Skill
- It is not just a renamed version of an existing concept
- It will be reused frequently
- It has clear triggers, inputs, outputs, workflow, and avoid conditions

------

### 4. GitHub External Skill Review

GitHub search is allowed only when no suitable local Skill exists.

Do not directly install external Skills without review.

The agent must check whether the external Skill:

- Contains destructive commands
- Reads `.env`, SSH keys, tokens, or cookies
- Uploads local files
- Executes remote scripts
- Contains obfuscated code
- Depends on unknown MCP services
- Bypasses user confirmation for high-risk operations

After review, the agent should extract ideas and rewrite them as a local Skill draft instead of copying blindly.

------

## Claude Code Installation

Run:

```powershell
.\scripts\install-claude.ps1
```

Default target:

```text
C:\Users\<your-user-name>\.claude
```

------

## Codex Installation

Run:

```powershell
.\scripts\install-codex.ps1
```

Default targets:

```text
C:\Users\<your-user-name>\.codex
C:\Users\<your-user-name>\.agents\skills
```

------

## Sync Skills

Run:

```powershell
.\scripts\sync-skills.ps1
```

Recommended neutral source directory:

```text
C:\Users\<your-user-name>\.agents\skills
```

Sync targets:

```text
C:\Users\<your-user-name>\.claude\skills
C:\Users\<your-user-name>\.codex\skills
```

------

## Recommended Prompt

For a new Claude Code or Codex session:

```text
Please follow the local global rules first.

Before handling the task, check skill-index.json and the Skill manual.

If this is a programming task, you must load karpathy-guidelines.

Then select only 1 to 3 relevant Skills based on the task type.

Do not load all Skills at once.
```

------

## Security Notice

Before publishing or syncing, do not commit:

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

This project should only include templates, rules, sanitized examples, and installation scripts.

------

## Who Is This For?

This project is for:

- Claude Code users
- Codex users
- AI Agent engineering practitioners
- Developers maintaining local Skills
- Individual developers who want to reduce repetitive prompting
- Engineering teams standardizing Agent rules
- Builders of local AI coding workflows

------

## Roadmap

-  Claude Code template
-  Codex template
-  PowerShell installation scripts
-  Skill index validation script
-  Skill deduplication helper
-  Example Skills
-  English documentation
-  Project-level Agent rule templates
-  Cross-platform Bash installer

------

## License

MIT License