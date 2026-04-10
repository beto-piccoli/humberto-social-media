# Content Workflows
_Owner: Gary V_
_Last updated: 2026-04-10_

---

## Overview

There are three main workflows in the social media system:

1. **New content from scratch** — a brief leads to a draft leads to a published post
2. **Repurposed content** — existing material gets extracted and reshaped
3. **Campaign content** — a coordinated batch of posts for a specific objective

All workflows converge at the same approval gate and publishing process.

---

## Workflow 1: New content from scratch

```
Humberto (idea or instruction)
    ↓
Gary V (routes, creates task)
    ↓
Nico (writes content brief → saves to 03_Content/drafts/ or a brief file)
    ↓
Maya (writes draft using create_post_from_brief skill)
    ↓ [file: 03_Content/drafts/YYYY-MM-DD_slug.md, status: draft]
Rosa (voice review using review_for_voice skill)
    ↓ [pass: file → 03_Content/review/, status: review]
    ↓ [fail: file stays in drafts/, Maya notified, revise]
Gary V (approval decision)
    ↓ [approved: file → 03_Content/approved/, status: approved]
    ↓ [rejected: returned with notes, back to Maya or Nico]
Humberto (approval for first-of-type, third-party content, or campaign launches)
    ↓ [approved by Humberto: confirmed]
Omar (publishing prep using pre-publishing checklist)
    ↓ [file → 03_Content/scheduled/, status: scheduled, publish_date set]
[Post goes live]
    ↓
Lina (logs publishing event, status → published)
    ↓
Eva (7-day metrics check → performance_metrics, status → analyzed)
    ↓
Lina (archives: file → 03_Content/archived/, status → archived)
```

**Typical timeline:** 1–3 days for simple posts. Campaign content may be planned 1–2 weeks ahead.

---

## Workflow 2: Repurposed content

```
Teo (identifies repurposing opportunity)
    ↓
Gary V (confirms: worth doing, routes)
    ↓
Teo (creates repurposed draft using repurpose_long_form_content skill)
    ↓ [file: 03_Content/drafts/, status: draft, source_content referenced]
[Continues from Rosa's voice review step — same as Workflow 1]
```

---

## Workflow 3: Campaign content

```
Gary V or Humberto (campaign objective identified)
    ↓
Nico (builds campaign plan using build_campaign_plan skill)
    ↓ [campaign file: 05_Campaigns/campaign-slug.md]
    ↓ [DB: campaigns + content_items created (status: idea)]
Gary V + Humberto (campaign plan reviewed and approved)
    ↓
Nico (writes briefs for all posts in the campaign)
    ↓
Maya (drafts all posts)
    ↓
[Each post follows Workflow 1 from Rosa's review step onward]
Omar (schedules the full campaign as a batch, maintaining cadence)
```

---

## Weekly rhythm

| Day | Activity |
|-----|---------|
| Sunday/Monday | Gary V + Nico build weekly queue (build_weekly_content_queue skill) |
| Monday | Omar prepares publishing packages for the week |
| Throughout week | Posts go live per schedule |
| Friday | Gary V reviews queue health — is next week covered? |
| First of month | Eva delivers monthly performance report |

---

## Status: what each stage means

| Status | Meaning | File location |
|--------|---------|---------------|
| `idea` | Raw concept, no draft yet | `02_Ideas/` or DB only |
| `draft` | Copy written, not yet reviewed | `03_Content/drafts/` |
| `review` | Passed Rosa's voice review | `03_Content/review/` |
| `approved` | Gary V (and Humberto if needed) approved | `03_Content/approved/` |
| `scheduled` | Publishing package ready, date set | `03_Content/scheduled/` |
| `published` | Confirmed live | `03_Content/published/` |
| `analyzed` | 7-day metrics logged | `03_Content/analyzed/` |
| `archived` | Cycle complete | `03_Content/archived/` |

---

## Who does what (quick reference)

| Action | Agent |
|--------|-------|
| Receive instruction from Humberto | Gary V |
| Write brief | Nico |
| Write copy | Maya |
| Voice review | Rosa |
| Approve | Gary V (routine) / Humberto (significant) |
| Repurpose content | Teo |
| Log and maintain DB | Lina |
| Prepare publishing | Omar |
| Analyze performance | Eva |
| Scout opportunities | Sol |
