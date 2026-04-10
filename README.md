# Social Media System — Humberto Ramos
_Managed by: Gary V (Social Media Director)_
_Created: 2026-04-10_
_Status: Active_

---

## What this system is

A structured social media operation for Humberto's music career. It handles content strategy, copywriting, scheduling prep, and analytics across Facebook (primary), with a clear path to Instagram, X, and YouTube.

It is designed to stay in your control. You inspect everything in Markdown. You approve everything before it moves forward.

---

## Where things live

| Folder | Purpose |
|--------|---------|
| `00_System/` | Database, schema, naming rules, system config |
| `01_Strategy/` | Brand, voice, content pillars, audience, platform rules |
| `02_Ideas/` | Raw ideas — unshaped, unfiltered |
| `03_Content/` | All content at every workflow stage |
| `04_Assets/` | Photos, graphics, audio, links to press kit |
| `05_Campaigns/` | Campaign plans and briefs |
| `06_Analytics/` | Performance reports and experiment results |
| `07_Agents/` | Agent definitions and handoff rules |
| `08_Skills/` | Reusable skill documents |
| `09_Logs/` | Action logs, daily records |

---

## Core files

| File | What it contains |
|------|-----------------|
| `01_Strategy/brand_profile.md` | Who Humberto is, how to describe his work |
| `01_Strategy/voice_rules.md` | How to write like Humberto, what to avoid |
| `01_Strategy/offers.md` | Services, pricing, and how to present them |
| `01_Strategy/audience_profiles.md` | Who we are talking to |
| `01_Strategy/content_pillars.md` | The 9 recurring themes for content |
| `01_Strategy/platform_rules.md` | Platform-specific formatting and behavior |
| `01_Strategy/publishing_rules.md` | Timing, frequency, queue rules |
| `07_Agents/agent_roster.md` | All agents, roles, and responsibilities |
| `07_Agents/workflows.md` | Step-by-step content workflow |
| `07_Agents/handoff_rules.md` | When and how agents hand off work |
| `07_Agents/escalation_rules.md` | When to escalate to Humberto |
| `00_System/naming_conventions.md` | File and slug naming rules |
| `00_System/schema.sql` | SQLite database schema |

---

## Quick start: how to use this system

1. Tell Gary V what you want to post about or what's happening in your music career
2. Gary V routes the request to the right agent
3. Content is drafted, reviewed for voice, approved by you, then prepared for publishing
4. After publishing, metrics are logged and analyzed

For full instructions, read `07_Agents/operational_guide.md`.

---

## Database

Location: `00_System/social_media.db`
Apply schema: `sqlite3 social_media.db < 00_System/schema.sql`
Tables: campaigns, content_items, content_versions, assets, performance_metrics, experiments, tasks

---

## Platforms

| Platform | Status |
|----------|--------|
| Facebook | **Active — primary** |
| Instagram | Planned — next after Facebook workflow is stable |
| X (Twitter) | Planned |
| YouTube | Planned |

---

## Meta API integration (future)

The system is designed to connect to the Meta Graph API later. When ready:
- `content_items.status = 'approved'` items can be passed to the API for scheduling
- `content_items.platform` and `publish_date` map directly to Meta's post scheduling parameters
- `performance_metrics` will be populated from the API instead of manually

---

_Assumptions documented in each file. No silent design decisions._
