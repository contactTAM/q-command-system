#!/bin/bash
# Test: Non-Git Repository
# Tests Q-System behavior in directories without git initialization

# Dont use set -e - we want to continue and report all failures

# Get script directory and source utilities
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/../../lib/test-utils.sh"

# ============================================================
# Test Suite: Non-Git Repository
# ============================================================

suite_start "Non-Git Repository"

# Set up cleanup trap
setup_cleanup_trap

# ------------------------------------------------------------
# Setup (No Git)
# ------------------------------------------------------------

echo ""
echo "  Setup (No Git Init):"

SANDBOX_DIR=$(sandbox_create "non-git")
# Deliberately NOT calling sandbox_git_init

assert_dir_exists "$SANDBOX_DIR" "Sandbox created"
assert_failure "cd '$SANDBOX_DIR' && git rev-parse --git-dir" "Not a git repository"

# ------------------------------------------------------------
# Q-System Can Still Be Installed
# ------------------------------------------------------------

echo ""
echo "  Installation Without Git:"

install_qsystem_to_sandbox
assert_true "true" "Q-System installed without git"

# Verify structure
assert_dir_exists "$SANDBOX_DIR/.claude/commands" "Commands directory exists"
assert_dir_exists "$SANDBOX_DIR/.q-system" "Q-System directory exists"
assert_file_exists "$SANDBOX_DIR/.q-system/version" "Version file exists"

# ------------------------------------------------------------
# Session Files Can Be Created
# ------------------------------------------------------------

echo ""
echo "  Session Files Without Git:"

TRANSCRIPT=$(create_mock_session_file "transcript" "NonGitUser")
assert_file_exists "$TRANSCRIPT" "Transcript created without git"

NOTE=$(create_mock_session_file "session-note" "NonGitUser")
assert_file_exists "$NOTE" "Session note created without git"

# ------------------------------------------------------------
# Git Commands Should Fail Gracefully
# ------------------------------------------------------------

echo ""
echo "  Git Operations (Expected Failures):"

cd "$SANDBOX_DIR"

# These should fail but not crash
assert_failure "git status" "git status fails (expected)"
assert_failure "git add ." "git add fails (expected)"

cd - > /dev/null

# ------------------------------------------------------------
# Later Git Init Should Work
# ------------------------------------------------------------

echo ""
echo "  Late Git Initialization:"

cd "$SANDBOX_DIR"
git init -q
git config user.email "test@test.com"
git config user.name "Test"
cd - > /dev/null

assert_git_repo "Git now initialized"

# Q-System files should be visible to git
cd "$SANDBOX_DIR"
assert_success "git status --porcelain | grep -q '.q-system'" "Q-System visible to git after init"
cd - > /dev/null

suite_end
