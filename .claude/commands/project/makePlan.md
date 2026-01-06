# /project:makePlan - 保存版本化计划

将当前对话中的计划保存为版本化文件。

## 执行步骤

1. **提取计划内容**
   - 从当前对话中提取计划部分
   - 包括：目标、步骤、技术方案、预期结果

2. **确定版本号**
   - 读取 `.claude/plans/` 目录
   - 找到最大版本号 `plan-vNNN.md`
   - 新版本号 = 最大版本号 + 1
   - 格式：`plan-v001.md`, `plan-v002.md`, ...

3. **生成计划文件**
   ```markdown
   # Plan vNNN - [简短标题]

   > 创建时间: YYYY-MM-DD HH:MM
   > 状态: 进行中

   ## 目标

   [从对话中提取]

   ## 实现步骤

   1. [步骤1]
   2. [步骤2]
   ...

   ## 技术方案

   [从对话中提取]

   ## 预期结果

   [从对话中提取]

   ## 风险与依赖

   [从对话中提取，如无则写"无"]
   ```

4. **保存文件**
   - 保存到 `.claude/plans/plan-vNNN.md`

5. **输出确认**
   ```
   Plan saved: .claude/plans/plan-v001.md

   Next steps:
   - /project:makeTODOS to convert to actionable tasks
   - /project:nextTODO to start execution
   ```

## 注意事项

- 如果对话中没有明确的计划，提示用户先进入计划模式（Shift+Tab x2）
- 保留原始表述，不要过度总结
