#!/bin/bash
# 用户提交 prompt 时检查是否需要提醒工作流

# 从环境变量获取用户输入（Claude Code 会传入）
USER_PROMPT="${CLAUDE_USER_PROMPT:-}"

# 开发相关关键词
DEV_KEYWORDS="实现|开发|添加|修复|创建|做|写|implement|add|fix|create|build|write|feature|bug"

# 检查是否包含开发关键词
if echo "$USER_PROMPT" | grep -qiE "$DEV_KEYWORDS"; then
    echo ""
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo "🔔 检测到开发任务，请遵循工作流："
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo "1️⃣  需求分析 → 检查点确认"
    echo "2️⃣  生成 TODO → 检查点确认"
    echo "3️⃣  执行任务 → 检查点确认"
    echo "4️⃣  验证测试 → 检查点确认"
    echo "5️⃣  提交归档 → 检查点确认"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo ""
fi

exit 0
