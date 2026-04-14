# Adapters - 平台启动配置

> 每个平台一个配置文件，clone 仓库后软链到对应位置即可。AI 自动读取整个仓库。

## 使用方式

### 1. Clone 仓库

```bash
git clone git@github.com:<你的用户名>/thinking.git ~/thinking
```

### 2. 按平台软链

```bash
# CodeBuddy（全局 Rules）
ln -sf ~/thinking/adapters/codebuddy.md ~/.codebuddy/rules/digital-self.md

# Claude Code（全局 CLAUDE.md）
ln -sf ~/thinking/adapters/claude.md ~/.claude/CLAUDE.md

# OpenClaw（工作区 SOUL.md 引导）
ln -sf ~/thinking/adapters/openclaw.md ~/.openclaw/workspace/BOOTSTRAP.md
```

### 3. 完事

AI 启动时读到配置文件 → 自动去 `~/thinking/` 读 Soul、Identity、Evolution → 自行适配。

**换电脑时重复步骤 1 和 2 即可。**
