# 全局 Agent 规则

## 语言设置

请始终使用中文回复所有内容，包括代码解释、错误分析、建议和提问。

---

## 编码规范

- 代码注释使用中文
- 变量命名使用英文 camelCase
- 提交信息格式：`<type>: <简短中文描述>`
- 修改代码前先分析影响范围
- 生成代码后主动说明关键设计决策
- 遇到不确定需求时，先指出不确定点，并给出最小合理假设
- 不要为了小问题阻塞整体推进

---

## Skill 调用规则

Agent 在处理复杂任务前，必须判断是否需要使用本地 Skill。

常见 Skill 根目录：

```
C:\Users\<你的用户名>\.claude\skills
C:\Users\<你的用户名>\.codex\skills
C:\Users\<你的用户名>\.agents\skills
```

核心文件：

```
skill-index.json
技能速查手册-ZH.md
{{SKILL_GOVERNANCE_SKILL}}\SKILL.md
```

复杂任务执行顺序：

1. 优先检查 `skill-index.json`
2. 必要时检查 `技能速查手册-ZH.md`
3. 识别任务类型、角色、技术栈、关键词和输出目标
4. 只加载最相关的 1 到 3 个 Skill
5. 禁止一次性加载全部 Skill

---

## 编程任务强制基础准则

凡是涉及编程相关任务，必须使用：

```
{{PROGRAMMING_BASELINE_SKILL}}
```

适用范围：写代码、改代码、重构、修 Bug、代码审查、接口设计、数据库设计、写测试、架构设计、技术方案、前端开发、后端开发、DevOps 自动化、AI Agent 开发。

默认组合方式：

```
{{PROGRAMMING_BASELINE_SKILL}} + 领域 Skill + 验证 / 安全 Skill
```

---

## UI 与设计系统任务

当任务涉及 UI、UX、设计系统、组件库、视觉规范、前端设计、后台管理系统 UI、页面原型、布局系统时，优先使用：

```
{{DESIGN_SYSTEM_SKILL}}
{{FRONTEND_PATTERNS_SKILL}}
{{BROWSER_QA_SKILL}}
```

如果任务涉及代码落地，还必须使用：

```
{{PROGRAMMING_BASELINE_SKILL}}
```

---

## 常见任务路由

### 前端任务

```
{{PROGRAMMING_BASELINE_SKILL}}  {{FRONTEND_PATTERNS_SKILL}}  {{DESIGN_SYSTEM_SKILL}}  {{BROWSER_QA_SKILL}}  {{E2E_TESTING_SKILL}}
```

### 后端 / API 任务

```
{{PROGRAMMING_BASELINE_SKILL}}  {{API_DESIGN_SKILL}}  {{SECURITY_REVIEW_SKILL}}
```

### 数据库任务

```
{{PROGRAMMING_BASELINE_SKILL}}  {{DATABASE_MIGRATIONS_SKILL}}  {{POSTGRES_PATTERNS_SKILL}}  {{SECURITY_REVIEW_SKILL}}
```

### DevOps / 部署任务

```
{{PROGRAMMING_BASELINE_SKILL}}  {{DEPLOYMENT_PATTERNS_SKILL}}  {{DOCKER_PATTERNS_SKILL}}  {{SAFETY_GUARD_SKILL}}
```

### 测试 / 验证任务

```
{{PROGRAMMING_BASELINE_SKILL}}  {{TDD_WORKFLOW_SKILL}}  {{VERIFICATION_LOOP_SKILL}}  {{BROWSER_QA_SKILL}}  {{E2E_TESTING_SKILL}}
```

### 架构 / 方案任务

```
{{BLUEPRINT_SKILL}}  {{API_DESIGN_SKILL}}  {{HEXAGONAL_ARCHITECTURE_SKILL}}  {{ARCHITECTURE_DECISION_RECORDS_SKILL}}
```

### AI Agent 工程任务

```
{{PROGRAMMING_BASELINE_SKILL}}  {{AGENTIC_ENGINEERING_SKILL}}  {{EVAL_HARNESS_SKILL}}
```

---

## Skill 治理规则

当任务涉及新增、合并、删除、去重、更新或查找 Skill 时，必须使用：

```
{{SKILL_GOVERNANCE_SKILL}}
```

新增 Skill 前必须先判断：

1. 是否已有 Skill 可以覆盖
2. 是否只是已有 Skill 的分支场景
3. 是否未来会重复使用
4. 是否能明确写出触发条件、输入、输出、流程和不适用场景

如果新需求与已有 Skill 相近，不新增 Skill，而是在已有 Skill 中增加分支场景。
