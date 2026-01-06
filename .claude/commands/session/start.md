# /session:start [name] - 开始开发会话

开始一个新的开发会话并创建记录文件。

## 参数

- `name`（可选）：会话名称，如 `feature-auth`、`hotfix-login`

## 执行步骤

1. **生成会话 ID**
   - 格式：`YYYY-MM-DD-HHMM-{name}`
   - 示例：`2025-01-06-1430-feature-auth`
   - 如果没有提供 name，使用 `session`

2. **创建会话文件**
   ```markdown
   # Session: {name}

   > ID: {session_id}
   > 开始时间: YYYY-MM-DD HH:MM
   > 状态: 进行中

   ## 目标

   [用户描述或待填写]

   ## 进度记录

   ### HH:MM - 会话开始
   - 初始化会话
   - 待定目标

   ## 变更摘要

   待更新...

   ## 决策记录

   待更新...

   ## 待办事项

   - [ ] 待定义

   ## 备注

   ```

3. **保存会话文件**
   - 保存到 `.claude/sessions/{session_id}.md`

4. **创建当前会话标记**
   - 创建 `.claude/sessions/.current` 文件
   - 内容为当前会话 ID

5. **输出确认**
   ```
   Session started: {session_id}
   File: .claude/sessions/{session_id}.md

   Commands:
   - /session:update [notes] - Add progress notes
   - /session:end - End session with summary
   ```

## 使用场景

```bash
# 功能开发
/session:start feature-user-auth

# Bug 修复
/session:start hotfix-login-crash

# 重构
/session:start refactor-api-layer

# 通用
/session:start
```
