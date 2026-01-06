# Prompt Engineering Rules

AI Prompt 设计规范索引。

## 规范体系

完整的 Prompt 工程规范体系位于：
`engineering/architecture/prompt-engineering/`

## 快速索引

| 文档 | 内容 | 适用场景 |
|------|------|----------|
| 00-quick-start | 快速入门 | 新手入门 |
| 00-overview | 总览与使用指南 | 了解完整规范 |
| 01-identity-architecture | 身份架构设计 | 定义 Agent 身份 |
| 02-behavioral-boundaries | 行为边界设计 | 设计 NEVER 清单 |
| 03-intent-recognition | 意图识别设计 | 处理用户意图 |
| 04-tone-adaptation | 语调适应设计 | 调整语调风格 |
| 05-user-state-awareness | 用户状态感知 | 识别用户情绪 |
| 06-tool-metacognition | 工具元认知 | 控制工具使用 |
| 07-error-handling | 异常处理设计 | 处理异常场景 |
| 08-self-awareness | 自我认知边界 | 定义能力边界 |
| 09-compliance-safety | 合规与安全 | 内容安全 |
| 10-output-control | 输出控制 | 格式与长度 |
| 11-memory-context | 记忆与上下文 | 上下文管理 |

## 核心原则

### 1. 负面约束优于正面指令

```
❌ "请准确提取用户确认的选题"
✅ "NEVER 推测用户没有明确说的意图"
```

### 2. 精确校准优于模糊描述

```
❌ "保持友好的语气"
✅ "不主动用 emoji（除非用户用）"
```

### 3. 状态驱动优于无状态

```
✅ 注入运行时上下文：
<session_state>
当前阶段: topic_selection
已推荐选题数: 3
</session_state>
```

### 4. 诚实比讨好重要

```
✅ "坦白说，这个方向可能很难脱颖而出..."
❌ "好的，我来试试这个方向。"
```

## Prompt 模板结构

```markdown
# 身份架构
## 产品身份 / 能力身份 / 行为身份

# 行为边界
## 绝对禁止（NEVER）

# 意图识别
## 用户意图分类

# 语调适应
## 镜像规则 / 禁止规则

# 工具使用
## 什么时候用/不用

# 输出控制
## 格式要求 / 长度控制
```

---

> 详细规范请参考 `engineering/architecture/prompt-engineering/`
