# /session:end - 结束会话

结束当前开发会话，生成总结报告。

## 执行步骤

1. **检查当前会话**
   - 读取 `.claude/sessions/.current`
   - 如果不存在，提示没有进行中的会话

2. **收集会话信息**
   - 读取会话文件
   - 计算会话时长
   - 统计进度记录数量

3. **生成变更摘要**
   ```bash
   git diff --stat HEAD~N  # N = 会话期间的提交数
   ```

4. **生成会话总结**
   - 在会话文件末尾添加总结部分
   ```markdown
   ---

   ## 会话总结

   > 结束时间: YYYY-MM-DD HH:MM
   > 持续时长: X 小时 Y 分钟
   > 状态: 已完成

   ### 完成事项

   - [x] 事项1
   - [x] 事项2
   ...

   ### 未完成事项

   - [ ] 事项1（原因：...）
   ...

   ### 关键决策

   1. 决策1：...
   2. 决策2：...

   ### 经验教训

   - ...

   ### 后续建议

   - 下一步应该...
   - 需要注意...

   ### Git 提交

   - {commit_hash}: {commit_message}
   ...
   ```

5. **更新会话状态**
   - 将会话状态改为"已完成"
   - 删除 `.current` 文件

6. **提示更新记忆库**
   ```
   Session ended: {session_id}
   Duration: X hours Y minutes

   Summary saved to: .claude/sessions/{session_id}.md

   Recommended:
   - /workflow:update-memory to persist important context
   ```

## 总结模板

会话总结应该能够让下一个开发者（或下一次 AI 会话）快速了解：
- 做了什么
- 为什么这样做
- 还有什么没做
- 有什么坑需要注意
