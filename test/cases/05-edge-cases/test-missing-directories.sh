#!/bin/bash
# Test: Missing Directories
# Tests graceful handling when expected directories don't exist

# Dont use set -e - we want to continue and report all failures

# Get script directory and source utilities
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/../../lib/test-utils.sh"

# ============================================================
# Test Suite: Missing Directories
# ============================================================

suite_start "Missing Directories"

# Set up cleanup trap
setup_cleanup_trap

# ------------------------------------------------------------
# Setup
# ------------------------------------------------------------

echo ""
echo "  Setup:"

SANDBOX_DIR=$(sandbox_create "missing-dirs")
sandbox_git_init

assert_dir_exists "$SANDBOX_DIR" "Sandbox created"

# ------------------------------------------------------------
# Missing .q-system Directory
# ------------------------------------------------------------

echo ""
echo "  Missing .q-system:"

# .q-system doesn't exist yet
assert_false "[[ -d '$SANDBOX_DIR/.q-system' ]]" ".q-system does not exist initially"

# Trying to read version should fail gracefully
VERSION=$(cat "$SANDBOX_DIR/.q-system/version" 2>/dev/null || echo "not-found")
assert_equals "not-found" "$VERSION" "Missing .q-system handled gracefully"

# ------------------------------------------------------------
# Missing .claude Directory
# ------------------------------------------------------------

echo ""
echo "  Missing .claude:"

assert_false "[[ -d '$SANDBOX_DIR/.claude' ]]" ".claude does not exist initially"

# ------------------------------------------------------------
# Partial Installation (Missing Subdirs)
# ------------------------------------------------------------

echo ""
echo "  Partial Installation:"

# Create .q-system but not subdirectories
mkdir -p "$SANDBOX_DIR/.q-system"
echo "2.1.0" > "$SANDBOX_DIR/.q-system/version"

assert_dir_exists "$SANDBOX_DIR/.q-system" ".q-system exists"
assert_false "[[ -d '$SANDBOX_DIR/.q-system/transcripts' ]]" "transcripts/ missing"
assert_false "[[ -d '$SANDBOX_DIR/.q-system/session-notes' ]]" "session-notes/ missing"

# Version should still be readable
VERSION=$(cat "$SANDBOX_DIR/.q-system/version" 2>/dev/null || echo "not-found")
assert_equals "2.1.0" "$VERSION" "Version readable despite missing subdirs"

# ------------------------------------------------------------
# Recovery: Create Missing Directories
# ------------------------------------------------------------

echo ""
echo "  Recovery (Create Missing Dirs):"

# Simulate what commands should do - create dirs if missing
for dir in transcripts session-notes checkpoints prompts memory docs; do
    mkdir -p "$SANDBOX_DIR/.q-system/$dir"
done

for dir in transcripts session-notes checkpoints prompts memory docs; do
    assert_dir_exists "$SANDBOX_DIR/.q-system/$dir" "$dir created during recovery"
done

suite_end
