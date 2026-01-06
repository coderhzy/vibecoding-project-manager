# project-init

自动检测并初始化新项目的 Claude Code 开发环境。

## 触发条件

当检测到以下情况时自动触发：
- 用户首次在项目中使用 Claude Code
- `.claude/memory-bank/projectBrief.md` 不存在或为空模板
- 用户明确要求初始化项目

## 执行流程

1. **检测项目状态**
   - 检查 `.claude/` 目录是否存在
   - 检查 `memory-bank/projectBrief.md` 是否已填写
   - 检查 `package.json`、`pyproject.toml` 等项目配置

2. **收集项目信息**
   - 扫描项目结构，识别技术栈
   - 分析现有配置文件
   - 检测框架和依赖

3. **生成项目简报**
   - 自动填充 `projectBrief.md` 的基础信息
   - 识别项目类型（前端/后端/全栈/库）
   - 记录主要技术栈

4. **初始化开发环境**
   - 创建首个会话记录
   - 设置 `activeContext.md`
   - 生成初始 `TODO.md`

## 输出

- 更新 `.claude/memory-bank/projectBrief.md`
- 创建 `.claude/memory-bank/activeContext.md`
- 创建首个会话文件 `.claude/sessions/{date}-init.md`

## 使用示例

```
用户：帮我看看这个项目
Claude：[自动触发 project-init] 检测到新项目，正在初始化...
```

## 手动触发

```
/project:init
```
