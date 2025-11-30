#!/bin/bash
# Q-Setup Command Simulator
# Simulates what Claude should do when executing /q-setup
#
# This allows functional testing of command logic without Claude

# Get directory
SIMULATOR_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# ============================================================
# Quick Mode Simulation
# ============================================================

# Simulate /q-setup Quick Mode for a new project
# Usage: simulate_qsetup_quick_new <target_dir> <project_type> <collaboration> <experience> [special_notes]
#
# project_type: software|writing|research|business|other
# collaboration: solo|team
# experience: beginner|intermediate|advanced
simulate_qsetup_quick_new() {
    local target_dir="$1"
    local project_type="${2:-software}"
    local collaboration="${3:-solo}"
    local experience="${4:-intermediate}"
    local special_notes="${5:-}"

    if [[ -z "$target_dir" ]]; then
        echo "Error: target_dir required" >&2
        return 1
    fi

    # Check if .q-system has active config (not just directory - could be after fresh)
    # After "start fresh", directory exists but config is archived
    if [[ -f "$target_dir/.q-system/config.md" || -f "$target_dir/.q-system/domain-config.json" ]]; then
        echo "Error: .q-system configuration exists - use simulate_qsetup_update instead" >&2
        return 1
    fi

    # Step 1: Create .q-system folder structure
    mkdir -p "$target_dir/.q-system/transcripts"
    mkdir -p "$target_dir/.q-system/session-notes"
    mkdir -p "$target_dir/.q-system/checkpoints"
    mkdir -p "$target_dir/.q-system/prompts"
    mkdir -p "$target_dir/.q-system/memory"
    mkdir -p "$target_dir/.q-system/docs"

    # Step 2: Create config.md with answers
    cat > "$target_dir/.q-system/config.md" << EOF
# Q-Command System Configuration

**Setup Mode:** Quick
**Setup Date:** $(date +%Y-%m-%d)

---

## Project Settings

**Project Type:** $project_type
**Collaboration:** $collaboration
**Experience Level:** $experience
EOF

    # Add special notes if provided
    if [[ -n "$special_notes" ]]; then
        cat >> "$target_dir/.q-system/config.md" << EOF
**Special Notes:** $special_notes
EOF
    fi

    cat >> "$target_dir/.q-system/config.md" << EOF

---

## What Was Created

- \`.q-system/\` folder structure
- \`.q-system/config.md\` (this file)
- Session directories: transcripts, session-notes, checkpoints, prompts, memory, docs

---

## Next Steps

Run \`/q-begin\` to start your first session.
EOF

    # Step 3: Create README in .q-system
    cat > "$target_dir/.q-system/README.md" << EOF
# Q-System Directory

This folder contains Q-Command System files for session management.

## Contents

- \`config.md\` - Your Q-System configuration
- \`transcripts/\` - Full session transcripts
- \`session-notes/\` - Session summaries
- \`checkpoints/\` - Mid-session snapshots
- \`prompts/\` - Saved prompts
- \`memory/\` - Persistent context
- \`docs/\` - Q-System documentation

## Version

Q-Command System files are managed by the system.
Do not manually edit files in session directories.
EOF

    echo "Q-Setup Quick Mode completed successfully"
    return 0
}

# ============================================================
# Detailed Mode Simulation
# ============================================================

# Simulate /q-setup Detailed Mode for a new project
# Usage: simulate_qsetup_detailed_new <target_dir> <answers_json>
#
# answers_json should contain:
#   starting_point, project_goal, experience, collaboration,
#   visual_needs, source_complexity, repo_state
simulate_qsetup_detailed_new() {
    local target_dir="$1"
    local starting_point="${2:-nothing}"
    local project_goal="${3:-complete_deliverable}"
    local experience="${4:-intermediate}"
    local collaboration="${5:-solo}"
    local visual_needs="${6:-no}"
    local source_complexity="${7:-no_sources}"
    local repo_state="${8:-existing_files}"

    if [[ -z "$target_dir" ]]; then
        echo "Error: target_dir required" >&2
        return 1
    fi

    # Check if .q-system has active config (not just directory - could be after fresh)
    if [[ -f "$target_dir/.q-system/config.md" || -f "$target_dir/.q-system/domain-config.json" ]]; then
        echo "Error: .q-system configuration exists - use simulate_qsetup_update instead" >&2
        return 1
    fi

    # Step 1: Create .q-system folder structure
    mkdir -p "$target_dir/.q-system/transcripts"
    mkdir -p "$target_dir/.q-system/session-notes"
    mkdir -p "$target_dir/.q-system/checkpoints"
    mkdir -p "$target_dir/.q-system/prompts"
    mkdir -p "$target_dir/.q-system/memory"
    mkdir -p "$target_dir/.q-system/docs"

    # Step 2: Create domain-config.json
    cat > "$target_dir/.q-system/domain-config.json" << EOF
{
  "setup_mode": "detailed",
  "setup_date": "$(date +%Y-%m-%d)",
  "version": "2.1.0",
  "answers": {
    "starting_point": "$starting_point",
    "project_goal": "$project_goal",
    "experience_level": "$experience",
    "collaboration": "$collaboration",
    "visual_needs": "$visual_needs",
    "source_complexity": "$source_complexity",
    "repo_state": "$repo_state"
  },
  "derived_settings": {
    "guidance_level": "$(derive_guidance_level "$experience")",
    "scaffolding_enabled": true,
    "multi_user": $([ "$collaboration" != "solo" ] && echo "true" || echo "false")
  }
}
EOF

    # Step 3: Create triggers.json for progressive scaffolding
    cat > "$target_dir/.q-system/triggers.json" << EOF
{
  "version": "2.1.0",
  "triggers": [
    {
      "id": "first_session",
      "condition": "session_count == 1",
      "action": "offer_project_structure_review",
      "fired": false
    },
    {
      "id": "context_high",
      "condition": "context_usage > 70",
      "action": "suggest_checkpoint",
      "fired": false
    },
    {
      "id": "week_one_review",
      "condition": "days_since_setup == 7",
      "action": "offer_configuration_review",
      "fired": false
    }
  ]
}
EOF

    # Step 4: Create config.md as human-readable summary
    cat > "$target_dir/.q-system/config.md" << EOF
# Q-Command System Configuration

**Setup Mode:** Detailed
**Setup Date:** $(date +%Y-%m-%d)

---

## Project Profile

| Question | Answer |
|----------|--------|
| Starting Point | $starting_point |
| Project Goal | $project_goal |
| Experience Level | $experience |
| Collaboration | $collaboration |
| Visual Needs | $visual_needs |
| Source Complexity | $source_complexity |
| Repository State | $repo_state |

---

## Derived Settings

- **Guidance Level:** $(derive_guidance_level "$experience")
- **Progressive Scaffolding:** Enabled
- **Multi-User Mode:** $([ "$collaboration" != "solo" ] && echo "Yes" || echo "No")

---

## What Was Created

- \`.q-system/\` folder structure
- \`.q-system/config.md\` (this file)
- \`.q-system/domain-config.json\` (full configuration)
- \`.q-system/triggers.json\` (progressive scaffolding)
- Session directories

---

## Triggers Configured

The following will be offered as your project evolves:
- First session: Project structure review
- Context > 70%: Checkpoint suggestion
- After 1 week: Configuration review

---

## Next Steps

Run \`/q-begin\` to start your first session.
EOF

    # Step 5: Create README
    cat > "$target_dir/.q-system/README.md" << EOF
# Q-System Directory

This folder contains Q-Command System files for session management.

## Contents

- \`config.md\` - Human-readable configuration
- \`domain-config.json\` - Full configuration profile
- \`triggers.json\` - Progressive scaffolding triggers
- \`transcripts/\` - Full session transcripts
- \`session-notes/\` - Session summaries
- \`checkpoints/\` - Mid-session snapshots

## Version

Setup with Q-Command System Detailed Mode.
EOF

    echo "Q-Setup Detailed Mode completed successfully"
    return 0
}

# Helper function to derive guidance level
derive_guidance_level() {
    local experience="$1"
    case "$experience" in
        beginner) echo "high" ;;
        learning) echo "moderate" ;;
        intermediate) echo "standard" ;;
        advanced) echo "minimal" ;;
        *) echo "standard" ;;
    esac
}

# ============================================================
# Update Configuration Simulation
# ============================================================

# Simulate /q-setup Update Configuration
# Usage: simulate_qsetup_update <target_dir> <changes_description>
simulate_qsetup_update() {
    local target_dir="$1"
    local changes="${2:-Configuration updated}"

    if [[ -z "$target_dir" ]]; then
        echo "Error: target_dir required" >&2
        return 1
    fi

    if [[ ! -d "$target_dir/.q-system" ]]; then
        echo "Error: .q-system does not exist - use simulate_qsetup_quick_new instead" >&2
        return 1
    fi

    # Create reconfiguration log
    local log_file="$target_dir/.q-system/RECONFIGURATION-LOG-$(date +%Y-%m-%d).md"

    cat > "$log_file" << EOF
# Reconfiguration Log - $(date +%Y-%m-%d)

**Time:** $(date +%H:%M)

---

## Changes Made

$changes

---

## Previous Configuration

$(cat "$target_dir/.q-system/config.md" 2>/dev/null || echo "No previous config found")

---

## Preserved Items

- All session notes in \`.q-system/session-notes/\`
- All checkpoints in \`.q-system/checkpoints/\`
- All transcripts in \`.q-system/transcripts/\`

---

## Notes

Configuration was updated without data loss.
EOF

    echo "Q-Setup Update completed - log at $log_file"
    return 0
}

# ============================================================
# Start Fresh Simulation
# ============================================================

# Simulate /q-setup Start Fresh
# Usage: simulate_qsetup_fresh <target_dir>
simulate_qsetup_fresh() {
    local target_dir="$1"

    if [[ -z "$target_dir" ]]; then
        echo "Error: target_dir required" >&2
        return 1
    fi

    if [[ ! -d "$target_dir/.q-system" ]]; then
        echo "Error: .q-system does not exist - nothing to reset" >&2
        return 1
    fi

    # Archive current config
    local archive_dir="$target_dir/.q-system/archived-$(date +%Y%m%d-%H%M%S)"
    mkdir -p "$archive_dir"

    # Move config files to archive (preserve session data)
    [[ -f "$target_dir/.q-system/config.md" ]] && mv "$target_dir/.q-system/config.md" "$archive_dir/"
    [[ -f "$target_dir/.q-system/domain-config.json" ]] && mv "$target_dir/.q-system/domain-config.json" "$archive_dir/"
    [[ -f "$target_dir/.q-system/triggers.json" ]] && mv "$target_dir/.q-system/triggers.json" "$archive_dir/"

    echo "Previous configuration archived to: $archive_dir"
    echo "Session data preserved. Ready for fresh setup."
    return 0
}

# ============================================================
# Verification Helpers
# ============================================================

# Verify basic Q-System directory structure (shared by both modes)
# Usage: verify_qsetup_structure <target_dir>
verify_qsetup_structure() {
    local target_dir="$1"
    local errors=0

    # Check directories exist
    for dir in transcripts session-notes checkpoints prompts memory docs; do
        if [[ ! -d "$target_dir/.q-system/$dir" ]]; then
            echo "Missing directory: .q-system/$dir"
            ((errors++))
        fi
    done

    # Check config.md exists
    if [[ ! -f "$target_dir/.q-system/config.md" ]]; then
        echo "Missing: .q-system/config.md"
        ((errors++))
    fi

    # Check README exists
    if [[ ! -f "$target_dir/.q-system/README.md" ]]; then
        echo "Missing: .q-system/README.md"
        ((errors++))
    fi

    return $errors
}

# Verify Quick Mode setup was successful
# Usage: verify_qsetup_quick <target_dir>
verify_qsetup_quick() {
    local target_dir="$1"
    local errors=0

    # Check structure
    verify_qsetup_structure "$target_dir"
    errors=$?

    # Check Quick mode specific content
    if [[ -f "$target_dir/.q-system/config.md" ]]; then
        if ! grep -q "Setup Mode.*Quick" "$target_dir/.q-system/config.md"; then
            echo "config.md missing 'Setup Mode: Quick'"
            ((errors++))
        fi
    fi

    return $errors
}

# Verify Detailed Mode setup was successful
# Usage: verify_qsetup_detailed <target_dir>
verify_qsetup_detailed() {
    local target_dir="$1"
    local errors=0

    # Check structure
    verify_qsetup_structure "$target_dir"
    errors=$?

    # Check detailed-mode specific files
    if [[ ! -f "$target_dir/.q-system/domain-config.json" ]]; then
        echo "Missing: .q-system/domain-config.json"
        ((errors++))
    else
        # Verify it's valid JSON
        if ! python3 -c "import json; json.load(open('$target_dir/.q-system/domain-config.json'))" 2>/dev/null; then
            echo "Invalid JSON: domain-config.json"
            ((errors++))
        fi
    fi

    if [[ ! -f "$target_dir/.q-system/triggers.json" ]]; then
        echo "Missing: .q-system/triggers.json"
        ((errors++))
    else
        if ! python3 -c "import json; json.load(open('$target_dir/.q-system/triggers.json'))" 2>/dev/null; then
            echo "Invalid JSON: triggers.json"
            ((errors++))
        fi
    fi

    # Check config.md mentions Detailed mode
    if [[ -f "$target_dir/.q-system/config.md" ]]; then
        if ! grep -q "Setup Mode.*Detailed" "$target_dir/.q-system/config.md"; then
            echo "config.md missing 'Setup Mode: Detailed'"
            ((errors++))
        fi
    fi

    return $errors
}
