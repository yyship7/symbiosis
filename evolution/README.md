# Evolution - 跨平台认知系统

> Symbiosis 的心脏。**各平台产生的跨平台认知在这里汇聚、验证、成熟，最终反哺 Soul 和 Identity。**

## 定位

```
各平台（CodeBuddy / Claude Code / OpenClaw / Hermes / ...）
  │
  │ 跨平台认知回流
  ▼
evolution/
  ├── insights/         ← 洞察和判断
  ├── frameworks/       ← 可复用方法论（归属待定）
  └── open-questions/   ← 待验证假设
  │
  │ 成熟后反哺
  ▼
Soul / Identity → inject.sh → 所有平台同步更新
```

## 什么该回流，什么不该

| 该回流（跨平台认知） | 不该回流（平台级记忆） |
|----------------------|----------------------|
| 方法论、原则、判断 | 调试经验、API 路径、编译命令 |
| 跨身份通用的做事方式 | 某个项目的具体配置 |
| 经验证的假设结论 | 临时的操作步骤 |

## 整理机制

Evolution 不能无限增长。定期整理：

### 毕业规则
- insights 中反复验证的认知 → **毕业到 Soul（跨身份）或 Identity（单身份）**
- frameworks 中归属明确的 → **移入对应 Identity 的 playbooks/**
- open-questions 中已验证的 → 标记结论，反哺上层后归档

### 反哺的具体流程

**insight → Soul/Identity 的路径：**

```
insight（单次观察/判断）
  ↓ 在 2-3 个不同场景中被验证
  ↓ 确认"这确实是我的模式/原则"
  ↓
写入 Soul（跨身份通用）或 Identity（特定角色）
  ↓
原 insight 标记为"已毕业 ✅"或删除
```

**触发时机：** 不要定期整理。在实践中碰到某条 insight 又被验证了一次时，顺手搬。这比"每周整理一次"更符合"在行动中思考"的认知方式。

**AI 协助判断：** AI 在对话中如果发现某条 insight 被反复引用或验证，应主动建议："这条 insight 已经多次验证，是否毕业到 Soul/Identity？"并给出具体的写入草稿，等确认后再写入。

### insight → framework → playbook → skill 的封装路径

```
insight（洞察：发现了什么）
  ↓ 提炼出可操作的步骤
framework（方法论：怎么做，状态 🟠草案）
  ↓ 多次实践，补充实践记录，迭代步骤
framework（状态升级为 🟢实践中 → 🔵成熟）
  ↓ 归属明确，移入对应 Identity
playbook（在 identities/<role>/playbooks/ 下）
  ↓ 其中有步骤足够标准化，可以让 AI 自动执行
skill（封装为平台 Skill，状态标记 ⚡）
```

**判断标准：**
- insight → framework：这条洞察能变成"下次碰到类似情况，按 1-2-3 步骤做"吗？能就提炼。
- framework → playbook：这套步骤在 3+ 次实践中稳定有效吗？有就搬。
- playbook → skill：其中有没有 AI 可以自动完成的环节？有就封装。

**注意：不要跳步。** 没有经过实践验证的 insight 不要直接封装成 skill。每一层的跃迁都需要真实的实践记录支撑。

### 修剪规则（借鉴 AutoDream）
- 被证伪的洞察 → 删除或标记为 ❌
- 被新认知取代的旧认知 → 合并或删除
- 超过 6 个月无更新的 open-questions → 评估是否还有价值

### 容量参考
- insights/ 保持活跃条目 ≤ 30 条
- frameworks/ 保持待归属条目 ≤ 10 条
- open-questions/ 保持活跃条目 ≤ 15 条
- 超出时优先合并或毕业，而非无限增长
