#!/usr/bin/env bash
# ==============================================================================
# master-skill Installer
# https://github.com/senapati484/master-skill
# ==============================================================================
set -euo pipefail

REPO_URL="https://github.com/senapati484/master-skill.git"
SKILL_NAME="master-skill"
VERSION="1.0.0"

# Modern Palette (24-bit TrueColor with ANSI capability)
CYAN='\033[38;2;56;189;248m'
VIOLET='\033[38;2;168;85;247m'
EMERALD='\033[38;2;52;211;153m'
AMBER='\033[38;2;251;191;36m'
GRAY='\033[38;2;148;163;184m'
DARKGRAY='\033[38;2;71;85;105m'
BOLD='\033[1m'
DIM='\033[2m'
RESET='\033[0m'

# Fallback if terminal doesn't support 24-bit colors
if [[ "${COLORTERM:-}" != "truecolor" && "${COLORTERM:-}" != "24bit" && "${TERM:-}" != *"256color"* ]]; then
  CYAN='\033[0;36m'
  VIOLET='\033[0;35m'
  EMERALD='\033[0;32m'
  AMBER='\033[0;33m'
  GRAY='\033[0;37m'
  DARKGRAY='\033[1;30m'
fi

# Print ASCII Slant Typography Banner
echo ""
echo -e "${CYAN}${BOLD}"
cat << "EOF"
    __  ___           __               _____ __   _ ____
   /  |/  /___ ______/ /____  _____   / ___// /__(_) / /
  / /|_/ / __ `/ ___/ __/ _ \/ ___/   \__ \/ //_/ / / / 
 / /  / / /_/ (__  ) /_/  __/ /      ___/ / ,< / / / /  
/_/  /_/\__,_/____/\__/\___/_/      /____/_/|_/_/_/_/   
EOF
echo -e "${RESET}"
echo -e "  ${VIOLET}✦${RESET} ${BOLD}master-skill${RESET} ${GRAY}— Disciplined AI Agent Workflow Harness${RESET} ${DARKGRAY}(v${VERSION})${RESET}"
echo -e "  ${DARKGRAY}────────────────────────────────────────────────────────────${RESET}"
echo ""

# Parse arguments
TARGET_MODE="auto"
TARGET_LABEL="Auto-Detect (All Active Agents)"

if [[ $# -gt 0 ]]; then
  case "$1" in
    --project)
      TARGET_MODE="project"
      TARGET_LABEL="Project-Local (.agents/skills/master-skill)"
      ;;
    --claude)
      TARGET_MODE="claude"
      TARGET_LABEL="Claude Code (~/.claude/skills)"
      ;;
    --antigravity|--gemini)
      TARGET_MODE="antigravity"
      TARGET_LABEL="Google Antigravity (~/.gemini/config/skills)"
      ;;
    --agents|--cursor)
      TARGET_MODE="agents"
      TARGET_LABEL="Agents / Cursor (~/.agents/skills)"
      ;;
    --all)
      TARGET_MODE="all"
      TARGET_LABEL="All Environments"
      ;;
    -h|--help)
      echo -e "${BOLD}Usage:${RESET} install.sh [OPTION]"
      echo ""
      echo -e "${BOLD}Options:${RESET}"
      echo -e "  ${CYAN}--all${RESET}            Install to all detected agent directories (default)"
      echo -e "  ${CYAN}--project${RESET}        Install to current project (.agents/skills/master-skill)"
      echo -e "  ${CYAN}--claude${RESET}         Install only to Claude Code (~/.claude/skills)"
      echo -e "  ${CYAN}--antigravity${RESET}    Install only to Antigravity (~/.gemini/config/skills)"
      echo -e "  ${CYAN}--agents${RESET}         Install only to Agents standard (~/.agents/skills)"
      echo -e "  ${CYAN}-h, --help${RESET}       Display this help message"
      exit 0
      ;;
    *)
      echo -e "  ${AMBER}▲ Unknown option: $1. Falling back to auto-detection.${RESET}"
      ;;
  esac
fi

# Determine source files (local dir vs remote download)
SCRIPT_SOURCE="${BASH_SOURCE[0]:-}"
SCRIPT_DIR=""
if [[ -n "$SCRIPT_SOURCE" && "$SCRIPT_SOURCE" != "bash" ]]; then
  SCRIPT_DIR="$(cd "$(dirname "$SCRIPT_SOURCE")" 2>/dev/null && pwd || echo "")"
fi
TEMP_DIR=""

cleanup() {
  if [[ -n "$TEMP_DIR" && -d "$TEMP_DIR" ]]; then
    rm -rf "$TEMP_DIR"
  fi
}
trap cleanup EXIT

echo -e "  ${CYAN}◆${RESET} ${BOLD}Mode:${RESET}   ${GRAY}${TARGET_LABEL}${RESET}"

if [[ -n "$SCRIPT_DIR" && -f "$SCRIPT_DIR/SKILL.md" && -d "$SCRIPT_DIR/references" ]]; then
  SRC_DIR="$SCRIPT_DIR"
  echo -e "  ${CYAN}◆${RESET} ${BOLD}Source:${RESET} ${GRAY}Local Repository (${SRC_DIR})${RESET}"
else
  TEMP_DIR="$(mktemp -d)"
  echo -e "  ${CYAN}◆${RESET} ${BOLD}Source:${RESET} ${GRAY}Remote Release (${REPO_URL})${RESET}"
  echo ""
  echo -e "  ${GRAY}● Fetching latest release artifacts...${RESET}"
  git clone --depth 1 "$REPO_URL" "$TEMP_DIR" >/dev/null 2>&1
  SRC_DIR="$TEMP_DIR"
fi

echo ""

install_to_dir() {
  local dest="$1"
  local label="$2"
  mkdir -p "$dest"
  cp "$SRC_DIR/SKILL.md" "$dest/SKILL.md"
  rm -rf "$dest/references"
  cp -r "$SRC_DIR/references" "$dest/references"
  echo -e "  ${EMERALD}✔${RESET} ${BOLD}Installed to ${label}${RESET}"
  echo -e "    ${DARKGRAY}↳ ${dest}${RESET}"
}

INSTALLED_COUNT=0

if [[ "$TARGET_MODE" == "project" ]]; then
  install_to_dir ".agents/skills/$SKILL_NAME" "Project Repository (.agents/skills)"
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

TARGET_WORD="targets"
if [[ $INSTALLED_COUNT -eq 1 ]]; then
  TARGET_WORD="target"
fi

echo ""
echo -e "  ${DARKGRAY}┌──────────────────────────────────────────────────────────┐${RESET}"
echo -e "  ${DARKGRAY}│${RESET}  ${EMERALD}${BOLD}✔ Successfully Activated!${RESET} ${GRAY}(${INSTALLED_COUNT} agent ${TARGET_WORD} updated)${RESET}     ${DARKGRAY}│${RESET}"
echo -e "  ${DARKGRAY}└──────────────────────────────────────────────────────────┘${RESET}"
echo ""
echo -e "  ${BOLD}⚡ How to use:${RESET}"
echo -e "     ${GRAY}Start or reload your coding agent and say:${RESET}"
echo -e "     ${CYAN}${BOLD}\"Plan this task using master-skill\"${RESET}"
echo ""
