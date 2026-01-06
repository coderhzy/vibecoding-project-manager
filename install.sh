#!/bin/bash

# Claude Code Project Manager - Installation Script
# 用法: ./install.sh [目标目录]

set -e

# 颜色定义
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# 获取脚本所在目录
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# 目标目录（默认为当前目录）
TARGET_DIR="${1:-.}"

echo -e "${GREEN}Claude Code Project Manager Installer${NC}"
echo "========================================"
echo ""

# 确认目标目录
if [ "$TARGET_DIR" != "." ]; then
    echo -e "目标目录: ${YELLOW}$TARGET_DIR${NC}"
else
    echo -e "目标目录: ${YELLOW}$(pwd)${NC}"
fi
echo ""

# 检查目标目录是否存在
if [ ! -d "$TARGET_DIR" ]; then
    echo -e "${RED}错误: 目标目录不存在${NC}"
    exit 1
fi

# 确认安装
read -p "是否继续安装？(y/n) " -n 1 -r
echo ""
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "已取消安装"
    exit 0
fi

echo ""
echo "开始安装..."

# 复制 .claude 目录
echo -n "复制 .claude/ ... "
if [ -d "$TARGET_DIR/.claude" ]; then
    echo -e "${YELLOW}已存在，跳过${NC}"
else
    cp -r "$SCRIPT_DIR/.claude" "$TARGET_DIR/"
    echo -e "${GREEN}完成${NC}"
fi

# 复制 engineering 目录
echo -n "复制 engineering/ ... "
if [ -d "$TARGET_DIR/engineering" ]; then
    echo -e "${YELLOW}已存在，合并${NC}"
    cp -rn "$SCRIPT_DIR/engineering/"* "$TARGET_DIR/engineering/" 2>/dev/null || true
else
    cp -r "$SCRIPT_DIR/engineering" "$TARGET_DIR/"
    echo -e "${GREEN}完成${NC}"
fi

# 复制 product 目录
echo -n "复制 product/ ... "
if [ -d "$TARGET_DIR/product" ]; then
    echo -e "${YELLOW}已存在，跳过${NC}"
else
    cp -r "$SCRIPT_DIR/product" "$TARGET_DIR/"
    echo -e "${GREEN}完成${NC}"
fi

echo ""
echo -e "${GREEN}安装完成!${NC}"
echo ""
echo "下一步操作："
echo "1. 在 Claude Code 中运行: /project:init"
echo "2. 编辑 .claude/memory-bank/projectBrief.md 填写项目信息"
echo "3. 开始开发: /session:start"
echo ""
echo "更多信息请查看 README.md"
