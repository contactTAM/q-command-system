#!/bin/bash
# Q-Command System Test Framework - Utilities
# Helper functions for test setup, teardown, and common operations

# Get the directory where this script is located
TEST_LIB_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TEST_DIR="$(dirname "$TEST_LIB_DIR")"
PROJECT_ROOT="$(dirname "$TEST_DIR")"

# Source assertions
source "$TEST_LIB_DIR/assertions.sh"

# ============================================================
# Configuration
# ============================================================

# Temporary directory for sandbox tests
SANDBOX_BASE="/tmp/q-system-tests"
SANDBOX_DIR=""

# Expected files in a Q-System installation
EXPECTED_COMMANDS=(
    "q-begin.md"
    "q-end.md"
    "q-checkpoint.md"
    "q-status.md"
    "q-save.md"
    "q-verify.md"
    "q-commit.md"
    "q-compact.md"
    "q-dump.md"
    "q-learnings.md"
    "q-pare.md"
    "q-prompts.md"
    "q-setup.md"
    "q-upgrade.md"
)

EXPECTED_QSYSTEM_DIRS=(
    "transcripts"
    "session-notes"
    "checkpoints"
    "prompts"
    "memory"
    "docs"
)

# ============================================================
# Sandbox Management
# ============================================================

# Create a fresh sandbox directory for testing
# Usage: sandbox_create [name]
sandbox_create() {
    local name="${1:-test-$(date +%s)}"
    SANDBOX_DIR="$SANDBOX_BASE/$name"

    # Clean up if exists
    if [[ -d "$SANDBOX_DIR" ]]; then
        rm -rf "$SANDBOX_DIR"
    fi

    mkdir -p "$SANDBOX_DIR"
    echo "$SANDBOX_DIR"
}

# Initialize a git repo in sandbox
# Usage: sandbox_git_init
sandbox_git_init() {
    if [[ -z "$SANDBOX_DIR" ]]; then
        echo "Error: No sandbox created" >&2
        return 1
    fi

    cd "$SANDBOX_DIR" || return 1
    git init -q
    git config user.email "test@q-system.test"
    git config user.name "Q-System Test"

    # Create initial commit so git operations work
    echo "# Test Repository" > README.md
    git add README.md
    git commit -q -m "Initial commit"

    cd - > /dev/null || return 1
}

# Clean up sandbox
# Usage: sandbox_cleanup
sandbox_cleanup() {
    if [[ -n "$SANDBOX_DIR" && -d "$SANDBOX_DIR" ]]; then
        rm -rf "$SANDBOX_DIR"
    fi
    SANDBOX_DIR=""
}

# Clean up all sandboxes
# Usage: sandbox_cleanup_all
sandbox_cleanup_all() {
    if [[ -d "$SANDBOX_BASE" ]]; then
        rm -rf "$SANDBOX_BASE"
    fi
}

# ============================================================
# Q-System Installation Helpers
# ============================================================

# Install Q-System from templates to sandbox
# Usage: install_qsystem_to_sandbox
install_qsystem_to_sandbox() {
    if [[ -z "$SANDBOX_DIR" ]]; then
        echo "Error: No sandbox created" >&2
        return 1
    fi

    local templates_dir="$PROJECT_ROOT/templates"

    # Copy command files
    mkdir -p "$SANDBOX_DIR/.claude/commands"
    cp "$templates_dir/.claude/commands/"*.md "$SANDBOX_DIR/.claude/commands/"

    # Copy .q-system structure
    mkdir -p "$SANDBOX_DIR/.q-system"
    cp -r "$templates_dir/.q-system/"* "$SANDBOX_DIR/.q-system/" 2>/dev/null || true

    # Create session directories
    for dir in "${EXPECTED_QSYSTEM_DIRS[@]}"; do
        mkdir -p "$SANDBOX_DIR/.q-system/$dir"
    done

    # Copy CLAUDE.md template
    cp "$templates_dir/CLAUDE.md" "$SANDBOX_DIR/CLAUDE.md"

    # Copy .gitignore
    cp "$templates_dir/.gitignore" "$SANDBOX_DIR/.q-system/.gitignore" 2>/dev/null || true
}

# Verify Q-System installation is complete
# Usage: verify_qsystem_installation [path]
verify_qsystem_installation() {
    local install_path="${1:-$SANDBOX_DIR}"
    local all_passed=true

    # Check command files
    for cmd in "${EXPECTED_COMMANDS[@]}"; do
        if [[ ! -f "$install_path/.claude/commands/$cmd" ]]; then
            echo "Missing command: $cmd" >&2
            all_passed=false
        fi
    done

    # Check directories
    for dir in "${EXPECTED_QSYSTEM_DIRS[@]}"; do
        if [[ ! -d "$install_path/.q-system/$dir" ]]; then
            echo "Missing directory: .q-system/$dir" >&2
            all_passed=false
        fi
    done

    # Check essential files
    if [[ ! -f "$install_path/.q-system/version" ]]; then
        echo "Missing: .q-system/version" >&2
        all_passed=false
    fi

    if [[ ! -f "$install_path/CLAUDE.md" ]]; then
        echo "Missing: CLAUDE.md" >&2
        all_passed=false
    fi

    $all_passed
}

# ============================================================
# Template Validation Helpers
# ============================================================

# Get list of all command files in templates
# Usage: get_template_commands
get_template_commands() {
    ls "$PROJECT_ROOT/templates/.claude/commands/"*.md 2>/dev/null
}

# Validate markdown file has required sections
# Usage: validate_command_structure "file.md" "section1" "section2" ...
validate_command_structure() {
    local filepath="$1"
    shift
    local sections=("$@")
    local all_found=true

    for section in "${sections[@]}"; do
        if ! grep -q "^#.*$section" "$filepath" 2>/dev/null; then
            echo "Missing section '$section' in $filepath" >&2
            all_found=false
        fi
    done

    $all_found
}

# Check if markdown file is valid (basic check)
# Usage: is_valid_markdown "file.md"
is_valid_markdown() {
    local filepath="$1"

    # File exists and is not empty
    [[ -f "$filepath" && -s "$filepath" ]] || return 1

    # Has at least one heading
    grep -q "^#" "$filepath" 2>/dev/null || return 1

    return 0
}

# ============================================================
# Version Helpers
# ============================================================

# Get current version from templates
# Usage: get_template_version
get_template_version() {
    cat "$PROJECT_ROOT/templates/.q-system/version" 2>/dev/null || echo "unknown"
}

# Validate version format (semver)
# Usage: is_valid_version "2.1.0"
is_valid_version() {
    local version="$1"
    [[ "$version" =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]]
}

# ============================================================
# Session File Helpers
# ============================================================

# Generate expected session filename
# Usage: generate_session_filename "Gabriel"
generate_session_filename() {
    local username="${1:-TestUser}"
    echo "$(date +%Y-%m-%d-%H%M)-$username.md"
}

# Create a mock session file
# Usage: create_mock_session_file "type" "username"
# type: transcript, session-note, checkpoint
create_mock_session_file() {
    local type="$1"
    local username="${2:-TestUser}"
    local filename
    filename=$(generate_session_filename "$username")

    local dir=""
    case "$type" in
        transcript)
            dir="$SANDBOX_DIR/.q-system/transcripts"
            ;;
        session-note)
            dir="$SANDBOX_DIR/.q-system/session-notes"
            ;;
        checkpoint)
            dir="$SANDBOX_DIR/.q-system/checkpoints"
            ;;
        *)
            echo "Unknown type: $type" >&2
            return 1
            ;;
    esac

    mkdir -p "$dir"
    cat > "$dir/$filename" << EOF
# Mock $type

**Date:** $(date +%Y-%m-%d)
**User:** $username
**Type:** $type

## Content

This is a mock $type for testing purposes.
EOF

    echo "$dir/$filename"
}

# ============================================================
# Output Helpers
# ============================================================

# Print a section header
# Usage: print_header "Section Name"
print_header() {
    local text="$1"
    echo ""
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo "  $text"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
}

# Print info message
# Usage: print_info "message"
print_info() {
    echo -e "${BLUE}ℹ${NC} $1"
}

# Print warning message
# Usage: print_warn "message"
print_warn() {
    echo -e "${YELLOW}⚠${NC} $1"
}

# Print error message
# Usage: print_error "message"
print_error() {
    echo -e "${RED}✗${NC} $1"
}

# Print success message
# Usage: print_success "message"
print_success() {
    echo -e "${GREEN}✓${NC} $1"
}

# ============================================================
# Cleanup trap
# ============================================================

# Set up cleanup on exit
# Usage: setup_cleanup_trap
setup_cleanup_trap() {
    trap sandbox_cleanup EXIT
}
