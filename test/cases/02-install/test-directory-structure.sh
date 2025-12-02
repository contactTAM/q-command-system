#!/bin/bash
# Test: Directory Structure After Install
# Validates the complete directory structure after installation

# Dont use set -e - we want to continue and report all failures

# Get script directory and source utilities
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/../../lib/test-utils.sh"

# ============================================================
# Test Suite: Directory Structure
# ============================================================

suite_start "Directory Structure After Install"

# Set up cleanup trap
setup_cleanup_trap

# ------------------------------------------------------------
# Setup
# ------------------------------------------------------------

echo ""
echo "  Setup:"

SANDBOX_DIR=$(sandbox_create "dir-structure")
sandbox_git_init
install_qsystem_to_sandbox

assert_true "true" "Test environment prepared"

# ------------------------------------------------------------
# Top Level Structure
# ------------------------------------------------------------

echo ""
echo "  Top Level:"

assert_dir_exists "$SANDBOX_DIR/.claude" ".claude directory"
assert_dir_exists "$SANDBOX_DIR/.q-system" ".q-system directory"
assert_file_exists "$SANDBOX_DIR/CLAUDE.md" "CLAUDE.md file"

# ------------------------------------------------------------
# .claude Structure
# ------------------------------------------------------------

echo ""
echo "  .claude/ Structure:"

assert_dir_exists "$SANDBOX_DIR/.claude/commands" ".claude/commands/"

# Should only have commands directory
CLAUDE_SUBDIRS=$(find "$SANDBOX_DIR/.claude" -mindepth 1 -maxdepth 1 -type d | wc -l | tr -d ' ')
assert_equals "1" "$CLAUDE_SUBDIRS" "Only commands/ subdirectory in .claude/"

# ------------------------------------------------------------
# .q-system Structure
# ------------------------------------------------------------

echo ""
echo "  .q-system/ Structure:"

# Required directories
assert_dir_exists "$SANDBOX_DIR/.q-system/transcripts" "transcripts/"
assert_dir_exists "$SANDBOX_DIR/.q-system/session-notes" "session-notes/"
assert_dir_exists "$SANDBOX_DIR/.q-system/checkpoints" "checkpoints/"
assert_dir_exists "$SANDBOX_DIR/.q-system/prompts" "prompts/"
assert_dir_exists "$SANDBOX_DIR/.q-system/memory" "memory/"
assert_dir_exists "$SANDBOX_DIR/.q-system/docs" "docs/"

# Required files
assert_file_exists "$SANDBOX_DIR/.q-system/version.yaml" "version.yaml file"

# ------------------------------------------------------------
# Session Directories Are Empty Initially
# ------------------------------------------------------------

echo ""
echo "  Session Directories (Empty):"

TRANSCRIPT_COUNT=$(ls -1 "$SANDBOX_DIR/.q-system/transcripts/" 2>/dev/null | wc -l | tr -d ' ')
assert_equals "0" "$TRANSCRIPT_COUNT" "transcripts/ is empty initially"

NOTES_COUNT=$(ls -1 "$SANDBOX_DIR/.q-system/session-notes/" 2>/dev/null | wc -l | tr -d ' ')
assert_equals "0" "$NOTES_COUNT" "session-notes/ is empty initially"

CHECKPOINT_COUNT=$(ls -1 "$SANDBOX_DIR/.q-system/checkpoints/" 2>/dev/null | wc -l | tr -d ' ')
assert_equals "0" "$CHECKPOINT_COUNT" "checkpoints/ is empty initially"

# ------------------------------------------------------------
# Command Files Complete
# ------------------------------------------------------------

echo ""
echo "  Command Files Complete:"

# Verify using the utility function
if verify_qsystem_installation "$SANDBOX_DIR"; then
    assert_true "true" "Full installation verification passed"
else
    assert_true "false" "Full installation verification passed"
fi

suite_end
