#!/bin/bash
# Test: Command Expected Output Patterns
# Validates that command files contain expected output patterns
# (Since commands are interpreted by Claude, we test the instruction patterns)

# Dont use set -e - we want to continue and report all failures

# Get script directory and source utilities
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/../../lib/test-utils.sh"

# ============================================================
# Test Suite: Command Expected Output Patterns
# ============================================================

suite_start "Command Expected Output Patterns"

CMD_DIR="$PROJECT_ROOT/templates/.claude/commands"

# ------------------------------------------------------------
# q-begin Expected Patterns
# ------------------------------------------------------------

echo ""
echo "  q-begin Patterns:"

assert_file_contains "$CMD_DIR/q-begin.md" "CLAUDE.md" "q-begin reads CLAUDE.md"
assert_file_contains "$CMD_DIR/q-begin.md" "session-notes" "q-begin checks previous session notes"
assert_file_contains "$CMD_DIR/q-begin.md" "What would you like" "q-begin asks user intent"

# ------------------------------------------------------------
# q-end Expected Patterns
# ------------------------------------------------------------

echo ""
echo "  q-end Patterns:"

assert_file_contains "$CMD_DIR/q-end.md" "transcript" "q-end creates transcripts"
assert_file_contains "$CMD_DIR/q-end.md" "session-notes" "q-end creates session notes"
assert_file_contains "$CMD_DIR/q-end.md" "git add" "q-end handles git operations"
assert_file_contains "$CMD_DIR/q-end.md" "VERIFY" "q-end verifies operations"

# ------------------------------------------------------------
# q-status Expected Patterns
# ------------------------------------------------------------

echo ""
echo "  q-status Patterns:"

assert_file_contains "$CMD_DIR/q-status.md" "Context" "q-status shows context"
assert_file_contains "$CMD_DIR/q-status.md" "Healthy" "q-status has Healthy status"
assert_file_contains "$CMD_DIR/q-status.md" "Caution" "q-status has Caution status"
assert_file_contains "$CMD_DIR/q-status.md" "Warning" "q-status has Warning status"
assert_file_contains "$CMD_DIR/q-status.md" "Critical" "q-status has Critical status"
assert_file_contains "$CMD_DIR/q-status.md" "recommendation" "q-status provides recommendations"

# ------------------------------------------------------------
# q-checkpoint Expected Patterns
# ------------------------------------------------------------

echo ""
echo "  q-checkpoint Patterns:"

assert_file_contains "$CMD_DIR/q-checkpoint.md" "checkpoint" "q-checkpoint mentions checkpoints"
assert_file_contains "$CMD_DIR/q-checkpoint.md" ".q-system" "q-checkpoint uses .q-system"
assert_file_contains "$CMD_DIR/q-checkpoint.md" "date" "q-checkpoint uses date format"

# ------------------------------------------------------------
# q-save Expected Patterns
# ------------------------------------------------------------

echo ""
echo "  q-save Patterns:"

assert_file_contains "$CMD_DIR/q-save.md" "Lightweight" "q-save is lightweight"
assert_file_contains "$CMD_DIR/q-save.md" "/q-end" "q-save compares to /q-end"
assert_file_contains "$CMD_DIR/q-save.md" "90%" "q-save mentions 90% threshold"

# ------------------------------------------------------------
# q-upgrade Expected Patterns
# ------------------------------------------------------------

echo ""
echo "  q-upgrade Patterns:"

assert_file_contains "$CMD_DIR/q-upgrade.md" "version" "q-upgrade checks version"
assert_file_contains "$CMD_DIR/q-upgrade.md" "GitHub" "q-upgrade fetches from GitHub"
assert_file_contains "$CMD_DIR/q-upgrade.md" "releases.yaml" "q-upgrade uses releases.yaml"
assert_file_contains "$CMD_DIR/q-upgrade.md" "backup" "q-upgrade creates backup"
assert_file_contains "$CMD_DIR/q-upgrade.md" "Preserved" "q-upgrade preserves user files"

# ------------------------------------------------------------
# q-setup Expected Patterns
# ------------------------------------------------------------

echo ""
echo "  q-setup Patterns:"

assert_file_contains "$CMD_DIR/q-setup.md" "Quick" "q-setup has Quick mode"
assert_file_contains "$CMD_DIR/q-setup.md" "Detailed" "q-setup has Detailed mode"
assert_file_contains "$CMD_DIR/q-setup.md" ".q-system" "q-setup creates .q-system"
assert_file_contains "$CMD_DIR/q-setup.md" "existing" "q-setup handles existing installs"
assert_file_contains "$CMD_DIR/q-setup.md" "Update" "q-setup can update config"

# ------------------------------------------------------------
# q-compact Expected Patterns
# ------------------------------------------------------------

echo ""
echo "  q-compact Patterns:"

assert_file_contains "$CMD_DIR/q-compact.md" "checkpoint" "q-compact saves checkpoint first"
assert_file_contains "$CMD_DIR/q-compact.md" "context" "q-compact mentions context"

# ------------------------------------------------------------
# q-verify Expected Patterns
# ------------------------------------------------------------

echo ""
echo "  q-verify Patterns:"

assert_file_contains "$CMD_DIR/q-verify.md" "verify" "q-verify performs verification"
assert_file_contains "$CMD_DIR/q-verify.md" ".q-system" "q-verify checks .q-system"

suite_end
