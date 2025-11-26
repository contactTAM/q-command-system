# Q-Command System Naming Conventions

**File naming patterns and rationale**

---

## Primary Format

**Format:** `YYYY-MM-DD-HHmm-[PersonName].md`

**Components:**
- `YYYY` = 4-digit year (2025)
- `MM` = 2-digit month, zero-padded (01-12)
- `DD` = 2-digit day, zero-padded (01-31)
- `HHmm` = 24-hour time, no colon (0000-2359)
- `[PersonName]` = Team member's name (Gabriel, Guy, Fraser, Brian)
- `.md` = Markdown file extension

---

## Examples by File Type

### Transcripts

**Location:** `GeneratedMDs/transcripts/`

**Examples:**
```
2025-11-13-0900-Gabriel.md         ← Gabriel's session, Nov 13, 9:00 AM
2025-11-13-0913-Gabriel.md         ← Gabriel's session, Nov 13, 9:13 AM
2025-11-13-1200-Guy.md             ← Guy's session, Nov 13, 12:00 PM
2025-11-13-1430-Fraser.md          ← Fraser's session, Nov 13, 2:30 PM
2025-11-14-0900-Gabriel.md         ← Gabriel's session, Nov 14, 9:00 AM
```

### Session Notes

**Location:** `GeneratedMDs/session-notes/`

**Examples:**
```
2025-11-13-0900-Gabriel.md
2025-11-13-1200-Guy.md
2025-11-14-0900-Gabriel.md
```

**Same format as transcripts** - makes it easy to match transcript to notes.

### Checkpoints

**Location:** `GeneratedMDs/checkpoints/`

**Examples:**
```
2025-11-13-1030-Gabriel.md         ← Checkpoint at 10:30 AM
2025-11-13-1145-Gabriel.md         ← Another checkpoint at 11:45 AM
```

**Note:** Checkpoint times are when checkpoint was created (not session start time).

---

## Time Format Details

### 24-Hour Format (No AM/PM)

**Correct:**
```
0900  →  9:00 AM
1200  → 12:00 PM
1430  →  2:30 PM
2145  →  9:45 PM
```

**Why 24-hour:**
- Unambiguous (no AM/PM confusion)
- Sortable (09:00 < 14:30 < 21:45)
- International standard
- No special characters

### No Colon (Scriptable)

**Correct:** `0900` (no colon)
**Incorrect:** `09:00` (has colon)

**Why no colon:**
- Safe in shell scripts (no escaping needed)
- Works in all file systems
- Easier to parse programmatically
- Cleaner appearance

### Zero-Padded Hours

**Correct:**
```
0900  →  9:00 AM (with leading zero)
0100  →  1:00 AM (with leading zero)
```

**Incorrect:**
```
900   →  9:00 AM (missing leading zero - DON'T DO THIS)
100   →  1:00 AM (missing leading zero - DON'T DO THIS)
```

**Why zero-padded:**
- Consistent 4-character width
- Proper sorting (0900 < 1200 < 1400)
- Easy pattern matching

---

## Person Name Format

### Standard Names

**Use actual names:**
```
Gabriel
Guy
Fraser
Brian
```

**NOT:**
- Usernames (gabrielr)
- Initials (GR)
- Roles (developer1)
- Email prefixes (gabriel.rymberg)

### Capitalization

**First letter capitalized, rest lowercase:**
```
✅ Gabriel
✅ Guy
✅ Fraser
❌ GABRIEL (all caps)
❌ gabriel (all lowercase)
❌ GaBrIeL (random caps)
```

### Spaces in Names

**For multi-part names, use hyphens or camelCase:**

**Option 1: Hyphen**
```
John-Smith
Mary-Jane
```

**Option 2: CamelCase**
```
JohnSmith
MaryJane
```

**NOT spaces:**
```
❌ John Smith.md  (spaces break shell scripts)
```

---

## Date Format Details

### ISO 8601 Standard

**Format:** YYYY-MM-DD

**Examples:**
```
2025-11-13  →  November 13, 2025
2025-01-05  →  January 5, 2025
2025-12-31  →  December 31, 2025
```

**Why ISO 8601:**
- International standard
- Sortable (2025-01-01 < 2025-12-31)
- Unambiguous
- Big-endian (year first, most significant)

### Zero-Padding

**Always zero-pad months and days:**

**Correct:**
```
2025-01-05  (January 5)
2025-09-03  (September 3)
```

**Incorrect:**
```
2025-1-5    (breaks sorting)
2025-9-3    (breaks sorting)
```

---

## Separator Character

### Use Hyphens (-)

**Hyphens between all components:**
```
2025-11-13-0900-Gabriel.md
└─┬─┘ └─┬─┘ └┬┘ └──┬──┘
 year  mon day time person
  │     │   │   │     │
  └─────┴───┴───┴─────┘
  All connected with hyphens
```

**Why hyphens:**
- Standard in ISO dates
- Safe in all file systems
- Easy to read
- Easy to parse

**NOT underscores:**
```
❌ 2025_11_13_0900_Gabriel.md
```

**NOT spaces:**
```
❌ 2025 11 13 0900 Gabriel.md
```

---

## Complete Pattern

### Anatomy of a Filename

```
2025-11-13-0913-Gabriel.md
│    │  │  │    │       │
│    │  │  │    │       └─ Extension (.md)
│    │  │  │    └───────── Person name
│    │  │  └────────────── Time (24hr, no colon)
│    │  └───────────────── Day (zero-padded)
│    └──────────────────── Month (zero-padded)
└───────────────────────── Year (4 digits)
```

**Total length:** 28 characters
**Pattern:** `\d{4}-\d{2}-\d{2}-\d{4}-[A-Z][a-z]+\.md`

---

## Sorting Behavior

### Natural Chronological Sort

**Files sort correctly with standard tools:**

```bash
ls GeneratedMDs/transcripts/ | sort
```

**Output (chronological):**
```
2025-11-11-0900-Gabriel.md
2025-11-11-1430-Guy.md
2025-11-12-0900-Gabriel.md
2025-11-12-1000-Guy.md
2025-11-13-0900-Gabriel.md
2025-11-13-0913-Gabriel.md          ← Later same morning
2025-11-13-1200-Guy.md
2025-11-14-0900-Gabriel.md
```

**Why it works:**
- Year first (most significant)
- Zero-padded components
- Hyphens sort before letters
- Consistent format

---

## Pattern Matching

### Glob Patterns

**Find specific person:**
```bash
ls GeneratedMDs/session-notes/*-Gabriel.md
```

**Find specific date:**
```bash
ls GeneratedMDs/session-notes/2025-11-13-*.md
```

**Find specific month:**
```bash
ls GeneratedMDs/session-notes/2025-11-*.md
```

**Find morning sessions (0800-1159):**
```bash
ls GeneratedMDs/session-notes/*-0[8-9]*-*.md
ls GeneratedMDs/session-notes/*-1[01]*-*.md
```

### Regex Patterns

**Match format with regex:**
```regex
^\d{4}-\d{2}-\d{2}-\d{4}-[A-Z][a-z]+\.md$
```

**Extract components:**
```regex
^(\d{4})-(\d{2})-(\d{2})-(\d{4})-([A-Z][a-z]+)\.md$
  └──┬──┘ └──┬──┘ └──┬──┘ └──┬──┘ └────┬────┘
   year   month   day    time    person
```

---

## Validation

### Valid Filenames

```
✅ 2025-11-13-0900-Gabriel.md
✅ 2025-01-01-0000-Guy.md              (midnight, Jan 1)
✅ 2025-12-31-2359-Fraser.md           (11:59 PM, Dec 31)
✅ 2025-06-15-1430-Brian.md
✅ 2025-03-22-0913-JohnSmith.md        (multi-word name, camelCase)
```

### Invalid Filenames

```
❌ 2025-11-13-09:00-Gabriel.md         (colon in time)
❌ 2025-11-13-9:00-Gabriel.md          (not zero-padded)
❌ 11-13-2025-0900-Gabriel.md          (wrong date order)
❌ 2025-11-13-0900-gabriel.md          (lowercase name)
❌ 2025-11-13-0900 Gabriel.md          (space instead of hyphen)
❌ 2025_11_13_0900_Gabriel.md          (underscores instead of hyphens)
❌ 2025-11-13-Gabriel-0900.md          (person before time)
```

---

## Edge Cases

### Same Person, Same Minute

**Scenario:** Gabriel starts two sessions within same minute (rare)

**Solution:** Use different times:
```
2025-11-13-0900-Gabriel.md             ← First session (9:00 AM)
2025-11-13-0901-Gabriel.md             ← Second session (9:01 AM)
```

**Or use session start time exactly:**
```
2025-11-13-0900-Gabriel.md             ← Started at 9:00:00
2025-11-13-0900-Gabriel-2.md           ← Started at 9:00:30 (add suffix)
```

**In practice:** Very rare. Session start times usually differ by minutes.

---

### Midnight Sessions

**Use 0000 for midnight:**
```
2025-11-14-0000-Gabriel.md             ← Midnight, Nov 14
```

**Use 2359 for 11:59 PM:**
```
2025-11-13-2359-Gabriel.md             ← Last minute of Nov 13
```

---

### Cross-Midnight Sessions

**Session starts Nov 13 11:00 PM, ends Nov 14 1:00 AM**

**Use session START time:**
```
2025-11-13-2300-Gabriel.md             ← Started Nov 13, 11 PM
```

**Not end time:**
```
❌ 2025-11-14-0100-Gabriel.md          ← This would be wrong
```

---

## Parsing Examples

### Shell Script (Bash)

```bash
#!/bin/bash
filename="2025-11-13-0913-Gabriel.md"

# Extract components
year=${filename:0:4}              # 2025
month=${filename:5:2}             # 11
day=${filename:8:2}               # 13
time=${filename:11:4}             # 0913
person=${filename:16:-3}          # Gabriel (remove .md)

echo "Year: $year"
echo "Month: $month"
echo "Day: $day"
echo "Time: $time"
echo "Person: $person"
```

### Python

```python
import re

filename = "2025-11-13-0913-Gabriel.md"

# Regex match
pattern = r'^(\d{4})-(\d{2})-(\d{2})-(\d{4})-([A-Z][a-z]+)\.md$'
match = re.match(pattern, filename)

if match:
    year, month, day, time, person = match.groups()
    print(f"Year: {year}")
    print(f"Month: {month}")
    print(f"Day: {day}")
    print(f"Time: {time}")
    print(f"Person: {person}")
```

---

## Benefits Summary

### Why This Format?

✅ **Sortable** - Chronological order naturally
✅ **Filterable** - Easy to find by person/date
✅ **Parseable** - Extract components with regex
✅ **Scriptable** - No spaces, safe in shells
✅ **Unambiguous** - ISO 8601 date, 24-hour time
✅ **Collision-free** - Per-person-per-session
✅ **Readable** - Humans can read it easily
✅ **International** - Works in all locales
✅ **Future-proof** - Scales to any date/team size

---

## Migration from v1.0

**Old format:** `YYYY-MM-DD HH_mm Dev [PersonName].md`
**New format:** `YYYY-MM-DD-HHmm-[PersonName].md`

**Changes:**
- Removed spaces (shell-safe)
- Removed "Dev" label (redundant)
- Changed `HH_mm` to `HHmm` (cleaner)
- Added hyphens throughout (consistent)

**Example conversion:**
```
Old: 2025-11-13 09_13 Dev Gabriel.md
New: 2025-11-13-0913-Gabriel.md
```

---

## Summary

The Q-Command System naming convention is:

**Format:** `YYYY-MM-DD-HHmm-[PersonName].md`

**Design goals:**
- Sortability
- Filterability
- Parseability
- Scriptability
- Unambiguity
- Collision-free

**Result:** Clean, consistent, scalable file naming that works in all environments.

---

**Next:** See [sample-session-flow.md](sample-session-flow.md) for a complete session walkthrough.
