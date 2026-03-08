#!/bin/bash
# Install cursor-rules into your project
# Usage: curl -fsSL https://raw.githubusercontent.com/aiagentwithdhruv/cursor-rules/main/install.sh | bash

set -e

REPO="https://github.com/aiagentwithdhruv/cursor-rules.git"
RULES_DIR=".cursor/rules"
TEMP_DIR=$(mktemp -d)

echo "Installing cursor-rules..."

# Clone repo
git clone --depth 1 "$REPO" "$TEMP_DIR" 2>/dev/null

# Create rules directory
mkdir -p "$RULES_DIR"

# Copy all .mdc files
cp "$TEMP_DIR/rules/"*.mdc "$RULES_DIR/"

# Cleanup
rm -rf "$TEMP_DIR"

echo ""
echo "Installed $(ls -1 "$RULES_DIR"/*.mdc 2>/dev/null | wc -l | tr -d ' ') rules to $RULES_DIR/"
echo ""
ls -1 "$RULES_DIR"/*.mdc
echo ""
echo "Done. Open Cursor and your rules are active."
