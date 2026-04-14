# Adapters - 平台注入与利用指引

> 把 Symbiosis 内核注入到各平台，并指导各平台利用自身原生能力做知识回流。

## 使用方式

```bash
# 1. Clone 仓库
git clone git@github.com:yyship7/symbiosis.git ~/symbiosis

# 2. 注入到各平台
cd ~/symbiosis && ./adapters/inject.sh all

# 3. Soul/Identity 更新后重新注入
cd ~/symbiosis && ./adapters/inject.sh all
```

## 各平台利用指引

Symbiosis 提供内核（Soul + Identity + Evolution），**执行和记忆管理利用各平台原生能力**：

### CodeBuddy

| Symbiosis 层 | 注入到 | 利用的原生能力 |
|--------------|--------|---------------|
| Soul + Identity | `~/.codebuddy/rules/digital-self.md` | Rules 自动加载 |
| Playbooks | 按需手动引用或做成 Skills | Skills 机制 |
| 知识回流 | AI 写入 `~/symbiosis/evolution/` | Memory 功能 |

### Claude Code

| Symbiosis 层 | 注入到 | 利用的原生能力 |
|--------------|--------|---------------|
| Soul + Identity | `~/.claude/CLAUDE.md` | 自动加载 |
| Playbooks | 项目级 `.claude/rules/` 或 `.claude/skills/` | rules + skills |
| 知识回流 | **AutoDream 自动提取 + 整理**，有价值的同步到 `~/symbiosis/evolution/` | Auto Memory + AutoDream |

### OpenClaw

| Symbiosis 层 | 注入到 | 利用的原生能力 |
|--------------|--------|---------------|
| Soul | `~/.openclaw/workspace/SOUL.md` | 人格定义 |
| Identity | `~/.openclaw/workspace/AGENTS.md` | 行为准则 |
| Preferences | `~/.openclaw/workspace/USER.md` | 用户档案 |
| 知识回流 | **Heartbeat 定期检查** + memory/ 日志，有价值的同步到 `~/symbiosis/evolution/` | Heartbeat + Memory 双层 |

### Hermes Agent

| Symbiosis 层 | 注入到 | 利用的原生能力 |
|--------------|--------|---------------|
| Soul + Identity | `~/.hermes/memories/MEMORY.md` + `USER.md` | 冻结快照注入 |
| Playbooks | 自动生成 Skills（Hermes 的核心能力） | **自进化闭环——自动从执行轨迹生成 Skills** |
| 知识回流 | Hermes 自动提取经验，有价值的同步到 `~/symbiosis/evolution/` | Skills 自进化 + 会话搜索 |

## 知识回流协议

### 问题
AI 在项目工作区内干活，但 `~/symbiosis/evolution/` 在另一个目录，跨目录写文件在很多平台上受限。

### 解决方案：暂存 + 收割

```
AI 在项目内干活，产生有价值的认知
  │
  ▼
写入当前项目的 .symbiosis/ 暂存目录（在工作区内，无跨目录问题）
  │
  ▼
harvest.sh 收割 → 移入 ~/symbiosis/evolution/（定期或手动执行）
  │
  ▼
成熟后反哺 Soul / Identity → inject.sh → 所有平台同步更新
```

### 操作

```bash
# 收割所有已注册项目
./adapters/harvest.sh

# 收割指定项目
./adapters/harvest.sh ~/Work/project-a

# 注册项目（编辑 projects.txt，每行一个路径）
vim adapters/projects.txt
```

### 什么该回流，什么不该

- **回流**：跨项目/跨平台有复用价值的认知（方法论、原则、判断）
- **不回流**：项目特定的细节（API 路径、编译命令、调试步骤）
