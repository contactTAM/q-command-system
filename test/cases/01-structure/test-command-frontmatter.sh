#!/bin/bash
# Test: Command Frontmatter
# Verifies all command files have proper YAML frontmatter with version

# Don't use set -e - we want to continue and report all failures

# Get script directory and source utilities
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/../../lib/test-utils.sh"

# ============================================================
# Test Suite: Command Frontmatter
# ============================================================

suite_start "Command Frontmatter"

# ------------------------------------------------------------
# Frontmatter Structure
# ------------------------------------------------------------

echo ""
echo "  Frontmatter Structure:"

TEMPLATES_CMD_DIR="$PROJECT_ROOT/templates/.claude/commands"

for cmd in "${EXPECTED_COMMANDS[@]}"; do
    # Check file starts with ---
    FIRST_LINE=$(head -1 "$TEMPLATES_CMD_DIR/$cmd" 2>/dev/null)
    assert_equals "---" "$FIRST_LINE" "$cmd starts with ---"
done

# ------------------------------------------------------------
# Description Field Present
# ------------------------------------------------------------

echo ""
echo "  Description Field:"

for cmd in "${EXPECTED_COMMANDS[@]}"; do
    assert_file_contains "$TEMPLATES_CMD_DIR/$cmd" "description:" "$cmd has description field"
done

# ------------------------------------------------------------
# Version Field Present (v2.1.1+)
# ------------------------------------------------------------

echo ""
echo "  Version Field (v2.1.1+):"

for cmd in "${EXPECTED_COMMANDS[@]}"; do
    assert_file_contains "$TEMPLATES_CMD_DIR/$cmd" "version:" "$cmd has version field"
done

# ------------------------------------------------------------
# Version Matches Current
# ------------------------------------------------------------

echo ""
echo "  Version Consistency:"

CURRENT_VERSION=$(get_template_version)

for cmd in "${EXPECTED_COMMANDS[@]}"; do
    # Extract version from frontmatter
    CMD_VERSION=$(grep '^version:' "$TEMPLATES_CMD_DIR/$cmd" 2>/dev/null | head -1 | sed 's/.*:[[:space:]]*//' | tr -d '"' | tr -d ' ')
    assert_equals "$CURRENT_VERSION" "$CMD_VERSION" "$cmd version is $CURRENT_VERSION"
done

# ------------------------------------------------------------
# Frontmatter Closes Properly
# ------------------------------------------------------------

echo ""
echo "  Frontmatter Closure:"

for cmd in "${EXPECTED_COMMANDS[@]}"; do
    # Count --- lines (should be at least 2 for open and close)
    DASH_COUNT=$(grep -c '^---$' "$TEMPLATES_CMD_DIR/$cmd" 2>/dev/null || echo "0")
    assert_true "[[ $DASH_COUNT -ge 2 ]]" "$cmd has closing ---"
done

# ------------------------------------------------------------
# No Invalid Frontmatter Fields
# ------------------------------------------------------------

echo ""
echo "  Valid Frontmatter Only:"

# Known valid fields: description, version
for cmd in "${EXPECTED_COMMANDS[@]}"; do
    # Get all frontmatter lines (between first and second ---)
    FRONTMATTER=$(sed -n '2,/^---$/p' "$TEMPLATES_CMD_DIR/$cmd" 2>/dev/null | grep -v '^---$' | grep ':')

    # Check each line contains only valid fields
    INVALID=$(echo "$FRONTMATTER" | grep -v -E '^(description|version):' | head -1)
    assert_equals "" "$INVALID" "$cmd has only valid frontmatter fields"
done

suite_end
