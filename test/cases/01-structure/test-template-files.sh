#!/bin/bash
# Test: Template File Structure
# Validates that all required template files exist and have correct structure

# Don't use set -e - we want to continue and report all failures

# Get script directory and source utilities
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/../../lib/test-utils.sh"

# ============================================================
# Test Suite: Template File Structure
# ============================================================

suite_start "Template File Structure"

# ------------------------------------------------------------
# Command Files Existence
# ------------------------------------------------------------

echo ""
echo "  Command Files:"

TEMPLATES_CMD_DIR="$PROJECT_ROOT/templates/.claude/commands"

for cmd in "${EXPECTED_COMMANDS[@]}"; do
    assert_file_exists "$TEMPLATES_CMD_DIR/$cmd" "Command exists: $cmd"
done

# ------------------------------------------------------------
# No Extra Command Files (q-setup-domain, q-reconfigure-domain should be gone)
# ------------------------------------------------------------

echo ""
echo "  Deprecated Files Removed:"

assert_file_not_exists "$TEMPLATES_CMD_DIR/q-setup-domain.md" "q-setup-domain.md removed (consolidated)"
assert_file_not_exists "$TEMPLATES_CMD_DIR/q-reconfigure-domain.md" "q-reconfigure-domain.md removed (consolidated)"

# ------------------------------------------------------------
# Q-System Structure
# ------------------------------------------------------------

echo ""
echo "  Q-System Structure:"

TEMPLATES_QSYSTEM="$PROJECT_ROOT/templates/.q-system"

assert_dir_exists "$TEMPLATES_QSYSTEM" ".q-system directory exists"
assert_file_exists "$TEMPLATES_QSYSTEM/version" "version file exists"
assert_file_exists "$TEMPLATES_QSYSTEM/README.md" "README.md exists"
assert_dir_exists "$TEMPLATES_QSYSTEM/docs" "docs directory exists"

# ------------------------------------------------------------
# Version File Format
# ------------------------------------------------------------

echo ""
echo "  Version File:"

VERSION=$(cat "$TEMPLATES_QSYSTEM/version" 2>/dev/null || echo "")
assert_matches "$VERSION" "^[0-9]+\.[0-9]+\.[0-9]+$" "Version follows semver format"
assert_not_equals "" "$VERSION" "Version is not empty"

# ------------------------------------------------------------
# CLAUDE.md Template
# ------------------------------------------------------------

echo ""
echo "  CLAUDE.md Template:"

CLAUDE_TEMPLATE="$PROJECT_ROOT/templates/CLAUDE.md"

assert_file_exists "$CLAUDE_TEMPLATE" "CLAUDE.md template exists"
assert_file_not_empty "$CLAUDE_TEMPLATE" "CLAUDE.md is not empty"
assert_file_contains "$CLAUDE_TEMPLATE" "Q-Command System" "Contains Q-Command System reference"
assert_file_contains "$CLAUDE_TEMPLATE" "Context Monitoring" "Contains Context Monitoring section"
assert_file_contains "$CLAUDE_TEMPLATE" "/q-begin" "References /q-begin command"
assert_file_contains "$CLAUDE_TEMPLATE" "/q-end" "References /q-end command"

# ------------------------------------------------------------
# .gitignore Template
# ------------------------------------------------------------

echo ""
echo "  .gitignore Template:"

GITIGNORE_TEMPLATE="$PROJECT_ROOT/templates/.gitignore"

assert_file_exists "$GITIGNORE_TEMPLATE" ".gitignore template exists"
assert_file_contains "$GITIGNORE_TEMPLATE" "transcripts" "Ignores transcripts"
assert_file_contains "$GITIGNORE_TEMPLATE" "session-notes" "Ignores session-notes"
assert_file_contains "$GITIGNORE_TEMPLATE" "checkpoints" "Ignores checkpoints"

suite_end
