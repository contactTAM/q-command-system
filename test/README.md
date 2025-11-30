# Q-Command System Test Suite

Enterprise-grade test suite for comprehensive validation of the Q-Command System.

## Quick Start

```bash
# Run all tests
./test/run-tests.sh

# Run quick smoke tests only (structure validation)
./test/run-tests.sh --quick

# Run specific test suite
./test/run-tests.sh --suite 01
```

## Test Suites

| Suite | Description | Tests |
|-------|-------------|-------|
| **01-structure** | Template files, markdown validity, required sections | ~40 |
| **02-install** | Fresh install, existing repos, directory structure | ~30 |
| **03-commands** | Session files, git operations, command patterns | ~50 |
| **04-upgrade** | Version detection, upgrade process, file preservation | ~25 |
| **05-edge-cases** | Missing dirs, special chars, concurrent users, non-git | ~35 |

**Total: ~180 assertions**

## Test Framework

### Directory Structure

```
test/
├── run-tests.sh           # Main test runner
├── README.md              # This file
├── lib/
│   ├── assertions.sh      # Assertion functions
│   └── test-utils.sh      # Helper utilities
├── cases/
│   ├── 01-structure/      # Structure validation tests
│   ├── 02-install/        # Installation tests
│   ├── 03-commands/       # Command behavior tests
│   ├── 04-upgrade/        # Upgrade tests
│   └── 05-edge-cases/     # Edge case tests
└── fixtures/
    └── expected/          # Expected outputs (for future use)
```

### Available Assertions

**Core Assertions:**
- `assert_true "condition" "message"` - Condition evaluates to true
- `assert_false "condition" "message"` - Condition evaluates to false
- `assert_equals "expected" "actual" "message"` - Values are equal
- `assert_not_equals "unexpected" "actual" "message"` - Values differ
- `assert_contains "haystack" "needle" "message"` - String contains substring
- `assert_matches "string" "pattern" "message"` - String matches regex

**File System Assertions:**
- `assert_file_exists "path" "message"` - File exists
- `assert_file_not_exists "path" "message"` - File doesn't exist
- `assert_dir_exists "path" "message"` - Directory exists
- `assert_file_contains "path" "text" "message"` - File contains text
- `assert_file_not_empty "path" "message"` - File has content
- `assert_file_line_count "path" N "message"` - File has N lines

**Command Assertions:**
- `assert_success "command" "message"` - Command exits with 0
- `assert_failure "command" "message"` - Command exits non-zero
- `assert_output_equals "command" "expected" "message"` - Output matches
- `assert_output_contains "command" "text" "message"` - Output contains text

**Git Assertions:**
- `assert_git_repo "message"` - Directory is a git repo
- `assert_git_tracked "file" "message"` - File is tracked
- `assert_git_staged "file" "message"` - File is staged
- `assert_git_clean "message"` - Working directory is clean

### Test Utilities

**Sandbox Management:**
```bash
SANDBOX_DIR=$(sandbox_create "test-name")  # Create temp directory
sandbox_git_init                            # Initialize git in sandbox
sandbox_cleanup                             # Clean up current sandbox
sandbox_cleanup_all                         # Clean up all sandboxes
```

**Q-System Helpers:**
```bash
install_qsystem_to_sandbox                  # Install Q-System to sandbox
verify_qsystem_installation "/path"         # Verify installation
get_template_version                        # Get current template version
is_valid_version "2.1.0"                    # Check semver format
```

**Session File Helpers:**
```bash
generate_session_filename "Username"        # Generate timestamped filename
create_mock_session_file "transcript" "User" # Create mock session file
```

## Writing New Tests

### Basic Test File Structure

```bash
#!/bin/bash
# Test: Descriptive Name
# Description of what this test validates

set -e

# Get script directory and source utilities
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/../../lib/test-utils.sh"

# ============================================================
# Test Suite: Suite Name
# ============================================================

suite_start "Suite Name"

# Set up cleanup trap (for sandbox tests)
setup_cleanup_trap

# ------------------------------------------------------------
# Test Group Name
# ------------------------------------------------------------

echo ""
echo "  Group Name:"

assert_true "condition" "Description of what we're testing"
assert_file_exists "/path" "Description"

suite_end
```

### Adding a New Test Suite

1. Create directory: `test/cases/XX-name/`
2. Add test files: `test-something.sh`
3. Tests are auto-discovered by the runner

### Best Practices

1. **One concept per test file** - Keep tests focused
2. **Use descriptive messages** - Failures should be self-explanatory
3. **Clean up after yourself** - Use `setup_cleanup_trap`
4. **Test both success and failure** - Verify error handling
5. **Use sandboxes** - Don't modify the actual repo

## CI Integration

For GitHub Actions or other CI:

```yaml
- name: Run Q-System Tests
  run: ./test/run-tests.sh

- name: Run Quick Smoke Tests
  run: ./test/run-tests.sh --quick
```

## Manual Testing Checklist

Some behaviors require Claude interpretation and can't be fully automated:

### Pre-Release Checklist

- [ ] Run `./test/run-tests.sh` - all tests pass
- [ ] Start Claude Code in fresh repo
- [ ] Run `/q-setup` - verify setup completes
- [ ] Run `/q-begin` - verify context loaded
- [ ] Run `/q-status` - verify context percentage shown
- [ ] Run `/q-checkpoint` - verify file created
- [ ] Run `/q-end` - verify transcript and notes created
- [ ] Run `/q-upgrade` - verify version check works

### Upgrade Testing

- [ ] Install old version in test repo
- [ ] Create session files
- [ ] Run `/q-upgrade`
- [ ] Verify session files preserved
- [ ] Verify commands updated
- [ ] Verify CLAUDE.md untouched

## Troubleshooting

### Tests Fail to Run

```bash
# Ensure scripts are executable
chmod +x test/run-tests.sh
chmod +x test/lib/*.sh
chmod +x test/cases/*/*.sh
```

### Sandbox Permission Issues

```bash
# Clean up leftover sandboxes
rm -rf /tmp/q-system-tests
```

### Git Errors in Tests

Tests create isolated git repos. If you see git errors:
1. Ensure git is installed
2. Check global git config exists
3. Run tests with `--verbose` for details

## Contributing

When adding new Q-System features:

1. Add tests for the feature in appropriate suite
2. Run full test suite before PR
3. Update this README if adding new assertions or utilities

---

**Q-Command System Test Suite** - Enterprise-grade validation for enterprise-grade tooling.
