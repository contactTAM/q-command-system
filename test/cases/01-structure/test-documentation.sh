#!/bin/bash
# Test: Documentation Structure
# Validates that all documentation files exist and are consistent

# Don't use set -e - we want to continue and report all failures

# Get script directory and source utilities
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/../../lib/test-utils.sh"

# ============================================================
# Test Suite: Documentation Structure
# ============================================================

suite_start "Documentation Structure"

# ------------------------------------------------------------
# Root Documentation Files
# ------------------------------------------------------------

echo ""
echo "  Root Documentation:"

assert_file_exists "$PROJECT_ROOT/README.md" "README.md exists"
assert_file_exists "$PROJECT_ROOT/CHANGELOG.md" "CHANGELOG.md exists"
assert_file_exists "$PROJECT_ROOT/getting-started.md" "getting-started.md exists"

# ------------------------------------------------------------
# README Content
# ------------------------------------------------------------

echo ""
echo "  README.md Content:"

assert_file_contains "$PROJECT_ROOT/README.md" "Q-Command System" "README has project name"
assert_file_contains "$PROJECT_ROOT/README.md" "install" "README has install instructions"
assert_file_contains "$PROJECT_ROOT/README.md" "14" "README shows 14 commands"

# ------------------------------------------------------------
# CHANGELOG Content
# ------------------------------------------------------------

echo ""
echo "  CHANGELOG.md Content:"

assert_file_contains "$PROJECT_ROOT/CHANGELOG.md" "2.1" "CHANGELOG has v2.1"
assert_file_contains "$PROJECT_ROOT/CHANGELOG.md" "2.0" "CHANGELOG has v2.0"
assert_file_contains "$PROJECT_ROOT/CHANGELOG.md" "context monitoring" "CHANGELOG documents context monitoring"
assert_file_contains "$PROJECT_ROOT/CHANGELOG.md" "q-setup" "CHANGELOG documents q-setup consolidation"

# ------------------------------------------------------------
# Docs Directory
# ------------------------------------------------------------

echo ""
echo "  Documentation Directory:"

assert_dir_exists "$PROJECT_ROOT/docs" "docs/ directory exists"
assert_file_exists "$PROJECT_ROOT/docs/features.md" "docs/features.md exists"
assert_file_exists "$PROJECT_ROOT/docs/workflow.md" "docs/workflow.md exists"
assert_file_exists "$PROJECT_ROOT/docs/context-management.md" "docs/context-management.md exists"

# ------------------------------------------------------------
# Features Documentation
# ------------------------------------------------------------

echo ""
echo "  features.md Content:"

assert_file_contains "$PROJECT_ROOT/docs/features.md" "Context Monitoring" "features.md has context monitoring"
assert_file_contains "$PROJECT_ROOT/docs/features.md" "/q-setup" "features.md documents /q-setup"
assert_file_contains "$PROJECT_ROOT/docs/features.md" "/q-begin" "features.md documents /q-begin"
assert_file_contains "$PROJECT_ROOT/docs/features.md" "/q-end" "features.md documents /q-end"

# ------------------------------------------------------------
# Install Documentation
# ------------------------------------------------------------

echo ""
echo "  Install Documentation:"

assert_dir_exists "$PROJECT_ROOT/docs/install" "docs/install/ directory exists"

# ------------------------------------------------------------
# Version Consistency
# ------------------------------------------------------------

echo ""
echo "  Version Consistency:"

# Get version from templates
TEMPLATE_VERSION=$(cat "$PROJECT_ROOT/templates/.q-system/version" 2>/dev/null || echo "unknown")

# Check CHANGELOG mentions this version
assert_file_contains "$PROJECT_ROOT/CHANGELOG.md" "$TEMPLATE_VERSION" "CHANGELOG mentions template version $TEMPLATE_VERSION"

# Check README is up to date (has 14 commands, not 15)
if grep -q "15 commands" "$PROJECT_ROOT/README.md" 2>/dev/null; then
    assert_true "false" "README updated to 14 commands (found 15)"
else
    assert_true "true" "README updated to 14 commands"
fi

suite_end
