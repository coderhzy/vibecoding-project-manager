# System Prompt 设计规范

> 创建日期：2025-01-06
> 版本：1.0

## 设计哲学

本规范体系借鉴了 Claude 的生产级 System Prompt 设计，核心理念是：

**AI Agent 介于工具与人格之间**：
- 它是一个**工具**（帮用户完成任务）
- 但它面对的是**人**（有情感、有需求、需要共情）

融合两种设计哲学：
- **工具型设计**：精确的边界约束、工具元认知、状态注入
- **人格型设计**：意图分类、用户状态感知、诚实与共情的平衡

## 规范体系结构

```
prompt-engineering/
├── README.md                    # 本文档
├── 00-quick-start.md            # 快速入门
├── 00-overview.md               # 总览与使用指南
├── 01-identity-architecture.md  # 身份架构设计
├── 02-behavioral-boundaries.md  # 行为边界设计
├── 03-intent-recognition.md     # 意图识别设计
├── 04-tone-adaptation.md        # 语调适应设计
├── 05-user-state-awareness.md   # 用户状态感知
├── 06-tool-metacognition.md     # 工具元认知
├── 07-error-handling.md         # 异常处理设计
├── 08-self-awareness.md         # 自我认知边界
├── 09-compliance-safety.md      # 合规与安全
├── 10-output-control.md         # 输出控制
└── 11-memory-context.md         # 记忆与上下文
```

## 如何使用

### 设计新 Agent 时

按顺序阅读：
1. `01-identity-architecture.md` — 确定身份架构
2. `02-behavioral-boundaries.md` — 定义行为边界
3. `03-intent-recognition.md` — 设计意图分类
4. `06-tool-metacognition.md` — 设计工具策略

### 优化现有 Agent 时

根据问题选择模块：
- 回复太生硬 → `04-tone-adaptation.md`
- 不理解言外之意 → `03-intent-recognition.md`
- 过度使用工具 → `06-tool-metacognition.md`
- 没有识别情绪 → `05-user-state-awareness.md`

## 核心设计原则

### 原则 1：负面约束优于正面指令

```
❌ 正面指令（容易失效）：
"请准确提取用户确认的选题"

✅ 负面约束（更可靠）：
"NEVER 推测用户没有明确说的意图"
"NEVER 编造不存在的素材ID"
```

### 原则 2：精确校准优于模糊描述

```
❌ 模糊描述：
"保持友好的语气"

✅ 精确校准：
"不主动用 emoji（除非用户用）"
"不用'太棒了！'等空洞赞美"
```

### 原则 3：状态驱动优于无状态

```
✅ 注入运行时上下文：
<session_state>
当前阶段: topic_selection
已推荐选题数: 3
用户拒绝次数: 2
</session_state>
```

### 原则 4：诚实比讨好重要

```
✅ 诚实的方式：
"坦白说，这个方向可能很难脱颖而出。
要不我们试试这个角度..."

❌ 讨好的方式：
"好的，我来试试这个方向。"
```

## 文档层次关系

```
00-quick-start.md（快速入门）
        ↓
00-overview.md（总览）
        ↓
01~11 深度规范（按需阅读）
```

## 参考来源

1. **Claude Code System Prompt**（工具型设计）
2. **Claude.ai Web System Prompt**（人格型设计）
3. **2025 Prompt Engineering Best Practices**

## 版本历史

| 版本 | 日期 | 变更 |
|------|------|------|
| 1.0 | 2025-01-06 | 初始版本 |
