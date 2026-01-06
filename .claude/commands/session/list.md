# /session:list - 列出所有会话

列出所有历史开发会话。

## 执行步骤

1. **扫描会话目录**
   - 读取 `.claude/sessions/` 目录
   - 找到所有 `.md` 文件（排除 `.current`）

2. **解析会话信息**
   - 从文件名解析日期和名称
   - 从文件内容读取状态
   - 计算持续时长（如已结束）

3. **输出会话列表**
   ```
   Sessions (N total):

   | # | Date       | Name          | Status   | Duration |
   |---|------------|---------------|----------|----------|
   | 1 | 2025-01-06 | feature-auth  | 已完成   | 2h 30m   |
   | 2 | 2025-01-05 | hotfix-login  | 已完成   | 45m      |
   | 3 | 2025-01-04 | refactor-api  | 进行中   | -        |
   ...

   Current session: {session_id or "None"}

   Commands:
   - /session:start [name] - Start new session
   - Read specific: .claude/sessions/{filename}.md
   ```

4. **高亮当前会话**
   - 如果有进行中的会话，特别标注

## 过滤选项（扩展）

```bash
# 查看最近 N 个
/session:list --last 5

# 按状态过滤
/session:list --status completed
/session:list --status active

# 按名称搜索
/session:list --name feature
```

## 输出格式

默认按时间倒序排列（最新的在前）。
