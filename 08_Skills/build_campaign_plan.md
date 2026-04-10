# Skill: build_campaign_plan
_Owner: Nico_
_Last updated: 2026-04-10_

---

## Purpose

Create a complete, actionable campaign plan for a focused initiative. A campaign is a time-bounded effort with a clear objective — promoting a gig, enrolling students, building awareness around a specific body of work.

---

## When to use

When:
- A specific goal has been identified that needs more than 1–2 posts
- A gig, program enrollment, or project needs a coordinated content push
- Gary V or Humberto requests a campaign for a specific topic or event

---

## Required inputs

- Campaign objective (what success looks like, specifically)
- Target audience (which profile from `audience_profiles.md`)
- Time window (start date, end date or milestone)
- Relevant offers or CTAs (`offers.md`)
- Any existing content, assets, or event details

---

## Process

1. **Define the campaign clearly:**
   - Objective: one sentence, measurable if possible
   - Success condition: what does "worked" look like?
   - Audience: which profile(s)
   - Platforms: Facebook primary; others if ready
   - Time window: start, peak activity, end

2. **Identify the message angles.** What are 3–5 different ways to talk about this topic across the campaign's duration?
   - Don't repeat the same angle twice
   - Cover different audience motivations (awareness, interest, decision)

3. **Map to content pillars.** Which pillars does this campaign use? Does it over-rely on one? Diversify if so.

4. **Define the CTA flow.** What action do you want from the audience at each stage?
   - Awareness posts: no explicit CTA or a soft one ("come out," "take a look")
   - Interest posts: engagement CTA ("what do you think?" or share-prompting)
   - Decision posts: direct ask ("message me to book," "tickets at [link]")

5. **Draft the post plan.** A list of N posts with:
   - Post number
   - Pillar
   - Message angle
   - CTA type
   - Format (post, event, reel, etc.)
   - Approximate date
   - Brief (one-line content direction for Maya)

6. **Write the campaign file** (see output format below) and save to `05_Campaigns/[campaign-slug].md`

7. **Create the campaign record** in `campaigns` table

8. **Create content_items** for each planned post (status: idea initially)

9. **Brief Maya** on the first 2–3 posts to begin drafts

---

## Output format

```markdown
# Campaign Plan: [Name]
_Slug: [campaign-slug]_
_Owner: Nico_
_Created: YYYY-MM-DD_
_Status: active_

## Objective
[One sentence]

## Success condition
[What does "worked" look like?]

## Audience
[Which profile(s) — reference audience_profiles.md]

## Platforms
[Facebook primary; others if applicable]

## Time window
- Start: YYYY-MM-DD
- Peak: YYYY-MM-DD
- End: YYYY-MM-DD

## Message angles
1. [angle 1]
2. [angle 2]
3. [angle 3]

## Content plan

| # | Pillar | Angle | Format | CTA type | Target date | Brief |
|---|--------|-------|--------|----------|-------------|-------|
| 1 | | | | | | |

## Assets needed
- [list any images, videos, links]

## CTA reference
- [exact language for the main CTA, per offers.md]

## Notes / assumptions
- [anything assumed that Humberto should know about]
```

---

## Validation checklist

- [ ] Objective is specific (not "raise awareness" — what action or measurable result?)
- [ ] At least 3 distinct message angles
- [ ] No two posts in a row with the same CTA type
- [ ] Each post in the plan has a brief
- [ ] DB campaign record created
- [ ] Content items created for all posts (status: idea)
- [ ] Assumptions documented

---

## Failure cases

| Situation | Action |
|-----------|--------|
| Objective is vague | Return to Gary V for clarification before building the plan |
| Time window is too short for the number of posts planned | Reduce posts or extend window — don't cram |
| Campaign overlaps heavily with another active campaign | Flag to Gary V — coordinate or delay |
| No assets available for image-heavy campaign | Note as risk in the plan; flag to Gary V to source images |
