# Q-Command System File Structure Examples

**Visual examples of directory organization**

---

## Minimal Setup

**Bare minimum to get started:**

```
your-repository/
├── CLAUDE.md                      ← Project context with Q-command section
├── SESSION-CHECKLIST.md            ← User workflow guide
│
└── GeneratedMDs/
    ├── SHORTCUTS.md                ← Q-command specifications
    ├── transcripts/                ← (empty initially)
    ├── session-notes/              ← (empty initially)
    └── checkpoints/                ← (empty initially)
```

**Size:** ~100 KB (just documentation)

---

## After First Session

**After running Q-BEGIN and Q-END once:**

```
your-repository/
├── CLAUDE.md
├── SESSION-CHECKLIST.md
│
└── GeneratedMDs/
    ├── SHORTCUTS.md
    │
    ├── transcripts/
    │   └── 2025-11-13-0900-Gabriel.md        ← First session transcript
    │
    ├── session-notes/
    │   └── 2025-11-13-0900-Gabriel.md        ← First session summary
    │
    └── checkpoints/                            ← (still empty, no checkpoints yet)
```

**Added:** 2 session files (~50-100 KB total)

---

## Multi-User Same Day

**Gabriel and Guy both work on Nov 13:**

```
GeneratedMDs/
├── transcripts/
│   ├── 2025-11-13-0900-Gabriel.md             ← Gabriel's morning session
│   └── 2025-11-13-1200-Guy.md                 ← Guy's afternoon session
│
└── session-notes/
    ├── 2025-11-13-0900-Gabriel.md
    └── 2025-11-13-1200-Guy.md
```

**No collisions!** Each person has separate files.

---

## After One Week

**Multiple sessions by multiple people:**

```
GeneratedMDs/
├── transcripts/
│   ├── 2025-11-11-0900-Gabriel.md
│   ├── 2025-11-12-1430-Gabriel.md
│   ├── 2025-11-12-0915-Guy.md
│   ├── 2025-11-13-0900-Gabriel.md
│   ├── 2025-11-13-1200-Guy.md
│   ├── 2025-11-13-1430-Fraser.md
│   ├── 2025-11-14-0900-Gabriel.md
│   └── 2025-11-15-0930-Guy.md                 ← 8 sessions total
│
├── session-notes/
│   ├── 2025-11-11-0900-Gabriel.md
│   ├── 2025-11-12-1430-Gabriel.md
│   ├── 2025-11-12-0915-Guy.md
│   ├── 2025-11-13-0900-Gabriel.md
│   ├── 2025-11-13-1200-Guy.md
│   ├── 2025-11-13-1430-Fraser.md
│   ├── 2025-11-14-0900-Gabriel.md
│   └── 2025-11-15-0930-Guy.md
│
└── checkpoints/
    ├── 2025-11-13-1030-Gabriel.md              ← Long session had checkpoint
    └── 2025-11-14-1045-Gabriel.md
```

**Typical size:** 400-800 KB (8 sessions × 50-100 KB each)

---

## With Optional .gitignore

**If excluding session files from git:**

```
GeneratedMDs/
├── .gitignore                                   ← Excludes transcripts/notes/checkpoints
├── SHORTCUTS.md                                 ← Included in git (system file)
│
├── transcripts/                                 ← Excluded from git
│   └── [many session files]
│
├── session-notes/                               ← Excluded from git
│   └── [many session files]
│
└── checkpoints/                                 ← Excluded from git
    └── [checkpoint files]
```

**Git only tracks:** SHORTCUTS.md (system files)
**Local only:** All session files

---

## Full Project Example

**Complete repository with Q-Command System:**

```
your-repository/
├── .git/
├── .gitignore
├── README.md
├── CLAUDE.md                                    ← Includes Q-command workflow
├── SESSION-CHECKLIST.md
│
├── src/
│   ├── components/
│   ├── services/
│   └── utils/
│
├── docs/
│   └── project-documentation.md
│
├── planning/
│   ├── work-plan.md
│   ├── features/
│   └── courses/
│
└── GeneratedMDs/
    ├── SHORTCUTS.md
    ├── .gitignore                               ← Optional
    │
    ├── transcripts/
    │   ├── 2025-11-13-0900-Gabriel.md
    │   ├── 2025-11-13-1200-Guy.md
    │   └── [more sessions...]
    │
    ├── session-notes/
    │   ├── 2025-11-13-0900-Gabriel.md
    │   ├── 2025-11-13-1200-Guy.md
    │   └── [more summaries...]
    │
    └── checkpoints/
        ├── 2025-11-13-1030-Gabriel.md
        └── [more checkpoints...]
```

---

## Filtering by Person

**Find all Gabriel's sessions:**

```bash
ls GeneratedMDs/session-notes/*-Gabriel.md
```

**Output:**
```
GeneratedMDs/session-notes/2025-11-11-0900-Gabriel.md
GeneratedMDs/session-notes/2025-11-12-1430-Gabriel.md
GeneratedMDs/session-notes/2025-11-13-0900-Gabriel.md
GeneratedMDs/session-notes/2025-11-14-0900-Gabriel.md
```

---

## Filtering by Date

**Find all sessions from Nov 13:**

```bash
ls GeneratedMDs/session-notes/2025-11-13-*.md
```

**Output:**
```
GeneratedMDs/session-notes/2025-11-13-0900-Gabriel.md
GeneratedMDs/session-notes/2025-11-13-1200-Guy.md
GeneratedMDs/session-notes/2025-11-13-1430-Fraser.md
```

---

## Sorting

**Files naturally sort chronologically:**

```bash
ls -1 GeneratedMDs/transcripts/ | sort
```

**Output (sorted by date/time):**
```
2025-11-11-0900-Gabriel.md
2025-11-12-0915-Guy.md
2025-11-12-1430-Gabriel.md
2025-11-13-0900-Gabriel.md
2025-11-13-1200-Guy.md
2025-11-13-1430-Fraser.md
2025-11-14-0900-Gabriel.md
```

Perfect chronological order!

---

## Archive Structure

**After archiving old sessions:**

```
your-repository/
├── GeneratedMDs/
│   ├── transcripts/                             ← Current month only
│   │   ├── 2025-11-13-0900-Gabriel.md
│   │   └── 2025-11-14-0900-Gabriel.md
│   │
│   └── session-notes/                           ← Current month only
│       ├── 2025-11-13-0900-Gabriel.md
│       └── 2025-11-14-0900-Gabriel.md
│
└── archives/
    ├── sessions-2025-10.tar.gz                  ← October archived
    └── sessions-2025-09.tar.gz                  ← September archived
```

**Keeps repo lean** while preserving history.

---

## Multi-Repository Setup

**Option 1: Copy to each repo (independent)**

```
project-1/
└── GeneratedMDs/
    └── [Q-command system + sessions]

project-2/
└── GeneratedMDs/
    └── [Q-command system + sessions]

project-3/
└── GeneratedMDs/
    └── [Q-command system + sessions]
```

**Pros:** Independent, customizable per project
**Cons:** Larger disk space, must update each separately

---

**Option 2: Symlink to shared system**

```
~/Q-command-system/
└── templates/
    ├── SHORTCUTS.md
    └── SESSION-CHECKLIST.md

project-1/
└── GeneratedMDs/
    ├── SHORTCUTS.md                             ← Symlink to ~/Q-command-system/templates/
    ├── transcripts/                             ← Project-specific
    └── session-notes/                           ← Project-specific

project-2/
└── GeneratedMDs/
    ├── SHORTCUTS.md                             ← Symlink (shared)
    ├── transcripts/                             ← Project-specific
    └── session-notes/                           ← Project-specific
```

**Pros:** Shared system, update once applies everywhere
**Cons:** Requires symlink knowledge

---

## Size Estimates

**System files only:** ~100 KB
- SHORTCUTS.md: ~18 KB
- SESSION-CHECKLIST.md: ~10 KB
- CLAUDE.md section: ~5 KB

**Per session:**
- Transcript: 30-60 KB (detailed)
- Session notes: 10-20 KB (summary)
- Checkpoint: 5-10 KB (lightweight)
- **Total per session:** 40-80 KB

**After 100 sessions:** 4-8 MB
**After 500 sessions:** 20-40 MB
**After 1000 sessions:** 40-80 MB

**Recommendation:** Archive sessions older than 3-6 months.

---

## Permission Considerations

**All files should be:**
- Readable/writable by user: `rw-r--r--` (644)
- Directories executable: `rwxr-xr-x` (755)

**Standard permissions (no special requirements):**
```bash
chmod 644 GeneratedMDs/SHORTCUTS.md
chmod 755 GeneratedMDs/transcripts/
```

---

## Summary

The Q-Command System file structure is:

✅ **Clean** - System files separated from generated files
✅ **Organized** - Subdirectories by file type
✅ **Scalable** - Works from 1 to 1000+ sessions
✅ **Filterable** - Easy to find by person or date
✅ **Sortable** - Natural chronological ordering
✅ **Archivable** - Easy to compress and store old sessions
✅ **Multi-user** - No collisions or conflicts

**Next:** See [naming-conventions.md](naming-conventions.md) for file naming details.
