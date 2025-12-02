#!/bin/bash
# Test: Upgrade Infrastructure
# Verifies upgrade.sh script and releases.yaml exist and are valid

# Don't use set -e - we want to continue and report all failures

# Get script directory and source utilities
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/../../lib/test-utils.sh"

# ============================================================
# Test Suite: Upgrade Infrastructure
# ============================================================

suite_start "Upgrade Infrastructure"

# ------------------------------------------------------------
# upgrade.sh Script
# ------------------------------------------------------------

echo ""
echo "  upgrade.sh Script:"

UPGRADE_SCRIPT="$PROJECT_ROOT/scripts/upgrade.sh"

assert_file_exists "$UPGRADE_SCRIPT" "upgrade.sh exists"
assert_file_not_empty "$UPGRADE_SCRIPT" "upgrade.sh is not empty"

# Check it's a bash script
FIRST_LINE=$(head -1 "$UPGRADE_SCRIPT" 2>/dev/null)
assert_equals "#!/bin/bash" "$FIRST_LINE" "upgrade.sh has bash shebang"

# Check script is executable (or at least has execute permissions in content)
assert_success "test -r '$UPGRADE_SCRIPT'" "upgrade.sh is readable"

# Check for essential functions/features
assert_file_contains "$UPGRADE_SCRIPT" "backup" "upgrade.sh handles backups"
assert_file_contains "$UPGRADE_SCRIPT" "version" "upgrade.sh handles versions"

# ------------------------------------------------------------
# releases.yaml Structure
# ------------------------------------------------------------

echo ""
echo "  releases.yaml Structure:"

RELEASES_FILE="$PROJECT_ROOT/templates/.q-system/releases.yaml"

assert_file_exists "$RELEASES_FILE" "releases.yaml exists"
assert_file_not_empty "$RELEASES_FILE" "releases.yaml is not empty"

# Check required top-level fields
assert_file_contains "$RELEASES_FILE" "current_version:" "releases.yaml has current_version"
assert_file_contains "$RELEASES_FILE" "minimum_supported:" "releases.yaml has minimum_supported"
assert_file_contains "$RELEASES_FILE" "all_commands:" "releases.yaml has all_commands list"
assert_file_contains "$RELEASES_FILE" "releases:" "releases.yaml has releases list"

# ------------------------------------------------------------
# releases.yaml Version Consistency
# ------------------------------------------------------------

echo ""
echo "  releases.yaml Version Consistency:"

# Extract current_version from releases.yaml
RELEASES_VERSION=$(grep 'current_version:' "$RELEASES_FILE" 2>/dev/null | head -1 | sed 's/.*:[[:space:]]*//' | tr -d '"' | tr -d ' ')

# Get template version
TEMPLATE_VERSION=$(get_template_version)

assert_equals "$TEMPLATE_VERSION" "$RELEASES_VERSION" "releases.yaml current_version matches template version"

# ------------------------------------------------------------
# releases.yaml Command List
# ------------------------------------------------------------

echo ""
echo "  releases.yaml Command List:"

# Check all 14 expected commands are listed
for cmd in "${EXPECTED_COMMANDS[@]}"; do
    # Strip .md extension for command name
    CMD_NAME="${cmd%.md}"
    assert_file_contains "$RELEASES_FILE" "$CMD_NAME" "releases.yaml lists $CMD_NAME"
done

# ------------------------------------------------------------
# releases.yaml Release History
# ------------------------------------------------------------

echo ""
echo "  releases.yaml Release History:"

# Check for required releases
assert_file_contains "$RELEASES_FILE" "version: \"2.1.1\"" "releases.yaml has 2.1.1 release"
assert_file_contains "$RELEASES_FILE" "version: \"2.1.0\"" "releases.yaml has 2.1.0 release"
assert_file_contains "$RELEASES_FILE" "version: \"2.0.0\"" "releases.yaml has 2.0.0 release"
assert_file_contains "$RELEASES_FILE" "version: \"1.0.0\"" "releases.yaml has 1.0.0 release"

# Check release structure fields
assert_file_contains "$RELEASES_FILE" "date:" "releases.yaml has date fields"
assert_file_contains "$RELEASES_FILE" "type:" "releases.yaml has type fields"
assert_file_contains "$RELEASES_FILE" "summary:" "releases.yaml has summary fields"
assert_file_contains "$RELEASES_FILE" "highlights:" "releases.yaml has highlights"
assert_file_contains "$RELEASES_FILE" "commands_changed:" "releases.yaml tracks command changes"
assert_file_contains "$RELEASES_FILE" "breaking_changes:" "releases.yaml tracks breaking changes"

# ------------------------------------------------------------
# releases.yaml 2.1.1 Specifics
# ------------------------------------------------------------

echo ""
echo "  releases.yaml 2.1.1 Content:"

# Check 2.1.1 specific content
assert_file_contains "$RELEASES_FILE" "YAML versioning" "2.1.1 mentions YAML versioning"
assert_file_contains "$RELEASES_FILE" "version.yaml" "2.1.1 mentions version.yaml"
assert_file_contains "$RELEASES_FILE" "releases.yaml" "2.1.1 mentions releases.yaml addition"

suite_end
