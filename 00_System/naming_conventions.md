# Naming Conventions
_Owner: Lina / Gary V_
_Last updated: 2026-04-10_

---

## Purpose

Clear naming keeps files sortable, searchable, and readable years from now. These rules apply to all content files, assets, logs, campaigns, and database slugs.

---

## Content file names

**Pattern:** `YYYY-MM-DD_short-description.md`

**Rules:**
- Use the intended publish date (not the creation date) when known; use creation date otherwise
- Short description: 3–5 words, lowercase, hyphens (no spaces, no underscores)
- Keep it readable at a glance: `2026-04-15_gig-announce-the-ship.md` not `post_001.md`
- No special characters except hyphens

**Examples:**
```
2026-04-15_gig-the-ship-trio.md
2026-04-22_teaching-two-five-one.md
2026-05-01_lessons-now-enrolling.md
2026-04-28_jazz-combo-spring-update.md
2026-04-10_jobim-choro-reflection.md
```

---

## Database slugs

Same pattern as filenames, without the `.md` extension.

**Pattern:** `YYYY-MM-DD_short-description`

The slug in `content_items` must match the filename (minus extension).

---

## Campaign file names

**Pattern:** `[campaign-slug].md`

**Campaign slug pattern:** `[topic]-[season/year]` or `[topic]-[YYYY-MM]`

**Examples:**
```
local-gigs-spring-2026.md
guitar-lessons-fall-2026.md
personal-brand-2026.md
jazz-combo-enrollment-winter-2026.md
```

---

## Asset file names

**Pattern:** `[source]-[date]-[description].[ext]`

**Rules:**
- Source: shortened photographer/source name (no spaces)
- Date: YYYY-MM or YYYY
- Description: what's in the image (3–4 words, hyphens)
- Extension: lowercase

**Examples:**
```
ritche-2025-12-performance-stage.jpg
ritche-2025-12-guitar-closeup.jpg
self-2026-01-teaching-studio.jpg
```

---

## Log file names

Log files use month-based naming when monthly:

**Pattern:** `[log-type]_YYYY-MM.md` for monthly, or `[log-type].md` for rolling

**Examples:**
```
publishing_log.md          (rolling — append to this file)
action_log.md              (rolling — append)
repurposing_log.md         (rolling — append)
scout_log.md               (rolling — append)
db_audit_2026-04.md        (monthly — new file each month)
report_2026-04.md          (monthly — new file each month)
```

---

## Weekly queue file

Overwrites every week. Always one file:
```
01_Strategy/weekly_queue.md
```

---

## Rules summary

| What | Pattern | Example |
|------|---------|---------|
| Content file | `YYYY-MM-DD_description.md` | `2026-04-15_gig-the-ship.md` |
| DB slug | `YYYY-MM-DD_description` | `2026-04-15_gig-the-ship` |
| Campaign file | `topic-season-year.md` | `local-gigs-spring-2026.md` |
| Asset file | `source-date-description.ext` | `ritche-2025-12-portrait.jpg` |
| Monthly report | `report_YYYY-MM.md` | `report_2026-04.md` |
| Monthly audit | `db_audit_YYYY-MM.md` | `db_audit_2026-04.md` |
| Rolling log | `[type]_log.md` | `publishing_log.md` |

---

## What NOT to do

- No `post1.md`, `post2.md` — not readable, not sortable usefully
- No `[space in name]` — breaks terminal operations
- No `UPPERCASE` filenames — inconsistent, harder to search
- No version numbers in filenames (versions live in the DB, not filenames)
- No dates in the middle of a name: `gig_2026_the_ship.md` — put the date first
