#!/bin/bash
# Install cursor-rules into your project
# Usage: curl -fsSL https://raw.githubusercontent.com/aiagentwithdhruv/cursor-rules/main/install.sh | bash

set -e

REPO="https://github.com/aiagentwithdhruv/cursor-rules.git"
RULES_DIR=".cursor/rules"
DOCS_DIR="docs"
TEMP_DIR=$(mktemp -d)

echo "Installing cursor-rules..."

# Clone repo
git clone --depth 1 "$REPO" "$TEMP_DIR" 2>/dev/null

# Create directories
mkdir -p "$RULES_DIR"
mkdir -p "$DOCS_DIR"

# Copy rules
cp "$TEMP_DIR/rules/"*.mdc "$RULES_DIR/"

# Copy docs (don't overwrite existing)
for doc in PRD.md ARCHITECTURE.md API_SPEC.md DB_SCHEMA.md DEPLOYMENT.md; do
  if [ ! -f "$DOCS_DIR/$doc" ]; then
    cp "$TEMP_DIR/docs/$doc" "$DOCS_DIR/$doc"
  else
    echo "  Skipped docs/$doc (already exists)"
  fi
done

# Cleanup
rm -rf "$TEMP_DIR"

echo ""
echo "Installed $(ls -1 "$RULES_DIR"/*.mdc 2>/dev/null | wc -l | tr -d ' ') rules to $RULES_DIR/"
echo "Installed $(ls -1 "$DOCS_DIR"/*.md 2>/dev/null | wc -l | tr -d ' ') docs to $DOCS_DIR/"
echo ""
echo "Next steps:"
echo "  1. Edit docs/ with your product details"
echo "  2. Open Cursor — rules are active immediately"
echo ""
echo "Done."
