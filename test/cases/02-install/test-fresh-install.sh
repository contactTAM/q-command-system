#!/bin/bash
# Test: Fresh Installation
# Tests installing Q-System into a new, empty repository

# Dont use set -e - we want to continue and report all failures

# Get script directory and source utilities
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/../../lib/test-utils.sh"

# ============================================================
# Test Suite: Fresh Installation
# ============================================================

suite_start "Fresh Installation"

# Set up cleanup trap
setup_cleanup_trap

# ------------------------------------------------------------
# Create Sandbox
# ------------------------------------------------------------

echo ""
echo "  Setup:"

SANDBOX_DIR=$(sandbox_create "fresh-install")
assert_dir_exists "$SANDBOX_DIR" "Sandbox created"

sandbox_git_init
assert_git_repo "Git initialized in sandbox"

# ------------------------------------------------------------
# Install Q-System
# ------------------------------------------------------------

echo ""
echo "  Installation:"

install_qsystem_to_sandbox
assert_true "true" "Q-System installed to sandbox"

# ------------------------------------------------------------
# Verify Command Files
# ------------------------------------------------------------

echo ""
echo "  Command Files:"

for cmd in "${EXPECTED_COMMANDS[@]}"; do
    assert_file_exists "$SANDBOX_DIR/.claude/commands/$cmd" "Installed: $cmd"
done

# Count command files (should be exactly 14)
CMD_COUNT=$(ls -1 "$SANDBOX_DIR/.claude/commands/"*.md 2>/dev/null | wc -l | tr -d ' ')
assert_equals "14" "$CMD_COUNT" "Exactly 14 command files installed"

# ------------------------------------------------------------
# Verify Q-System Structure
# ------------------------------------------------------------

echo ""
echo "  Q-System Structure:"

assert_dir_exists "$SANDBOX_DIR/.q-system" ".q-system directory exists"
assert_file_exists "$SANDBOX_DIR/.q-system/version.yaml" "version.yaml file exists"

for dir in "${EXPECTED_QSYSTEM_DIRS[@]}"; do
    assert_dir_exists "$SANDBOX_DIR/.q-system/$dir" ".q-system/$dir exists"
done

# ------------------------------------------------------------
# Verify CLAUDE.md
# ------------------------------------------------------------

echo ""
echo "  CLAUDE.md:"

assert_file_exists "$SANDBOX_DIR/CLAUDE.md" "CLAUDE.md installed"
assert_file_not_empty "$SANDBOX_DIR/CLAUDE.md" "CLAUDE.md is not empty"
assert_file_contains "$SANDBOX_DIR/CLAUDE.md" "Q-Command System" "CLAUDE.md has Q-System reference"

# ------------------------------------------------------------
# Verify Version
# ------------------------------------------------------------

echo ""
echo "  Version:"

# Read version from version.yaml (v2.1.1+)
VERSION=$(grep 'version:' "$SANDBOX_DIR/.q-system/version.yaml" 2>/dev/null | head -1 | sed 's/.*:[[:space:]]*//' | tr -d '"' | tr -d ' ')
assert_matches "$VERSION" "^[0-9]+\.[0-9]+\.[0-9]+$" "Version is valid semver"

# Compare with template version
TEMPLATE_VERSION=$(get_template_version)
assert_equals "$TEMPLATE_VERSION" "$VERSION" "Installed version matches template"

# ------------------------------------------------------------
# Verify File Permissions
# ------------------------------------------------------------

echo ""
echo "  File Permissions:"

# Command files should be readable
assert_success "test -r '$SANDBOX_DIR/.claude/commands/q-begin.md'" "q-begin.md is readable"
assert_success "test -r '$SANDBOX_DIR/CLAUDE.md'" "CLAUDE.md is readable"

suite_end
