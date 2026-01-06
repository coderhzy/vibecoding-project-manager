# Backend Rules

后端开发规范索引。

## 规则列表

| 文件 | 内容 |
|------|------|
| api.md | API 设计规范 |
| database.md | 数据库规范 |
| error-handling.md | 错误处理规范 |
| testing.md | 测试规范 |

## 通用原则

### 代码风格

- 使用项目统一的代码格式化工具
- 遵循语言官方风格指南
- 保持一致的命名规范

### API 设计

- RESTful 风格（或 GraphQL）
- 统一的响应格式
- 完整的错误处理

### 安全

- 输入验证
- SQL 注入防护
- 认证授权

## 禁止操作

- **NEVER** 在代码中硬编码密钥
- **NEVER** 直接拼接 SQL 语句
- **NEVER** 返回敏感信息到前端
- **NEVER** 跳过输入验证

## 目录结构

```
backend/
├── README.md           # 本文件
├── api.md             # API 规范
├── database.md        # 数据库规范
├── error-handling.md  # 错误处理
└── testing.md         # 测试规范
```

---

> 根据项目实际需要添加具体规则文件
