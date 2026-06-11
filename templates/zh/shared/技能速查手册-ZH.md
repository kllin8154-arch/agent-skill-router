# 技能速查手册-ZH

本文件是人类可读的 Skill 清单。

请与 `skill-index.json` 配合使用。

Agent 应优先检查 `skill-index.json`。仅在索引缺失、不完整或需要人类可读概览时使用本文件。

---

## 核心 Skill 参数

| 参数 | 建议 Skill | 用途 |
|------|-----------|------|
| `{{PROGRAMMING_BASELINE_SKILL}}` | `karpathy-guidelines` | 编程任务强制基础准则 |
| `{{SKILL_GOVERNANCE_SKILL}}` | `skill-governance` | Skill 治理与去重 |
| `{{DESIGN_SYSTEM_SKILL}}` | `design-system` | UI 设计系统 |
| `{{FRONTEND_PATTERNS_SKILL}}` | `frontend-patterns` | 前端模式 |
| `{{BROWSER_QA_SKILL}}` | `browser-qa` | 浏览器 UI QA |
| `{{E2E_TESTING_SKILL}}` | `e2e-testing` | 端到端测试 |
| `{{TDD_WORKFLOW_SKILL}}` | `tdd-workflow` | 测试驱动开发 |
| `{{VERIFICATION_LOOP_SKILL}}` | `verification-loop` | 验证循环 |
| `{{SECURITY_REVIEW_SKILL}}` | `security-review` | 安全审查 |
| `{{SAFETY_GUARD_SKILL}}` | `safety-guard` | 高风险操作保护 |
| `{{API_DESIGN_SKILL}}` | `api-design` | API 设计 |
| `{{DATABASE_MIGRATIONS_SKILL}}` | `database-migrations` | 数据库迁移 |
| `{{POSTGRES_PATTERNS_SKILL}}` | `postgres-patterns` | PostgreSQL 模式 |
| `{{DEPLOYMENT_PATTERNS_SKILL}}` | `deployment-patterns` | 部署模式 |
| `{{DOCKER_PATTERNS_SKILL}}` | `docker-patterns` | Docker 模式 |
| `{{BLUEPRINT_SKILL}}` | `blueprint` | 方案规划与拆解 |
| `{{ARCHITECTURE_DECISION_RECORDS_SKILL}}` | `architecture-decision-records` | 架构决策记录 |
| `{{HEXAGONAL_ARCHITECTURE_SKILL}}` | `hexagonal-architecture` | 六边形架构 |
| `{{AGENTIC_ENGINEERING_SKILL}}` | `agentic-engineering` | Agent 工程 |
| `{{EVAL_HARNESS_SKILL}}` | `eval-harness` | 评估驱动开发 |

---

## 快速选择

### 任何编程任务

```
{{PROGRAMMING_BASELINE_SKILL}} + 领域 Skill + 验证/安全 Skill
```

### UI / 设计系统

```
{{DESIGN_SYSTEM_SKILL}}  {{FRONTEND_PATTERNS_SKILL}}  {{BROWSER_QA_SKILL}}
```

如需代码落地，还需使用 `{{PROGRAMMING_BASELINE_SKILL}}`。

### 前端开发

```
{{PROGRAMMING_BASELINE_SKILL}} {{FRONTEND_PATTERNS_SKILL}} {{DESIGN_SYSTEM_SKILL}} {{BROWSER_QA_SKILL}}
```

### 后端 / API

```
{{PROGRAMMING_BASELINE_SKILL}} {{API_DESIGN_SKILL}} {{SECURITY_REVIEW_SKILL}}
```

### 数据库

```
{{PROGRAMMING_BASELINE_SKILL}} {{DATABASE_MIGRATIONS_SKILL}} {{POSTGRES_PATTERNS_SKILL}} {{SECURITY_REVIEW_SKILL}}
```

### DevOps / 部署

```
{{PROGRAMMING_BASELINE_SKILL}} {{DEPLOYMENT_PATTERNS_SKILL}} {{DOCKER_PATTERNS_SKILL}} {{SAFETY_GUARD_SKILL}}
```

### 测试 / 验证

```
{{PROGRAMMING_BASELINE_SKILL}} {{TDD_WORKFLOW_SKILL}} {{VERIFICATION_LOOP_SKILL}} {{E2E_TESTING_SKILL}}
```

### 架构 / 方案

```
{{BLUEPRINT_SKILL}} {{API_DESIGN_SKILL}} {{HEXAGONAL_ARCHITECTURE_SKILL}} {{ARCHITECTURE_DECISION_RECORDS_SKILL}}
```

### AI Agent 工程

```
{{PROGRAMMING_BASELINE_SKILL}} {{AGENTIC_ENGINEERING_SKILL}} {{EVAL_HARNESS_SKILL}}
```

### Skill 管理

```
{{SKILL_GOVERNANCE_SKILL}}
```

## 注意事项

- 不要一次性加载全部 Skill
- 优先使用本地 Skill，再考虑外部搜索
- 相近 Skill 合并为分支场景
- 仅无本地 Skill 匹配时才搜索 GitHub
- 外部 Skill 必须先审查再采用
- 面向用户的输出聚焦实际任务结果
