# Skill: maintain_metadata_and_logs
_Owner: Lina_
_Last updated: 2026-04-10_

---

## Purpose

Keep the database records, file metadata, and log files accurate and consistent. Catch drift before it becomes a problem.

---

## When to use

- After any content status transition
- After publishing a post
- When adding new assets to `04_Assets/`
- During monthly consistency audit
- When directed by Gary V after a system change

---

## Required inputs

- The event that triggered this skill (what changed)
- The content item slug or asset filename affected
- The agent that performed the action

---

## Process

### A. Updating content item status (most common)

1. Confirm the new status is a valid transition (see `move_content_through_workflow.md`)
2. Run the SQL update:
   ```sql
   UPDATE content_items
   SET status = '[new_status]',
       updated_at = datetime('now'),
       [additional_field] = '[value]'  -- e.g. published_at, approved_by
   WHERE slug = '[slug]';
   ```
3. Verify with a SELECT that the update applied
4. Log to `09_Logs/action_log.md`

### B. Logging a publish event

1. INSERT performance_metrics skeleton row (with 0s — Eva will update)
2. Log to `09_Logs/publishing_log.md`:
   ```
   | [YYYY-MM-DD] | [slug] | facebook | [published_at timestamp] | [notes] |
   ```
3. Move file to `03_Content/published/`

### C. Adding a new asset

1. Copy the asset to `04_Assets/` with the correct filename (see naming conventions)
2. INSERT into `assets` table:
   ```sql
   INSERT INTO assets (filename, asset_type, description, file_path, source, tags, usable_for, rights_cleared)
   VALUES (?, ?, ?, ?, ?, ?, ?, ?);
   ```
3. Log to `09_Logs/action_log.md`

### D. Monthly consistency audit

1. Run a cross-check: every row in `content_items` should have a corresponding file in the correct folder
   ```sql
   SELECT slug, status, file_path FROM content_items ORDER BY status;
   ```
2. For each status, verify the file exists in the matching `03_Content/[status]/` folder
3. Flag any mismatches
4. Check for orphaned files (files with no matching DB record)
5. Verify `content_versions` has at least one row for each content item that's past `idea` status
6. Write audit report to `06_Analytics/db_audit_YYYY-MM.md`

---

## Log file formats

### `09_Logs/action_log.md`
```markdown
| Timestamp | Action | Agent | File / Record | Notes |
|-----------|--------|-------|---------------|-------|
| 2026-04-10 14:32 | status: draft → review | Rosa | 2026-04-15_gig-announce | Voice check passed |
```

### `09_Logs/publishing_log.md`
```markdown
| Date | Slug | Platform | Published at | Notes |
|------|------|----------|-------------|-------|
| 2026-04-15 | 2026-04-15_gig-announce | facebook | 2026-04-15 09:05 NST | |
```

---

## Output

- Updated DB records
- Log entries written
- Files in correct locations
- Monthly audit report (when applicable)

---

## Validation checklist

- [ ] SQL update verified with SELECT
- [ ] Log entry written (not just the DB update)
- [ ] File is in the correct folder for its status
- [ ] No orphaned records or files after the action

---

## Failure cases

| Situation | Action |
|-----------|--------|
| File is missing but DB record exists | Flag to Gary V. Do not mark as published/archived without the file. |
| DB has no record for an existing file | Create the record. Check if content_versions also missing. |
| Log file is missing | Create it with a header row, then add the entry. |
| Status in file frontmatter doesn't match DB | DB is authoritative. Update the file frontmatter to match. |
