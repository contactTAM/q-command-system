#!/bin/bash
# Test: Strict Checklists
# Verifies critical commands have MANDATORY PRE-FLIGHT CHECKLIST and VERIFICATION GATE sections

# Don't use set -e - we want to continue and report all failures

# Get script directory and source utilities
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/../../lib/test-utils.sh"

# ============================================================
# Test Suite: Strict Checklists
# ============================================================

suite_start "Strict Checklists"

TEMPLATES_CMD_DIR="$PROJECT_ROOT/templates/.claude/commands"

# Critical commands that MUST have strict checklists (v2.1.1+)
CRITICAL_COMMANDS=(
    "q-begin.md"
    "q-checkpoint.md"
    "q-end.md"
    "q-save.md"
    "q-upgrade.md"
)

# ------------------------------------------------------------
# MANDATORY PRE-FLIGHT CHECKLIST
# ------------------------------------------------------------

echo ""
echo "  PRE-FLIGHT CHECKLIST Presence:"

for cmd in "${CRITICAL_COMMANDS[@]}"; do
    assert_file_contains "$TEMPLATES_CMD_DIR/$cmd" "MANDATORY PRE-FLIGHT CHECKLIST" "$cmd has PRE-FLIGHT CHECKLIST"
done

# ------------------------------------------------------------
# PRE-FLIGHT Has Checkboxes
# ------------------------------------------------------------

echo ""
echo "  PRE-FLIGHT Has Checkboxes:"

for cmd in "${CRITICAL_COMMANDS[@]}"; do
    # Check for markdown checkbox format (look for "] 1." which indicates numbered checkbox)
    assert_file_contains "$TEMPLATES_CMD_DIR/$cmd" "] 1\\." "$cmd has checkboxes"
done

# ------------------------------------------------------------
# VERIFICATION GATE Presence
# ------------------------------------------------------------

echo ""
echo "  VERIFICATION GATE Presence:"

for cmd in "${CRITICAL_COMMANDS[@]}"; do
    assert_file_contains "$TEMPLATES_CMD_DIR/$cmd" "VERIFICATION GATE" "$cmd has VERIFICATION GATE"
done

# ------------------------------------------------------------
# FINAL Section Presence (FINAL CHECKLIST or FINAL REMINDER)
# ------------------------------------------------------------

echo ""
echo "  FINAL Section Presence:"

for cmd in "${CRITICAL_COMMANDS[@]}"; do
    # Match "## FINAL" which covers both FINAL CHECKLIST and FINAL REMINDER
    assert_file_contains "$TEMPLATES_CMD_DIR/$cmd" "## FINAL" "$cmd has FINAL section"
done

# ------------------------------------------------------------
# Step Numbering
# ------------------------------------------------------------

echo ""
echo "  Numbered Steps:"

for cmd in "${CRITICAL_COMMANDS[@]}"; do
    # Check for Step 1 header
    assert_file_contains "$TEMPLATES_CMD_DIR/$cmd" "## Step 1" "$cmd has Step 1"
done

# ------------------------------------------------------------
# Error Handling Section
# ------------------------------------------------------------

echo ""
echo "  Error Handling Section:"

for cmd in "${CRITICAL_COMMANDS[@]}"; do
    assert_file_contains "$TEMPLATES_CMD_DIR/$cmd" "Error Handling" "$cmd has Error Handling"
done

# ------------------------------------------------------------
# Non-Critical Commands (Should NOT require strict checklists)
# ------------------------------------------------------------

echo ""
echo "  Non-Critical Commands (flexible structure):"

NON_CRITICAL_COMMANDS=(
    "q-status.md"
    "q-verify.md"
    "q-dump.md"
    "q-learnings.md"
)

for cmd in "${NON_CRITICAL_COMMANDS[@]}"; do
    # Just verify the file exists and is valid markdown
    assert_file_exists "$TEMPLATES_CMD_DIR/$cmd" "$cmd exists"
    assert_true "is_valid_markdown '$TEMPLATES_CMD_DIR/$cmd'" "$cmd is valid markdown"
done

suite_end
