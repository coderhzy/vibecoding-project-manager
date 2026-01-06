# /project:makeTODOS - 生成任务清单

将最新计划转换为可执行的 TODO 清单。

## 执行步骤

1. **读取最新计划**
   - 找到 `.claude/plans/` 中版本号最大的计划文件
   - 如果没有计划文件，提示先执行 `/project:makePlan`

2. **分解任务**
   - 将计划中的"实现步骤"分解为具体任务
   - 每个任务应该是可独立执行的最小单元
   - 任务粒度建议：15-30 分钟可完成

3. **生成 TODO.md**
   ```markdown
   # TODO - [计划标题]

   > 来源: plan-vNNN.md
   > 创建时间: YYYY-MM-DD HH:MM
   > 状态: 0/N 完成

   ## 任务清单

   - [ ] 任务1：具体描述
   - [ ] 任务2：具体描述
   - [ ] 任务3：具体描述
   ...

   ## 完成标准

   - [ ] 所有任务完成
   - [ ] 测试通过
   - [ ] 代码已提交
   ```

4. **保存文件**
   - 保存到 `.claude/TODO.md`
   - 如果已存在，备份为 `TODO.backup.md` 后覆盖

5. **输出确认**
   ```
   TODO list created: .claude/TODO.md
   Total tasks: N

   Next step:
   - /project:nextTODO to start executing tasks
   ```

## 任务分解原则

- **原子性**：每个任务独立可执行
- **可验证**：完成后有明确的验证方式
- **顺序性**：考虑任务之间的依赖关系
- **估算性**：复杂任务进一步拆分
