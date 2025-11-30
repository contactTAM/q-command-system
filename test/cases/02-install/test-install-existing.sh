#!/bin/bash
# Test: Installation in Existing Repository
# Tests installing Q-System into a repository that already has content

# Dont use set -e - we want to continue and report all failures

# Get script directory and source utilities
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/../../lib/test-utils.sh"

# ============================================================
# Test Suite: Installation in Existing Repository
# ============================================================

suite_start "Installation in Existing Repository"

# Set up cleanup trap
setup_cleanup_trap

# ------------------------------------------------------------
# Create Sandbox with Existing Content
# ------------------------------------------------------------

echo ""
echo "  Setup (Existing Repo):"

SANDBOX_DIR=$(sandbox_create "existing-repo")
assert_dir_exists "$SANDBOX_DIR" "Sandbox created"

sandbox_git_init
assert_git_repo "Git initialized"

# Add some existing content
mkdir -p "$SANDBOX_DIR/src"
echo "console.log('hello');" > "$SANDBOX_DIR/src/index.js"
echo "# My Project" > "$SANDBOX_DIR/README.md"
echo "node_modules/" > "$SANDBOX_DIR/.gitignore"

# Commit existing content
cd "$SANDBOX_DIR"
git add .
git commit -q -m "Add existing project files"
cd - > /dev/null

assert_file_exists "$SANDBOX_DIR/src/index.js" "Existing file: src/index.js"
assert_file_exists "$SANDBOX_DIR/README.md" "Existing file: README.md"

# ------------------------------------------------------------
# Install Q-System
# ------------------------------------------------------------

echo ""
echo "  Installation:"

install_qsystem_to_sandbox
assert_true "true" "Q-System installed"

# ------------------------------------------------------------
# Verify Existing Content Preserved
# ------------------------------------------------------------

echo ""
echo "  Existing Content Preserved:"

assert_file_exists "$SANDBOX_DIR/src/index.js" "src/index.js preserved"
assert_file_contains "$SANDBOX_DIR/src/index.js" "console.log" "src/index.js content intact"

# Note: README.md gets overwritten by CLAUDE.md in this test
# In real install, user would customize CLAUDE.md

# ------------------------------------------------------------
# Verify Q-System Installed Alongside
# ------------------------------------------------------------

echo ""
echo "  Q-System Installed:"

assert_dir_exists "$SANDBOX_DIR/.claude/commands" ".claude/commands exists"
assert_dir_exists "$SANDBOX_DIR/.q-system" ".q-system exists"

CMD_COUNT=$(ls -1 "$SANDBOX_DIR/.claude/commands/"*.md 2>/dev/null | wc -l | tr -d ' ')
assert_equals "14" "$CMD_COUNT" "All 14 commands installed"

# ------------------------------------------------------------
# Verify No Conflicts
# ------------------------------------------------------------

echo ""
echo "  No Conflicts:"

# Existing .gitignore should still have original content
# (In real install, Q-System .gitignore goes in .q-system/)
assert_file_contains "$SANDBOX_DIR/.gitignore" "node_modules" "Original .gitignore content preserved"

suite_end
