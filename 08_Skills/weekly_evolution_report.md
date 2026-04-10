# Skill: weekly_evolution_report
_Owner: Gary V_
_Last updated: 2026-04-10_

---

## Purpose

Produce the weekly Evolution Report. Review everything that happened in the past week, extract what is worth knowing, and translate it into concrete improvements and priorities for the next week.

This is not a summary. It is a strategic review that improves the system over time.

---

## When to use

Every week. Gary V runs this on Sunday or Monday before building the weekly content queue. The report informs the queue, not the other way around.

---

## Required inputs

Before starting, collect:

- Eva's metrics summary (query `v_published_with_metrics` for posts published in the last 7 days)
- Sol's scout log entry for the week (`09_Logs/scout_log.md`)
- Nico's campaign status (query `campaigns` table, check active campaigns)
- Lina's DB audit notes if any (check `09_Logs/action_log.md` for the week)
- Open tasks from last week (`SELECT * FROM tasks WHERE status != 'done' AND due_date < date('now')`)
- Humberto's schedule for the coming week (from Rio / `_Music_Dashboard.md`)

---

## Process

### Section 1 — Performance Review

Pull all posts published in the past 7–30 days with metrics logged.

```sql
SELECT ci.slug, ci.title, ci.pillar, ci.content_type, ci.published_at,
       pm.reach, pm.likes, pm.comments, pm.shares, pm.engagement_rate
FROM content_items ci
JOIN performance_metrics pm ON pm.content_item_id = ci.id
WHERE ci.published_at >= date('now', '-30 days')
ORDER BY pm.engagement_rate DESC;
```

For each metric category, identify the top and bottom performers:
- Best/worst by reach
- Best/worst by engagement rate
- Best hooks (first line of the best-performing posts)
- Best CTAs (what was asked, what got clicked or replied to)
- Best topics (which pillars performed best this period)
- Best posting times (day of week and time of day correlation)
- Best post lengths (character count vs. engagement)
- Best media types (post with image vs. without, reel vs. static)

If data is insufficient for a category, note it explicitly: "Insufficient data — need N more posts in this pillar."

---

### Section 2 — Audience Review

Review comments, shares, and any direct messages or inquiries Humberto has flagged.

Answer these questions based on what is observable:
- What content prompted direct action (DMs, ticket clicks, lesson inquiries)?
- What content got comments vs. just likes (comments signal deeper engagement)?
- What content was shared vs. just liked?
- Are any audience questions or comments repeating (a FAQ emerging)?
- Which audience segment is most active (local music community, students, general)?
- What local events or seasonal moments are approaching in the next 4 weeks?

If Humberto hasn't flagged any DMs or inquiries this week, note it as a data gap and ask him during the next check-in.

---

### Section 3 — System Review

Review the operational health of the system itself.

Check each of the following:

| Area | Question |
|------|----------|
| Folders | Are all content files in the right folders matching their DB status? |
| Database | Any orphaned records, missing timestamps, or status inconsistencies? |
| Queue | Does the queue have at least 3 approved posts ready? |
| Agent load | Are any agents repeatedly overloaded or blocked? |
| Handoffs | Did any handoffs fail or get skipped this week? |
| Logs | Are publishing, repurposing, and action logs up to date? |
| Repetitive tasks | Did any task appear 3 or more times this week? (Candidate for a new skill.) |
| Skills | Are any existing skills being used incorrectly or producing poor results? |
| Workflows | Is any step in the content workflow causing consistent delays? |

---

### Section 4 — Experiment Review

Query the `experiments` table:

```sql
SELECT * FROM experiments WHERE status IN ('running', 'concluded') ORDER BY start_date DESC;
```

For running experiments: is there enough data to conclude? Is the variable being tested cleanly isolated?

For concluded experiments: what was the result? Is the conclusion documented? Has the learning been applied?

Identify what should be tested next based on the week's open questions.

---

### Section 5 — Improvement Actions

Based on Sections 1–4, identify concrete improvements. Every recommendation must cite the evidence that prompted it.

Categories to consider:
- Folder structure (if files are consistently ending up in the wrong place)
- Database schema (only if the current structure is genuinely blocking work)
- Agent roles (only if load is repeatedly uneven)
- Skills (create when a task has appeared 3+ times)
- Campaign strategy (if a campaign is underperforming against its objective)
- Posting cadence (if timing data shows a clear pattern)
- Voice rules (propose only — Humberto approves all changes)
- Publishing rules (adjust based on real performance data)
- Analytics tracking (add fields or views if patterns can't be measured with current schema)
- Naming conventions (only if inconsistencies are causing operational problems)
- Content pillars (adjust balance based on what is actually working)
- Offer positioning (if audience is not responding to CTAs as expected)

For each proposed change: state what it is, why (the evidence), and what the expected improvement is.

---

### Section 6 — Priority Recommendations

End every report with these six outputs. These are what Humberto actually reads.

**The 5 highest-leverage actions for next week**
Specific, assigned, with a clear reason. Not "post more." Something like: "Post the intermediate plateau idea (2026-04-28_intermediate-plateau.md) this Tuesday — it addresses the exact audience that inquires most."

**The 3 most important experiments to run**
Each with a hypothesis, a variable, and a success measure.

**The 3 biggest mistakes to avoid next week**
Based on the past week's failures or near-misses, not generic warnings.

**The 1 most important focus area for Humberto personally**
One thing only. The single highest-leverage action he could take that no agent can do for him.

---

## Output format

Save to: `06_Analytics/evolution_report_YYYY-WW.md`

```markdown
# Evolution Report — Week [WW], [YYYY]
_Prepared by: Gary V_
_Week of: [Monday date] to [Sunday date]_
_Generated: [date]_

---

## 1. Performance Review
[Data-driven summary. Specific posts named. No generic observations.]

## 2. Audience Review
[What people responded to. What they ignored. Patterns and gaps.]

## 3. System Review
[What is working, what is causing friction, what needs attention.]

## 4. Experiment Review
[Active experiments status. Concluded results. Next candidates.]

## 5. Improvement Actions
[Concrete proposals with evidence. Implementation status.]

## 6. Priority Recommendations

### 5 highest-leverage actions for next week
1.
2.
3.
4.
5.

### 3 most important experiments to run
1.
2.
3.

### 3 biggest mistakes to avoid
1.
2.
3.

### 1 most important focus area for Humberto
[One sentence. Specific. Actionable only by him.]

---

## Missing data
[What information would have made this report more useful. What to collect next week.]
```

---

## Validation checklist

Before finalizing the report:
- [ ] All six sections completed
- [ ] Every recommendation cites evidence (not opinion or assumption)
- [ ] No generic marketing advice
- [ ] Priority section is specific to Humberto's actual career and local market
- [ ] Missing data section completed honestly
- [ ] DB and logs updated with any actions taken
- [ ] Report saved to `06_Analytics/`

---

## Failure cases

| Situation | Action |
|-----------|--------|
| No performance data yet (early weeks) | Complete all other sections fully. Note the data gap explicitly. Priority recommendations based on strategy logic, not metrics. |
| Humberto hasn't flagged DMs or inquiries | Note as a gap. Ask once at the next check-in. Do not ask every week until it becomes friction. |
| Proposed system change is structural | Flag to Humberto before implementing. Log the proposal in the report. Do not self-authorize major changes. |
| Week had no published posts | Still run the report. Focus on system review, opportunities, and queue preparation. |
| Conflicting signals (one metric up, another down) | Report both. Do not cherry-pick. Propose an experiment to isolate the variable. |
