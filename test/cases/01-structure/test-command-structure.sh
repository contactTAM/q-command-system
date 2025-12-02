#!/bin/bash
# Test: Command File Structure
# Validates that command files have required sections and correct format

# Don't use set -e - we want to continue and report all failures

# Get script directory and source utilities
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/../../lib/test-utils.sh"

# ============================================================
# Test Suite: Command File Structure
# ============================================================

suite_start "Command File Structure"

TEMPLATES_CMD_DIR="$PROJECT_ROOT/templates/.claude/commands"

# ------------------------------------------------------------
# All Commands: Basic Markdown Validity
# ------------------------------------------------------------

echo ""
echo "  Markdown Validity:"

for cmd in "${EXPECTED_COMMANDS[@]}"; do
    filepath="$TEMPLATES_CMD_DIR/$cmd"
    if is_valid_markdown "$filepath"; then
        assert_true "true" "$cmd is valid markdown"
    else
        assert_true "false" "$cmd is valid markdown"
    fi
done

# ------------------------------------------------------------
# All Commands: Have Title Heading
# ------------------------------------------------------------

echo ""
echo "  Title Headings:"

for cmd in "${EXPECTED_COMMANDS[@]}"; do
    filepath="$TEMPLATES_CMD_DIR/$cmd"
    assert_file_contains "$filepath" "^# " "$cmd has title heading"
done

# ------------------------------------------------------------
# Critical Commands: Detailed Structure Checks
# ------------------------------------------------------------

echo ""
echo "  q-begin.md Structure:"

assert_file_contains "$TEMPLATES_CMD_DIR/q-begin.md" "CLAUDE.md" "q-begin reads CLAUDE.md"
assert_file_contains "$TEMPLATES_CMD_DIR/q-begin.md" "session-notes" "q-begin checks session notes"

echo ""
echo "  q-end.md Structure:"

assert_file_contains "$TEMPLATES_CMD_DIR/q-end.md" "transcript" "q-end creates transcript"
assert_file_contains "$TEMPLATES_CMD_DIR/q-end.md" "session-notes" "q-end creates session notes"
assert_file_contains "$TEMPLATES_CMD_DIR/q-end.md" "commit" "q-end handles commits"
assert_file_contains "$TEMPLATES_CMD_DIR/q-end.md" "date" "q-end uses date format"

echo ""
echo "  q-checkpoint.md Structure:"

assert_file_contains "$TEMPLATES_CMD_DIR/q-checkpoint.md" "checkpoint" "q-checkpoint creates checkpoints"
assert_file_contains "$TEMPLATES_CMD_DIR/q-checkpoint.md" ".q-system" "q-checkpoint uses .q-system"

echo ""
echo "  q-status.md Structure:"

assert_file_contains "$TEMPLATES_CMD_DIR/q-status.md" "Context" "q-status shows context info"
assert_file_contains "$TEMPLATES_CMD_DIR/q-status.md" "70%" "q-status has 70% threshold"
assert_file_contains "$TEMPLATES_CMD_DIR/q-status.md" "85%" "q-status has 85% threshold"
assert_file_contains "$TEMPLATES_CMD_DIR/q-status.md" "90%" "q-status has 90% threshold"

echo ""
echo "  q-save.md Structure:"

assert_file_contains "$TEMPLATES_CMD_DIR/q-save.md" "/q-save" "q-save explains /q-save command"
assert_file_contains "$TEMPLATES_CMD_DIR/q-save.md" "/q-end" "q-save compares to /q-end"
assert_file_contains "$TEMPLATES_CMD_DIR/q-save.md" "Lightweight" "q-save is lightweight"

echo ""
echo "  q-setup.md Structure:"

assert_file_contains "$TEMPLATES_CMD_DIR/q-setup.md" ".q-system" "q-setup configures .q-system"
assert_file_contains "$TEMPLATES_CMD_DIR/q-setup.md" "Quick" "q-setup has Quick mode"
assert_file_contains "$TEMPLATES_CMD_DIR/q-setup.md" "Detailed" "q-setup has Detailed mode"
assert_file_contains "$TEMPLATES_CMD_DIR/q-setup.md" "existing" "q-setup handles existing installs"

echo ""
echo "  q-upgrade.md Structure:"

assert_file_contains "$TEMPLATES_CMD_DIR/q-upgrade.md" "version" "q-upgrade checks version"
assert_file_contains "$TEMPLATES_CMD_DIR/q-upgrade.md" "releases.yaml" "q-upgrade uses releases.yaml"
assert_file_contains "$TEMPLATES_CMD_DIR/q-upgrade.md" "backup" "q-upgrade creates backup"
assert_file_contains "$TEMPLATES_CMD_DIR/q-upgrade.md" "GitHub" "q-upgrade fetches from GitHub"

echo ""
echo "  q-compact.md Structure:"

assert_file_contains "$TEMPLATES_CMD_DIR/q-compact.md" "checkpoint" "q-compact creates checkpoint"
assert_file_contains "$TEMPLATES_CMD_DIR/q-compact.md" "context" "q-compact mentions context"

echo ""
echo "  q-verify.md Structure:"

assert_file_contains "$TEMPLATES_CMD_DIR/q-verify.md" "verify" "q-verify performs verification"
assert_file_contains "$TEMPLATES_CMD_DIR/q-verify.md" ".q-system" "q-verify checks .q-system"

suite_end
