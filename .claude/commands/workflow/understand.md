# /workflow:understand - 理解项目上下文

加载记忆库并分析当前项目状态。

## 执行步骤

1. **加载记忆库**
   - 读取 `memory-bank/projectBrief.md` - 项目概述
   - 读取 `memory-bank/activeContext.md` - 活跃上下文
   - 读取 `memory-bank/progress.md` - 进度追踪

2. **检查当前状态**
   - 读取 `.claude/TODO.md`（如存在）
   - 读取 `.claude/sessions/.current`（如存在）
   - 检查最近的 git 提交

3. **分析代码库**
   - 识别主要技术栈
   - 识别项目结构
   - 识别关键模块

4. **输出理解报告**
   ```markdown
   # Project Understanding

   ## 项目概述
   {从 projectBrief.md 提取}

   ## 当前状态
   - 进行中的会话: {session_id or "无"}
   - 待完成任务: {N 个 or "无"}
   - 最近提交: {commit_message}

   ## 技术栈
   - 后端: {识别结果}
   - 前端: {识别结果}
   - 数据库: {识别结果}

   ## 关键文件
   - {file1}: {用途}
   - {file2}: {用途}
   ...

   ## 活跃上下文
   {从 activeContext.md 提取}

   ## 建议下一步
   - {建议1}
   - {建议2}
   ```

## 使用场景

- **新会话开始时**：快速了解项目背景
- **中断后恢复**：回顾之前的进度
- **新成员加入**：快速上手项目

## 注意事项

- 如果记忆库为空，提示先执行 `/project:init`
- 如果项目结构复杂，可分模块输出
