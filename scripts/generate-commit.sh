#!/bin/bash

# 🤖 OpenCode Commit Message Generator for Lazygit
# Generates intelligent commit messages based on git changes using OpenCode AI

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Check if we're in a git repository
if ! git rev-parse --git-dir > /dev/null 2>&1; then
    echo -e "${RED}❌ Error: Not in a git repository${NC}" >&2
    exit 1
fi

# Check if OpenCode is available
if ! command -v opencode &> /dev/null; then
    echo -e "${RED}❌ Error: OpenCode not found in PATH${NC}" >&2
    echo -e "${YELLOW}💡 Install OpenCode: https://github.com/sst/opencode${NC}" >&2
    exit 1
fi

# Check if there are staged changes
if git diff --cached --quiet; then
    echo -e "${YELLOW}⚠️  No staged changes found${NC}" >&2
    echo -e "${BLUE}💡 Stage some changes first with: git add <files>${NC}" >&2
    exit 1
fi

echo -e "${BLUE}🤖 Generating commit message with OpenCode...${NC}"

# Get git diff of staged changes
STAGED_DIFF=$(git diff --cached)

# Get list of changed files
CHANGED_FILES=$(git diff --cached --name-only | head -10)

# Get commit history for context (last 5 commits)
RECENT_COMMITS=$(git log --oneline -5 --no-decorate 2>/dev/null || echo "No previous commits")

# Create a comprehensive prompt for OpenCode
PROMPT="Based on the following git changes, generate a concise, descriptive commit message following conventional commit format.

STAGED CHANGES:
\`\`\`
$STAGED_DIFF
\`\`\`

CHANGED FILES:
$CHANGED_FILES

RECENT COMMIT HISTORY:
$RECENT_COMMITS

INSTRUCTIONS:
1. Use conventional commit format: type(scope): description
2. Types: feat, fix, docs, style, refactor, test, chore, build, ci, perf
3. Keep the first line under 72 characters
4. Use present tense and imperative mood
5. Add emoji if appropriate (🎨 🐛 📚 ✨ 🔧 🚀 etc.)
6. Focus on WHAT changed and WHY, not HOW
7. If multiple types of changes, choose the most significant one
8. Be specific about the actual changes made

Generate ONLY the commit message, no explanations or additional text:"

# Generate commit message using OpenCode
COMMIT_MSG=$(echo "$PROMPT" | opencode 2>/dev/null || echo "")

# Check if OpenCode generated a message
if [ -z "$COMMIT_MSG" ] || [ "$COMMIT_MSG" = "null" ]; then
    echo -e "${RED}❌ Error: Failed to generate commit message${NC}" >&2
    echo -e "${YELLOW}💡 Falling back to manual commit message entry${NC}" >&2
    exit 1
fi

# Clean up the commit message (remove quotes, extra whitespace)
COMMIT_MSG=$(echo "$COMMIT_MSG" | sed 's/^["\x27]//;s/["\x27]$//' | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')

# Validate the commit message isn't empty
if [ -z "$COMMIT_MSG" ]; then
    echo -e "${RED}❌ Error: Generated commit message is empty${NC}" >&2
    exit 1
fi

echo -e "${GREEN}✅ Generated commit message:${NC}"
echo -e "${YELLOW}$COMMIT_MSG${NC}"
echo

# Ask for confirmation
read -p "$(echo -e "${BLUE}❓ Use this commit message? [Y/n]: ${NC}")" -n 1 -r
echo

if [[ $REPLY =~ ^[Nn]$ ]]; then
    echo -e "${YELLOW}❌ Commit cancelled${NC}"
    exit 1
fi

# Commit with the generated message
if git commit -m "$COMMIT_MSG"; then
    echo -e "${GREEN}🎉 Successfully committed with AI-generated message!${NC}"
else
    echo -e "${RED}❌ Error: Failed to commit${NC}" >&2
    exit 1
fi