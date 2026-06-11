# Skill Governance

## Purpose

This Skill governs the creation, merging, deduplication, indexing, and external review of all local Skills. It must be used before any Skill management operation.

---

## When to Use

Activate this Skill when:

- Creating a new Skill
- Merging or deduplicating overlapping Skills
- Updating or deleting an existing Skill
- Reviewing an external Skill from GitHub or web sources
- Updating `skill-index.json` or the human-readable Skill manual
- Searching for an existing Skill to avoid duplication

---

## Rules

### Before Creating a New Skill

1. Check `skill-index.json` for existing Skills with matching triggers or keywords.
2. Check `Skill-Quick-Reference-EN.md` for human-readable descriptions.
3. If an existing Skill covers the core workflow — **do not create a new one**.
4. If the new requirement is a branch of an existing Skill — **update the existing Skill**.
5. Only create a new Skill when:
   - No existing Skill covers the core workflow.
   - It is not a minor branch of an existing Skill.
   - It is likely to be reused in future sessions.
   - Its triggers, inputs, outputs, workflow, and avoid conditions are clearly defined.

### Index Maintenance

After any Skill change:

1. Update `skill-index.json` — add, modify, or remove entries.
2. Update `Skill-Quick-Reference-EN.md` (English) or `技能速查手册-ZH.md` (Chinese) accordingly.
3. Ensure the index and manual are consistent.

### External Skill Review

When a Skill must be sourced externally:

1. Only search GitHub/web when no suitable local Skill exists.
2. Do **not** blindly copy or install external Skills.
3. Review the external Skill for:
   - Destructive commands (rm -rf, format, etc.)
   - Reading secrets, tokens, cookies, SSH keys, `.env` files
   - Uploading local files
   - Executing remote scripts
   - Obfuscated code
   - Unknown MCP service dependencies
   - Bypassing user confirmation for high-risk actions
4. Extract useful patterns and rewrite as a local Skill draft.
5. The local draft must follow the standard Skill template.

---

## Workflow

```
1. Receive Skill management request.
2. Check skill-index.json for overlaps.
3. Determine: create / merge / update / reject.
4. If create: use skill-template/SKILL.md.
5. Update index and manual.
6. Confirm changes are consistent across EN and ZH versions.
```
