# Project Instructions

> 此文件是 Claude Code 的主入口，每次会话自动加载。

## 项目原有配置（如有）

<!-- 如果项目根目录有 CLAUDE.md，自动引入 -->
@../CLAUDE.md

## 项目概述

@memory-bank/projectBrief.md

## 当前上下文

@memory-bank/activeContext.md

## 开发规范

### 代码规范
@rules/backend/README.md
@rules/frontend/README.md

### Prompt 规范
@../engineering/architecture/prompt-engineering/00-quick-start.md

---

## 全自动开发系统 (Auto-Pilot)

**你只需要说"做什么"，其他全自动处理。**

### 工作流程

```
你："帮我实现用户登录"
         │
         ▼
    ┌─────────┐
    │ 需求分析 │ ──→ 📍 检查点1: 需求理解正确？
    └────┬────┘
         │ 确认
         ▼
    ┌─────────┐
    │ 生成计划 │ ──→ 📍 检查点2: 任务分解合理？
    └────┬────┘
         │ 确认
         ▼
    ┌─────────┐
    │ 执行任务 │ ──→ 📍 检查点3: 完成，需要验证？
    └────┬────┘
         │ 确认
         ▼
    ┌─────────┐
    │ 验证测试 │ ──→ 📍 检查点4: 验证通过，提交？
    └────┬────┘
         │ 确认
         ▼
    ┌─────────┐
    │ 提交归档 │ ──→ 📍 检查点5: 继续还是结束？
    └─────────┘
```

### 每一步都有文档

全程按**日期维度**自动记录到 `.claude/daily/{year}/{month}/{day}.md`：

| 阶段 | 自动记录内容 |
|------|--------------|
| 需求分析 | 原始描述 + 理解分析 + 技术方案 |
| 生成计划 | 任务列表 + 预计修改文件 |
| 执行任务 | 每个任务的代码修改 + 关键决策 |
| 验证测试 | 测试结果 + 问题发现 |
| 提交归档 | Git 提交 + 日终总结 |

### 多人协作

团队成员的工作自动同步到 `.claude/team/`：

| 文档 | 内容 |
|------|------|
| `team/status.md` | 谁在做什么 |
| `team/decisions.md` | 技术决策记录 |
| `team/handoff.md` | 任务交接 |

---

## Skills 系统

| Skill | 功能 | 检查点 |
|-------|------|--------|
| `auto-pilot` | 全流程编排 | 5 个 |
| `daily-log` | 日期维度记录 | 自动 |
| `plan-maker` | 计划制定 | 4 个 |
| `todo-runner` | 任务执行 | 3 个 |
| `code-review` | 代码审查 | 3 个 |
| `git-commit` | Git 提交 | 2 个 |
| `team-sync` | 团队协作 | 2 个 |
| `memory-sync` | 记忆同步 | 1 个 |

---

## 查看日志

```
/daily:today          # 今日日志
/daily:yesterday      # 昨日日志
/daily:2024-01-10     # 指定日期
/daily:search "登录"  # 搜索历史
/daily:week           # 本周汇总
```

---

## 禁止操作

### 系统级禁止
- **NEVER** 执行 `git reset --hard`、`git clean -fd` 等破坏性命令
- **NEVER** 删除或覆盖现有代码而不先询问
- **NEVER** 跳过代码审查直接提交关键代码

### 开发级禁止
- **NEVER** 推测用户没有明确说的意图
- **NEVER** 在用户没确认时就开始执行破坏性任务
- **NEVER** 硬编码密钥、Token、密码

### 自动化级禁止
- **NEVER** 自动执行删除文件/数据的任务
- **NEVER** 自动执行部署/发布相关任务
- **NEVER** 跳过检查点自动执行

---

## 记忆系统

```
projectBrief.md     ← 基础层（项目定义）
       ↓
activeContext.md    ← 工作层（当前上下文）
       ↓
daily/{date}.md     ← 日志层（按日期记录）
       ↓
team/*.md           ← 协作层（团队文档）
```

---

## 快速开始

**全自动模式**（推荐）：
1. 直接说"帮我实现 xxx"
2. 在每个检查点确认即可
3. 所有文档自动维护

**手动模式**：
```
/project:init        # 初始化
/session:start       # 开始会话
/project:makePlan    # 创建计划
/project:nextTODO    # 执行任务
/project:finishPlan  # 提交归档
```
