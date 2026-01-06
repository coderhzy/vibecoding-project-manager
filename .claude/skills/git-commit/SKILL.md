# git-commit

智能 Git 提交管理，自动生成规范的提交信息。

## 触发条件

### 自动触发
- 代码审查通过后
- 用户明确表示"提交"
- 完成 TODO 任务后

### 手动触发
- `/commit`
- `/commit:amend`
- `/commit:fixup`

## Commit Message 规范

### 格式

```
<type>(<scope>): <subject>

<body>

<footer>
```

### Type 类型

| Type | 描述 | Emoji |
|------|------|-------|
| feat | 新功能 | ✨ |
| fix | Bug 修复 | 🐛 |
| docs | 文档更新 | 📝 |
| style | 代码格式 | 💄 |
| refactor | 重构 | ♻️ |
| perf | 性能优化 | ⚡ |
| test | 测试 | ✅ |
| build | 构建系统 | 📦 |
| ci | CI 配置 | 👷 |
| chore | 杂项 | 🔧 |
| revert | 回滚 | ⏪ |

### Scope 范围

自动从修改的文件路径推断：
- `src/api/*` → `api`
- `src/components/*` → `components`
- `src/models/*` → `models`
- 多个范围用逗号分隔

### Subject 主题

规则：
- 使用祈使语气（"add" not "added"）
- 不超过 50 字符
- 首字母小写
- 不以句号结尾

## 执行流程

### 1. 分析变更

```bash
git diff --staged --stat
git diff --staged
```

分析内容：
- 修改的文件列表
- 变更的代码行数
- 变更的性质（新增/修改/删除）

### 2. 推断提交类型

根据变更内容自动推断：

```
新文件 + 功能代码 → feat
修改现有文件 + 修复逻辑 → fix
*.md 文件 → docs
*.test.* / *.spec.* → test
package.json / 依赖变更 → build
仅代码格式变更 → style
```

### 3. 生成提交信息

```markdown
feat(api): add user authentication endpoint

- implement JWT token generation
- add login/logout endpoints
- add password hashing with bcrypt

Closes #123
```

### 4. 确认提交

```
📝 生成的提交信息：

feat(api): add user authentication endpoint

- implement JWT token generation
- add login/logout endpoints
- add password hashing with bcrypt

Closes #123

确认提交？(y/n/e)
- y: 确认提交
- n: 取消
- e: 编辑后提交
```

## 智能关联

### 关联 Issue

自动检测并关联：
- TODO.md 中的任务 ID
- 分支名中的 issue 号
- 代码注释中的 issue 引用

### 关联 PR

生成 PR 友好的提交：
- 保持提交原子性
- 清晰的变更说明
- 便于 review 的结构

## 批量提交

支持将多个变更拆分为多个提交：

```
检测到多个不相关的变更：
1. src/api/auth.ts (认证相关)
2. src/utils/format.ts (工具函数)
3. docs/api.md (文档)

建议拆分为 3 个提交？(y/n)
```

## 安全检查

### NEVER 提交
- `.env` / `.env.*`
- `**/secrets/**`
- `credentials.json`
- `*.pem` / `*.key`
- 包含 API Key / Token 的文件

### ALWAYS 警告
- 大文件 (>1MB)
- 二进制文件
- 生成的文件 (dist/, build/)
- node_modules/

## 与工作流集成

提交成功后：
1. 更新 TODO.md（标记相关任务完成）
2. 更新会话记录
3. 同步 memory-bank
4. 提示是否需要 push

```
✅ 提交成功

commit: a1b2c3d
message: feat(api): add user authentication

已完成任务：
- [x] #task-001 实现用户认证

下一步：
- git push origin feature/auth
- 创建 Pull Request
```
