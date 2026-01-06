# Frontend Rules

前端开发规范索引。

## 规则列表

| 文件 | 内容 |
|------|------|
| components.md | 组件设计规范 |
| styling.md | 样式规范 |
| state.md | 状态管理规范 |
| testing.md | 测试规范 |

## 通用原则

### 组件设计

- 单一职责原则
- 组件粒度适中
- Props 类型完整

### 样式

- 使用项目统一的样式方案
- 响应式设计
- 主题一致性

### 性能

- 合理的代码分割
- 图片懒加载
- 避免不必要的重渲染

## 禁止操作

- **NEVER** 在组件中直接操作 DOM
- **NEVER** 使用内联样式（除非动态计算）
- **NEVER** 在 render 中创建新对象/函数
- **NEVER** 忽略 TypeScript 错误

## 目录结构

```
frontend/
├── README.md          # 本文件
├── components.md      # 组件规范
├── styling.md         # 样式规范
├── state.md           # 状态管理
└── testing.md         # 测试规范
```

---

> 根据项目实际需要添加具体规则文件
