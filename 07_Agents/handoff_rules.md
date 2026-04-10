# Handoff Rules
_Owner: Gary V_
_Last updated: 2026-04-10_

---

## Purpose

These rules define exactly when an agent finishes their part and what they hand off to the next agent. Following these prevents gaps and prevents agents from doing each other's work.

---

## Handoff matrix

| From | To | Condition | What is handed off |
|------|----|-----------|--------------------|
| Humberto | Gary V | Any instruction or request | Instruction as received |
| Gary V | Nico | New content needed | Routing + objective/context notes |
| Nico | Maya | Brief is complete and reviewed by Gary V | Complete content brief |
| Maya | Rosa | Draft is complete and self-reviewed | Content file in `03_Content/drafts/` |
| Rosa | Maya | Draft failed voice review | Content file with inline review notes + task in DB |
| Rosa | Gary V | Draft passed voice review | Content file moved to `03_Content/review/` + status updated |
| Gary V | Humberto | Escalation required | Clear summary: what is the post, what is the question |
| Gary V | Omar | Post is approved | Content file in `03_Content/approved/` + DB status = approved |
| Omar | Lina | Post is published (confirmed live) | Publishing confirmation with timestamp |
| Omar | Gary V | Queue gap identified or scheduling conflict | Queue report |
| Lina | Eva | Post is in `published` status for 7 days | Notification for metrics check |
| Eva | Gary V | Monthly report or significant finding | Report in `06_Analytics/` |
| Teo | Rosa | Repurposed draft complete | Content file in `03_Content/drafts/` (same path as Maya's drafts) |
| Sol | Gary V | Opportunity flagged | Entry in `02_Ideas/opportunity_log.md` + summary note |
| Sol → Nico | (via Gary V) | Opportunity approved for content | Brief request routed by Gary V |

---

## Handoff quality rules

1. **Never hand off incomplete work.** If a brief is missing fields, don't hand it to Maya. If a draft has known issues, don't hand it to Rosa without noting them.

2. **Always update the DB before handing off.** Status changes happen in the DB, not just in the file. If you move a file without updating the DB, it's a system error.

3. **Use the task system for explicit handoffs.** When routing work to another agent, create a task in `social_media.db → tasks` with `assigned_to` = receiving agent and `related_content` = the content item ID.

4. **Don't skip agents in the chain.** Maya does not hand directly to Omar. Rosa does not approve. Gary V does not write copy. The chain exists for quality reasons.

5. **Escalation is not a failure.** Passing something to Humberto for a decision is the right call in many situations — not a sign that the system is broken.

---

## Content file location rules

The file's folder is always the source of truth for its current stage. If the DB and the folder disagree, Lina reconciles — but the standard is: **file location must match DB status at all times.**

| DB Status | Folder |
|-----------|--------|
| idea | DB only (or `02_Ideas/`) |
| draft | `03_Content/drafts/` |
| review | `03_Content/review/` |
| approved | `03_Content/approved/` |
| scheduled | `03_Content/scheduled/` |
| published | `03_Content/published/` |
| analyzed | `03_Content/analyzed/` |
| archived | `03_Content/archived/` |

---

## When a handoff fails

If an agent receives incomplete or incorrect work:
1. Do not attempt to work around it — return it with a specific note
2. Create a task in the DB for the previous agent noting the issue
3. Update the content item status to reflect the correct stage
4. Notify Gary V if the issue blocks the queue
