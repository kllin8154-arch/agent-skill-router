~~~markdown
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

```text
C:\Users\<你的用户名>\.claude\skills
C:\Users\<你的用户名>\.codex\skills
C:\Users\<你的用户名>\.agents\skills
~~~

核心文件：

```text
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

------

## 编程任务强制基础准则

凡是涉及编程相关任务，必须使用：

```text
{{PROGRAMMING_BASELINE_SKILL}}
```

适用范围：

- 写代码
- 改代码
- 重构代码
- 修 Bug
- 代码审查
- 接口设计
- 数据库设计
- 写测试
- 架构设计
- 技术方案
- 前端开发
- 后端开发
- DevOps 自动化
- AI Agent 开发

默认组合方式：

```text
{{PROGRAMMING_BASELINE_SKILL}} + 领域 Skill + 验证 / 安全 Skill
```

------

## UI 与设计系统任务

当任务涉及 UI、UX、设计系统、组件库、视觉规范、前端设计、后台管理系统 UI、页面原型、布局系统时，优先使用：

```text
{{DESIGN_SYSTEM_SKILL}}
{{FRONTEND_PATTERNS_SKILL}}
{{BROWSER_QA_SKILL}}
```

如果任务涉及代码落地，还必须使用：

```text
{{PROGRAMMING_BASELINE_SKILL}}
```

------

## 常见任务路由

### 前端任务

优先使用：

```text
{{PROGRAMMING_BASELINE_SKILL}}
{{FRONTEND_PATTERNS_SKILL}}
{{DESIGN_SYSTEM_SKILL}}
{{BROWSER_QA_SKILL}}
{{E2E_TESTING_SKILL}}
```

### 后端 / API 任务

优先使用：

```text
{{PROGRAMMING_BASELINE_SKILL}}
{{API_DESIGN_SKILL}}
{{SECURITY_REVIEW_SKILL}}
```

### 数据库任务

优先使用：

```text
{{PROGRAMMING_BASELINE_SKILL}}
{{DATABASE_MIGRATIONS_SKILL}}
{{POSTGRES_PATTERNS_SKILL}}
{{SECURITY_REVIEW_SKILL}}
```

### DevOps / 部署任务

优先使用：

```text
{{PROGRAMMING_BASELINE_SKILL}}
{{DEPLOYMENT_PATTERNS_SKILL}}
{{DOCKER_PATTERNS_SKILL}}
{{SAFETY_GUARD_SKILL}}
```

### 测试 / 验证任务

优先使用：

```text
{{PROGRAMMING_BASELINE_SKILL}}
{{TDD_WORKFLOW_SKILL}}
{{VERIFICATION_LOOP_SKILL}}
{{BROWSER_QA_SKILL}}
{{E2E_TESTING_SKILL}}
```

### 架构 / 方案任务

优先使用：

```text
{{BLUEPRINT_SKILL}}
{{API_DESIGN_SKILL}}
{{HEXAGONAL_ARCHITECTURE_SKILL}}
{{ARCHITECTURE_DECISION_RECORDS_SKILL}}
```

### AI Agent 工程任务

优先使用：

```text
{{PROGRAMMING_BASELINE_SKILL}}
{{AGENTIC_ENGINEERING_SKILL}}
{{EVAL_HARNESS_SKILL}}
```

------

## Skill 治理规则

当任务涉及新增、合并、删除、去重、更新或查找 Skill 时，必须使用：

```text
{{SKILL_GOVERNANCE_SKILL}}
```

新增 Skill 前必须先判断：

1. 是否已有 Skill 可以覆盖
2. 是否只是已有 Skill 的分支场景
3. 是否未来会重复使用
4. 是否能明确写出触发条件、输入、输出、流程和不适用场景

如果新需求与已有 Skill 相近，不新增 Skill，而是在已有 Skill 中增加分支场景。

------

## 外部 Skill 搜索规则

只有当本地没有合适 Skill 时，才允许去 GitHub 或外部来源查找。

禁止直接安装或复制未经审查的外部 Skill。

必须检查外部 Skill 是否存在：

- 删除文件、清空目录、格式化磁盘等危险命令
- 读取 token、cookie、SSH key、`.env` 等敏感信息
- 上传本地文件
- 执行远程脚本
- 混淆代码
- 依赖未知 MCP 服务
- 绕过用户确认执行高风险操作

通过审查后，只能提炼其思路，并改写成本地 Skill 草案。

------

## Agent Team / Subagent 分派规则

当使用 agent-team、subagent、子 Agent、并行 Agent、团队模式或动态创建临时 Agent 时，主 Agent 必须把精简后的 Skill 路由约束传递给子 Agent。

本规则只在多 Agent / 子 Agent 场景下生效，不影响普通单 Agent 任务。

主 Agent 应确保子 Agent 理解：

- 自己的角色定位
- 子任务目标边界
- 当前任务相关 Skill
- 是否涉及代码
- 是否必须使用 `{{PROGRAMMING_BASELINE_SKILL}}`
- 是否必须使用 `{{SKILL_GOVERNANCE_SKILL}}`
- 禁止一次性加载全部 Skill

这些是内部执行约束，不要求固定展示给用户。

主 Agent 汇总子 Agent 结果时，应：

- 去除重复建议
- 合并相近结论
- 消除互相冲突的方案
- 优先选择更简单、更安全、更符合项目现状的方案
- 删除不必要的过程性说明
- 输出符合用户当前任务要求的最终结果

不得因为存在本规则，就把简单任务强行拆分为多个 Agent。

```
# `templates/zh/codex/AGENTS.md`

```markdown
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

```text
C:\Users\<你的用户名>\.codex\skills
C:\Users\<你的用户名>\.agents\skills
C:\Users\<你的用户名>\.claude\skills
```

核心文件：

```text
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

------

## 编程任务强制基础准则

凡是涉及编程相关任务，必须使用：

```text
{{PROGRAMMING_BASELINE_SKILL}}
```

适用范围：

- 写代码
- 改代码
- 重构代码
- 修 Bug
- 代码审查
- 接口设计
- 数据库设计
- 写测试
- 架构设计
- 技术方案
- 前端开发
- 后端开发
- DevOps 自动化
- AI Agent 开发

默认组合方式：

```text
{{PROGRAMMING_BASELINE_SKILL}} + 领域 Skill + 验证 / 安全 Skill
```

------

## UI 与设计系统任务

当任务涉及 UI、UX、设计系统、组件库、视觉规范、前端设计、后台管理系统 UI、页面原型、布局系统时，优先使用：

```text
{{DESIGN_SYSTEM_SKILL}}
{{FRONTEND_PATTERNS_SKILL}}
{{BROWSER_QA_SKILL}}
```

如果任务涉及代码落地，还必须使用：

```text
{{PROGRAMMING_BASELINE_SKILL}}
```

------

## Skill 治理规则

当任务涉及新增、合并、删除、去重、更新或查找 Skill 时，必须使用：

```text
{{SKILL_GOVERNANCE_SKILL}}
```

新增 Skill 前必须先判断：

1. 是否已有 Skill 可以覆盖
2. 是否只是已有 Skill 的分支场景
3. 是否未来会重复使用
4. 是否能明确写出触发条件、输入、输出、流程和不适用场景

如果新需求与已有 Skill 相近，不新增 Skill，而是在已有 Skill 中增加分支场景。

------

## 外部 Skill 搜索规则

只有当本地没有合适 Skill 时，才允许去 GitHub 或外部来源查找。

禁止直接安装或复制未经审查的外部 Skill。

必须检查外部 Skill 是否存在：

- 删除文件、清空目录、格式化磁盘等危险命令
- 读取 token、cookie、SSH key、`.env` 等敏感信息
- 上传本地文件
- 执行远程脚本
- 混淆代码
- 依赖未知 MCP 服务
- 绕过用户确认执行高风险操作

通过审查后，只能提炼其思路，并改写成本地 Skill 草案。

------

## Agent Team / Subagent 分派规则

当使用 agent-team、subagent、子 Agent、并行 Agent、团队模式或动态创建临时 Agent 时，主 Agent 必须把精简后的 Skill 路由约束传递给子 Agent。

本规则只在多 Agent / 子 Agent 场景下生效，不影响普通单 Agent 任务。

主 Agent 应确保子 Agent 理解：

- 自己的角色定位
- 子任务目标边界
- 当前任务相关 Skill
- 是否涉及代码
- 是否必须使用 `{{PROGRAMMING_BASELINE_SKILL}}`
- 是否必须使用 `{{SKILL_GOVERNANCE_SKILL}}`
- 禁止一次性加载全部 Skill

这些是内部执行约束，不要求固定展示给用户。

主 Agent 汇总子 Agent 结果时，应：

- 去除重复建议
- 合并相近结论
- 消除互相冲突的方案
- 优先选择更简单、更安全、更符合项目现状的方案
- 删除不必要的过程性说明
- 输出符合用户当前任务要求的最终结果

不得因为存在本规则，就把简单任务强行拆分为多个 Agent。

```
# `templates/zh/shared/技能速查手册-ZH.md`

```markdown
# 技能速查手册-ZH

本文件是人类可读的 Skill 清单。

请与 `skill-index.json` 配合使用。

Agent 应优先读取 `skill-index.json`，只有在索引信息不足或需要人工理解时，再读取本文件。

---

## 核心 Skill 参数

| 参数 | 默认建议 Skill | 用途 |
|---|---|---|
| `{{PROGRAMMING_BASELINE_SKILL}}` | `karpathy-guidelines` | 编程任务强制基础准则 |
| `{{SKILL_GOVERNANCE_SKILL}}` | `skill-governance` | Skill 治理与去重 |
| `{{DESIGN_SYSTEM_SKILL}}` | `design-system` | UI 设计系统 |
| `{{FRONTEND_PATTERNS_SKILL}}` | `frontend-patterns` | 前端模式 |
| `{{BROWSER_QA_SKILL}}` | `browser-qa` | 浏览器 UI 验证 |
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
| `{{BLUEPRINT_SKILL}}` | `blueprint` | 规划与任务拆解 |
| `{{ARCHITECTURE_DECISION_RECORDS_SKILL}}` | `architecture-decision-records` | 架构决策记录 |
| `{{HEXAGONAL_ARCHITECTURE_SKILL}}` | `hexagonal-architecture` | 六边形架构 |
| `{{AGENTIC_ENGINEERING_SKILL}}` | `agentic-engineering` | Agent 工程 |
| `{{EVAL_HARNESS_SKILL}}` | `eval-harness` | 评估框架 |

---

## 快速选 Skill

### 任意编程任务

使用：

```text
{{PROGRAMMING_BASELINE_SKILL}} + 领域 Skill + 验证 / 安全 Skill
```

### UI / 设计系统任务

使用：

```text
{{DESIGN_SYSTEM_SKILL}}
{{FRONTEND_PATTERNS_SKILL}}
{{BROWSER_QA_SKILL}}
```

如果涉及代码实现，还需要使用：

```text
{{PROGRAMMING_BASELINE_SKILL}}
```

### 前端实现任务

使用：

```text
{{PROGRAMMING_BASELINE_SKILL}}
{{FRONTEND_PATTERNS_SKILL}}
{{DESIGN_SYSTEM_SKILL}}
{{BROWSER_QA_SKILL}}
```

### 后端 / API 任务

使用：

```text
{{PROGRAMMING_BASELINE_SKILL}}
{{API_DESIGN_SKILL}}
{{SECURITY_REVIEW_SKILL}}
```

### 数据库任务

使用：

```text
{{PROGRAMMING_BASELINE_SKILL}}
{{DATABASE_MIGRATIONS_SKILL}}
{{POSTGRES_PATTERNS_SKILL}}
```

### DevOps / 部署任务

使用：

```text
{{PROGRAMMING_BASELINE_SKILL}}
{{DEPLOYMENT_PATTERNS_SKILL}}
{{DOCKER_PATTERNS_SKILL}}
{{SAFETY_GUARD_SKILL}}
```

### 测试任务

使用：

```text
{{PROGRAMMING_BASELINE_SKILL}}
{{TDD_WORKFLOW_SKILL}}
{{VERIFICATION_LOOP_SKILL}}
{{E2E_TESTING_SKILL}}
```

### Skill 管理任务

使用：

```text
{{SKILL_GOVERNANCE_SKILL}}
```

------

## 注意事项

- 不要一次性加载全部 Skill
- 优先使用本地 Skill
- 相近 Skill 优先合并为分支场景
- 只有本地没有合适 Skill 时，才去 GitHub 查找
- 外部 Skill 必须先安全审查，再决定是否改写为本地 Skill

```
# `templates/zh/shared/skill-governance/SKILL.md`

```markdown
---
name: skill-governance
description: 管理 Skill 的新增、合并、去重、索引维护、速查手册更新和外部 Skill 安全审查。
---

# Skill Governance

## 适用场景

当任务涉及以下内容时，使用本 Skill：

- 新增 Skill
- 修改 Skill
- 合并 Skill
- 删除 Skill
- 去重 Skill
- 更新 `skill-index.json`
- 更新 Skill 速查手册
- 审查外部 Skill
- 从 GitHub 查找可复用 Skill 思路
- 设计 Skill 路由规则
- 降低 Skill 过多导致的上下文浪费

核心目标：

```text
少量高质量 Skill
+ 清晰触发条件
+ 可维护索引
+ 相近场景写分支
+ 本地缺失时才外部搜索
```

------

## 本地文件

常见文件：

```text
skill-index.json
技能速查手册-ZH.md
{{SKILL_GOVERNANCE_SKILL}}\SKILL.md
```

如果索引和速查手册冲突，应检查实际 Skill 文件夹和 `SKILL.md` 内容，然后同步更新两份文件。

------

## 去重策略

以下情况不新增 Skill：

- 已有 Skill 覆盖大部分工作流
- 新需求只是已有 Skill 的一个分支
- 名称不同，但输入、输出、流程基本相同
- 只是通用 Skill 的业务化表达
- 未来复用概率低
- 可以通过给已有 Skill 增加分支场景解决

只有以下情况才新增 Skill：

- 现有 Skill 无法覆盖核心流程
- 不是已有 Skill 的小分支
- 不是单纯换名
- 未来会重复使用
- 能明确写出触发条件、输入、输出、工作流程和不适用场景
- 能说明为什么不能合并到已有 Skill

------

## 相似度检查

新增 Skill 前，对比：

| 维度     | 判断问题                   |
| -------- | -------------------------- |
| 任务目标 | 是否解决同一类问题         |
| 输入内容 | 是否接收类似输入           |
| 输出结果 | 是否产出类似结果           |
| 操作流程 | 是否步骤高度重合           |
| 技术栈   | 是否只是换了框架或工具名称 |
| 工具依赖 | 是否使用相同工具           |
| 风险控制 | 是否存在相同风险           |
| 复用频率 | 是否未来会重复使用         |

------

## 分支场景规则

如果新需求与已有 Skill 意义相近，但存在有价值的分支差异，不新增 Skill。

应在已有 Skill 中增加分支场景。

分支场景模板：

```markdown
## 分支场景

### 分支：<名称>

适用于：

不适用于：

触发关键词：

处理流程：

风险点：

推荐组合 Skill：
```

------

## 外部 Skill 审查

只有本地没有合适 Skill 时，才允许查找 GitHub 或外部来源。

禁止直接安装或复制未经审查的外部 Skill。

必须检查外部 Skill 是否：

- 包含破坏性命令
- 读取 `.env`、SSH key、token、cookie、浏览器数据
- 上传本地文件
- 执行远程脚本
- 包含混淆代码
- 依赖未知 MCP 服务
- 要求过高权限
- 绕过用户确认执行高风险操作

审查后：

1. 提炼有用思路
2. 改写成本地 Skill 草案
3. 执行去重分析
4. 判断是新增还是合并
5. 更新 `skill-index.json`
6. 更新速查手册

------

## Skill 修改输出要求

涉及 Skill 修改时，总结：

```text
处理结果：
- 是否新增 Skill：
- 是否合并到已有 Skill：
- 修改了哪些文件：
- 为什么这样处理：
- 后续如何触发：
```

普通任务中不要暴露不必要的内部分析。

```
# `templates/zh/shared/skill-template/SKILL.md`

```markdown
---
name: skill-name
description: 用一句话说明该 Skill 解决什么问题，以及何时应该使用。
---

# Skill Name

## 目标

说明该 Skill 的核心目标。

## 适用场景

当出现以下场景时使用：

- 场景 1
- 场景 2
- 场景 3

## 不适用场景

以下情况不使用：

- 不适用场景 1
- 不适用场景 2

## 触发关键词

- 关键词 1
- 关键词 2
- 关键词 3

## 推荐组合 Skill

- {{PROGRAMMING_BASELINE_SKILL}}
- related-skill-a
- related-skill-b

## 输入

典型输入：

- 输入 1
- 输入 2

## 输出

期望输出：

- 输出 1
- 输出 2

## 工作流程

### 步骤 1：理解任务

说明如何理解任务。

### 步骤 2：选择最小有效方案

说明如何选择实现或分析方式。

### 步骤 3：执行

说明执行规则。

### 步骤 4：验证

说明验证规则。

## 分支场景

### 分支：示例

适用于：

不适用于：

处理流程：

风险点：

推荐组合 Skill：

## 风险控制

- 风险控制 1
- 风险控制 2

## 完成标准

- 标准 1
- 标准 2
```