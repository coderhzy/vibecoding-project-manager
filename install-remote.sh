#!/bin/bash

# Claude Code Project Manager - Remote Installation Script
# 一键安装脚本，支持从 GitHub 远程安装
#
# 使用方式：
# curl -fsSL https://raw.githubusercontent.com/coderhzy/vibecoding-project-manager/main/install-remote.sh | bash
# curl -fsSL https://raw.githubusercontent.com/coderhzy/vibecoding-project-manager/main/install-remote.sh | bash -s -- /path/to/project

set -e

# ============================================================
# 配置区域
# ============================================================
REPO_OWNER="coderhzy"                        # GitHub 用户名
REPO_NAME="vibecoding-project-manager"       # 仓库名
BRANCH="main"                                # 分支名
BASE_URL="https://raw.githubusercontent.com/${REPO_OWNER}/${REPO_NAME}/${BRANCH}"

# ============================================================
# 颜色定义
# ============================================================
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# ============================================================
# 工具函数
# ============================================================
print_banner() {
    echo -e "${CYAN}"
    echo "╔═══════════════════════════════════════════════════════════╗"
    echo "║                                                           ║"
    echo "║        Claude Code Project Manager Installer              ║"
    echo "║                                                           ║"
    echo "║   全自动开发流程 · 按日期维护文档 · 多人协作支持            ║"
    echo "║                                                           ║"
    echo "╚═══════════════════════════════════════════════════════════╝"
    echo -e "${NC}"
}

log_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

log_success() {
    echo -e "${GREEN}[✓]${NC} $1"
}

log_warn() {
    echo -e "${YELLOW}[!]${NC} $1"
}

log_error() {
    echo -e "${RED}[✗]${NC} $1"
}

# ============================================================
# 检查依赖
# ============================================================
check_dependencies() {
    log_info "检查依赖..."

    if ! command -v curl &> /dev/null; then
        log_error "需要 curl，请先安装"
        exit 1
    fi

    if ! command -v git &> /dev/null; then
        log_warn "未检测到 git，部分功能可能受限"
    fi

    log_success "依赖检查通过"
}

# ============================================================
# 下载文件
# ============================================================
download_file() {
    local remote_path=$1
    local local_path=$2
    local url="${BASE_URL}/${remote_path}"

    mkdir -p "$(dirname "$local_path")"

    if curl -fsSL "$url" -o "$local_path" 2>/dev/null; then
        return 0
    else
        return 1
    fi
}

# ============================================================
# 主安装函数
# ============================================================
install_project_manager() {
    local target_dir=$1

    log_info "开始安装到: ${target_dir}"
    echo ""

    # 检测已有配置
    echo -e "${CYAN}━━━ 检测已有配置 ━━━${NC}"
    local has_existing=false

    if [ -f "${target_dir}/CLAUDE.md" ]; then
        echo -e "  ${GREEN}✓${NC} 检测到 CLAUDE.md (将保留并自动引用)"
        has_existing=true
    fi

    if [ -f "${target_dir}/.cursorrules" ]; then
        echo -e "  ${GREEN}✓${NC} 检测到 .cursorrules (将在初始化时读取)"
        has_existing=true
    fi

    if [ -d "${target_dir}/.cursor/rules" ]; then
        echo -e "  ${GREEN}✓${NC} 检测到 .cursor/rules/ (将在初始化时读取)"
        has_existing=true
    fi

    if [ -f "${target_dir}/README.md" ]; then
        echo -e "  ${GREEN}✓${NC} 检测到 README.md (将在初始化时提取信息)"
        has_existing=true
    fi

    if [ "$has_existing" = false ]; then
        echo -e "  ${YELLOW}-${NC} 未检测到已有配置"
    fi

    echo ""

    # 文件列表 - 核心文件
    local files=(
        # CLAUDE.md 主入口
        ".claude/CLAUDE.md"
        ".claude/TODO.md"

        # Skills
        ".claude/skills/README.md"
        ".claude/skills/_checkpoints.md"
        ".claude/skills/auto-pilot/SKILL.md"
        ".claude/skills/daily-log/SKILL.md"
        ".claude/skills/project-init/SKILL.md"
        ".claude/skills/project-init/init.md"
        ".claude/skills/session-auto/SKILL.md"
        ".claude/skills/memory-sync/SKILL.md"
        ".claude/skills/plan-maker/SKILL.md"
        ".claude/skills/todo-runner/SKILL.md"
        ".claude/skills/code-review/SKILL.md"
        ".claude/skills/git-commit/SKILL.md"
        ".claude/skills/team-sync/SKILL.md"

        # Commands
        ".claude/commands/project/init.md"
        ".claude/commands/project/makePlan.md"
        ".claude/commands/project/makeTODOS.md"
        ".claude/commands/project/nextTODO.md"
        ".claude/commands/project/finishPlan.md"
        ".claude/commands/session/start.md"
        ".claude/commands/session/update.md"
        ".claude/commands/session/end.md"
        ".claude/commands/session/list.md"
        ".claude/commands/workflow/understand.md"
        ".claude/commands/workflow/update-memory.md"
        ".claude/commands/daily/today.md"
        ".claude/commands/daily/search.md"

        # Memory Bank
        ".claude/memory-bank/projectBrief.md"
        ".claude/memory-bank/activeContext.md"
        ".claude/memory-bank/progress.md"

        # Rules
        ".claude/rules/_template.md"
        ".claude/rules/backend/README.md"
        ".claude/rules/frontend/README.md"
        ".claude/rules/prompt/README.md"

        # Team
        ".claude/team/status.md"
        ".claude/team/decisions.md"

        # Daily template
        ".claude/daily/_template.md"
    )

    # 工程文档（可选）
    local engineering_files=(
        "engineering/architecture/prompt-engineering/README.md"
        "engineering/architecture/prompt-engineering/00-quick-start.md"
        "engineering/architecture/prompt-engineering/00-overview.md"
        "engineering/planning/backlog.md"
        "engineering/standup/_template.md"
    )

    # 产品文档（可选）
    local product_files=(
        "product/overview.md"
        "product/changelog.md"
        "product/user-guide.md"
    )

    # 下载核心文件
    echo -e "${CYAN}━━━ 下载核心文件 ━━━${NC}"
    local success_count=0
    local fail_count=0

    for file in "${files[@]}"; do
        local target_path="${target_dir}/${file}"

        if [ -f "$target_path" ]; then
            echo -e "  ${YELLOW}跳过${NC} $file (已存在)"
        else
            printf "  下载 %-50s " "$file"
            if download_file "$file" "$target_path"; then
                echo -e "${GREEN}✓${NC}"
                ((success_count++))
            else
                echo -e "${RED}✗${NC}"
                ((fail_count++))
            fi
        fi
    done

    echo ""
    echo -e "${CYAN}━━━ 下载工程文档 ━━━${NC}"

    for file in "${engineering_files[@]}"; do
        local target_path="${target_dir}/${file}"

        if [ -f "$target_path" ]; then
            echo -e "  ${YELLOW}跳过${NC} $file (已存在)"
        else
            printf "  下载 %-50s " "$file"
            if download_file "$file" "$target_path"; then
                echo -e "${GREEN}✓${NC}"
                ((success_count++))
            else
                echo -e "${YELLOW}-${NC} (可选)"
            fi
        fi
    done

    echo ""
    echo -e "${CYAN}━━━ 下载产品文档 ━━━${NC}"

    for file in "${product_files[@]}"; do
        local target_path="${target_dir}/${file}"

        if [ -f "$target_path" ]; then
            echo -e "  ${YELLOW}跳过${NC} $file (已存在)"
        else
            printf "  下载 %-50s " "$file"
            if download_file "$file" "$target_path"; then
                echo -e "${GREEN}✓${NC}"
                ((success_count++))
            else
                echo -e "${YELLOW}-${NC} (可选)"
            fi
        fi
    done

    # 创建必要的空目录
    mkdir -p "${target_dir}/.claude/plans"
    mkdir -p "${target_dir}/.claude/sessions"
    mkdir -p "${target_dir}/.claude/daily/archive"
    mkdir -p "${target_dir}/.claude/team/standup"

    echo ""
    log_success "安装完成！下载了 ${success_count} 个文件"

    if [ $fail_count -gt 0 ]; then
        log_warn "${fail_count} 个文件下载失败（可能是可选文件）"
    fi
}

# ============================================================
# 显示使用说明
# ============================================================
show_usage() {
    echo ""
    echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${GREEN}                        安装成功！                            ${NC}"
    echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo ""
    echo -e "${CYAN}下一步操作：${NC}"
    echo ""
    echo "  1. 打开 Claude Code"
    echo ""
    echo "  2. 运行初始化命令（可选，推荐）："
    echo -e "     ${YELLOW}/project:init${NC}"
    echo "     这会自动分析项目结构、技术栈，并读取已有配置"
    echo ""
    echo "  3. 直接说你要做什么，例如："
    echo -e "     ${YELLOW}\"帮我实现用户登录功能\"${NC}"
    echo ""
    echo "  4. 在每个检查点确认即可 (输入 y)"
    echo ""
    echo -e "${CYAN}已有配置处理：${NC}"
    echo ""
    echo "  ✓ 根目录 CLAUDE.md 会被保留并自动引用"
    echo "  ✓ .cursorrules、README.md 会在初始化时读取"
    echo "  ✓ 项目信息会写入 .claude/memory-bank/projectBrief.md"
    echo ""
    echo -e "${CYAN}常用命令：${NC}"
    echo ""
    echo "  /project:init       初始化项目（分析技术栈）"
    echo "  /daily:today        查看今日开发日志"
    echo "  /daily:search \"xx\"  搜索历史记录"
    echo ""
    echo -e "${CYAN}文档位置：${NC}"
    echo ""
    echo "  .claude/daily/      按日期的开发日志"
    echo "  .claude/team/       团队协作文档"
    echo "  .claude/memory-bank/ 项目记忆（技术栈、上下文）"
    echo ""
    echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
}

# ============================================================
# 主程序
# ============================================================
main() {
    print_banner

    local skip_confirm=false
    local target_dir="."

    # 解析参数
    while [[ $# -gt 0 ]]; do
        case $1 in
            -y|--yes)
                skip_confirm=true
                shift
                ;;
            *)
                target_dir="$1"
                shift
                ;;
        esac
    done

    # 转换为绝对路径
    if [[ "$target_dir" != /* ]]; then
        target_dir="$(pwd)/$target_dir"
    fi

    # 规范化路径
    target_dir=$(cd "$target_dir" 2>/dev/null && pwd || echo "$target_dir")

    echo -e "目标目录: ${YELLOW}${target_dir}${NC}"
    echo ""

    # 检查目标目录
    if [ ! -d "$target_dir" ]; then
        log_error "目标目录不存在: $target_dir"
        exit 1
    fi

    # 确认安装
    echo -e "即将安装 Claude Code Project Manager 到此目录"
    echo ""

    # 检测是否通过管道运行（curl | bash）或使用了 -y 参数
    if [[ "$skip_confirm" == true ]]; then
        log_info "使用 -y 参数，跳过确认..."
    elif [[ ! -t 0 ]]; then
        # 非交互模式，自动继续
        log_info "检测到非交互模式，自动继续安装..."
    else
        # 交互模式，询问确认
        read -p "是否继续？(y/n) " -n 1 -r
        echo ""

        if [[ ! $REPLY =~ ^[Yy]$ ]]; then
            log_warn "已取消安装"
            exit 0
        fi
    fi

    echo ""

    # 检查依赖
    check_dependencies

    echo ""

    # 执行安装
    install_project_manager "$target_dir"

    # 显示使用说明
    show_usage
}

# 运行主程序
main "$@"
