# /session:update [notes] - 更新会话进度

向当前会话添加进度记录。

## 参数

- `notes`（可选）：进度描述，如 `完成了用户认证模块`

## 执行步骤

1. **检查当前会话**
   - 读取 `.claude/sessions/.current`
   - 如果不存在，提示先执行 `/session:start`

2. **读取会话文件**
   - 读取 `.claude/sessions/{session_id}.md`

3. **添加进度记录**
   - 在"进度记录"部分添加新条目
   - 格式：`### HH:MM - {notes}`

4. **自动收集信息**
   - 检查 git 状态
   - 记录文件变更
   - 记录重要决策（如果对话中有）

5. **更新会话文件**
   ```markdown
   ## 进度记录

   ### HH:MM - 会话开始
   - 初始化会话

   ### HH:MM - {notes}          <- 新增
   - {自动收集的详细信息}
   - 文件变更: X files
   ```

6. **输出确认**
   ```
   Session updated: {session_id}
   Time: HH:MM
   Note: {notes}
   ```

## 自动更新触发

以下情况可自动触发更新（可选配置）：
- 完成一个 TODO 任务
- 执行 git commit
- 遇到重要决策点

## 示例

```bash
# 手动更新
/session:update 完成了用户登录功能

# 带详细信息
/session:update 重构了 API 层，将 REST 改为 GraphQL

# 记录问题
/session:update 遇到跨域问题，临时用 proxy 解决
```
