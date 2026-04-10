# Skill: build_weekly_content_queue
_Owner: Gary V / Nico_
_Last updated: 2026-04-10_

---

## Purpose

Build a concrete publishing schedule for the coming week. Select which approved posts go live on which day, fill gaps with evergreen content, and ensure the week has a sensible content mix.

---

## When to use

Every week, typically on Sunday or Monday. Gary V runs this with input from Nico.

---

## Required inputs

- `v_content_queue` view (all approved and scheduled content)
- `01_Strategy/publishing_rules.md` (frequency, mix targets, timing)
- `01_Strategy/content_pillars.md` (for mix balance)
- Humberto's schedule for the week (via Rio or `_Music_Dashboard.md`)
- Any active campaigns (check `campaigns` table for `status = 'active'`)

---

## Process

1. **Check the queue.** Run:
   ```sql
   SELECT * FROM v_content_queue WHERE status = 'approved' ORDER BY created_at;
   ```
   How many approved posts are available?

2. **Check the week's calendar.**
   - Are there gigs this week? If yes, a gig post is priority — schedule it for the day before or day of.
   - Are there active campaigns with time-sensitive posts? Schedule those first.
   - Any program enrollment deadlines?

3. **Target the week's post count.** Per `publishing_rules.md`:
   - Normal week: 3–4 posts
   - Active campaign week: up to 5
   - Minimum: 1

4. **Select and slot posts.**
   - Time-sensitive (gig, enrollment deadline) → priority slots
   - Campaign posts → follow campaign cadence
   - Fill remaining slots with approved evergreen content
   - Check that no two posts in the same day are scheduled
   - Check the content mix: aim for balance across pillars

5. **Fill gaps.** If there aren't enough approved posts:
   - Gary V asks Nico to brief 1–2 new posts
   - Teo checks if any repurposing is available
   - Gary V can pull from evergreen stock in `03_Content/approved/`

6. **Set `publish_date` fields** in the DB for each selected post:
   ```sql
   UPDATE content_items SET publish_date = 'YYYY-MM-DD', status = 'scheduled', updated_at = datetime('now') WHERE slug = '...';
   ```

7. **Create the weekly queue file:**
   - Save to `01_Strategy/weekly_queue.md` (overwrite previous week's)

8. **Notify Omar** to prepare publishing packages for all scheduled posts.

---

## Weekly queue file format

```markdown
# Weekly Content Queue — Week of [YYYY-MM-DD]
_Built by: Gary V / Nico_
_Last updated: YYYY-MM-DD_

## This week's schedule

| Date | Day | Slug | Pillar | Platform | CTA | Notes |
|------|-----|------|--------|----------|-----|-------|
| YYYY-MM-DD | Mon | | | | | |
| YYYY-MM-DD | Tue | | | | | |
| YYYY-MM-DD | Wed | | | | | |
| YYYY-MM-DD | Thu | | | | | |
| YYYY-MM-DD | Fri | | | | | |

## Queue health
- Approved posts available: N
- Posts this week: N
- Pillars covered: [list]
- Evergreen buffer: N posts remaining after this week

## Gaps / flags
- [Any gaps or flags for Gary V or Humberto]
```

---

## Validation checklist

- [ ] No two posts on the same day
- [ ] Time-sensitive posts scheduled at correct time
- [ ] Content mix covers at least 3 different pillars
- [ ] At least 30% of weekly posts are evergreen (non-time-sensitive)
- [ ] `publish_date` set in DB for all selected posts
- [ ] Omar notified
- [ ] Weekly queue file saved

---

## Failure cases

| Situation | Action |
|-----------|--------|
| Not enough approved content to fill the week | Brief Maya for 1–2 new posts; check Teo's repurposing availability; lower the week's count to minimum floor |
| All available posts are from the same pillar | Delay some; ask Nico to brief content from a different pillar before scheduling |
| Gig happening but no gig post exists | Urgent: brief Maya immediately with gig details |
| Humberto's schedule is unavailable | Proceed with non-time-sensitive evergreen content; flag to Gary V |
