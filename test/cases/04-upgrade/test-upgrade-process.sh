#!/bin/bash
# Test: Upgrade Process
# Tests the upgrade workflow and file preservation

# Dont use set -e - we want to continue and report all failures

# Get script directory and source utilities
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/../../lib/test-utils.sh"

# ============================================================
# Test Suite: Upgrade Process
# ============================================================

suite_start "Upgrade Process"

# Set up cleanup trap
setup_cleanup_trap

# ------------------------------------------------------------
# Setup: Create "Old" Installation
# ------------------------------------------------------------

echo ""
echo "  Setup (Simulated Old Install):"

SANDBOX_DIR=$(sandbox_create "upgrade-test")
sandbox_git_init
install_qsystem_to_sandbox

# Simulate older version
echo "2.0.0" > "$SANDBOX_DIR/.q-system/version"

# Create some session files that should be preserved
create_mock_session_file "transcript" "OldUser" > /dev/null
create_mock_session_file "session-note" "OldUser" > /dev/null

# Create custom CLAUDE.md content
echo "# My Custom Project" >> "$SANDBOX_DIR/CLAUDE.md"
echo "This is my custom content that should be preserved." >> "$SANDBOX_DIR/CLAUDE.md"

OLD_VERSION=$(cat "$SANDBOX_DIR/.q-system/version")
assert_equals "2.0.0" "$OLD_VERSION" "Old version set to 2.0.0"

# ------------------------------------------------------------
# Verify Session Files Exist Before Upgrade
# ------------------------------------------------------------

echo ""
echo "  Pre-Upgrade Session Files:"

TRANSCRIPT_COUNT=$(ls -1 "$SANDBOX_DIR/.q-system/transcripts/"*.md 2>/dev/null | wc -l | tr -d ' ')
assert_equals "1" "$TRANSCRIPT_COUNT" "Transcript exists before upgrade"

NOTE_COUNT=$(ls -1 "$SANDBOX_DIR/.q-system/session-notes/"*.md 2>/dev/null | wc -l | tr -d ' ')
assert_equals "1" "$NOTE_COUNT" "Session note exists before upgrade"

# ------------------------------------------------------------
# Simulate Upgrade (Copy New Commands)
# ------------------------------------------------------------

echo ""
echo "  Upgrade Process:"

# Create backup
BACKUP_DIR="$SANDBOX_DIR/.claude/commands-backup-$(date +%Y-%m-%d)"
cp -r "$SANDBOX_DIR/.claude/commands" "$BACKUP_DIR"
assert_dir_exists "$BACKUP_DIR" "Backup created"

# Copy new commands (simulating upgrade)
cp "$PROJECT_ROOT/templates/.claude/commands/"*.md "$SANDBOX_DIR/.claude/commands/"

# Update version
cp "$PROJECT_ROOT/templates/.q-system/version" "$SANDBOX_DIR/.q-system/version"

NEW_VERSION=$(cat "$SANDBOX_DIR/.q-system/version")
assert_not_equals "$OLD_VERSION" "$NEW_VERSION" "Version updated"

# ------------------------------------------------------------
# Verify Session Files Preserved
# ------------------------------------------------------------

echo ""
echo "  Post-Upgrade Session Files (Should Be Preserved):"

TRANSCRIPT_COUNT=$(ls -1 "$SANDBOX_DIR/.q-system/transcripts/"*.md 2>/dev/null | wc -l | tr -d ' ')
assert_equals "1" "$TRANSCRIPT_COUNT" "Transcript preserved after upgrade"

NOTE_COUNT=$(ls -1 "$SANDBOX_DIR/.q-system/session-notes/"*.md 2>/dev/null | wc -l | tr -d ' ')
assert_equals "1" "$NOTE_COUNT" "Session note preserved after upgrade"

# Verify content preserved
assert_file_contains "$SANDBOX_DIR/.q-system/transcripts/"*.md "OldUser" "Transcript content preserved"

# ------------------------------------------------------------
# Verify CLAUDE.md Custom Content Preserved
# ------------------------------------------------------------

echo ""
echo "  Custom Content Preserved:"

# Note: In real upgrade, CLAUDE.md is NOT touched
# This test verifies that principle
assert_file_contains "$SANDBOX_DIR/CLAUDE.md" "My Custom Project" "Custom CLAUDE.md content preserved"

# ------------------------------------------------------------
# Verify Commands Updated
# ------------------------------------------------------------

echo ""
echo "  Commands Updated:"

# Should have q-setup.md (v2.1 feature)
assert_file_exists "$SANDBOX_DIR/.claude/commands/q-setup.md" "q-setup.md exists (v2.1)"

# Should NOT have old commands
assert_file_not_exists "$SANDBOX_DIR/.claude/commands/q-setup-domain.md" "q-setup-domain.md removed"
assert_file_not_exists "$SANDBOX_DIR/.claude/commands/q-reconfigure-domain.md" "q-reconfigure-domain.md removed"

# Count should be 14
CMD_COUNT=$(ls -1 "$SANDBOX_DIR/.claude/commands/"*.md 2>/dev/null | wc -l | tr -d ' ')
assert_equals "14" "$CMD_COUNT" "14 command files after upgrade"

# ------------------------------------------------------------
# Verify Backup Works for Rollback
# ------------------------------------------------------------

echo ""
echo "  Rollback Capability:"

assert_dir_exists "$BACKUP_DIR" "Backup exists for rollback"
BACKUP_COUNT=$(ls -1 "$BACKUP_DIR/"*.md 2>/dev/null | wc -l | tr -d ' ')
assert_true "[[ $BACKUP_COUNT -gt 0 ]]" "Backup contains command files"

suite_end
