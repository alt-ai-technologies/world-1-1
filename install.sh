#!/usr/bin/env bash
set -euo pipefail

SKILL_NAME="world-1-1"
REPO="alt-ai-technologies/world-1-1"
RAW_URL="https://raw.githubusercontent.com/$REPO/main/skills/$SKILL_NAME/SKILL.md"
DEST="$HOME/.claude/skills/$SKILL_NAME"
TMP_DIR=$(mktemp -d)

cleanup() { rm -rf "$TMP_DIR"; }
trap cleanup EXIT

SKILL_SRC="$TMP_DIR/SKILL.md"

if command -v gh &>/dev/null; then
  echo "Downloading via gh..."
  gh repo clone "$REPO" "$TMP_DIR/repo" -- --depth=1 --filter=blob:none --sparse 2>/dev/null \
    && git -C "$TMP_DIR/repo" sparse-checkout set "skills/$SKILL_NAME" \
    && cp "$TMP_DIR/repo/skills/$SKILL_NAME/SKILL.md" "$SKILL_SRC"
elif command -v curl &>/dev/null; then
  echo "Downloading via curl..."
  curl -fsSL "$RAW_URL" -o "$SKILL_SRC"
elif command -v wget &>/dev/null; then
  echo "Downloading via wget..."
  wget -qO "$SKILL_SRC" "$RAW_URL"
else
  echo "Error: need gh, curl, or wget to install." >&2
  exit 1
fi

if [[ ! -f "$SKILL_SRC" ]]; then
  echo "Error: download failed — SKILL.md not found." >&2
  exit 1
fi

mkdir -p "$DEST"
cp "$SKILL_SRC" "$DEST/SKILL.md"

echo "Installed: $DEST/SKILL.md"
echo "Restart Claude Code to activate /world-1-1"
