#!/bin/bash
# Functional Test: /q-setup Existing Project Scenarios
# Tests the actual behavior of /q-setup when .q-system already exists
#
# Scenarios:
# - Update configuration
# - Start fresh (reset but preserve session data)

# Don't use set -e - we want to continue and report all failures

# Get script directory - we're in test/cases/06-functional/
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TEST_DIR="$(cd "$SCRIPT_DIR/../.." && pwd)"
PROJECT_ROOT="$(dirname "$TEST_DIR")"

# Source test utilities and simulator
source "$TEST_DIR/lib/test-utils.sh"
source "$TEST_DIR/lib/q-setup-simulator.sh"

# ============================================================
# Test Suite: Q-Setup Update Configuration
# ============================================================

suite_start "Q-Setup Update Configuration"

echo ""
echo "  Testing: Update existing Quick Mode setup"

# Create sandbox with existing setup
sandbox_create "qsetup-update-quick"
sandbox_git_init

# First, do initial setup
simulate_qsetup_quick_new "$SANDBOX_DIR" "software" "solo" "beginner" > /dev/null

# Create some session files to verify they're preserved
mkdir -p "$SANDBOX_DIR/.q-system/session-notes"
echo "# Important session note" > "$SANDBOX_DIR/.q-system/session-notes/2025-11-30-1200-TestUser.md"

mkdir -p "$SANDBOX_DIR/.q-system/checkpoints"
echo "# Important checkpoint" > "$SANDBOX_DIR/.q-system/checkpoints/2025-11-30-1300-TestUser.md"

# Now run update
simulate_qsetup_update "$SANDBOX_DIR" "Changed from solo to team collaboration" > /dev/null

echo ""
echo "  Reconfiguration Log:"
# Find the reconfiguration log
RECONFIG_LOG=$(find "$SANDBOX_DIR/.q-system" -name "RECONFIGURATION-LOG-*.md" 2>/dev/null | head -1)

if [[ -n "$RECONFIG_LOG" && -f "$RECONFIG_LOG" ]]; then
    TESTS_RUN=$((TESTS_RUN + 1))
    TESTS_PASSED=$((TESTS_PASSED + 1))
    echo -e "  ${GREEN}✓${NC} Reconfiguration log created"
else
    TESTS_RUN=$((TESTS_RUN + 1))
    TESTS_FAILED=$((TESTS_FAILED + 1))
    echo -e "  ${RED}✗${NC} Reconfiguration log created"
fi

if [[ -n "$RECONFIG_LOG" ]]; then
    assert_file_contains "$RECONFIG_LOG" "solo to team" "Log contains change description"
    assert_file_contains "$RECONFIG_LOG" "Preserved Items" "Log mentions preserved items"
fi

echo ""
echo "  Session Data Preserved:"
assert_file_exists "$SANDBOX_DIR/.q-system/session-notes/2025-11-30-1200-TestUser.md" "Session note preserved"
assert_file_exists "$SANDBOX_DIR/.q-system/checkpoints/2025-11-30-1300-TestUser.md" "Checkpoint preserved"

sandbox_cleanup

# ============================================================
# Test: Update rejects non-existent .q-system
# ============================================================

echo ""
echo "  Testing: Update rejects missing .q-system"

sandbox_create "qsetup-update-missing"
sandbox_git_init

# Try update without setup
if simulate_qsetup_update "$SANDBOX_DIR" "Some changes" 2>/dev/null; then
    TESTS_RUN=$((TESTS_RUN + 1))
    TESTS_FAILED=$((TESTS_FAILED + 1))
    echo -e "  ${RED}✗${NC} Update should reject missing .q-system"
else
    TESTS_RUN=$((TESTS_RUN + 1))
    TESTS_PASSED=$((TESTS_PASSED + 1))
    echo -e "  ${GREEN}✓${NC} Update correctly rejects missing .q-system"
fi

sandbox_cleanup

# ============================================================
# Test Suite: Q-Setup Start Fresh
# ============================================================

suite_start "Q-Setup Start Fresh"

echo ""
echo "  Testing: Start fresh archives config, preserves sessions"

sandbox_create "qsetup-fresh"
sandbox_git_init

# Do initial detailed setup
simulate_qsetup_detailed_new "$SANDBOX_DIR" "nothing" "explore" "beginner" "solo" > /dev/null

# Create session files
echo "# Session 1" > "$SANDBOX_DIR/.q-system/session-notes/session1.md"
echo "# Session 2" > "$SANDBOX_DIR/.q-system/session-notes/session2.md"
echo "# Checkpoint" > "$SANDBOX_DIR/.q-system/checkpoints/cp1.md"

# Verify files exist before fresh
assert_file_exists "$SANDBOX_DIR/.q-system/config.md" "config.md exists before fresh"
assert_file_exists "$SANDBOX_DIR/.q-system/domain-config.json" "domain-config.json exists before fresh"
assert_file_exists "$SANDBOX_DIR/.q-system/triggers.json" "triggers.json exists before fresh"

# Run start fresh
simulate_qsetup_fresh "$SANDBOX_DIR" > /dev/null

echo ""
echo "  After Start Fresh:"

# Config files should be archived (moved)
assert_file_not_exists "$SANDBOX_DIR/.q-system/config.md" "config.md archived (removed from root)"
assert_file_not_exists "$SANDBOX_DIR/.q-system/domain-config.json" "domain-config.json archived"
assert_file_not_exists "$SANDBOX_DIR/.q-system/triggers.json" "triggers.json archived"

# Session files should be preserved
assert_file_exists "$SANDBOX_DIR/.q-system/session-notes/session1.md" "Session 1 preserved"
assert_file_exists "$SANDBOX_DIR/.q-system/session-notes/session2.md" "Session 2 preserved"
assert_file_exists "$SANDBOX_DIR/.q-system/checkpoints/cp1.md" "Checkpoint preserved"

# Archive directory should exist
ARCHIVE_DIR=$(find "$SANDBOX_DIR/.q-system" -maxdepth 1 -type d -name "archived-*" 2>/dev/null | head -1)

if [[ -n "$ARCHIVE_DIR" && -d "$ARCHIVE_DIR" ]]; then
    TESTS_RUN=$((TESTS_RUN + 1))
    TESTS_PASSED=$((TESTS_PASSED + 1))
    echo -e "  ${GREEN}✓${NC} Archive directory created"

    # Check archived files
    assert_file_exists "$ARCHIVE_DIR/config.md" "config.md in archive"
    assert_file_exists "$ARCHIVE_DIR/domain-config.json" "domain-config.json in archive"
    assert_file_exists "$ARCHIVE_DIR/triggers.json" "triggers.json in archive"
else
    TESTS_RUN=$((TESTS_RUN + 1))
    TESTS_FAILED=$((TESTS_FAILED + 1))
    echo -e "  ${RED}✗${NC} Archive directory created"
fi

sandbox_cleanup

# ============================================================
# Test: Start Fresh rejects missing .q-system
# ============================================================

echo ""
echo "  Testing: Start Fresh rejects missing .q-system"

sandbox_create "qsetup-fresh-missing"
sandbox_git_init

if simulate_qsetup_fresh "$SANDBOX_DIR" 2>/dev/null; then
    TESTS_RUN=$((TESTS_RUN + 1))
    TESTS_FAILED=$((TESTS_FAILED + 1))
    echo -e "  ${RED}✗${NC} Start Fresh should reject missing .q-system"
else
    TESTS_RUN=$((TESTS_RUN + 1))
    TESTS_PASSED=$((TESTS_PASSED + 1))
    echo -e "  ${GREEN}✓${NC} Start Fresh correctly rejects missing .q-system"
fi

sandbox_cleanup

# ============================================================
# Test: Fresh then New Setup works
# ============================================================

suite_start "Q-Setup Fresh Then New"

echo ""
echo "  Testing: Fresh followed by new setup"

sandbox_create "qsetup-fresh-then-new"
sandbox_git_init

# Initial setup
simulate_qsetup_detailed_new "$SANDBOX_DIR" "nothing" "explore" "beginner" "solo" > /dev/null

# Create session file
echo "# Important work" > "$SANDBOX_DIR/.q-system/session-notes/work.md"

# Start fresh
simulate_qsetup_fresh "$SANDBOX_DIR" > /dev/null

# Now do new setup (should work because configs are archived)
simulate_qsetup_quick_new "$SANDBOX_DIR" "writing" "team" "advanced" > /dev/null

echo ""
echo "  New Setup After Fresh:"
assert_file_exists "$SANDBOX_DIR/.q-system/config.md" "New config.md created"
assert_file_contains "$SANDBOX_DIR/.q-system/config.md" "Quick" "New config is Quick mode"
assert_file_contains "$SANDBOX_DIR/.q-system/config.md" "writing" "New config has new project type"

# Session file should still be there
assert_file_exists "$SANDBOX_DIR/.q-system/session-notes/work.md" "Session file still preserved"

sandbox_cleanup

# ============================================================
# Test: Safety - Never delete session data
# ============================================================

suite_start "Q-Setup Safety Guarantees"

echo ""
echo "  Testing: Session data never deleted during any operation"

sandbox_create "qsetup-safety"
sandbox_git_init

# Setup and create significant session data
simulate_qsetup_quick_new "$SANDBOX_DIR" "software" "solo" "intermediate" > /dev/null

# Create various session files
for i in 1 2 3 4 5; do
    echo "# Transcript $i with important content" > "$SANDBOX_DIR/.q-system/transcripts/transcript-$i.md"
    echo "# Session note $i with decisions" > "$SANDBOX_DIR/.q-system/session-notes/note-$i.md"
done
echo "# Critical checkpoint" > "$SANDBOX_DIR/.q-system/checkpoints/critical.md"

# Count files before operations
TRANSCRIPTS_BEFORE=$(ls "$SANDBOX_DIR/.q-system/transcripts/" | wc -l | tr -d ' ')
NOTES_BEFORE=$(ls "$SANDBOX_DIR/.q-system/session-notes/" | wc -l | tr -d ' ')

# Run update
simulate_qsetup_update "$SANDBOX_DIR" "Major changes" > /dev/null

# Count files after update
TRANSCRIPTS_AFTER=$(ls "$SANDBOX_DIR/.q-system/transcripts/" | wc -l | tr -d ' ')
NOTES_AFTER=$(ls "$SANDBOX_DIR/.q-system/session-notes/" | wc -l | tr -d ' ')

if [[ "$TRANSCRIPTS_BEFORE" -eq "$TRANSCRIPTS_AFTER" ]]; then
    TESTS_RUN=$((TESTS_RUN + 1))
    TESTS_PASSED=$((TESTS_PASSED + 1))
    echo -e "  ${GREEN}✓${NC} Update preserves all transcripts ($TRANSCRIPTS_BEFORE files)"
else
    TESTS_RUN=$((TESTS_RUN + 1))
    TESTS_FAILED=$((TESTS_FAILED + 1))
    echo -e "  ${RED}✗${NC} Update preserves all transcripts (was $TRANSCRIPTS_BEFORE, now $TRANSCRIPTS_AFTER)"
fi

if [[ "$NOTES_BEFORE" -eq "$NOTES_AFTER" ]]; then
    TESTS_RUN=$((TESTS_RUN + 1))
    TESTS_PASSED=$((TESTS_PASSED + 1))
    echo -e "  ${GREEN}✓${NC} Update preserves all session notes ($NOTES_BEFORE files)"
else
    TESTS_RUN=$((TESTS_RUN + 1))
    TESTS_FAILED=$((TESTS_FAILED + 1))
    echo -e "  ${RED}✗${NC} Update preserves all session notes (was $NOTES_BEFORE, now $NOTES_AFTER)"
fi

# Now do fresh
simulate_qsetup_fresh "$SANDBOX_DIR" > /dev/null

# Count files after fresh
TRANSCRIPTS_FRESH=$(ls "$SANDBOX_DIR/.q-system/transcripts/" | wc -l | tr -d ' ')
NOTES_FRESH=$(ls "$SANDBOX_DIR/.q-system/session-notes/" | wc -l | tr -d ' ')

if [[ "$TRANSCRIPTS_BEFORE" -eq "$TRANSCRIPTS_FRESH" ]]; then
    TESTS_RUN=$((TESTS_RUN + 1))
    TESTS_PASSED=$((TESTS_PASSED + 1))
    echo -e "  ${GREEN}✓${NC} Fresh preserves all transcripts ($TRANSCRIPTS_FRESH files)"
else
    TESTS_RUN=$((TESTS_RUN + 1))
    TESTS_FAILED=$((TESTS_FAILED + 1))
    echo -e "  ${RED}✗${NC} Fresh preserves all transcripts (was $TRANSCRIPTS_BEFORE, now $TRANSCRIPTS_FRESH)"
fi

if [[ "$NOTES_BEFORE" -eq "$NOTES_FRESH" ]]; then
    TESTS_RUN=$((TESTS_RUN + 1))
    TESTS_PASSED=$((TESTS_PASSED + 1))
    echo -e "  ${GREEN}✓${NC} Fresh preserves all session notes ($NOTES_FRESH files)"
else
    TESTS_RUN=$((TESTS_RUN + 1))
    TESTS_FAILED=$((TESTS_FAILED + 1))
    echo -e "  ${RED}✗${NC} Fresh preserves all session notes (was $NOTES_BEFORE, now $NOTES_FRESH)"
fi

assert_file_exists "$SANDBOX_DIR/.q-system/checkpoints/critical.md" "Critical checkpoint preserved through all operations"

sandbox_cleanup

suite_end
