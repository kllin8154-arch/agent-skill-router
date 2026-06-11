# Skill 治理

## 用途

本 Skill 管理所有本地 Skill 的新增、合并、去重、索引更新和外部审查。任何 Skill 管理操作前必须激活本 Skill。

---

## 触发条件

以下情况应激活本 Skill：

- 创建新 Skill
- 合并或去重相近 Skill
- 更新或删除已有 Skill
- 审查来自 GitHub 或网络的外部 Skill
- 更新 `skill-index.json` 或 Skill 速查手册
- 搜索已有 Skill 以避免重复

---

## 规则

### 新建 Skill 前

1. 检查 `skill-index.json` 中是否有匹配关键词的已有 Skill。
2. 检查 `技能速查手册-ZH.md` 中的人类可读描述。
3. 如果已有 Skill 覆盖核心流程 — **不新建**。
4. 如果只是已有 Skill 的分支场景 — **写入已有 Skill**。
5. 只有满足以下条件才新建：
   - 没有已有 Skill 覆盖核心流程
   - 不是已有 Skill 的小分支
   - 未来很可能被复用
   - 触发条件、输入、输出、流程、不适用场景清晰可写

### 索引维护

每次 Skill 变更后：

1. 更新 `skill-index.json` — 新增、修改或删除条目。
2. 同步更新 `技能速查手册-ZH.md`（中文）或 `Skill-Quick-Reference-EN.md`（英文）。
3. 确保索引与手册一致。

### 外部 Skill 审查

需要获取外部 Skill 时：

1. 只有本地无合适 Skill 时才搜索 GitHub/网络。
2. **禁止**直接复制或安装未经审查的外部 Skill。
3. 审查外部 Skill 是否存在：
   - 危险命令（删文件、格式化等）
   - 读取密钥、token、cookie、SSH key、`.env` 文件
   - 上传本地文件
   - 执行远程脚本
   - 混淆代码
   - 未知 MCP 服务依赖
   - 绕过用户确认的高风险操作
4. 提取有用思路，改写为本地 Skill 草案。
5. 本地草案必须遵循标准 Skill 模板。

---

## 工作流

```
1. 收到 Skill 管理请求。
2. 检查 skill-index.json 是否有重叠。
3. 判断：新建 / 合并 / 更新 / 拒绝。
4. 如需新建：使用 skill-template/SKILL.md 模板。
5. 更新索引和手册。
6. 确认 EN 和 ZH 版本一致。
```
