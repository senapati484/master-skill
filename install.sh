#!/usr/bin/env bash
# ==============================================================================
# master-skill Installer
# https://github.com/senapati484/master-skill
# ==============================================================================
set -euo pipefail

REPO_URL="https://github.com/senapati484/master-skill.git"
SKILL_NAME="master-skill"

# Colors
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${BLUE}======================================================${NC}"
echo -e "${BLUE}   Installing master-skill (AI Agent Master Workflow) ${NC}"
echo -e "${BLUE}======================================================${NC}"

# Parse arguments
TARGET_MODE="auto"
if [[ $# -gt 0 ]]; then
  case "$1" in
    --project)
      TARGET_MODE="project"
      ;;
    --claude)
      TARGET_MODE="claude"
      ;;
    --antigravity|--gemini)
      TARGET_MODE="antigravity"
      ;;
    --agents|--cursor)
      TARGET_MODE="agents"
      ;;
    --all)
      TARGET_MODE="all"
      ;;
    -h|--help)
      echo "Usage: install.sh [OPTION]"
      echo ""
      echo "Options:"
      echo "  --all            Install to all detected agent directories (default)"
      echo "  --project        Install to current project (.agents/skills/master-skill)"
      echo "  --claude         Install only to Claude Code (~/.claude/skills)"
      echo "  --antigravity    Install only to Antigravity (~/.gemini/config/skills)"
      echo "  --agents         Install only to Agents standard (~/.agents/skills)"
      echo "  -h, --help       Display this help message"
      exit 0
      ;;
    *)
      echo -e "${YELLOW}Unknown option: $1. Falling back to auto detection.${NC}"
      ;;
  esac
fi

# Determine source files (local dir vs remote download)
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" 2>/dev/null && pwd || echo "")"
TEMP_DIR=""

cleanup() {
  if [[ -n "$TEMP_DIR" && -d "$TEMP_DIR" ]]; then
    rm -rf "$TEMP_DIR"
  fi
}
trap cleanup EXIT

if [[ -n "$SCRIPT_DIR" && -f "$SCRIPT_DIR/SKILL.md" && -d "$SCRIPT_DIR/references" ]]; then
  SRC_DIR="$SCRIPT_DIR"
  echo -e "Source: ${GREEN}Local directory ($SRC_DIR)${NC}"
else
  TEMP_DIR="$(mktemp -d)"
  echo -e "Fetching latest release from ${BLUE}$REPO_URL${NC}..."
  git clone --depth 1 "$REPO_URL" "$TEMP_DIR" >/dev/null 2>&1
  SRC_DIR="$TEMP_DIR"
fi

install_to_dir() {
  local dest="$1"
  local label="$2"
  mkdir -p "$dest"
  cp "$SRC_DIR/SKILL.md" "$dest/SKILL.md"
  rm -rf "$dest/references"
  cp -r "$SRC_DIR/references" "$dest/references"
  echo -e "  ${GREEN}✓${NC} Installed to ${label} (${BLUE}$dest${NC})"
}

INSTALLED_COUNT=0

if [[ "$TARGET_MODE" == "project" ]]; then
  install_to_dir ".agents/skills/$SKILL_NAME" "Project (.agents/skills)"
  INSTALLED_COUNT=$((INSTALLED_COUNT + 1))
else
  # Claude Code target
  if [[ "$TARGET_MODE" == "auto" || "$TARGET_MODE" == "all" || "$TARGET_MODE" == "claude" ]]; then
    if [[ -d "$HOME/.claude" || "$TARGET_MODE" == "claude" || "$TARGET_MODE" == "all" ]]; then
      install_to_dir "$HOME/.claude/skills/$SKILL_NAME" "Claude Code"
      INSTALLED_COUNT=$((INSTALLED_COUNT + 1))
    fi
  fi

  # Antigravity / Gemini CLI target
  if [[ "$TARGET_MODE" == "auto" || "$TARGET_MODE" == "all" || "$TARGET_MODE" == "antigravity" ]]; then
    if [[ -d "$HOME/.gemini" || "$TARGET_MODE" == "antigravity" || "$TARGET_MODE" == "all" ]]; then
      install_to_dir "$HOME/.gemini/config/skills/$SKILL_NAME" "Antigravity"
      INSTALLED_COUNT=$((INSTALLED_COUNT + 1))
    fi
  fi

  # Agents / Cursor / Codex target
  if [[ "$TARGET_MODE" == "auto" || "$TARGET_MODE" == "all" || "$TARGET_MODE" == "agents" ]]; then
    if [[ -d "$HOME/.agents" || "$TARGET_MODE" == "agents" || "$TARGET_MODE" == "all" ]]; then
      install_to_dir "$HOME/.agents/skills/$SKILL_NAME" "Agents / Cursor / Codex"
      INSTALLED_COUNT=$((INSTALLED_COUNT + 1))
    fi
  fi

  # Fallback if none of the above existed yet
  if [[ $INSTALLED_COUNT -eq 0 ]]; then
    install_to_dir "$HOME/.agents/skills/$SKILL_NAME" "Default (~/.agents/skills)"
    INSTALLED_COUNT=$((INSTALLED_COUNT + 1))
  fi
fi

echo ""
echo -e "${GREEN}Installation complete! ($INSTALLED_COUNT targets updated)${NC}"
echo -e "The ${BLUE}master-skill${NC} is now active and ready for your AI agent."
echo -e "To verify, start or restart your coding agent session and ask it to review any task."
