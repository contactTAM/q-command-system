#!/bin/bash
# Test: Version Detection
# Tests version file handling and comparison logic

# Dont use set -e - we want to continue and report all failures

# Get script directory and source utilities
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/../../lib/test-utils.sh"

# ============================================================
# Test Suite: Version Detection
# ============================================================

suite_start "Version Detection"

# Set up cleanup trap
setup_cleanup_trap

# ------------------------------------------------------------
# Template Version
# ------------------------------------------------------------

echo ""
echo "  Template Version:"

TEMPLATE_VERSION=$(get_template_version)
assert_not_equals "unknown" "$TEMPLATE_VERSION" "Template version is set"
assert_matches "$TEMPLATE_VERSION" "^[0-9]+\.[0-9]+\.[0-9]+$" "Template version is valid semver"

# ------------------------------------------------------------
# Version Format Validation
# ------------------------------------------------------------

echo ""
echo "  Version Format Validation:"

assert_true "is_valid_version '2.1.0'" "2.1.0 is valid version"
assert_true "is_valid_version '1.0.0'" "1.0.0 is valid version"
assert_true "is_valid_version '10.20.30'" "10.20.30 is valid version"
assert_false "is_valid_version '2.1'" "2.1 is invalid (missing patch)"
assert_false "is_valid_version 'v2.1.0'" "v2.1.0 is invalid (has prefix)"
assert_false "is_valid_version ''" "Empty string is invalid"
assert_false "is_valid_version 'unknown'" "unknown is invalid"

# ------------------------------------------------------------
# Fresh Install Version
# ------------------------------------------------------------

echo ""
echo "  Fresh Install Version:"

SANDBOX_DIR=$(sandbox_create "version-detect")
sandbox_git_init
install_qsystem_to_sandbox

# Read version from version.yaml (v2.1.1+)
VERSION=$(grep 'version:' "$SANDBOX_DIR/.q-system/version.yaml" 2>/dev/null | head -1 | sed 's/.*:[[:space:]]*//' | tr -d '"' | tr -d ' ')
[[ -z "$VERSION" ]] && VERSION="unknown"
assert_equals "$TEMPLATE_VERSION" "$VERSION" "Fresh install has current version"

# ------------------------------------------------------------
# Missing Version File (Pre-2.1.1)
# ------------------------------------------------------------

echo ""
echo "  Missing Version File:"

# Remove version.yaml to simulate pre-2.1.1 install
rm -f "$SANDBOX_DIR/.q-system/version.yaml"
rm -f "$SANDBOX_DIR/.q-system/version"

# Try to read version (should fail gracefully)
VERSION=$(grep 'version:' "$SANDBOX_DIR/.q-system/version.yaml" 2>/dev/null | head -1 | sed 's/.*:[[:space:]]*//' | tr -d '"' | tr -d ' ')
[[ -z "$VERSION" ]] && VERSION="unknown"
assert_equals "unknown" "$VERSION" "Missing version returns unknown"

# ------------------------------------------------------------
# Corrupted Version File
# ------------------------------------------------------------

echo ""
echo "  Corrupted Version File:"

# Write invalid version.yaml content
echo "invalid: not-yaml-we-expect" > "$SANDBOX_DIR/.q-system/version.yaml"
VERSION=$(grep 'version:' "$SANDBOX_DIR/.q-system/version.yaml" 2>/dev/null | head -1 | sed 's/.*:[[:space:]]*//' | tr -d '"' | tr -d ' ')
[[ -z "$VERSION" ]] && VERSION="invalid"
assert_false "is_valid_version '$VERSION'" "Corrupted version is detected as invalid"

# Write empty file
echo "" > "$SANDBOX_DIR/.q-system/version.yaml"
VERSION=$(grep 'version:' "$SANDBOX_DIR/.q-system/version.yaml" 2>/dev/null | head -1 | sed 's/.*:[[:space:]]*//' | tr -d '"' | tr -d ' ')
assert_equals "" "$VERSION" "Empty version file detected"

suite_end
