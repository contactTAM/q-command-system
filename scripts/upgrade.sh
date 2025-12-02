#!/bin/bash
# Q-Command System Upgrade Script
# https://github.com/contactTAM/q-command-system
#
# Usage:
#   Full upgrade:        ./upgrade.sh
#   Specific commands:   ./upgrade.sh q-begin q-end q-save
#   Remote execution:    curl -sL https://raw.githubusercontent.com/contactTAM/q-command-system/main/scripts/upgrade.sh | bash
#   Remote differential: curl -sL https://raw.githubusercontent.com/contactTAM/q-command-system/main/scripts/upgrade.sh | bash -s -- q-begin q-end
#
# This script is designed to be efficient - it uses native curl instead of
# requiring Claude to fetch and write each file individually.

set -e

# Configuration
BASE_URL="https://raw.githubusercontent.com/contactTAM/q-command-system/main/templates"
BACKUP_DATE=$(date +%Y-%m-%d)
BACKUP_DIR=".claude/commands-backup-$BACKUP_DATE"

# All available commands
ALL_COMMANDS="q-begin q-checkpoint q-commit q-compact q-dump q-end q-learnings q-pare q-prompts q-save q-setup q-status q-upgrade q-verify"

# Colors for output (if terminal supports it)
if [ -t 1 ]; then
    GREEN='\033[0;32m'
    YELLOW='\033[1;33m'
    RED='\033[0;31m'
    NC='\033[0m' # No Color
else
    GREEN=''
    YELLOW=''
    RED=''
    NC=''
fi

# Determine which commands to update
if [ $# -eq 0 ]; then
    COMMANDS=$ALL_COMMANDS
    MODE="full"
else
    COMMANDS="$@"
    MODE="differential"
fi

echo ""
echo "========================================"
echo "   Q-Command System Upgrade Script"
echo "========================================"
echo ""
echo "Mode: $MODE upgrade"
echo "Commands to update: $(echo $COMMANDS | wc -w | tr -d ' ')"
echo ""

# Verify we're in a valid directory
if [ ! -d ".claude/commands" ]; then
    echo -e "${RED}Error: .claude/commands directory not found${NC}"
    echo "Please run this script from your project root."
    exit 1
fi

# Create backup (only if not already done today)
if [ ! -d "$BACKUP_DIR" ]; then
    echo -e "${YELLOW}Creating backup...${NC}"
    cp -r .claude/commands "$BACKUP_DIR"
    echo "  Backup created: $BACKUP_DIR"
else
    echo -e "${YELLOW}Backup already exists for today: $BACKUP_DIR${NC}"
fi
echo ""

# Download commands
echo -e "${GREEN}Downloading commands...${NC}"
UPDATED=0
FAILED=0

for cmd in $COMMANDS; do
    printf "  %-20s" "$cmd.md"
    if curl -sL "$BASE_URL/.claude/commands/$cmd.md" -o ".claude/commands/$cmd.md" 2>/dev/null; then
        echo -e "${GREEN}OK${NC}"
        ((UPDATED++))
    else
        echo -e "${RED}FAILED${NC}"
        ((FAILED++))
    fi
done
echo ""

# Download version.yaml
echo -e "${GREEN}Updating version.yaml...${NC}"
if curl -sL "$BASE_URL/.q-system/version.yaml" -o ".q-system/version.yaml" 2>/dev/null; then
    echo "  version.yaml updated"
else
    echo -e "${RED}  Warning: Could not update version.yaml${NC}"
fi

# Clean up old version file if it exists
if [ -f ".q-system/version" ]; then
    rm ".q-system/version"
    echo "  Removed old version file"
fi
echo ""

# Download releases.yaml for future upgrades
echo -e "${GREEN}Updating releases.yaml...${NC}"
if curl -sL "$BASE_URL/releases.yaml" -o ".q-system/releases.yaml" 2>/dev/null; then
    echo "  releases.yaml updated"
else
    echo -e "${YELLOW}  Note: releases.yaml not available (optional)${NC}"
fi
echo ""

# Summary
echo "========================================"
echo "           Upgrade Complete"
echo "========================================"
echo ""
echo "  Commands updated: $UPDATED"
if [ $FAILED -gt 0 ]; then
    echo -e "  ${RED}Commands failed: $FAILED${NC}"
fi
echo "  Backup location:  $BACKUP_DIR"
echo ""
echo -e "${YELLOW}IMPORTANT: Restart Claude Code to load new commands${NC}"
echo "  Close terminal and run 'claude' again"
echo ""
echo "Run /q-begin to verify installation"
echo ""
