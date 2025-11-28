#!/bin/bash

# 🤖 OpenCode Commit Message Generator (Message Only)
# Generates commit message for Lazygit integration

set -e

# Check if OpenCode is available
if ! command -v opencode &> /dev/null; then
    echo "Error: OpenCode not found"
    exit 1
fi

# Check if there are staged changes
if git diff --cached --quiet; then
    echo "feat: update project files"
    exit 0
fi

# Get git diff of staged changes (limit size for API)
STAGED_DIFF=$(git diff --cached --stat)
STAGED_CONTENT=$(git diff --cached | head -100)

# Get list of changed files
CHANGED_FILES=$(git diff --cached --name-only | head -5 | tr '\n' ', ' | sed 's/,$//')

# Get recent commits for context
RECENT_COMMITS=$(git log --oneline -3 --no-decorate 2>/dev/null | head -3)

# Create prompt for OpenCode
PROMPT="Generate a conventional commit message for these changes:

Files changed: $CHANGED_FILES

Diff stats:
$STAGED_DIFF

Recent commits:
$RECENT_COMMITS

Rules:
- Use format: type(scope): description
- Types: feat, fix, docs, style, refactor, test, chore
- Max 72 chars for first line
- Add appropriate emoji
- Be specific and concise
- Present tense, imperative mood

Generate ONLY the commit message:"

# Generate and clean the message
COMMIT_MSG=$(echo "$PROMPT" | opencode 2>/dev/null | head -1 | sed 's/^["\x27]//;s/["\x27]$//' | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')

# Fallback if empty
if [ -z "$COMMIT_MSG" ]; then
    COMMIT_MSG="chore: update files"
fi

echo "$COMMIT_MSG"