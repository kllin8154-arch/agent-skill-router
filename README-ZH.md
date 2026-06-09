# Agent Skill Router

面向 Claude Code 与 Codex 的本地 Skill 路由与治理模板。

## 项目简介

Agent Skill Router 是一套用于管理本地 AI Agent Skills 的模板和规则体系。

它的目标是让 Claude Code、Codex 等编程 Agent 在执行任务前，能够根据任务类型、角色、技术栈和关键词，自动选择合适的 Skill，而不是每次依赖用户手动提醒。

本项目重点解决以下问题：

- Agent 不会主动寻找合适 Skill
- 新开窗口后忘记角色对应的 Skill
- Skill 越加越多，出现重复、相近、难维护的问题
- 编程 Agent 缺少统一的代码质量准则
- 新增 Skill 后没有同步更新清单
- 本地没有合适 Skill 时，不知道如何安全地从 GitHub 寻找
- Claude Code 与 Codex 的规则体系难以统一维护

本项目提供一套可复制、可扩展、可维护的本地模板。

------

## 核心能力

- 按任务自动选择 Skill
- 按角色自动选择 Skill
- 编程任务强制加载 `karpathy-guidelines`
- 新 Skill 准入审查
- 相近 Skill 合并为分支场景
- 自动维护 `skill-index.json`
- 自动维护 `技能速查手册-ZH.md`
- Claude Code / Codex 双端适配
- GitHub 外部 Skill 安全审查流程
- 控制上下文消耗，避免一次性加载全部 Skill

------

## 支持范围

当前模板适用于：

- Claude Code
- Codex CLI
- Codex IDE Extension
- 本地 Skills
- 用户级规则
- 项目级规则
- Skill 索引
- Skill 去重
- Skill 合并
- Skill 治理
- Agent 规则模板

------

## 推荐目录结构

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
│     ├─ 技能速查手册-ZH.md
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

## 核心文件说明

| 文件                           | 说明                             |
| ------------------------------ | -------------------------------- |
| `CLAUDE.md`                    | Claude Code 的全局规则入口       |
| `AGENTS.md`                    | Codex 的全局规则入口             |
| `skill-index.json`             | 机器可读的 Skill 路由索引        |
| `技能速查手册-ZH.md`           | 人类可读的 Skill 清单            |
| `skill-governance/SKILL.md`    | Skill 新增、合并、去重、维护规则 |
| `skill-template/SKILL.md`      | 新建 Skill 的标准模板            |
| `karpathy-guidelines/SKILL.md` | 编程 Agent 强制基础准则          |

------

## 工作机制

### 1. Skill 路由

Agent 在执行任务前，先根据以下信息选择 Skill：

- 用户指定的角色
- 当前任务类型
- 技术栈
- 关键词
- 输出目标
- 风险等级

默认只加载 1 到 3 个最相关 Skill，避免浪费上下文。

------

### 2. 编程任务强制基础准则

凡是涉及以下任务，必须加载：

```text
karpathy-guidelines
```

适用范围：

- 写代码
- 改代码
- 修 Bug
- 重构
- 代码审查
- 接口设计
- 数据库设计
- 测试
- 架构设计
- 技术方案
- 前端开发
- 后端开发
- DevOps 自动化
- AI Agent 开发

默认组合方式：

```text
karpathy-guidelines + 领域 Skill + 验证 / 安全 Skill
```

示例：

```text
Java / Spring Boot:
karpathy-guidelines + springboot-patterns + springboot-security

前端:
karpathy-guidelines + frontend-patterns + browser-qa

数据库:
karpathy-guidelines + database-migrations + postgres-patterns

DevOps:
karpathy-guidelines + deployment-patterns + safety-guard

Bug 修复:
karpathy-guidelines + tdd-workflow + verification-loop
```

------

### 3. Skill 治理

新增 Skill 前必须先判断是否已有相近 Skill。

如果已有 Skill 可以覆盖，不新增。

如果只是场景分支，写入已有 Skill。

只有满足以下条件时，才允许新增 Skill：

- 现有 Skill 无法覆盖核心流程
- 不是已有 Skill 的小分支
- 不是单纯换技术名词
- 未来会重复使用
- 能明确写出触发条件、输入、输出、操作步骤和禁用场景

------

### 4. GitHub 外部 Skill 安全审查

本地没有合适 Skill 时，才允许搜索 GitHub。

禁止直接安装未经审查的外部 Skill。

必须检查：

- 是否包含删除文件、清空目录、格式化磁盘等危险命令
- 是否读取 `.env`、SSH key、token、cookie
- 是否上传本地文件
- 是否执行远程脚本
- 是否包含混淆代码
- 是否依赖未知 MCP 服务
- 是否绕过用户确认执行高危操作

通过审查后，只能提炼其思路，改写成本地 Skill 草案。

------

## Claude Code 安装

执行：

```powershell
.\scripts\install-claude.ps1
```

默认安装到：

```text
C:\Users\<你的用户名>\.claude
```

------

## Codex 安装

执行：

```powershell
.\scripts\install-codex.ps1
```

默认安装到：

```text
C:\Users\<你的用户名>\.codex
C:\Users\<你的用户名>\.agents\skills
```

------

## 同步 Skills

执行：

```powershell
.\scripts\sync-skills.ps1
```

推荐使用：

```text
C:\Users\<你的用户名>\.agents\skills
```

作为中立主目录，然后同步到：

```text
C:\Users\<你的用户名>\.claude\skills
C:\Users\<你的用户名>\.codex\skills
```

------

## 推荐使用方式

新开 Claude Code 或 Codex 会话时，可以这样提示：

```text
请先按照本地全局规则工作。

处理任务前必须检查 skill-index.json 和技能速查手册-ZH.md。

如果是编程任务，必须加载 karpathy-guidelines。

然后根据任务类型选择 1 到 3 个最相关 Skill。

不要一次性加载全部 Skill。
```

------

## 安全提醒

开源或同步前，请不要提交以下内容：

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

本项目建议只提交模板、规则、脱敏示例和安装脚本。

------

## 适合谁使用

本项目适合：

- Claude Code 用户
- Codex 用户
- AI Agent 工程实践者
- 想维护本地 Skills 的开发者
- 想减少重复 Prompt 的个人开发者
- 想统一团队 Agent 规则的工程团队
- 想构建本地 AI 编程工作流的人

------

## 路线图

-  Claude Code 模板
-  Codex 模板
-  PowerShell 安装脚本
-  Skill 索引校验脚本
-  Skill 去重分析脚本
-  示例 Skill
-  英文文档
-  项目级 Agent 规则模板
-  跨平台 Bash 安装脚本

------

## 许可证

MIT License