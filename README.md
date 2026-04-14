# 🧠 Digital Self - 数字体

> 现实的人和数字的人结合，协同进化。

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

- **Soul** — 你是谁，恒定的内核（被 Evolution 慢慢改变）
- **Identity** — 你的某个侧面/角色（被 Evolution 慢慢丰富）
- **Task** — 某个身份下的具体项目（不在本 repo 中，各项目自治）
- **Evolution** — 活的知识流，推动整个系统演进的引擎

## 目录结构

```
soul/                           ← 稳定的你
  principles.md                 ← 核心原则（思维方式、做事原则、沟通风格）
  preferences.md                ← 偏好习惯（技术、工作、学习）

identities/                     ← 你的角色
  engineer.md                   ← 工程师
  writer.md                     ← 写作者
  learner.md                    ← 学习者

evolution/                      ← 认知系统（心脏）
  journal.md                    ← 演进日志（Soul/Identity 的重大变更记录）
  insights/                     ← 洞察与判断（日常产出的认知）
  frameworks/                   ← 方法论与流程（经验证的可复用知识）
  open-questions/               ← 待验证假设（还没确认的判断）

adapters/                       ← 各平台启动配置（软链到对应位置即可）
  codebuddy.md                  ← CodeBuddy 全局 Rules
  claude.md                     ← Claude Code 全局 CLAUDE.md
  openclaw.md                   ← OpenClaw 启动引导
  README.md                     ← 使用说明
```

## 设计原则

1. **Soul × Identity × Task = 当下的你** — 三层穿透，AI 在任何任务中都能表现得像你
2. **Evolution 是心脏** — 知识在这里生长、验证、成熟，反哺 Soul 和 Identity
3. **Git 是家** — 仓库是唯一真相源，各平台只是投影
4. **AI 做 AI 的事** — 身份判断、格式适配、知识沉淀全交给 AI，人不干这些
5. **零手动** — clone 仓库 + 软链配置文件，之后一切自动

## 使用方式

```bash
# 1. 任何一台新电脑，clone 仓库
git clone git@github.com:<你的用户名>/thinking.git ~/thinking

# 2. 按需软链到各平台（一次性）
ln -sf ~/thinking/adapters/codebuddy.md ~/.codebuddy/rules/digital-self.md
ln -sf ~/thinking/adapters/claude.md ~/.claude/CLAUDE.md
ln -sf ~/thinking/adapters/openclaw.md ~/.openclaw/workspace/BOOTSTRAP.md

# 3. 完事。AI 启动时自动读仓库、判断身份、开始协作
```

日常使用：
- 对话中有价值的内容说"沉淀一下"，AI 自动写入 `evolution/`
- 定期 `git push` 同步到 GitHub
- 定期回顾 `open-questions/`，验证通过则反哺 Soul / Identity
