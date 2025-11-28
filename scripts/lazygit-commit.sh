#!/bin/bash

# 🤖 OpenCode Auto-Commit for Lazygit
# Generates and commits automatically without user interaction

set -e

# Check requirements
if ! git rev-parse --git-dir > /dev/null 2>&1; then
    echo "❌ Not in a git repository"
    exit 1
fi

if ! command -v opencode &> /dev/null; then
    echo "❌ OpenCode not found"
    git commit -m "chore: update files"
    exit 0
fi

if git diff --cached --quiet; then
    echo "⚠️  No staged changes"
    exit 1
fi

echo "🤖 Generating AI commit message..."

# Get minimal context
CHANGED_FILES=$(git diff --cached --name-only | head -3 | tr '\n' ', ' | sed 's/,$//')
STATS=$(git diff --cached --stat | head -3)
RECENT=$(git log --oneline -2 --no-decorate 2>/dev/null | head -2)

# Simple prompt
PROMPT="Generate a conventional commit message:

Files: $CHANGED_FILES
Changes: $STATS
Recent: $RECENT

Format: type: description (max 60 chars)
Types: feat, fix, docs, style, refactor, chore
Add emoji. Be concise.

Message only:"

# Generate with fallback
COMMIT_MSG=""
if command -v timeout &> /dev/null; then
    COMMIT_MSG=$(echo "$PROMPT" | timeout 15 opencode 2>/dev/null || echo "")
else
    COMMIT_MSG=$(echo "$PROMPT" | opencode 2>/dev/null || echo "")
fi

# Clean and validate
COMMIT_MSG=$(echo "$COMMIT_MSG" | head -1 | sed 's/^["\x27]//;s/["\x27]$//' | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')

if [ -z "$COMMIT_MSG" ] || [ "$COMMIT_MSG" = "null" ]; then
    COMMIT_MSG="chore: update project files"
fi

echo "✅ $COMMIT_MSG"

# Auto-commit
if git commit -m "$COMMIT_MSG"; then
    echo "🎉 Committed successfully!"
else
    echo "❌ Commit failed"
    exit 1
fi