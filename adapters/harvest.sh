#!/bin/bash

# Symbiosis - 知识回流脚本
# 从各项目的本地暂存区收割认知，汇入 symbiosis/evolution/
#
# 用法：
#   ./harvest.sh                        # 扫描所有已注册的项目
#   ./harvest.sh ~/Work/project-a       # 只收割指定项目
#
# 工作原理：
#   1. AI 在项目内把认知写到 .symbiosis/ 暂存目录（在工作区内，无跨目录问题）
#   2. harvest.sh 定期或手动收割，把暂存内容移入 evolution/

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_DIR="$(dirname "$SCRIPT_DIR")"
EVOLUTION_DIR="$REPO_DIR/evolution"

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m'

harvest_project() {
    local project_dir="$1"
    local staging="$project_dir/.symbiosis"

    if [ ! -d "$staging" ]; then
        return
    fi

    local count=0

    # 收割 insights
    if [ -d "$staging/insights" ]; then
        for f in "$staging/insights"/*.md; do
            [ -f "$f" ] || continue
            local basename=$(basename "$f")
            mv "$f" "$EVOLUTION_DIR/insights/$basename"
            echo -e "  ${GREEN}→${NC} insights/$basename"
            count=$((count + 1))
        done
    fi

    # 收割 frameworks
    if [ -d "$staging/frameworks" ]; then
        for f in "$staging/frameworks"/*.md; do
            [ -f "$f" ] || continue
            local basename=$(basename "$f")
            mv "$f" "$EVOLUTION_DIR/frameworks/$basename"
            echo -e "  ${GREEN}→${NC} frameworks/$basename"
            count=$((count + 1))
        done
    fi

    # 收割 open-questions
    if [ -d "$staging/open-questions" ]; then
        for f in "$staging/open-questions"/*.md; do
            [ -f "$f" ] || continue
            local basename=$(basename "$f")
            mv "$f" "$EVOLUTION_DIR/open-questions/$basename"
            echo -e "  ${GREEN}→${NC} open-questions/$basename"
            count=$((count + 1))
        done
    fi

    # 收割 log（追加到 evolution/journal.md）
    if [ -f "$staging/log.md" ]; then
        echo "" >> "$EVOLUTION_DIR/journal.md"
        cat "$staging/log.md" >> "$EVOLUTION_DIR/journal.md"
        rm "$staging/log.md"
        echo -e "  ${GREEN}→${NC} 追加到 journal.md"
        count=$((count + 1))
    fi

    if [ "$count" -gt 0 ]; then
        echo -e "${GREEN}✅ $project_dir${NC} — 收割 $count 条"
    fi

    # 清理空的暂存目录
    find "$staging" -type d -empty -delete 2>/dev/null
    [ -d "$staging" ] && rmdir "$staging" 2>/dev/null || true
}

if [ -n "$1" ]; then
    # 指定项目
    echo -e "${CYAN}📥 收割: $1${NC}"
    harvest_project "$1"
else
    # 扫描所有注册的项目（从 projects.txt 读取）
    PROJECTS_FILE="$REPO_DIR/adapters/projects.txt"
    if [ ! -f "$PROJECTS_FILE" ]; then
        echo "未找到 projects.txt，请创建 $PROJECTS_FILE 并列出项目路径（每行一个）"
        echo "或指定项目路径：$0 ~/Work/project-a"
        exit 1
    fi

    echo -e "${CYAN}📥 批量收割${NC}"
    while IFS= read -r project_dir; do
        [ -z "$project_dir" ] && continue
        [[ "$project_dir" == \#* ]] && continue
        # 展开 ~
        project_dir="${project_dir/#\~/$HOME}"
        if [ -d "$project_dir" ]; then
            harvest_project "$project_dir"
        fi
    done < "$PROJECTS_FILE"
fi

echo -e "${GREEN}📥 收割完成${NC}"
echo "   记得 cd ~/symbiosis && git add -A && git commit && git push"
