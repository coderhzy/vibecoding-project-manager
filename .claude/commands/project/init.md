# /project:init - 初始化项目

初始化项目的 Claude Code 配置。

## 执行步骤

1. **检查目录结构**
   - 确认 `.claude/` 目录存在
   - 确认 `memory-bank/`、`plans/`、`sessions/` 目录存在
   - 如果缺失，创建它们

2. **初始化 Memory Bank**
   - 如果 `memory-bank/projectBrief.md` 不存在，创建模板
   - 如果 `memory-bank/activeContext.md` 不存在，创建模板
   - 如果 `memory-bank/progress.md` 不存在，创建模板

3. **初始化 TODO.md**
   - 如果 `.claude/TODO.md` 不存在，创建空模板

4. **输出初始化报告**
   ```
   Project initialized:
   - [x] .claude/ directory
   - [x] memory-bank/ files
   - [x] TODO.md
   - [x] Ready for development
   ```

## 注意事项

- 不要覆盖已存在的文件
- 如果项目已初始化，提示用户
