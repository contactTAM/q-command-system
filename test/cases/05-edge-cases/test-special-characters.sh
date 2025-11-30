#!/bin/bash
# Test: Special Characters in Names
# Tests handling of special characters in usernames and file paths

# Dont use set -e - we want to continue and report all failures

# Get script directory and source utilities
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/../../lib/test-utils.sh"

# ============================================================
# Test Suite: Special Characters
# ============================================================

suite_start "Special Characters"

# Set up cleanup trap
setup_cleanup_trap

# ------------------------------------------------------------
# Setup
# ------------------------------------------------------------

echo ""
echo "  Setup:"

SANDBOX_DIR=$(sandbox_create "special-chars")
sandbox_git_init
install_qsystem_to_sandbox

assert_true "true" "Environment ready"

# ------------------------------------------------------------
# Usernames with Spaces
# ------------------------------------------------------------

echo ""
echo "  Usernames with Spaces:"

# Generate filename - spaces should work
FILENAME=$(generate_session_filename "John Doe")
assert_contains "$FILENAME" "John Doe" "Filename contains space in name"

# Create file with spaced name
FILEPATH="$SANDBOX_DIR/.q-system/transcripts/$FILENAME"
echo "# Test" > "$FILEPATH"
assert_file_exists "$FILEPATH" "File with spaces created"

# ------------------------------------------------------------
# Usernames with Special Characters
# ------------------------------------------------------------

echo ""
echo "  Usernames with Special Characters:"

# Hyphen (common)
FILENAME=$(generate_session_filename "Mary-Jane")
assert_contains "$FILENAME" "Mary-Jane" "Hyphen in name works"

# Underscore
FILENAME=$(generate_session_filename "User_Name")
assert_contains "$FILENAME" "User_Name" "Underscore in name works"

# Numbers
FILENAME=$(generate_session_filename "User123")
assert_contains "$FILENAME" "User123" "Numbers in name work"

# ------------------------------------------------------------
# Long Usernames
# ------------------------------------------------------------

echo ""
echo "  Long Usernames:"

LONG_NAME="VeryLongUserNameThatMightCauseIssues"
FILENAME=$(generate_session_filename "$LONG_NAME")
assert_contains "$FILENAME" "$LONG_NAME" "Long username works"

# Create file
FILEPATH="$SANDBOX_DIR/.q-system/transcripts/$FILENAME"
echo "# Test" > "$FILEPATH"
assert_file_exists "$FILEPATH" "File with long name created"

# ------------------------------------------------------------
# Empty/Minimal Names
# ------------------------------------------------------------

echo ""
echo "  Empty/Minimal Names:"

# Empty should use default
FILENAME=$(generate_session_filename "")
# Default in function is "TestUser" when empty - let's check it works
assert_matches "$FILENAME" "\.md$" "Empty name still creates valid filename"

# Single character
FILENAME=$(generate_session_filename "A")
assert_contains "$FILENAME" "-A.md" "Single character name works"

suite_end
