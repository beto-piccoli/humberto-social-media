# Skill: move_content_through_workflow
_Owner: Gary V / Lina_
_Last updated: 2026-04-10_

---

## Purpose

Move a content item from one workflow stage to the next, updating both the Markdown file and the database to stay in sync. This skill is the handoff mechanism for the entire pipeline.

---

## When to use

Any time a content item needs to change status. Every status transition should go through this process.

---

## Required inputs

- Content item slug or file path
- Current status (confirmed — check the DB, not just the file)
- Target status
- Agent performing the transition
- Reason (brief — logged in action_log)

---

## Workflow stages and allowed transitions

```
idea → draft          (Nico/Maya: brief exists, drafting begins)
draft → review        (Maya: draft complete, sent to Rosa)
review → draft        (Rosa: failed voice check, returned to Maya)
review → approved     (Gary V: voice check passed, Gary V approves)
approved → scheduled  (Omar: publishing package complete, date set)
scheduled → published (Omar/Lina: confirmed live)
published → analyzed  (Eva: metrics logged)
analyzed → archived   (Lina: content cycle complete)

Any status → archived (Gary V or Humberto: explicit decision to retire content)
```

---

## Process

1. **Verify current status** in `content_items` table. Do not proceed if the DB status doesn't match the expected state — investigate the discrepancy first.

2. **Perform the transition work** relevant to the target status:

   | Target status | Work required |
   |--------------|--------------|
   | `draft` | Brief exists; create draft file in `03_Content/drafts/`; insert `content_versions` row |
   | `review` | Move file to `03_Content/review/`; Rosa notified |
   | `approved` | Gary V has reviewed; set `approved_by`; move file to `03_Content/approved/` |
   | `scheduled` | Omar checklist complete; `publish_date` set; move to `03_Content/scheduled/` |
   | `published` | Confirmed live; set `published_at`; move to `03_Content/published/` |
   | `analyzed` | Eva has logged metrics; move to `03_Content/analyzed/` |
   | `archived` | Move to `03_Content/archived/`; reason logged |

3. **Update the database:**
   ```sql
   UPDATE content_items
   SET status = '[new_status]',
       updated_at = datetime('now')
   WHERE slug = '[slug]';
   ```
   Add additional field updates as required by target status (published_at, approved_by, etc.)

4. **Move the file** to the correct subfolder of `03_Content/`.
   - File naming stays the same — only the folder changes.

5. **Log the action** in `09_Logs/action_log.md`:
   ```
   | [timestamp] | status: [old] → [new] | [agent] | [slug] | [reason] |
   ```

---

## Output

- Updated DB record
- File in correct folder
- Action log entry

---

## Validation checklist

- [ ] DB status confirmed before transition
- [ ] Required work for target status is complete
- [ ] File moved to correct folder
- [ ] DB updated
- [ ] Log entry written
- [ ] No file left in the wrong folder after transition

---

## Failure cases

| Situation | Action |
|-----------|--------|
| File is in wrong folder for its DB status | Reconcile — move file to match DB. Log the discrepancy. |
| DB status doesn't match expected (something is already past this stage) | Investigate before changing anything. Flag to Gary V. |
| File is missing but DB record exists | Flag to Lina for recovery. Do not update status. |
| DB record is missing but file exists | Lina creates the DB record. Check if content_versions also missing. |
| Trying to publish without a `publish_date` | Block. Omar must set date before status change. |
