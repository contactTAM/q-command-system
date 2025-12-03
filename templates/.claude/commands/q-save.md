---
description: Quick exit with minimal documentation
version: 2.1.2
---

# Quick Save

**Purpose:** Lightweight session wrap-up when time or context is limited.

**USE THIS WHEN:** Context is critical (>90%) or you need to exit immediately.

---

## MANDATORY PRE-FLIGHT CHECKLIST

**STOP. Before proceeding, confirm:**

- [ ] 1. I will generate and USE the timestamp
- [ ] 2. I will create the transcript file (even if brief)
- [ ] 3. I will commit changes
- [ ] 4. I will VERIFY both file and commit

---

## Step 1: Generate Timestamp

**EXECUTE this exact command:**

```bash
TIMESTAMP=$(date +"%Y-%m-%d-%H%M") && echo "TIMESTAMP: $TIMESTAMP"
```

- [ ] Command executed
- [ ] Timestamp captured: ____________________
- [ ] Format verified: YYYY-MM-DD-HHMM

**STORE this timestamp. Use it for ALL operations.**

---

## Step 2: Determine Participant Name

- [ ] Name known from session: ____________________
- [ ] OR use: "Unknown"

---

## Step 3: Create Basic Transcript

### 3.1 Create Directory

```bash
mkdir -p .q-system/transcripts
```

### 3.2 Create File

**Filename:** `.q-system/transcripts/${TIMESTAMP}-[Name].md`

**MANDATORY content (keep it brief but complete):**

```markdown
# Session: [TIMESTAMP]-[Name]

**Type:** Quick save (abbreviated due to context constraints)

---

## Key Accomplishments

- [Accomplishment 1]
- [Accomplishment 2]
- [List ALL major work items]

---

## Files Changed

**Created:**
- [file1]

**Modified:**
- [file1]

---

## Status at Exit

[Current state - what's done, what's pending]

---

## Note

Quick save used due to: [context limit / time constraint / emergency exit]
Full session notes not created. Review checkpoints if available.
```

- [ ] File created
- [ ] All accomplishments listed (even if brief)
- [ ] Files changed listed

### 3.3 VERIFY File

```bash
ls -la .q-system/transcripts/${TIMESTAMP}* && wc -l .q-system/transcripts/${TIMESTAMP}*
```

- [ ] File exists
- [ ] File has content (>15 lines minimum)

**VERIFICATION GATE 1:**
```
Transcript created: .q-system/transcripts/[filename]
- Lines: [N]
```

---

## Step 4: Commit Changes

### 4.1 Stage All Changes

```bash
git add .
```

### 4.2 Create Commit

```bash
git commit -m "$(cat <<'EOF'
Quick save: [brief summary of work]

- [Main accomplishment 1]
- [Main accomplishment 2]

Quick save (abbreviated session documentation)

Co-Authored-By: Claude <noreply@anthropic.com>
EOF
)"
```

### 4.3 VERIFY Commit

```bash
git status
```

- [ ] Working tree is clean
- [ ] Commit created

**VERIFICATION GATE 2:**
```
Committed: [hash]
Working tree: [clean]
```

---

## Step 5: Final Report

**MANDATORY output format:**

```
=== Quick Save Complete ===

Timestamp: [TIMESTAMP]
Type: Abbreviated (quick save)

Created:
- Transcript: .q-system/transcripts/[filename] ([N] lines)
- Commit: [hash]

Note: Full session notes skipped for speed.
Checkpoints (if any) preserved in .q-system/checkpoints/

Run /q-verify to confirm what was saved.

Ready to push: git push
```

---

## Error Handling

**If transcript creation fails:**
1. Report error
2. Still attempt commit
3. Show user what couldn't be saved

**If commit fails:**
1. Report error
2. Show git status
3. Suggest manual intervention

---

## FINAL CHECKLIST

Before reporting "Quick Save Complete":

- [ ] Timestamp generated and used
- [ ] Transcript file created and verified
- [ ] All changes committed
- [ ] User informed of what was saved

**If any item is unchecked, go back and complete it.**

---

## When to Use /q-save vs /q-end

| Situation | Use |
|-----------|-----|
| Context 90%+ | **/q-save** (safer, less output) |
| Normal session end | /q-end (full documentation) |
| Emergency exit | **/q-save** (faster) |
| Checkpoints already saved | **/q-save** (checkpoints have details) |
| Need detailed notes | /q-end |

**Key insight:** At 90%+ context, /q-save is safer because it generates ~60-100 lines vs /q-end's 800-1000 lines. Less output = lower failure risk.
