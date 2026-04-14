# 🧠 Symbiosis - 数字体内核

> 跨平台的"数字体内核"。各平台的 Agent 是手和脚，Symbiosis 是大脑。

## 定位

```
                    Symbiosis（内核）
                    ┌─────────────┐
                    │ Soul        │ ← 你是谁
                    │ Identity    │ ← 你的角色 + 能力
                    │ Evolution   │ ← 你的认知资产
                    └──────┬──────┘
                           │ inject.sh 注入
          ┌────────┬───────┼───────┬────────┐
          ▼        ▼       ▼       ▼        ▼
     CodeBuddy  Claude  OpenClaw  Hermes  未来平台
               Code               Agent
          │        │       │       │        │
          └────────┴───────┴───────┴────────┘
                           │ 跨平台认知回流
                           ▼
                      Evolution
```

**平台来来去去，内核不丢。A 平台学到的，B 平台能用。**

## 架构

```
Soul ←──反哺──┐
  │            │
  ↓            │
Identity ←─反哺─┤
  │            │
  ↓            │
Task ──产出──→ Evolution（心脏）
```

- **Soul** — 你是谁，恒定的内核
- **Identity** — 你的角色 + 可选 playbooks
- **Task** — 具体项目（不在本 repo 中，各项目自治，从 playbooks 中选用工作流程）
- **Evolution** — 跨平台认知系统，各平台的认知在这里汇聚、验证、毕业

## 目录结构

```
soul/                           ← 稳定的你
  principles.md                 ← 核心原则、协作关系、知识回流规则
  preferences.md                ← 偏好习惯

identities/                     ← 你的角色
  engineer/                     ← 工程师
    README.md                   ← 通用工程原则
    harness-engineering.md      ← 从实践中长出来的：多 Agent 七阶段
  writer.md                     ← 写作者
  learner.md                    ← 学习者

evolution/                      ← 跨平台认知系统（心脏）
  journal.md                    ← 演进日志
  insights/                     ← 洞察与判断
  frameworks/                   ← 方法论（归属待定）
  open-questions/               ← 待验证假设

adapters/                       ← 平台注入
  inject.sh                     ← 注入脚本
  README.md                     ← 各平台利用指引
```

## 设计原则

1. **Symbiosis 是内核，不是执行引擎** — 执行靠各平台原生能力
2. **各平台是手脚，内核是大脑** — 利用 Claude Code 的 AutoDream、OpenClaw 的 Heartbeat、Hermes 的自进化
3. **跨平台认知回流** — 各平台产生的洞察汇聚到 Evolution，成熟后反哺 Soul / Identity
4. **Git 是家** — 仓库是唯一真相源，`inject.sh` 把内核注入到各平台

## 使用方式

```bash
# 1. Clone
git clone git@github.com:yyship7/symbiosis.git ~/symbiosis

# 2. 注入到各平台
cd ~/symbiosis && ./adapters/inject.sh all

# 3. 日常：各平台产生认知 → 回流到 evolution/ → git push 同步
```
