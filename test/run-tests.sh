#!/bin/bash
# Q-Command System Test Runner
# Enterprise-grade test suite for comprehensive validation
#
# Usage:
#   ./test/run-tests.sh              # Run all tests
#   ./test/run-tests.sh --quick      # Run quick smoke tests only
#   ./test/run-tests.sh --suite 01   # Run specific suite (01-05)
#   ./test/run-tests.sh --help       # Show help
#
# Logs are saved to: test/logs/YYYY-MM-DD-HHMM-results.log

# Don't use set -e - we want to continue and report all failures

# Get script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

# Source utilities
source "$SCRIPT_DIR/lib/test-utils.sh"

# ============================================================
# Logging Setup
# ============================================================

LOG_DIR="$SCRIPT_DIR/logs"
mkdir -p "$LOG_DIR"
TIMESTAMP=$(date +"%Y-%m-%d-%H%M")
LOG_FILE="$LOG_DIR/$TIMESTAMP-results.log"

# Function to log to both terminal and file
log() {
    echo -e "$1"
    # Strip color codes for log file
    echo -e "$1" | sed 's/\x1b\[[0-9;]*m//g; s/\\033\[[0-9;]*m//g' >> "$LOG_FILE"
}

# Function to log plain text (no echo -e)
log_plain() {
    echo "$1"
    echo "$1" >> "$LOG_FILE"
}

# ============================================================
# Version Check
# ============================================================

TEST_VERSION=$(cat "$SCRIPT_DIR/VERSION" 2>/dev/null | tr -d '[:space:]')
TEMPLATE_VERSION=$(cat "$PROJECT_ROOT/templates/.q-system/version" 2>/dev/null | tr -d '[:space:]')

# ============================================================
# Configuration
# ============================================================

QUICK_MODE=false
SPECIFIC_SUITE=""
VERBOSE=false

# Parse arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        --quick|-q)
            QUICK_MODE=true
            shift
            ;;
        --suite|-s)
            SPECIFIC_SUITE="$2"
            shift 2
            ;;
        --verbose|-v)
            VERBOSE=true
            shift
            ;;
        --help|-h)
            echo "Q-Command System Test Runner"
            echo ""
            echo "Usage:"
            echo "  ./test/run-tests.sh              Run all tests"
            echo "  ./test/run-tests.sh --quick      Run quick smoke tests only"
            echo "  ./test/run-tests.sh --suite 01   Run specific suite (01-05)"
            echo "  ./test/run-tests.sh --verbose    Show detailed output"
            echo "  ./test/run-tests.sh --help       Show this help"
            echo ""
            echo "Test Suites:"
            echo "  01-structure   Template file and structure validation"
            echo "  02-install     Installation tests"
            echo "  03-commands    Command behavior tests"
            echo "  04-upgrade     Version and upgrade tests"
            echo "  05-edge-cases  Edge case handling"
            echo ""
            echo "Logs saved to: test/logs/"
            exit 0
            ;;
        *)
            echo "Unknown option: $1"
            echo "Use --help for usage information"
            exit 1
            ;;
    esac
done

# ============================================================
# Header
# ============================================================

clear

# Start log file
echo "Q-Command System Test Results" > "$LOG_FILE"
echo "=============================" >> "$LOG_FILE"
echo "Timestamp: $(date)" >> "$LOG_FILE"
echo "Test Version: $TEST_VERSION" >> "$LOG_FILE"
echo "Template Version: $TEMPLATE_VERSION" >> "$LOG_FILE"
echo "" >> "$LOG_FILE"

log ""
log "${BLUE}╔══════════════════════════════════════════════════════════════╗${NC}"
log "${BLUE}║                                                              ║${NC}"
log "${BLUE}║          Q-COMMAND SYSTEM TEST SUITE                         ║${NC}"
log "${BLUE}║          Enterprise-Grade Validation                         ║${NC}"
log "${BLUE}║                                                              ║${NC}"
log "${BLUE}╚══════════════════════════════════════════════════════════════╝${NC}"
log ""

# ============================================================
# Version Validation
# ============================================================

log "${BLUE}Version Check:${NC}"
log "  Test Suite Version:     $TEST_VERSION"
log "  Template Version:       $TEMPLATE_VERSION"

if [[ "$TEST_VERSION" != "$TEMPLATE_VERSION" ]]; then
    log ""
    log "${RED}╔══════════════════════════════════════════════════════════════╗${NC}"
    log "${RED}║  VERSION MISMATCH - Tests may not match templates!           ║${NC}"
    log "${RED}╚══════════════════════════════════════════════════════════════╝${NC}"
    log ""
    log "${YELLOW}Update test/VERSION to match templates/.q-system/version${NC}"
    log ""
else
    log "  ${GREEN}✓ Versions match${NC}"
fi
log ""

# Show configuration
log "${BLUE}Configuration:${NC}"
log "  Project Root: $PROJECT_ROOT"
log "  Quick Mode:   $QUICK_MODE"
if [[ -n "$SPECIFIC_SUITE" ]]; then
    log "  Suite:        $SPECIFIC_SUITE"
else
    log "  Suite:        All"
fi
log "  Log File:     $LOG_FILE"
log ""

# ============================================================
# Test Discovery
# ============================================================

# Find all test files
declare -a TEST_FILES

if [[ -n "$SPECIFIC_SUITE" ]]; then
    # Run specific suite - use proper glob expansion with quoted path
    for dir in "$SCRIPT_DIR/cases/$SPECIFIC_SUITE"*/; do
        if [[ -d "$dir" ]]; then
            for test_file in "$dir"test-*.sh; do
                if [[ -f "$test_file" ]]; then
                    TEST_FILES+=("$test_file")
                fi
            done
        fi
    done
else
    # Run all suites
    for suite_dir in "$SCRIPT_DIR/cases/"*/; do
        if [[ -d "$suite_dir" ]]; then
            for test_file in "$suite_dir"test-*.sh; do
                if [[ -f "$test_file" ]]; then
                    # In quick mode, only run structure tests
                    if $QUICK_MODE; then
                        if [[ "$suite_dir" == *"01-structure"* ]]; then
                            TEST_FILES+=("$test_file")
                        fi
                    else
                        TEST_FILES+=("$test_file")
                    fi
                fi
            done
        fi
    done
fi

log "${BLUE}Discovered ${#TEST_FILES[@]} test files${NC}"
log ""

# ============================================================
# Run Tests (with logging)
# ============================================================

TOTAL_TESTS=0
TOTAL_PASSED=0
TOTAL_FAILED=0
FAILED_SUITES=()

# Temporarily redirect assertion output to capture for logging
original_stdout=$(tty)

for test_file in "${TEST_FILES[@]}"; do
    # Save current counters
    PREV_TESTS=$TESTS_RUN
    PREV_PASSED=$TESTS_PASSED
    PREV_FAILED=$TESTS_FAILED

    # Reset counters for this file
    reset_counters

    # Get relative path for display
    REL_PATH="${test_file#$SCRIPT_DIR/}"

    log "${YELLOW}Running: $REL_PATH${NC}"

    # Source the test file, capturing output for log
    {
        source "$test_file" 2>&1 || echo -e "${RED}Test file had errors: $REL_PATH${NC}"
    } | while IFS= read -r line; do
        echo -e "$line"
        echo "$line" | sed 's/\x1b\[[0-9;]*m//g' >> "$LOG_FILE"
    done

    # Re-source to get the counter values (they were lost in the pipe)
    reset_counters
    source "$test_file" > /dev/null 2>&1 || true

    # Accumulate totals from this file
    TOTAL_TESTS=$((TOTAL_TESTS + TESTS_RUN))
    TOTAL_PASSED=$((TOTAL_PASSED + TESTS_PASSED))
    TOTAL_FAILED=$((TOTAL_FAILED + TESTS_FAILED))

    if [[ $TESTS_FAILED -gt 0 ]]; then
        FAILED_SUITES+=("$REL_PATH ($TESTS_FAILED failed)")
    fi
done

# ============================================================
# Cleanup
# ============================================================

log ""
log "${BLUE}Cleaning up test sandboxes...${NC}"
sandbox_cleanup_all
log "${GREEN}✓${NC} Cleanup complete"

# ============================================================
# Final Summary
# ============================================================

log ""
log "${BLUE}╔══════════════════════════════════════════════════════════════╗${NC}"
log "${BLUE}║                      FINAL SUMMARY                           ║${NC}"
log "${BLUE}╚══════════════════════════════════════════════════════════════╝${NC}"
log ""
log "  Test Suite Version: $TEST_VERSION"
log "  Template Version:   $TEMPLATE_VERSION"
log "  Test Files Run:     ${#TEST_FILES[@]}"
log "  Total Tests:        $TOTAL_TESTS"
log "  ${GREEN}Passed:             $TOTAL_PASSED${NC}"

if [[ $TOTAL_FAILED -gt 0 ]]; then
    log "  ${RED}Failed:             $TOTAL_FAILED${NC}"
    log ""
    log "${RED}Failed Suites:${NC}"
    for suite in "${FAILED_SUITES[@]}"; do
        log "  ${RED}✗${NC} $suite"
    done
    log ""
    log "${RED}╔══════════════════════════════════════════════════════════════╗${NC}"
    log "${RED}║                    TESTS FAILED                              ║${NC}"
    log "${RED}╚══════════════════════════════════════════════════════════════╝${NC}"
    log ""
    log "Log saved to: $LOG_FILE"
    exit 1
else
    log "  Failed:             0"
    log ""
    log "${GREEN}╔══════════════════════════════════════════════════════════════╗${NC}"
    log "${GREEN}║                  ALL TESTS PASSED                            ║${NC}"
    log "${GREEN}╚══════════════════════════════════════════════════════════════╝${NC}"
    log ""
    log "Log saved to: $LOG_FILE"
    exit 0
fi
