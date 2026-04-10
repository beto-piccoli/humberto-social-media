# Publishing Rules
_Owner: Omar (Publishing Operator) / Gary V_
_Last updated: 2026-04-10_

---

## Frequency guidelines

### Facebook (current target)
| Phase | Target frequency | Notes |
|-------|-----------------|-------|
| Launch / warm-up (first 8 weeks) | 3x per week | Build rhythm before optimizing |
| Steady state | 3–4x per week | Adjust based on content availability and Eva's data |
| Active campaign weeks | Up to 5x per week | If a gig or program enrollment is open |
| Minimum floor | 1x per week | Even quiet weeks need a presence |

**Never:**
- Post more than twice in one day
- Post 7 days in a row (signals spam to algorithms and burnout to audience)
- Go more than 10 days without posting during active periods

---

## Queue management

The weekly queue is managed by Gary V with input from Nico and Maya. The queue lives in the database (`v_content_queue` view) and in `01_Strategy/weekly_queue.md`.

### Queue rules
1. Queue should always have at least 3 approved posts ready at any time
2. No post goes into the queue without `status = 'approved'`
3. If the queue drops below 3, Gary V triggers Maya to draft or Nico to brief new content
4. Evergreen content (non-dated teaching posts, reflections) should make up at least 30% of the queue to absorb unexpected gaps

---

## Content mix target

Per 10 posts, aim for approximately:
| Type | Count | Pillar examples |
|------|-------|----------------|
| Teaching / educational | 3 | Jazz education, guitar teaching, Brazilian music |
| Performance / gig | 2 | Live performance, local scene |
| Personal / artist identity | 2 | Behind the scenes, reflections |
| Community / local scene | 1 | Jazz East, local music |
| Offer / CTA | 1 | Lessons, programs |
| Student result / social proof | 1 | Anonymized student wins |

This is a guideline, not a quota. If you have 3 gigs in a week, post about them.

---

## Posting time guidelines (Facebook)

Based on general best practices for musician/educator audiences. Update after 60 days of data.

| Day | Recommended windows (NST) |
|-----|--------------------------|
| Tuesday | 9:00–11:00 AM or 6:00–8:00 PM |
| Wednesday | 9:00–11:00 AM or 6:00–8:00 PM |
| Thursday | 9:00–11:00 AM or 6:00–8:00 PM |
| Friday | 12:00–2:00 PM (pre-weekend) |
| Saturday | 10:00 AM–12:00 PM |

Avoid: Monday mornings, Sunday evenings, after 9pm any day.

---

## Approval gate

**No post goes live without approval.**

The approval gate is Gary V → Humberto (for anything that changes an offer, involves third parties, or is a new campaign first post) or Gary V only (for routine queue posts once voice is established).

See `07_Agents/workflows.md` for the full approval flow.

---

## Pre-publishing checklist (Omar runs this)

Before any content moves to `status = 'scheduled'`:

- [ ] Status is `approved` in the database
- [ ] Image attached (if required)
- [ ] No external link in post body (move to first comment)
- [ ] Hashtags present and correct
- [ ] CTA is clear and actionable (if post has a CTA)
- [ ] Date and time confirmed in `publish_date` field
- [ ] No duplicate content in the last 14 days
- [ ] Voice check passed (Rosa sign-off recorded in file)

---

## Post-publishing log

After each post goes live, Lina logs:
- `content_items.status` → `published`
- `content_items.published_at` → actual timestamp
- Entry in `09_Logs/publishing_log.md`

After 7 days, Eva reviews metrics and logs `performance_metrics`.

---

_Frequency and timing targets should be reviewed and updated by Eva every 30 days using actual engagement data._
