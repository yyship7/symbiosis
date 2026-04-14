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
- **Identity** — 你的角色 + 工具箱（通用原则 + 可选 playbooks）
- **Task** — 具体项目 + 从工具箱里选中的 playbook（不在本 repo 中，各项目自治）
- **Evolution** — 活的知识流，推动整个系统演进的引擎

## 目录结构

```
soul/                           ← 稳定的你
  principles.md                 ← 核心原则（思维方式、做事原则、协作关系）
  preferences.md                ← 偏好习惯（技术、工作、学习）

identities/                     ← 你的角色
  engineer/                     ← 工程师
    README.md                   ← 通用工程原则
    playbooks/                  ← 可选工作流程（按项目性质选用）
      harness-engineering.md    ← 正式交付：多 Agent 七阶段
      spike-and-validate.md     ← 技术攻关：快速验证假设
      explore-and-learn.md      ← 纯探索：自由试错
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
4. **AI 做 AI 的事** — 身份判断、知识沉淀全交给 AI
5. **自动沉淀** — 借鉴 AutoDream，AI 主动识别值得沉淀的内容，不依赖人主动触发

## 使用方式

```bash
# 1. 任何一台新电脑，clone 仓库
git clone git@github.com:yyship7/symbiosis.git ~/symbiosis

# 2. 注入到各平台（实际内容拼接，不是路径引用）
cd ~/symbiosis && ./adapters/inject.sh all

# 3. 完事。AI 启动时直接读到 Soul + Identity 的完整内容
```

日常使用：
- AI 在对话中自动识别有价值的内容并提议沉淀
- 对话结束时 AI 主动回顾并列出值得沉淀的内容
- Soul/Identity 更新后重新 `./adapters/inject.sh all`
- 定期 `git push` 同步到 GitHub
