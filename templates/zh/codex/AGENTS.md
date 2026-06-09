# `templates/zh/codex/AGENTS.md`

```
```markdown
# Codex 全局 Agent 规则

## 语言设置

请始终使用中文回复所有内容，包括代码解释、错误分析、建议和提问。

---

## 目标

本文件用于定义 Codex 的全局持久规则。

建议复制到：

```text
C:\Users\<你的用户名>\.codex\AGENTS.md
```

Codex 应通过本文件在不同会话、不同仓库、不同任务中保持一致行为。

## 编码规范

- 代码注释使用中文。
- 变量、函数、类和文件命名使用英文，除非项目已有约定不同。
- 提交信息格式：`<type>: <简短中文描述>`。
- 修改代码前先分析影响范围。
- 生成代码后只说明必要的关键设计决策。
- 遇到不确定需求时，先指出不确定点，并给出最小合理假设。
- 不要为了小问题阻塞整体推进。
- 不要重构无关代码。
- 不要引入不必要的新依赖。
- 添加生产依赖、修改部署配置、删除文件、修改数据库结构或执行高风险命令前，必须先请求确认。

## Codex Skill 根目录

推荐 Codex 用户级 Skill 根目录：

```
C:\Users\<你的用户名>\.agents\skills
```

可选 Codex 镜像 Skill 根目录：

```
C:\Users\<你的用户名>\.codex\skills
```

可选 Claude 共用 Skill 根目录：

```
C:\Users\<你的用户名>\.claude\skills
```

优先把 `C:\Users\<你的用户名>\.agents\skills` 作为中立的用户级 Skill 目录。

## 核心 Skill 文件

Codex 进行 Skill 路由时，应优先使用：

```
skill-index.json
技能速查手册-ZH.md
{{SKILL_GOVERNANCE_SKILL}}\SKILL.md
```

如果存在 `skill-index.json`，优先读取索引。

如果索引缺失或不完整，再读取 `技能速查手册-ZH.md`。

## Skill 调用规则

处理复杂任务前，必须判断是否需要使用本地 Skill。

复杂任务包括：

- 编程开发
- Bug 修复
- 代码审查
- API 设计
- 数据库设计
- UI / UX 设计
- 设计系统
- 测试
- DevOps / 部署
- 安全审查
- AI Agent 开发
- Skill 管理
- 多 Agent 工作流

路由顺序：

1. 检查 `skill-index.json`
2. 必要时检查 `技能速查手册-ZH.md`
3. 识别任务类型、角色、技术栈、关键词和输出目标
4. 只加载最相关的 1 到 3 个 Skill
5. 禁止一次性加载全部 Skill
6. 优先使用本地 Skill，再考虑外部搜索

## 编程任务强制基础准则

凡是涉及编程相关任务，必须使用：

```
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

```
{{PROGRAMMING_BASELINE_SKILL}} + 领域 Skill + 验证 / 安全 Skill
```

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

## 常见任务路由

### 前端任务

优先使用：

```
{{PROGRAMMING_BASELINE_SKILL}}
{{FRONTEND_PATTERNS_SKILL}}
{{DESIGN_SYSTEM_SKILL}}
{{BROWSER_QA_SKILL}}
{{E2E_TESTING_SKILL}}
```

### 后端 / API 任务

优先使用：

```
{{PROGRAMMING_BASELINE_SKILL}}
{{API_DESIGN_SKILL}}
{{SECURITY_REVIEW_SKILL}}
```

### 数据库任务

优先使用：

```
{{PROGRAMMING_BASELINE_SKILL}}
{{DATABASE_MIGRATIONS_SKILL}}
{{POSTGRES_PATTERNS_SKILL}}
{{SECURITY_REVIEW_SKILL}}
```

### DevOps / 部署任务

优先使用：

```
{{PROGRAMMING_BASELINE_SKILL}}
{{DEPLOYMENT_PATTERNS_SKILL}}
{{DOCKER_PATTERNS_SKILL}}
{{SAFETY_GUARD_SKILL}}
```

### 测试 / 验证任务

优先使用：

```
{{PROGRAMMING_BASELINE_SKILL}}
{{TDD_WORKFLOW_SKILL}}
{{VERIFICATION_LOOP_SKILL}}
{{BROWSER_QA_SKILL}}
{{E2E_TESTING_SKILL}}
```

### 架构 / 方案任务

优先使用：

```
{{BLUEPRINT_SKILL}}
{{API_DESIGN_SKILL}}
{{HEXAGONAL_ARCHITECTURE_SKILL}}
{{ARCHITECTURE_DECISION_RECORDS_SKILL}}
```

### AI Agent 工程任务

优先使用：

```
{{PROGRAMMING_BASELINE_SKILL}}
{{AGENTIC_ENGINEERING_SKILL}}
{{EVAL_HARNESS_SKILL}}
```

### Skill 管理任务

使用：

```
{{SKILL_GOVERNANCE_SKILL}}
```

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

## Agent Team / Subagent 分派规则

当使用 subagent、子 Agent、并行 Agent、agent-team 工作流或动态创建临时 Agent 时，主 Agent 必须把精简后的 Skill 路由约束传递给子 Agent。

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

## 输出克制原则

除非用户明确要求，否则不要暴露内部 Skill 路由细节。

普通任务聚焦最终交付结果。

高风险任务必须明确说明风险，并在执行前请求确认。

代码任务只输出必要的实现说明、验证步骤和关键取舍。