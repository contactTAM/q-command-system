#!/bin/bash
# Test: Session File Creation
# Tests that session files are created correctly with proper naming and content

# Dont use set -e - we want to continue and report all failures

# Get script directory and source utilities
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/../../lib/test-utils.sh"

# ============================================================
# Test Suite: Session File Creation
# ============================================================

suite_start "Session File Creation"

# Set up cleanup trap
setup_cleanup_trap

# ------------------------------------------------------------
# Setup
# ------------------------------------------------------------

echo ""
echo "  Setup:"

SANDBOX_DIR=$(sandbox_create "session-files")
sandbox_git_init
install_qsystem_to_sandbox

assert_true "true" "Test environment prepared"

# ------------------------------------------------------------
# Filename Format Validation
# ------------------------------------------------------------

echo ""
echo "  Filename Format:"

# Test filename generation
FILENAME=$(generate_session_filename "Gabriel")
assert_matches "$FILENAME" "^[0-9]{4}-[0-9]{2}-[0-9]{2}-[0-9]{4}-Gabriel\.md$" "Filename follows YYYY-MM-DD-HHmm-Name.md format"

# Test with different names
FILENAME2=$(generate_session_filename "JohnDoe")
assert_contains "$FILENAME2" "JohnDoe" "Filename contains username"

# ------------------------------------------------------------
# Mock Transcript Creation
# ------------------------------------------------------------

echo ""
echo "  Transcript Creation:"

TRANSCRIPT_FILE=$(create_mock_session_file "transcript" "TestUser")
assert_file_exists "$TRANSCRIPT_FILE" "Transcript file created"
assert_file_not_empty "$TRANSCRIPT_FILE" "Transcript is not empty"
assert_file_contains "$TRANSCRIPT_FILE" "transcript" "Transcript has type marker"
assert_file_contains "$TRANSCRIPT_FILE" "TestUser" "Transcript has username"

# Verify in correct directory
assert_contains "$TRANSCRIPT_FILE" "transcripts" "Transcript in transcripts/ directory"

# ------------------------------------------------------------
# Mock Session Note Creation
# ------------------------------------------------------------

echo ""
echo "  Session Note Creation:"

NOTE_FILE=$(create_mock_session_file "session-note" "TestUser")
assert_file_exists "$NOTE_FILE" "Session note file created"
assert_file_not_empty "$NOTE_FILE" "Session note is not empty"
assert_file_contains "$NOTE_FILE" "session-note" "Session note has type marker"

# Verify in correct directory
assert_contains "$NOTE_FILE" "session-notes" "Session note in session-notes/ directory"

# ------------------------------------------------------------
# Mock Checkpoint Creation
# ------------------------------------------------------------

echo ""
echo "  Checkpoint Creation:"

CHECKPOINT_FILE=$(create_mock_session_file "checkpoint" "TestUser")
assert_file_exists "$CHECKPOINT_FILE" "Checkpoint file created"
assert_file_not_empty "$CHECKPOINT_FILE" "Checkpoint is not empty"
assert_file_contains "$CHECKPOINT_FILE" "checkpoint" "Checkpoint has type marker"

# Verify in correct directory
assert_contains "$CHECKPOINT_FILE" "checkpoints" "Checkpoint in checkpoints/ directory"

# ------------------------------------------------------------
# Multiple Users Don't Collide
# ------------------------------------------------------------

echo ""
echo "  Multi-User Support:"

# Create files for different users
USER1_FILE=$(create_mock_session_file "transcript" "Alice")
USER2_FILE=$(create_mock_session_file "transcript" "Bob")

assert_file_exists "$USER1_FILE" "Alice's transcript exists"
assert_file_exists "$USER2_FILE" "Bob's transcript exists"
assert_not_equals "$USER1_FILE" "$USER2_FILE" "Different users have different files"

# Both files should exist simultaneously
assert_file_contains "$USER1_FILE" "Alice" "Alice's file has her name"
assert_file_contains "$USER2_FILE" "Bob" "Bob's file has his name"

suite_end
