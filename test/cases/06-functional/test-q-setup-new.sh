#!/bin/bash
# Functional Test: /q-setup New Project Scenarios
# Tests the actual behavior of /q-setup command when setting up a new project
#
# These tests simulate what Claude should do and verify the results

# Don't use set -e - we want to continue and report all failures

# Get script directory - we're in test/cases/06-functional/
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TEST_DIR="$(cd "$SCRIPT_DIR/../.." && pwd)"
PROJECT_ROOT="$(dirname "$TEST_DIR")"

# Source test utilities and simulator
source "$TEST_DIR/lib/test-utils.sh"
source "$TEST_DIR/lib/q-setup-simulator.sh"

# ============================================================
# Test Suite: Q-Setup Quick Mode - New Project
# ============================================================

suite_start "Q-Setup Quick Mode - New Project"

echo ""
echo "  Testing: Software project, solo, intermediate"

# Create sandbox
sandbox_create "qsetup-quick-software"
sandbox_git_init

# Run simulation
simulate_qsetup_quick_new "$SANDBOX_DIR" "software" "solo" "intermediate" > /dev/null

# Verify results
echo ""
echo "  Directory Structure:"
assert_dir_exists "$SANDBOX_DIR/.q-system" ".q-system directory created"
assert_dir_exists "$SANDBOX_DIR/.q-system/transcripts" "transcripts directory created"
assert_dir_exists "$SANDBOX_DIR/.q-system/session-notes" "session-notes directory created"
assert_dir_exists "$SANDBOX_DIR/.q-system/checkpoints" "checkpoints directory created"
assert_dir_exists "$SANDBOX_DIR/.q-system/prompts" "prompts directory created"
assert_dir_exists "$SANDBOX_DIR/.q-system/memory" "memory directory created"
assert_dir_exists "$SANDBOX_DIR/.q-system/docs" "docs directory created"

echo ""
echo "  Configuration Files:"
assert_file_exists "$SANDBOX_DIR/.q-system/config.md" "config.md created"
assert_file_exists "$SANDBOX_DIR/.q-system/README.md" "README.md created"

echo ""
echo "  Config Content:"
assert_file_contains "$SANDBOX_DIR/.q-system/config.md" "Quick" "config.md has Quick mode"
assert_file_contains "$SANDBOX_DIR/.q-system/config.md" "software" "config.md has project type"
assert_file_contains "$SANDBOX_DIR/.q-system/config.md" "solo" "config.md has collaboration"
assert_file_contains "$SANDBOX_DIR/.q-system/config.md" "intermediate" "config.md has experience"
assert_file_contains "$SANDBOX_DIR/.q-system/config.md" "/q-begin" "config.md suggests /q-begin"

sandbox_cleanup

# ============================================================
# Test: Quick Mode with special notes
# ============================================================

echo ""
echo "  Testing: Writing project with special notes"

sandbox_create "qsetup-quick-writing"
sandbox_git_init

simulate_qsetup_quick_new "$SANDBOX_DIR" "writing" "team" "beginner" "Focus on screenplay format" > /dev/null

echo ""
echo "  Special Notes:"
assert_file_contains "$SANDBOX_DIR/.q-system/config.md" "writing" "config.md has writing type"
assert_file_contains "$SANDBOX_DIR/.q-system/config.md" "team" "config.md has team collaboration"
assert_file_contains "$SANDBOX_DIR/.q-system/config.md" "beginner" "config.md has beginner level"
assert_file_contains "$SANDBOX_DIR/.q-system/config.md" "screenplay" "config.md has special notes"

sandbox_cleanup

# ============================================================
# Test Suite: Q-Setup Detailed Mode - New Project
# ============================================================

suite_start "Q-Setup Detailed Mode - New Project"

echo ""
echo "  Testing: Full detailed setup"

sandbox_create "qsetup-detailed-full"
sandbox_git_init

# Run detailed simulation with all parameters
simulate_qsetup_detailed_new "$SANDBOX_DIR" \
    "source_materials" \
    "complete_deliverable" \
    "intermediate" \
    "active_collaboration" \
    "maybe_later" \
    "multiple_sources" \
    "existing_files" > /dev/null

echo ""
echo "  Directory Structure:"
assert_dir_exists "$SANDBOX_DIR/.q-system" ".q-system directory created"
assert_dir_exists "$SANDBOX_DIR/.q-system/transcripts" "transcripts directory created"
assert_dir_exists "$SANDBOX_DIR/.q-system/session-notes" "session-notes directory created"
assert_dir_exists "$SANDBOX_DIR/.q-system/checkpoints" "checkpoints directory created"

echo ""
echo "  Configuration Files:"
assert_file_exists "$SANDBOX_DIR/.q-system/config.md" "config.md created"
assert_file_exists "$SANDBOX_DIR/.q-system/domain-config.json" "domain-config.json created"
assert_file_exists "$SANDBOX_DIR/.q-system/triggers.json" "triggers.json created"
assert_file_exists "$SANDBOX_DIR/.q-system/README.md" "README.md created"

echo ""
echo "  Config Content:"
assert_file_contains "$SANDBOX_DIR/.q-system/config.md" "Detailed" "config.md has Detailed mode"
assert_file_contains "$SANDBOX_DIR/.q-system/config.md" "complete_deliverable" "config.md has project goal"
assert_file_contains "$SANDBOX_DIR/.q-system/config.md" "Progressive Scaffolding" "config.md mentions scaffolding"

echo ""
echo "  JSON Validity:"
# Test JSON files are valid
if python3 -c "import json; json.load(open('$SANDBOX_DIR/.q-system/domain-config.json'))" 2>/dev/null; then
    TESTS_RUN=$((TESTS_RUN + 1))
    TESTS_PASSED=$((TESTS_PASSED + 1))
    echo -e "  ${GREEN}✓${NC} domain-config.json is valid JSON"
else
    TESTS_RUN=$((TESTS_RUN + 1))
    TESTS_FAILED=$((TESTS_FAILED + 1))
    echo -e "  ${RED}✗${NC} domain-config.json is valid JSON"
fi

if python3 -c "import json; json.load(open('$SANDBOX_DIR/.q-system/triggers.json'))" 2>/dev/null; then
    TESTS_RUN=$((TESTS_RUN + 1))
    TESTS_PASSED=$((TESTS_PASSED + 1))
    echo -e "  ${GREEN}✓${NC} triggers.json is valid JSON"
else
    TESTS_RUN=$((TESTS_RUN + 1))
    TESTS_FAILED=$((TESTS_FAILED + 1))
    echo -e "  ${RED}✗${NC} triggers.json is valid JSON"
fi

echo ""
echo "  Domain Config Content:"
assert_file_contains "$SANDBOX_DIR/.q-system/domain-config.json" "source_materials" "has starting_point"
assert_file_contains "$SANDBOX_DIR/.q-system/domain-config.json" "complete_deliverable" "has project_goal"
assert_file_contains "$SANDBOX_DIR/.q-system/domain-config.json" "active_collaboration" "has collaboration"
assert_file_contains "$SANDBOX_DIR/.q-system/domain-config.json" "multi_user" "has derived multi_user setting"

echo ""
echo "  Triggers Content:"
assert_file_contains "$SANDBOX_DIR/.q-system/triggers.json" "first_session" "has first_session trigger"
assert_file_contains "$SANDBOX_DIR/.q-system/triggers.json" "context_high" "has context_high trigger"
assert_file_contains "$SANDBOX_DIR/.q-system/triggers.json" "week_one_review" "has week_one_review trigger"

sandbox_cleanup

# ============================================================
# Test: Detailed Mode with different experience levels
# ============================================================

echo ""
echo "  Testing: Experience level derivation"

sandbox_create "qsetup-detailed-beginner"
sandbox_git_init

simulate_qsetup_detailed_new "$SANDBOX_DIR" "nothing" "explore" "beginner" "solo" > /dev/null

assert_file_contains "$SANDBOX_DIR/.q-system/domain-config.json" '"guidance_level": "high"' "beginner gets high guidance"

sandbox_cleanup

sandbox_create "qsetup-detailed-advanced"
sandbox_git_init

simulate_qsetup_detailed_new "$SANDBOX_DIR" "partial_work" "ongoing" "advanced" "solo" > /dev/null

assert_file_contains "$SANDBOX_DIR/.q-system/domain-config.json" '"guidance_level": "minimal"' "advanced gets minimal guidance"

sandbox_cleanup

# ============================================================
# Test: Error Handling - Setup on existing .q-system
# ============================================================

suite_start "Q-Setup Error Handling"

echo ""
echo "  Testing: Reject setup if .q-system config exists"

sandbox_create "qsetup-error-exists"
sandbox_git_init

# Pre-create .q-system with a config file (simulates real existing setup)
mkdir -p "$SANDBOX_DIR/.q-system"
echo "# Existing Config" > "$SANDBOX_DIR/.q-system/config.md"

# Try to run setup - should fail because config exists
if simulate_qsetup_quick_new "$SANDBOX_DIR" "software" "solo" "intermediate" 2>/dev/null; then
    TESTS_RUN=$((TESTS_RUN + 1))
    TESTS_FAILED=$((TESTS_FAILED + 1))
    echo -e "  ${RED}✗${NC} Quick setup should reject existing config"
else
    TESTS_RUN=$((TESTS_RUN + 1))
    TESTS_PASSED=$((TESTS_PASSED + 1))
    echo -e "  ${GREEN}✓${NC} Quick setup correctly rejects existing config"
fi

if simulate_qsetup_detailed_new "$SANDBOX_DIR" "nothing" "explore" "beginner" "solo" 2>/dev/null; then
    TESTS_RUN=$((TESTS_RUN + 1))
    TESTS_FAILED=$((TESTS_FAILED + 1))
    echo -e "  ${RED}✗${NC} Detailed setup should reject existing config"
else
    TESTS_RUN=$((TESTS_RUN + 1))
    TESTS_PASSED=$((TESTS_PASSED + 1))
    echo -e "  ${GREEN}✓${NC} Detailed setup correctly rejects existing config"
fi

sandbox_cleanup

# ============================================================
# Test: Verification helpers work correctly
# ============================================================

suite_start "Verification Helper Functions"

echo ""
echo "  Testing: verify_qsetup_quick"

sandbox_create "qsetup-verify-quick"
sandbox_git_init

simulate_qsetup_quick_new "$SANDBOX_DIR" "software" "solo" "intermediate" > /dev/null

if verify_qsetup_quick "$SANDBOX_DIR" > /dev/null 2>&1; then
    TESTS_RUN=$((TESTS_RUN + 1))
    TESTS_PASSED=$((TESTS_PASSED + 1))
    echo -e "  ${GREEN}✓${NC} verify_qsetup_quick passes for valid setup"
else
    TESTS_RUN=$((TESTS_RUN + 1))
    TESTS_FAILED=$((TESTS_FAILED + 1))
    echo -e "  ${RED}✗${NC} verify_qsetup_quick passes for valid setup"
fi

sandbox_cleanup

echo ""
echo "  Testing: verify_qsetup_detailed"

sandbox_create "qsetup-verify-detailed"
sandbox_git_init

simulate_qsetup_detailed_new "$SANDBOX_DIR" "nothing" "explore" "beginner" "solo" > /dev/null

if verify_qsetup_detailed "$SANDBOX_DIR" > /dev/null 2>&1; then
    TESTS_RUN=$((TESTS_RUN + 1))
    TESTS_PASSED=$((TESTS_PASSED + 1))
    echo -e "  ${GREEN}✓${NC} verify_qsetup_detailed passes for valid setup"
else
    TESTS_RUN=$((TESTS_RUN + 1))
    TESTS_FAILED=$((TESTS_FAILED + 1))
    echo -e "  ${RED}✗${NC} verify_qsetup_detailed passes for valid setup"
fi

sandbox_cleanup

echo ""
echo "  Testing: Verification fails on incomplete setup"

sandbox_create "qsetup-verify-incomplete"
sandbox_git_init

# Create incomplete .q-system (missing files)
mkdir -p "$SANDBOX_DIR/.q-system"

if verify_qsetup_quick "$SANDBOX_DIR" > /dev/null 2>&1; then
    TESTS_RUN=$((TESTS_RUN + 1))
    TESTS_FAILED=$((TESTS_FAILED + 1))
    echo -e "  ${RED}✗${NC} verify_qsetup_quick should fail on incomplete setup"
else
    TESTS_RUN=$((TESTS_RUN + 1))
    TESTS_PASSED=$((TESTS_PASSED + 1))
    echo -e "  ${GREEN}✓${NC} verify_qsetup_quick correctly fails on incomplete setup"
fi

sandbox_cleanup

suite_end
