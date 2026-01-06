#!/bin/bash
# Claude 响应完成后的提醒

YEAR=$(date +%Y)
MONTH=$(date +%m)
DAY=$(date +%d)
LOG_FILE=".claude/daily/${YEAR}/${MONTH}/${DAY}.md"

# 如果日志文件存在，提醒更新
if [ -f "$LOG_FILE" ]; then
    echo ""
    echo "📝 记得更新日志: ${LOG_FILE}"
fi

exit 0
