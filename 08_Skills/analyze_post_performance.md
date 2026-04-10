# Skill: analyze_post_performance
_Owner: Eva_
_Last updated: 2026-04-10_

---

## Purpose

Log performance metrics for a published post and extract a useful insight from the data. Not just recording numbers — identifying what the numbers mean for future content decisions.

---

## When to use

- 7 days after a post is published (first metrics check)
- 30 days after a post is published (second check, for longer-tail content)
- At end-of-month reporting cycle
- When Gary V or Humberto requests a post-specific performance review

---

## Required inputs

- Content item slug and `content_items.id`
- Raw metrics from Facebook Insights (or Meta API response when connected):
  - Reach
  - Impressions
  - Likes / reactions
  - Comments
  - Shares
  - Saves
  - Clicks (if available)
  - Video views (if video content)
- Post publish date and content type for context

---

## Process

1. **Pull the content item** from the DB (`SELECT * FROM content_items WHERE slug = '...'`)

2. **Record the metrics.** INSERT a row into `performance_metrics`:
   ```sql
   INSERT INTO performance_metrics
   (content_item_id, platform, measured_at, reach, impressions, likes,
    comments, shares, saves, clicks, engagement_rate, notes)
   VALUES (?, 'facebook', datetime('now'), ?, ?, ?, ?, ?, ?, ?, ?, ?);
   ```
   Calculate `engagement_rate`:
   ```
   engagement_rate = (likes + comments + shares) / reach
   ```
   If reach = 0, set engagement_rate = 0 and note the data issue.

3. **Compare to baseline.** What is the average reach and engagement rate for posts of the same pillar and content type? (Query `performance_metrics` joined to `content_items` for comparison.)

4. **Identify the insight.** Answer one question: what does this post tell us about what works or doesn't?
   - Was it above/below average for its pillar?
   - Did a specific element (image type, post length, CTA type, posting time) seem to correlate?
   - Any anomalies worth noting?

5. **Update content status** if this is the 30-day check and content has been analyzed:
   - UPDATE `content_items.status` → `analyzed`

6. **Log in monthly report** or note in `06_Analytics/` if standalone.

---

## Output format

Database row in `performance_metrics` plus a brief insight note:

```markdown
## Post performance note — [slug] — [YYYY-MM-DD]

**Post:** [title]
**Published:** [date]
**Pillar:** [pillar]
**Platform:** Facebook
**Check:** [7-day / 30-day]

**Metrics:**
- Reach: N
- Likes: N | Comments: N | Shares: N
- Engagement rate: N%

**Comparison to pillar average:**
- Reach: [above/below/at] average by N%
- Engagement: [above/below/at] average by N%

**Insight:**
[One or two sentences. What does this tell us?]

**Recommended action:**
[None / Make more of this / Adjust X / Experiment with Y]
```

---

## Validation checklist

- [ ] DB row inserted for this check interval
- [ ] Engagement rate calculated correctly
- [ ] Compared to same-pillar baseline (if baseline data exists)
- [ ] Insight is specific, not generic
- [ ] Recommended action is actionable
- [ ] Status updated if 30-day check

---

## Failure cases

| Situation | Action |
|-----------|--------|
| Facebook Insights data is unavailable | Note the gap. Do not insert zeroes as real data. Mark as "data pending." |
| Reach is 0 (possible API or privacy issue) | Flag to Gary V. Do not calculate engagement rate from 0. |
| Post was deleted before metrics were captured | Log as "deleted before measurement" in notes. Archive the content item. |
| Baseline data doesn't exist yet (not enough posts) | Skip comparison. Note "insufficient baseline." |
