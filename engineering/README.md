# Engineering

工程开发资料，面向开发团队。

## 目录结构

```
engineering/
├── architecture/           # 技术架构
│   ├── system-design.md   # 系统设计（按需创建）
│   ├── data-model.md      # 数据模型（按需创建）
│   └── prompt-engineering/ # Prompt 设计规范
│
├── planning/               # 开发规划
│   ├── backlog.md         # 功能池
│   └── decisions/          # 技术决策记录 (ADR)
│
└── standup/                # 每日站会
    └── YYYY-MM-DD.md
```

## 文档职责

### architecture/

技术架构文档，说明系统是怎么设计的。

| 文件 | 内容 |
|------|------|
| system-design.md | 技术栈、模块结构、架构模式 |
| data-model.md | 数据结构、API 定义 |
| prompt-engineering/ | AI Prompt 设计规范（11篇） |

### planning/

开发规划文档，说明要做什么、怎么决策的。

| 文件 | 内容 |
|------|------|
| backlog.md | 功能池，待开发功能列表 |
| decisions/ | ADR（架构决策记录） |

### standup/

每日站会记录，格式：`YYYY-MM-DD.md`

```markdown
# Standup YYYY-MM-DD

## 昨日完成
- ...

## 今日计划
- ...

## 阻塞/风险
- ...
```

## 使用指南

### 新功能开发

1. 在 `planning/backlog.md` 中添加功能
2. 如有架构决策，在 `planning/decisions/` 创建 ADR
3. 开发过程中在 `standup/` 记录进度
4. 完成后更新 `architecture/` 相关文档

### ADR 格式

```markdown
# {日期}-{决策标题}

## 背景
{为什么需要做这个决策}

## 决策
{最终决定是什么}

## 原因
{为什么这样决定}

## 影响
{这个决策会影响什么}

## 状态
{提议/接受/废弃/替代}
```

## 与 product/ 的区别

| 目录 | 面向 | 更新时机 |
|------|------|----------|
| engineering/ | 开发者 | 开发过程中 |
| product/ | 用户/产品 | 发布时 |
