# /project:nextTODO - 执行下一个任务

找到并执行 TODO 清单中的下一个未完成任务。

## 执行步骤

1. **读取 TODO.md**
   - 读取 `.claude/TODO.md`
   - 如果不存在，提示先执行 `/project:makeTODOS`

2. **找到下一个任务**
   - 扫描所有 `- [ ]` 未完成任务
   - 选择第一个未完成的任务
   - 如果全部完成，提示执行 `/project:finishPlan`

3. **显示任务信息**
   ```
   Current task (M/N):
   - [ ] 任务描述

   Starting execution...
   ```

4. **执行任务**
   - 根据任务描述执行相应操作
   - 可能包括：编写代码、修改文件、运行命令等
   - 遇到问题时暂停并询问用户

5. **标记完成**
   - 任务完成后，将 `- [ ]` 改为 `- [x]`
   - 更新 TODO.md 的完成状态统计

6. **输出结果**
   ```
   Task completed: 任务描述
   Progress: M/N tasks done

   Next:
   - /project:nextTODO to continue
   - /project:finishPlan if all done
   ```

## 执行原则

- **专注**：一次只执行一个任务
- **完整**：确保任务完全完成再标记
- **记录**：重要决策记录到会话中
- **询问**：不确定时先询问用户

## 自动模式

如果用户说"继续执行所有任务"，可以循环执行直到：
- 所有任务完成
- 遇到需要用户决策的问题
- 用户手动中断
