# 安装指南

## 方式 1：使用安装脚本（推荐）

```bash
# 1. 进入 project-manager 目录
cd project-manager

# 2. 添加执行权限
chmod +x install.sh

# 3. 安装到目标项目
./install.sh /path/to/your-project

# 或者安装到当前目录
./install.sh .
```

## 方式 2：手动复制

```bash
# 复制核心文件
cp -r project-manager/.claude your-project/
cp -r project-manager/engineering your-project/
cp -r project-manager/product your-project/
```

## 方式 3：选择性安装

只需要核心功能：
```bash
cp -r project-manager/.claude your-project/
```

需要文档体系：
```bash
cp -r project-manager/.claude your-project/
cp -r project-manager/engineering your-project/
```

完整安装：
```bash
cp -r project-manager/.claude your-project/
cp -r project-manager/engineering your-project/
cp -r project-manager/product your-project/
```

## 安装后配置

### 1. 初始化项目

在 Claude Code 中运行：
```
/project:init
```

### 2. 填写项目信息

编辑 `.claude/memory-bank/projectBrief.md`：
- 项目名称
- 项目简介
- 核心功能
- 技术栈

### 3. 配置 CLAUDE.md

编辑 `.claude/CLAUDE.md`：
- 更新常用命令
- 添加项目特定的禁止操作
- 配置导入路径

### 4. 添加项目特定规则

在 `.claude/rules/` 中添加：
- `backend/api.md` - API 规范
- `frontend/components.md` - 组件规范
- 其他项目特定规则

## 目录结构说明

```
your-project/
├── .claude/                 # Claude Code 配置
│   ├── CLAUDE.md           # 主入口
│   ├── commands/           # Slash Commands
│   │   ├── project/       # 项目管理命令
│   │   ├── session/       # 会话管理命令
│   │   └── workflow/      # 工作流命令
│   ├── rules/             # 模块化规则
│   ├── plans/             # 版本化计划
│   ├── sessions/          # 会话记录
│   ├── memory-bank/       # 持久化记忆
│   └── TODO.md            # 任务清单
│
├── engineering/            # 工程文档
│   ├── architecture/      # 技术架构
│   │   └── prompt-engineering/  # Prompt 规范
│   ├── planning/          # 开发规划
│   └── standup/           # 站会记录
│
└── product/               # 产品文档
    ├── overview.md
    ├── changelog.md
    └── user-guide.md
```

## 更新框架

当 project-manager 有更新时：

```bash
# 备份当前配置
cp -r .claude .claude.backup

# 更新命令和模板（不覆盖已有文件）
cp -rn project-manager/.claude/commands .claude/
cp -rn project-manager/engineering/architecture/prompt-engineering engineering/architecture/

# 手动合并需要的更新
```

## 卸载

```bash
# 删除 .claude 目录
rm -rf .claude

# 可选：删除文档目录
rm -rf engineering product
```

## 常见问题

### Q: 安装后 Slash Commands 不生效？

A: 确保 `.claude/commands/` 目录结构正确，并重启 Claude Code。

### Q: 如何与现有 CLAUDE.md 合并？

A: 手动将现有内容合并到新的 `.claude/CLAUDE.md` 中，保留项目特定配置。

### Q: 可以只使用部分功能吗？

A: 可以。只复制需要的目录，如只需要 Slash Commands：
```bash
cp -r project-manager/.claude/commands your-project/.claude/
```
