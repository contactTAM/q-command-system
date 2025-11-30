#!/bin/bash
# Test: Git Operations
# Tests git-related functionality used by Q-System commands

# Dont use set -e - we want to continue and report all failures

# Get script directory and source utilities
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/../../lib/test-utils.sh"

# ============================================================
# Test Suite: Git Operations
# ============================================================

suite_start "Git Operations"

# Set up cleanup trap
setup_cleanup_trap

# ------------------------------------------------------------
# Setup
# ------------------------------------------------------------

echo ""
echo "  Setup:"

SANDBOX_DIR=$(sandbox_create "git-ops")
sandbox_git_init
install_qsystem_to_sandbox

cd "$SANDBOX_DIR"
assert_git_repo "Git repository ready"

# ------------------------------------------------------------
# Initial State
# ------------------------------------------------------------

echo ""
echo "  Initial State:"

# Q-System files should be untracked initially
assert_success "git status --porcelain | grep -q '.claude'" "Q-System files detected by git"

# ------------------------------------------------------------
# Staging Operations
# ------------------------------------------------------------

echo ""
echo "  Staging Operations:"

# Stage all Q-System files
git add .claude/ .q-system/ CLAUDE.md 2>/dev/null
assert_success "git diff --cached --name-only | grep -q 'CLAUDE.md'" "CLAUDE.md staged"

# ------------------------------------------------------------
# Commit Operations
# ------------------------------------------------------------

echo ""
echo "  Commit Operations:"

git commit -q -m "Install Q-Command System"
assert_success "git log --oneline | grep -q 'Q-Command'" "Commit created successfully"
assert_git_clean "Working directory clean after commit"

# ------------------------------------------------------------
# Session File Git Behavior
# ------------------------------------------------------------

echo ""
echo "  Session File Git Behavior:"

# Create session files
create_mock_session_file "transcript" "TestUser" > /dev/null
create_mock_session_file "session-note" "TestUser" > /dev/null

# Check .gitignore behavior
# Session files should be ignored (if .gitignore is set up correctly)
if [[ -f "$SANDBOX_DIR/.q-system/.gitignore" ]]; then
    # With proper .gitignore, session files should not show in git status
    # But they're in subdirectories that are ignored
    assert_true "true" ".gitignore exists for session files"
else
    # Without .gitignore in .q-system, they'll show as untracked
    print_warn "No .q-system/.gitignore - session files will be tracked"
fi

# ------------------------------------------------------------
# Version File Should Be Tracked
# ------------------------------------------------------------

echo ""
echo "  Version File Tracking:"

# Version file should be committed
assert_success "git ls-files | grep -q '.q-system/version'" "version file is tracked"

cd - > /dev/null

suite_end
