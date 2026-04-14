#!/bin/bash

# Symbiosis - 平台注入脚本
# 把 Soul + Identity 的实际内容拼接成各平台能直接读的文件
#
# 用法：
#   ./inject.sh codebuddy              # 注入到 CodeBuddy 全局 Rules
#   ./inject.sh claude                  # 注入到 Claude Code 全局 CLAUDE.md
#   ./inject.sh openclaw                # 注入到 OpenClaw 工作区
#   ./inject.sh all                     # 注入到所有已支持的平台
#
# clone 仓库后跑一次；Soul/Identity 更新后重新跑一次。

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_DIR="$(dirname "$SCRIPT_DIR")"

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

# 拼接 Soul + 所有 Identity 的通用原则（README.md）
assemble() {
    echo "# ============================================"
    echo "# Symbiosis - Digital Self"
    echo "# 自动生成于 $(date '+%Y-%m-%d %H:%M:%S')"
    echo "# 源仓库：$REPO_DIR"
    echo "# 更新方式：修改源仓库后重新运行 inject.sh"
    echo "# ============================================"
    echo ""

    # Soul
    echo "# ========== Soul =========="
    echo ""
    for f in "$REPO_DIR"/soul/*.md; do
        [ -f "$f" ] && cat "$f" && echo "" && echo "---" && echo ""
    done

    # Identity 通用原则（每个 identity 的 README.md 或顶层 .md）
    echo "# ========== Identities =========="
    echo ""
    for d in "$REPO_DIR"/identities/*/; do
        if [ -f "$d/README.md" ]; then
            cat "$d/README.md"
            echo ""
            echo "---"
            echo ""
        fi
    done
    for f in "$REPO_DIR"/identities/*.md; do
        [ -f "$f" ] && cat "$f" && echo "" && echo "---" && echo ""
    done

    # 成熟的 frameworks
    local fw_dir="$REPO_DIR/evolution/frameworks"
    if [ -d "$fw_dir" ]; then
        local has_fw=false
        for f in "$fw_dir"/*.md; do
            [ "$(basename "$f")" = "README.md" ] && continue
            [ -f "$f" ] || continue
            if grep -q "状态：.*🟢\|状态：.*🔵\|状态：.*⚡" "$f" 2>/dev/null; then
                has_fw=true
                break
            fi
        done
        if [ "$has_fw" = true ]; then
            echo "# ========== 已验证的方法论 =========="
            echo ""
            for f in "$fw_dir"/*.md; do
                [ "$(basename "$f")" = "README.md" ] && continue
                [ -f "$f" ] || continue
                if grep -q "状态：.*🟢\|状态：.*🔵\|状态：.*⚡" "$f" 2>/dev/null; then
                    cat "$f" && echo "" && echo "---" && echo ""
                fi
            done
        fi
    fi
}

inject_codebuddy() {
    local target="$HOME/.codebuddy/rules"
    mkdir -p "$target"
    assemble > "$target/digital-self.md"
    echo -e "${GREEN}✅ CodeBuddy${NC} → $target/digital-self.md"
}

inject_claude() {
    local target="$HOME/.claude"
    mkdir -p "$target"
    assemble > "$target/CLAUDE.md"
    echo -e "${GREEN}✅ Claude Code${NC} → $target/CLAUDE.md"
}

inject_openclaw() {
    local target="$HOME/.openclaw/workspace"
    mkdir -p "$target"
    # Soul → SOUL.md
    cat "$REPO_DIR"/soul/principles.md > "$target/SOUL.md"
    echo -e "${GREEN}✅ OpenClaw SOUL.md${NC} → $target/SOUL.md"
    # Preferences → USER.md
    cat "$REPO_DIR"/soul/preferences.md > "$target/USER.md"
    echo -e "${GREEN}✅ OpenClaw USER.md${NC} → $target/USER.md"
    # Identity 通用原则 → AGENTS.md
    {
        for d in "$REPO_DIR"/identities/*/; do
            [ -f "$d/README.md" ] && cat "$d/README.md" && echo "" && echo "---" && echo ""
        done
        for f in "$REPO_DIR"/identities/*.md; do
            [ -f "$f" ] && cat "$f" && echo "" && echo "---" && echo ""
        done
    } > "$target/AGENTS.md"
    echo -e "${GREEN}✅ OpenClaw AGENTS.md${NC} → $target/AGENTS.md"
}

case "${1:-}" in
    codebuddy) inject_codebuddy ;;
    claude)    inject_claude ;;
    openclaw)  inject_openclaw ;;
    all)
        inject_codebuddy
        inject_claude
        inject_openclaw
        ;;
    *)
        echo "用法: $0 <codebuddy|claude|openclaw|all>"
        exit 1
        ;;
esac

echo -e "${GREEN}🧠 注入完成。Soul + Identity 已就位。${NC}"
