#!/bin/bash
# Q-Command System Test Framework - Assertions
# Enterprise-grade assertion library for comprehensive testing

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Counters
TESTS_RUN=0
TESTS_PASSED=0
TESTS_FAILED=0
CURRENT_SUITE=""

# ============================================================
# Core Assertion Functions
# ============================================================

# Assert that a condition is true
# Usage: assert_true "condition" "message"
assert_true() {
    local condition="$1"
    local message="$2"
    TESTS_RUN=$((TESTS_RUN + 1))

    if eval "$condition"; then
        TESTS_PASSED=$((TESTS_PASSED + 1))
        echo -e "  ${GREEN}✓${NC} $message"
        return 0
    else
        TESTS_FAILED=$((TESTS_FAILED + 1))
        echo -e "  ${RED}✗${NC} $message"
        echo -e "    ${RED}Expected: condition to be true${NC}"
        echo -e "    ${RED}Condition: $condition${NC}"
        return 1
    fi
}

# Assert that a condition is false
# Usage: assert_false "condition" "message"
assert_false() {
    local condition="$1"
    local message="$2"
    TESTS_RUN=$((TESTS_RUN + 1))

    if ! eval "$condition"; then
        TESTS_PASSED=$((TESTS_PASSED + 1))
        echo -e "  ${GREEN}✓${NC} $message"
        return 0
    else
        TESTS_FAILED=$((TESTS_FAILED + 1))
        echo -e "  ${RED}✗${NC} $message"
        echo -e "    ${RED}Expected: condition to be false${NC}"
        return 1
    fi
}

# Assert two values are equal
# Usage: assert_equals "expected" "actual" "message"
assert_equals() {
    local expected="$1"
    local actual="$2"
    local message="$3"
    TESTS_RUN=$((TESTS_RUN + 1))

    if [[ "$expected" == "$actual" ]]; then
        TESTS_PASSED=$((TESTS_PASSED + 1))
        echo -e "  ${GREEN}✓${NC} $message"
        return 0
    else
        TESTS_FAILED=$((TESTS_FAILED + 1))
        echo -e "  ${RED}✗${NC} $message"
        echo -e "    ${RED}Expected: $expected${NC}"
        echo -e "    ${RED}Actual:   $actual${NC}"
        return 1
    fi
}

# Assert two values are not equal
# Usage: assert_not_equals "unexpected" "actual" "message"
assert_not_equals() {
    local unexpected="$1"
    local actual="$2"
    local message="$3"
    TESTS_RUN=$((TESTS_RUN + 1))

    if [[ "$unexpected" != "$actual" ]]; then
        TESTS_PASSED=$((TESTS_PASSED + 1))
        echo -e "  ${GREEN}✓${NC} $message"
        return 0
    else
        TESTS_FAILED=$((TESTS_FAILED + 1))
        echo -e "  ${RED}✗${NC} $message"
        echo -e "    ${RED}Value should not equal: $unexpected${NC}"
        return 1
    fi
}

# Assert string contains substring
# Usage: assert_contains "haystack" "needle" "message"
assert_contains() {
    local haystack="$1"
    local needle="$2"
    local message="$3"
    TESTS_RUN=$((TESTS_RUN + 1))

    if [[ "$haystack" == *"$needle"* ]]; then
        TESTS_PASSED=$((TESTS_PASSED + 1))
        echo -e "  ${GREEN}✓${NC} $message"
        return 0
    else
        TESTS_FAILED=$((TESTS_FAILED + 1))
        echo -e "  ${RED}✗${NC} $message"
        echo -e "    ${RED}Expected to contain: $needle${NC}"
        echo -e "    ${RED}In: $haystack${NC}"
        return 1
    fi
}

# Assert string matches regex
# Usage: assert_matches "string" "pattern" "message"
assert_matches() {
    local string="$1"
    local pattern="$2"
    local message="$3"
    TESTS_RUN=$((TESTS_RUN + 1))

    if [[ "$string" =~ $pattern ]]; then
        TESTS_PASSED=$((TESTS_PASSED + 1))
        echo -e "  ${GREEN}✓${NC} $message"
        return 0
    else
        TESTS_FAILED=$((TESTS_FAILED + 1))
        echo -e "  ${RED}✗${NC} $message"
        echo -e "    ${RED}Expected to match pattern: $pattern${NC}"
        echo -e "    ${RED}String: $string${NC}"
        return 1
    fi
}

# ============================================================
# File System Assertions
# ============================================================

# Assert file exists
# Usage: assert_file_exists "/path/to/file" "message"
assert_file_exists() {
    local filepath="$1"
    local message="${2:-File exists: $filepath}"
    TESTS_RUN=$((TESTS_RUN + 1))

    if [[ -f "$filepath" ]]; then
        TESTS_PASSED=$((TESTS_PASSED + 1))
        echo -e "  ${GREEN}✓${NC} $message"
        return 0
    else
        TESTS_FAILED=$((TESTS_FAILED + 1))
        echo -e "  ${RED}✗${NC} $message"
        echo -e "    ${RED}File not found: $filepath${NC}"
        return 1
    fi
}

# Assert file does not exist
# Usage: assert_file_not_exists "/path/to/file" "message"
assert_file_not_exists() {
    local filepath="$1"
    local message="${2:-File does not exist: $filepath}"
    TESTS_RUN=$((TESTS_RUN + 1))

    if [[ ! -f "$filepath" ]]; then
        TESTS_PASSED=$((TESTS_PASSED + 1))
        echo -e "  ${GREEN}✓${NC} $message"
        return 0
    else
        TESTS_FAILED=$((TESTS_FAILED + 1))
        echo -e "  ${RED}✗${NC} $message"
        echo -e "    ${RED}File should not exist: $filepath${NC}"
        return 1
    fi
}

# Assert directory exists
# Usage: assert_dir_exists "/path/to/dir" "message"
assert_dir_exists() {
    local dirpath="$1"
    local message="${2:-Directory exists: $dirpath}"
    TESTS_RUN=$((TESTS_RUN + 1))

    if [[ -d "$dirpath" ]]; then
        TESTS_PASSED=$((TESTS_PASSED + 1))
        echo -e "  ${GREEN}✓${NC} $message"
        return 0
    else
        TESTS_FAILED=$((TESTS_FAILED + 1))
        echo -e "  ${RED}✗${NC} $message"
        echo -e "    ${RED}Directory not found: $dirpath${NC}"
        return 1
    fi
}

# Assert file contains text
# Usage: assert_file_contains "/path/to/file" "text" "message"
assert_file_contains() {
    local filepath="$1"
    local text="$2"
    local message="${3:-File contains expected text}"
    TESTS_RUN=$((TESTS_RUN + 1))

    if [[ ! -f "$filepath" ]]; then
        TESTS_FAILED=$((TESTS_FAILED + 1))
        echo -e "  ${RED}✗${NC} $message"
        echo -e "    ${RED}File not found: $filepath${NC}"
        return 1
    fi

    if grep -q "$text" "$filepath" 2>/dev/null; then
        TESTS_PASSED=$((TESTS_PASSED + 1))
        echo -e "  ${GREEN}✓${NC} $message"
        return 0
    else
        TESTS_FAILED=$((TESTS_FAILED + 1))
        echo -e "  ${RED}✗${NC} $message"
        echo -e "    ${RED}Expected to find: $text${NC}"
        echo -e "    ${RED}In file: $filepath${NC}"
        return 1
    fi
}

# Assert file is not empty
# Usage: assert_file_not_empty "/path/to/file" "message"
assert_file_not_empty() {
    local filepath="$1"
    local message="${2:-File is not empty: $filepath}"
    TESTS_RUN=$((TESTS_RUN + 1))

    if [[ ! -f "$filepath" ]]; then
        TESTS_FAILED=$((TESTS_FAILED + 1))
        echo -e "  ${RED}✗${NC} $message"
        echo -e "    ${RED}File not found: $filepath${NC}"
        return 1
    fi

    if [[ -s "$filepath" ]]; then
        TESTS_PASSED=$((TESTS_PASSED + 1))
        echo -e "  ${GREEN}✓${NC} $message"
        return 0
    else
        TESTS_FAILED=$((TESTS_FAILED + 1))
        echo -e "  ${RED}✗${NC} $message"
        echo -e "    ${RED}File is empty: $filepath${NC}"
        return 1
    fi
}

# Assert file line count
# Usage: assert_file_line_count "/path/to/file" 10 "message"
assert_file_line_count() {
    local filepath="$1"
    local expected_count="$2"
    local message="${3:-File has $expected_count lines}"
    TESTS_RUN=$((TESTS_RUN + 1))

    if [[ ! -f "$filepath" ]]; then
        TESTS_FAILED=$((TESTS_FAILED + 1))
        echo -e "  ${RED}✗${NC} $message"
        echo -e "    ${RED}File not found: $filepath${NC}"
        return 1
    fi

    local actual_count
    actual_count=$(wc -l < "$filepath" | tr -d ' ')

    if [[ "$actual_count" -eq "$expected_count" ]]; then
        TESTS_PASSED=$((TESTS_PASSED + 1))
        echo -e "  ${GREEN}✓${NC} $message"
        return 0
    else
        TESTS_FAILED=$((TESTS_FAILED + 1))
        echo -e "  ${RED}✗${NC} $message"
        echo -e "    ${RED}Expected: $expected_count lines${NC}"
        echo -e "    ${RED}Actual: $actual_count lines${NC}"
        return 1
    fi
}

# ============================================================
# Command/Exit Code Assertions
# ============================================================

# Assert command succeeds (exit code 0)
# Usage: assert_success "command" "message"
assert_success() {
    local command="$1"
    local message="${2:-Command succeeds: $command}"
    TESTS_RUN=$((TESTS_RUN + 1))

    if eval "$command" >/dev/null 2>&1; then
        TESTS_PASSED=$((TESTS_PASSED + 1))
        echo -e "  ${GREEN}✓${NC} $message"
        return 0
    else
        local exit_code=$?
        TESTS_FAILED=$((TESTS_FAILED + 1))
        echo -e "  ${RED}✗${NC} $message"
        echo -e "    ${RED}Command failed with exit code: $exit_code${NC}"
        return 1
    fi
}

# Assert command fails (non-zero exit code)
# Usage: assert_failure "command" "message"
assert_failure() {
    local command="$1"
    local message="${2:-Command fails: $command}"
    TESTS_RUN=$((TESTS_RUN + 1))

    if ! eval "$command" >/dev/null 2>&1; then
        TESTS_PASSED=$((TESTS_PASSED + 1))
        echo -e "  ${GREEN}✓${NC} $message"
        return 0
    else
        TESTS_FAILED=$((TESTS_FAILED + 1))
        echo -e "  ${RED}✗${NC} $message"
        echo -e "    ${RED}Command should have failed but succeeded${NC}"
        return 1
    fi
}

# Assert command output equals expected
# Usage: assert_output_equals "command" "expected" "message"
assert_output_equals() {
    local command="$1"
    local expected="$2"
    local message="${3:-Command output matches}"
    TESTS_RUN=$((TESTS_RUN + 1))

    local actual
    actual=$(eval "$command" 2>&1)

    if [[ "$actual" == "$expected" ]]; then
        TESTS_PASSED=$((TESTS_PASSED + 1))
        echo -e "  ${GREEN}✓${NC} $message"
        return 0
    else
        TESTS_FAILED=$((TESTS_FAILED + 1))
        echo -e "  ${RED}✗${NC} $message"
        echo -e "    ${RED}Expected: $expected${NC}"
        echo -e "    ${RED}Actual: $actual${NC}"
        return 1
    fi
}

# Assert command output contains text
# Usage: assert_output_contains "command" "text" "message"
assert_output_contains() {
    local command="$1"
    local text="$2"
    local message="${3:-Command output contains expected text}"
    TESTS_RUN=$((TESTS_RUN + 1))

    local output
    output=$(eval "$command" 2>&1)

    if [[ "$output" == *"$text"* ]]; then
        TESTS_PASSED=$((TESTS_PASSED + 1))
        echo -e "  ${GREEN}✓${NC} $message"
        return 0
    else
        TESTS_FAILED=$((TESTS_FAILED + 1))
        echo -e "  ${RED}✗${NC} $message"
        echo -e "    ${RED}Expected to contain: $text${NC}"
        echo -e "    ${RED}Output: $output${NC}"
        return 1
    fi
}

# ============================================================
# Git Assertions
# ============================================================

# Assert we're in a git repository
# Usage: assert_git_repo "message"
assert_git_repo() {
    local message="${1:-Is a git repository}"
    assert_success "git rev-parse --git-dir" "$message"
}

# Assert file is tracked by git
# Usage: assert_git_tracked "file" "message"
assert_git_tracked() {
    local filepath="$1"
    local message="${2:-File is tracked: $filepath}"
    assert_success "git ls-files --error-unmatch '$filepath'" "$message"
}

# Assert file is staged
# Usage: assert_git_staged "file" "message"
assert_git_staged() {
    local filepath="$1"
    local message="${2:-File is staged: $filepath}"
    TESTS_RUN=$((TESTS_RUN + 1))

    if git diff --cached --name-only | grep -q "^$filepath$"; then
        TESTS_PASSED=$((TESTS_PASSED + 1))
        echo -e "  ${GREEN}✓${NC} $message"
        return 0
    else
        TESTS_FAILED=$((TESTS_FAILED + 1))
        echo -e "  ${RED}✗${NC} $message"
        echo -e "    ${RED}File not staged: $filepath${NC}"
        return 1
    fi
}

# Assert working directory is clean
# Usage: assert_git_clean "message"
assert_git_clean() {
    local message="${1:-Working directory is clean}"
    TESTS_RUN=$((TESTS_RUN + 1))

    if [[ -z $(git status --porcelain) ]]; then
        TESTS_PASSED=$((TESTS_PASSED + 1))
        echo -e "  ${GREEN}✓${NC} $message"
        return 0
    else
        TESTS_FAILED=$((TESTS_FAILED + 1))
        echo -e "  ${RED}✗${NC} $message"
        echo -e "    ${RED}Uncommitted changes exist${NC}"
        return 1
    fi
}

# ============================================================
# Test Suite Management
# ============================================================

# Start a test suite
# Usage: suite_start "Suite Name"
suite_start() {
    CURRENT_SUITE="$1"
    echo ""
    echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${BLUE}  $CURRENT_SUITE${NC}"
    echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
}

# End a test suite (optional, for visual separation)
# Usage: suite_end
suite_end() {
    echo ""
}

# Print test summary
# Usage: print_summary
print_summary() {
    echo ""
    echo -e "${BLUE}══════════════════════════════════════════════════${NC}"
    echo -e "${BLUE}  TEST SUMMARY${NC}"
    echo -e "${BLUE}══════════════════════════════════════════════════${NC}"
    echo ""
    echo -e "  Total tests:  $TESTS_RUN"
    echo -e "  ${GREEN}Passed:       $TESTS_PASSED${NC}"

    if [[ $TESTS_FAILED -gt 0 ]]; then
        echo -e "  ${RED}Failed:       $TESTS_FAILED${NC}"
        echo ""
        echo -e "${RED}  ✗ TESTS FAILED${NC}"
        return 1
    else
        echo -e "  Failed:       0"
        echo ""
        echo -e "${GREEN}  ✓ ALL TESTS PASSED${NC}"
        return 0
    fi
}

# Reset counters (for running multiple test files)
# Usage: reset_counters
reset_counters() {
    TESTS_RUN=0
    TESTS_PASSED=0
    TESTS_FAILED=0
}
