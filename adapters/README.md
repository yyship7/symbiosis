# Adapters - 平台注入

> 把 Soul + Identity 的实际内容注入到各平台的规则目录，AI 启动时直接读到内容。

## 使用方式

```bash
# 1. Clone 仓库
git clone git@github.com:yyship7/symbiosis.git ~/symbiosis

# 2. 注入到各平台（clone 后跑一次，内容更新后重新跑）
./adapters/inject.sh all          # 注入所有平台
./adapters/inject.sh codebuddy    # 只注入 CodeBuddy
./adapters/inject.sh claude       # 只注入 Claude Code
./adapters/inject.sh openclaw     # 只注入 OpenClaw
```

## 各平台注入位置

| 平台 | 生成文件 |
|------|----------|
| CodeBuddy | `~/.codebuddy/rules/digital-self.md`（Soul + Identity 合并） |
| Claude Code | `~/.claude/CLAUDE.md`（Soul + Identity 合并） |
| OpenClaw | `~/.openclaw/workspace/SOUL.md` + `USER.md` + `AGENTS.md`（按原生格式分拆） |

## 什么时候需要重新注入

- `soul/` 下的文件改了
- `identities/` 下的通用原则改了
- `evolution/frameworks/` 下有新的成熟方法论

`evolution/` 下的日常沉淀不需要重新注入——那些是知识库，不是规则。
