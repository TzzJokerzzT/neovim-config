#!/bin/bash

# 🤖 OpenCode Commit Message Generator for Lazygit
# Generates intelligent commit messages and commits automatically

set -e

# Check if we're in a git repository
if ! git rev-parse --git-dir > /dev/null 2>&1; then
    echo "❌ Error: Not in a git repository"
    exit 1
fi

# Check if OpenCode is available
if ! command -v opencode &> /dev/null; then
    echo "❌ Error: OpenCode not found in PATH"
    echo "💡 Install OpenCode: https://github.com/sst/opencode"
    exit 1
fi

# Check if there are staged changes
if git diff --cached --quiet; then
    echo "⚠️  No staged changes found"
    echo "💡 Stage some changes first with: git add <files>"
    exit 1
fi

echo "🤖 Generating commit message with OpenCode..."

# Get git diff stats (limited)
STAGED_STATS=$(git diff --cached --stat | head -5)

# Get list of changed files
CHANGED_FILES=$(git diff --cached --name-only | head -5 | tr '\n' ', ' | sed 's/,$//')

# Get recent commits for context
RECENT_COMMITS=$(git log --oneline -3 --no-decorate 2>/dev/null | head -3)

# Create prompt for OpenCode
PROMPT="Generate a conventional commit message for these changes:

Files: $CHANGED_FILES

Stats:
$STAGED_STATS

Recent commits:
$RECENT_COMMITS

Rules:
- Format: type(scope): description
- Types: feat, fix, docs, style, refactor, test, chore
- Max 72 chars
- Add appropriate emoji
- Be specific and concise

Generate ONLY the commit message:"

# Generate commit message with timeout
echo "⏳ Calling OpenCode..."

COMMIT_MSG=""
if command -v timeout &> /dev/null; then
    COMMIT_MSG=$(echo "$PROMPT" | timeout 20 opencode 2>/dev/null || echo "")
else
    COMMIT_MSG=$(echo "$PROMPT" | opencode 2>/dev/null || echo "")
fi

# Fallback if OpenCode fails
if [ -z "$COMMIT_MSG" ] || [ "$COMMIT_MSG" = "null" ]; then
    echo "⚠️  OpenCode failed, using fallback"
    COMMIT_MSG="chore: update project files"
fi

# Clean the message
COMMIT_MSG=$(echo "$COMMIT_MSG" | head -1 | sed 's/^["\x27]//;s/["\x27]$//' | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')

# Ensure message isn't empty
if [ -z "$COMMIT_MSG" ]; then
    COMMIT_MSG="chore: update files"
fi

echo "✅ Generated: $COMMIT_MSG"
echo ""
echo "❓ Press any key to commit or Ctrl+C to cancel..."
read -n 1 -s -r

# Commit the changes
if git commit -m "$COMMIT_MSG"; then
    echo ""
    echo "🎉 Successfully committed!"
    sleep 1
else
    echo ""
    echo "❌ Failed to commit"
    exit 1
fi