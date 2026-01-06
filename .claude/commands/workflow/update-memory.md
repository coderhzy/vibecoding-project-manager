# /workflow:update-memory - 更新记忆库

将当前会话的重要信息持久化到记忆库。

## 执行步骤

1. **收集当前上下文**
   - 从当前对话中提取重要信息
   - 检查最近的会话记录
   - 检查最近的代码变更

2. **更新 activeContext.md**
   ```markdown
   # Active Context

   > 最后更新: YYYY-MM-DD HH:MM

   ## 当前工作重点

   {从对话/会话中提取}

   ## 最近完成

   - {完成事项1}
   - {完成事项2}

   ## 进行中

   - {进行中事项}

   ## 待处理

   - {待处理事项}

   ## 技术决策

   ### {日期} - {决策标题}
   - 背景: ...
   - 决策: ...
   - 原因: ...

   ## 已知问题

   - {问题1}: {临时解决方案}

   ## 注意事项

   - {注意事项1}
   ```

3. **更新 progress.md**
   ```markdown
   # Progress Tracking

   > 最后更新: YYYY-MM-DD HH:MM

   ## 里程碑

   - [x] M1: {描述} (完成于 YYYY-MM-DD)
   - [ ] M2: {描述}
   ...

   ## 本周进度

   ### YYYY-MM-DD
   - {进度1}
   - {进度2}

   ## 指标

   - 完成功能数: N
   - 修复 Bug 数: N
   - 代码提交数: N
   ```

4. **可选：更新 projectBrief.md**
   - 如果项目范围有重大变化
   - 需要用户确认后更新

5. **输出确认**
   ```
   Memory bank updated:
   - [x] activeContext.md
   - [x] progress.md
   - [ ] projectBrief.md (unchanged)

   Key updates:
   - {更新摘要1}
   - {更新摘要2}
   ```

## 更新原则

- **增量更新**：保留历史记录，追加新信息
- **结构化**：使用标准格式，便于解析
- **精简**：只记录重要信息，避免信息过载
- **可追溯**：记录时间戳，便于回溯

## 自动触发

以下情况建议执行此命令：
- `/session:end` 结束会话后
- `/project:finishPlan` 完成计划后
- 做出重要技术决策后
- 发现并解决重要 Bug 后
