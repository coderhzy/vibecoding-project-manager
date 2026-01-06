# 项目初始化执行指令

## 步骤 1：扫描项目结构

执行以下检测：

```
检查文件：
- package.json → Node.js/前端项目
- pyproject.toml / requirements.txt → Python 项目
- go.mod → Go 项目
- Cargo.toml → Rust 项目
- pom.xml / build.gradle → Java 项目
- *.sln / *.csproj → .NET 项目

检查目录：
- src/ → 源代码目录
- app/ → 应用目录（Next.js/Laravel等）
- lib/ → 库代码
- tests/ / __tests__/ → 测试目录
- docs/ → 文档目录
```

## 步骤 2：识别技术栈

根据扫描结果，识别：

```yaml
项目类型: [前端 | 后端 | 全栈 | 库 | CLI工具 | 其他]
主要语言: [TypeScript | Python | Go | Rust | Java | ...]
框架: [Next.js | FastAPI | Express | Django | ...]
数据库: [PostgreSQL | MySQL | MongoDB | Redis | ...]
构建工具: [npm | pnpm | yarn | poetry | cargo | ...]
```

## 步骤 3：生成 projectBrief.md

使用以下模板填充：

```markdown
# 项目简报

## 基本信息

- **项目名称**：{从 package.json/pyproject.toml 提取}
- **项目类型**：{识别的类型}
- **版本**：{当前版本}

## 技术栈

- **语言**：{主要语言}
- **框架**：{使用的框架}
- **数据库**：{如果有}
- **其他依赖**：{关键依赖}

## 项目结构

{简要描述目录结构}

## 核心功能

{根据代码分析推断，或标记为待填写}

## 开发规范

{检测到的规范，如 ESLint、Prettier、Black 等}
```

## 步骤 4：初始化 activeContext.md

```markdown
# 当前上下文

## 活跃区域

- 初始化阶段，尚未确定活跃区域

## 最近变更

- {当前日期}: 项目初始化

## 待处理事项

- [ ] 完善项目简报
- [ ] 确认开发规范
- [ ] 创建首个开发计划

## 技术决策

暂无
```

## 步骤 5：创建会话记录

文件：`.claude/sessions/{YYYY-MM-DD}-init.md`

```markdown
# 会话：项目初始化

- **日期**：{当前日期}
- **类型**：初始化

## 执行内容

1. 扫描项目结构
2. 识别技术栈
3. 生成项目简报
4. 初始化开发环境

## 发现

{项目分析结果}

## 下一步

- 用户确认项目简报
- 开始正式开发
```

## 完成提示

初始化完成后，向用户报告：

```
✅ 项目初始化完成

已生成：
- .claude/memory-bank/projectBrief.md（项目简报）
- .claude/memory-bank/activeContext.md（当前上下文）
- .claude/sessions/{date}-init.md（会话记录）

检测到的技术栈：
- 语言：{语言}
- 框架：{框架}
- 类型：{类型}

建议：
1. 查看并完善 projectBrief.md
2. 使用 /session:start 开始正式开发
```
