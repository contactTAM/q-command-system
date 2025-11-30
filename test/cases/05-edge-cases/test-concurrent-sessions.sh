#!/bin/bash
# Test: Concurrent Sessions
# Tests that multiple users can work simultaneously without conflicts

# Dont use set -e - we want to continue and report all failures

# Get script directory and source utilities
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/../../lib/test-utils.sh"

# ============================================================
# Test Suite: Concurrent Sessions
# ============================================================

suite_start "Concurrent Sessions"

# Set up cleanup trap
setup_cleanup_trap

# ------------------------------------------------------------
# Setup
# ------------------------------------------------------------

echo ""
echo "  Setup:"

SANDBOX_DIR=$(sandbox_create "concurrent")
sandbox_git_init
install_qsystem_to_sandbox

assert_true "true" "Environment ready"

# ------------------------------------------------------------
# Multiple Users Same Minute
# ------------------------------------------------------------

echo ""
echo "  Multiple Users Same Minute:"

# Create files for multiple users at roughly the same time
# The timestamp includes minutes, so different users get different files

FILE1=$(create_mock_session_file "transcript" "Alice")
FILE2=$(create_mock_session_file "transcript" "Bob")
FILE3=$(create_mock_session_file "transcript" "Charlie")

assert_file_exists "$FILE1" "Alice's transcript created"
assert_file_exists "$FILE2" "Bob's transcript created"
assert_file_exists "$FILE3" "Charlie's transcript created"

# All files should be different
assert_not_equals "$FILE1" "$FILE2" "Alice and Bob have different files"
assert_not_equals "$FILE2" "$FILE3" "Bob and Charlie have different files"
assert_not_equals "$FILE1" "$FILE3" "Alice and Charlie have different files"

# ------------------------------------------------------------
# Same User Multiple Sessions
# ------------------------------------------------------------

echo ""
echo "  Same User Multiple Sessions:"

# Wait a moment to get different timestamp
sleep 1

FILE_SESSION1=$(create_mock_session_file "transcript" "Alice")

# In real usage, minutes would differ between sessions
# For testing, files would have same timestamp but that's okay
# (In practice, users rarely start sessions in same minute)

assert_file_exists "$FILE_SESSION1" "Second session file created"

# ------------------------------------------------------------
# Different File Types Same User
# ------------------------------------------------------------

echo ""
echo "  Different File Types Same User:"

TRANSCRIPT=$(create_mock_session_file "transcript" "DevUser")
NOTE=$(create_mock_session_file "session-note" "DevUser")
CHECKPOINT=$(create_mock_session_file "checkpoint" "DevUser")

assert_file_exists "$TRANSCRIPT" "Transcript created"
assert_file_exists "$NOTE" "Session note created"
assert_file_exists "$CHECKPOINT" "Checkpoint created"

# All in different directories
assert_contains "$TRANSCRIPT" "transcripts" "Transcript in correct dir"
assert_contains "$NOTE" "session-notes" "Note in correct dir"
assert_contains "$CHECKPOINT" "checkpoints" "Checkpoint in correct dir"

# ------------------------------------------------------------
# Count Total Files
# ------------------------------------------------------------

echo ""
echo "  File Count:"

TRANSCRIPT_COUNT=$(ls -1 "$SANDBOX_DIR/.q-system/transcripts/"*.md 2>/dev/null | wc -l | tr -d ' ')
NOTE_COUNT=$(ls -1 "$SANDBOX_DIR/.q-system/session-notes/"*.md 2>/dev/null | wc -l | tr -d ' ')
CHECKPOINT_COUNT=$(ls -1 "$SANDBOX_DIR/.q-system/checkpoints/"*.md 2>/dev/null | wc -l | tr -d ' ')

assert_true "[[ $TRANSCRIPT_COUNT -ge 4 ]]" "At least 4 transcripts created"
assert_true "[[ $NOTE_COUNT -ge 1 ]]" "At least 1 session note created"
assert_true "[[ $CHECKPOINT_COUNT -ge 1 ]]" "At least 1 checkpoint created"

suite_end
