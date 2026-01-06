# /project:finishPlan - 完成计划并提交

完成当前 Sprint，生成提交信息并清理状态。

## 执行步骤

1. **检查完成状态**
   - 读取 `.claude/TODO.md`
   - 检查是否所有任务都已完成
   - 如有未完成任务，询问是否继续

2. **收集变更信息**
   ```bash
   git status
   git diff --stat
   ```

3. **检查遗漏工作**
   - 审查所有改动的文件
   - 确认没有遗漏的任务
   - 确认测试已通过

4. **生成提交信息**
   ```markdown
   # 提交信息建议

   类型: feat/fix/refactor/docs/chore
   范围: [affected module]

   标题: [简短描述，不超过50字符]

   正文:
   - 改动点1
   - 改动点2
   ...

   关联: #issue_number (如有)
   ```

5. **执行提交**（需用户确认）
   ```bash
   git add -A
   git commit -m "..."
   ```

6. **更新计划状态**
   - 将当前计划文件状态改为"已完成"
   - 归档 TODO.md

7. **输出总结**
   ```
   Sprint completed!

   Summary:
   - Plan: plan-vNNN.md
   - Tasks completed: N/N
   - Files changed: X
   - Commit: [hash]

   Next steps:
   - /session:end to close session
   - /workflow:update-memory to update memory bank
   ```

## 提交规范

### 类型

| 类型 | 说明 |
|------|------|
| feat | 新功能 |
| fix | Bug 修复 |
| refactor | 重构 |
| docs | 文档 |
| style | 格式调整 |
| test | 测试 |
| chore | 构建/工具 |

### 注意事项

- 不要提交敏感信息（.env、credentials 等）
- 确保代码可编译/运行
- 提交前运行 lint/test
