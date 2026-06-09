# README-ZH.md

```
# Agent Skill Router

面向 Claude Code、Codex 以及其他编程 Agent 的本地 Skill 路由与治理模板。

Agent Skill Router 用于帮助 AI Agent 根据任务类型、角色、技术栈和关键词自动选择合适的本地 Skill，同时提供 Skill 新增、合并、去重、外部 Skill 安全审查等治理规则，避免重复创建、重复加载和上下文浪费。

[English README](./README.md)

---

## 项目目标

很多 AI 编程工作流都会遇到类似问题：

- Agent 不会主动寻找合适 Skill
- 新开窗口后忘记角色对应 Skill
- Skill 越加越多，出现重复、相近、难维护的问题
- 编程 Agent 缺少统一的工程质量准则
- 新增 Skill 后没有同步更新索引和清单
- 本地没有 Skill 时，容易直接从 GitHub 复制外部内容
- Claude Code 与 Codex 的规则体系难以统一维护

本项目提供一套中英文双版本模板，适合个人开发者和团队使用。

---

## 英文版与中文版

本仓库提供两套模板：

```text
templates/en
templates/zh
```

### 英文版模板

英文版适合国外用户和国际团队。

不强制指定输出语言，Agent 默认使用用户输入语言回复。

### 中文版模板

中文版适合国内用户和中文开发团队。

默认要求 Agent 使用中文回复，并保留中文开发环境常用约定。

------

## 推荐目录结构

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

## 核心文件说明

| 文件                          | 说明                                 |
| ----------------------------- | ------------------------------------ |
| `CLAUDE.md`                   | Claude Code 的全局规则入口           |
| `AGENTS.md`                   | Codex 的全局规则入口                 |
| `skill-index.json`            | 机器可读的 Skill 路由索引            |
| `Skill-Quick-Reference-EN.md` | 英文版 Skill 速查手册                |
| `技能速查手册-ZH.md`          | 中文版 Skill 速查手册                |
| `skill-governance/SKILL.md`   | Skill 新增、合并、去重、外部审查规则 |
| `skill-template/SKILL.md`     | 新建 Skill 的标准模板                |

------

## Skill 名称参数说明

本项目使用参数代替写死的 Skill 名称。

你可以保留默认名称，也可以根据自己的本地 Skill 名称进行替换。

| 参数                                      | 默认建议 Skill                  | 用途                                    |
| ----------------------------------------- | ------------------------------- | --------------------------------------- |
| `{{PROGRAMMING_BASELINE_SKILL}}`          | `karpathy-guidelines`           | 编程任务强制基础准则                    |
| `{{SKILL_GOVERNANCE_SKILL}}`              | `skill-governance`              | Skill 新增、合并、去重和外部 Skill 审查 |
| `{{DESIGN_SYSTEM_SKILL}}`                 | `design-system`                 | UI 设计系统、视觉一致性、组件规范       |
| `{{FRONTEND_PATTERNS_SKILL}}`             | `frontend-patterns`             | 前端架构、组件模式、UI 实现             |
| `{{BROWSER_QA_SKILL}}`                    | `browser-qa`                    | 浏览器 UI 验证和可视化 QA               |
| `{{E2E_TESTING_SKILL}}`                   | `e2e-testing`                   | 端到端测试工作流                        |
| `{{TDD_WORKFLOW_SKILL}}`                  | `tdd-workflow`                  | 测试驱动开发流程                        |
| `{{VERIFICATION_LOOP_SKILL}}`             | `verification-loop`             | 构建、测试和验证循环                    |
| `{{SECURITY_REVIEW_SKILL}}`               | `security-review`               | 安全审查和风险分析                      |
| `{{SAFETY_GUARD_SKILL}}`                  | `safety-guard`                  | 高风险操作保护                          |
| `{{API_DESIGN_SKILL}}`                    | `api-design`                    | API 设计和 REST 规范                    |
| `{{DATABASE_MIGRATIONS_SKILL}}`           | `database-migrations`           | 数据库结构变更和迁移规划                |
| `{{POSTGRES_PATTERNS_SKILL}}`             | `postgres-patterns`             | PostgreSQL 及兼容数据库模式             |
| `{{DEPLOYMENT_PATTERNS_SKILL}}`           | `deployment-patterns`           | 部署、回滚、健康检查、生产就绪          |
| `{{DOCKER_PATTERNS_SKILL}}`               | `docker-patterns`               | Docker 和 Docker Compose 模式           |
| `{{BLUEPRINT_SKILL}}`                     | `blueprint`                     | 任务规划和拆解                          |
| `{{ARCHITECTURE_DECISION_RECORDS_SKILL}}` | `architecture-decision-records` | 架构决策记录                            |
| `{{HEXAGONAL_ARCHITECTURE_SKILL}}`        | `hexagonal-architecture`        | 六边形架构和端口适配器                  |
| `{{AGENTIC_ENGINEERING_SKILL}}`           | `agentic-engineering`           | AI Agent 工程工作流                     |
| `{{EVAL_HARNESS_SKILL}}`                  | `eval-harness`                  | Agent 评估驱动开发                      |

------

## 工作机制

### 1. Skill 路由

Agent 在处理复杂任务前，应当：

1. 检查 `skill-index.json`
2. 必要时检查人类可读的 Skill 速查手册
3. 识别任务类型、角色、技术栈、关键词和输出目标
4. 只加载最相关的 1 到 3 个 Skill
5. 避免一次性加载全部 Skill

------

### 2. 编程任务强制基础准则

涉及编程相关任务时，必须使用：

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

### 3. Skill 治理

新增 Skill 前必须先判断是否已有相近 Skill。

如果已有 Skill 可以覆盖大部分流程，不新增。

如果只是分支场景，写入已有 Skill。

只有满足以下条件时，才创建新 Skill：

- 现有 Skill 无法覆盖核心流程
- 不是已有 Skill 的小分支
- 不是单纯换名
- 未来会重复使用
- 能明确写出触发条件、输入、输出、工作流程和不适用场景

------

### 4. 外部 Skill 审查

只有本地没有合适 Skill 时，才允许查找 GitHub 或外部来源。

禁止直接安装或复制未经审查的外部 Skill。

必须检查外部 Skill 是否存在：

- 删除文件、清空目录、格式化磁盘等危险命令
- 读取 token、cookie、SSH key、`.env` 等敏感信息
- 上传本地文件
- 执行远程脚本
- 混淆代码
- 依赖未知 MCP 服务
- 绕过用户确认执行高风险操作

通过审查后，只能提炼思路，并改写成本地 Skill 草案。

------

## 安装脚本

安装脚本后续可放在 `scripts/` 目录。

推荐脚本：

```text
install-claude-en.ps1
install-claude-zh.ps1
install-codex-en.ps1
install-codex-zh.ps1
sync-skills.ps1
```

------

## 安全提醒

不要提交以下内容：

- API Key
- token
- cookie
- SSH key
- `.env`
- 内网 IP
- 私有项目配置
- 数据库连接信息
- 真实服务器巡检报告
- 公司内部文档
- 用户个人信息
- 生产环境配置

本仓库只建议提交模板、规则、脱敏示例和安装脚本。

------

## License

MIT License

