# Operational Guide — How to Use Your Social Media System
_Written for: Humberto_
_Owner: Gary V_
_Last updated: 2026-04-10_

---

## What this system does

It handles your social media operation so you don't have to manage it piece by piece. You give direction, review content, and approve posts. The team handles the rest.

You are not expected to know how to run every agent or use every file. That's Gary V's job.

---

## How to give instructions

**Just tell Gary V what's happening in your career.**

Examples of good instructions:

> "I have a gig at The Ship on April 25 with the trio. We're playing a mix of Jobim and Wayne Shorter. No cover."

> "I want to start running a lesson enrollment push for spring. Spots are available starting May 1."

> "I noticed something interesting in rehearsal this week — the way the bass and melody lock up in this choro arrangement. Worth posting about."

> "My student finally nailed a clean turnaround in G minor. Can we post something about that?"

You don't need to specify which agent handles it, which file to update, or what the post should say. That's the team's job.

**What to include when you give an instruction:**
- The fact (what happened, what's available, what you're thinking)
- Any specific details that need to be accurate (dates, venues, names with permission)
- Any preference about tone or approach if you have one

---

## How agents collaborate

Here's the flow, in plain terms:

1. You tell Gary V what you need
2. Gary V routes the work to the right agent (usually Nico to build a brief, then Maya to write the post)
3. Rosa checks that it sounds like you
4. Gary V approves it (or sends it to you if it needs your eyes)
5. Omar prepares it for publishing
6. After it's live, Lina logs it, Eva checks the numbers later

Most of this happens without you needing to know which step it's at. Gary V keeps the queue moving.

---

## How new content enters the system

There are three ways:

**1. You tell Gary V directly**
Most common. Just share what's happening. Gary V kicks off the process.

**2. Ideas land in `02_Ideas/`**
Gary V, Nico, Sol, or any agent can drop raw ideas there. These don't move forward until Gary V reviews them and decides whether to brief them.

**3. Repurposing (handled by Teo)**
Teo periodically looks at published content and finds new angles from it. These also need Gary V's routing before they move forward.

---

## How approval works

**Routine posts:** Gary V approves most standard posts (teaching insights, gig announcements, process content). You don't need to review every post.

**You need to approve when:**
- The post mentions someone by name (musician, organization, business)
- The post is the first post of a new campaign
- The post involves an offer (price, enrollment, new service)
- The post involves something sensitive or personal
- Anything Gary V flags as "please review"

When Gary V escalates to you, he'll give you:
- The post to read
- One specific question (approve as-is / change X / other preference)

You answer, it moves forward. No lengthy back-and-forth unless needed.

**How to approve:** Tell Gary V "approved" (or make a specific change request). That's it.

---

## How publishing prep works

Once you approve a post (or Gary V approves a routine one), Omar:
1. Attaches the right image
2. Sets the scheduled date and time
3. Runs the pre-publishing checklist
4. Prepares the complete publishing package

If you're posting manually: Omar will have the post copy ready, the image attached, the date set, and a note on whether to put any links in the first comment. You post it exactly as prepared.

If the Meta API is connected in the future: Omar submits it directly and it posts automatically at the scheduled time.

---

## How analytics review works

After each post has been live for 7 days, Eva logs the performance numbers. Once a month, she sends Gary V a brief report.

You don't need to log anything manually. If Facebook Insights shows you something interesting, pass the numbers to Eva.

What you'll get from Eva:
- What's working (which pillars and content types get the most engagement)
- What's not working
- 2–3 specific adjustments for the next month

You can act on these or ignore them — Gary V will implement whatever you decide.

---

## Checking the system yourself

If you want to look at what's in the pipeline:

**Content queue (upcoming posts):**
```sql
SELECT slug, title, status, pillar, publish_date FROM v_content_queue;
```
Run in SQLite against `00_System/social_media.db`.

Or just browse `03_Content/` folders:
- `approved/` — approved, ready to be scheduled
- `scheduled/` — scheduled and ready to post
- `drafts/` — in progress

**Campaign plans:** `05_Campaigns/`

**Content ideas:** `02_Ideas/`

**All strategy docs:** `01_Strategy/`

---

## What Gary V will NOT do without asking you

- Post about anyone by name
- Change an offer or pricing
- Start a new campaign type not already in the plans
- Post anything that involves grant-related positioning (coordinate with Rio)
- Post anything that involves the PhD or academic work (Meghan's domain — off limits entirely)

---

## The International Jazz Day note (urgent)

April 30 is International Jazz Day. There's an idea file in `02_Ideas/` for it. Gary V needs your input on what angle to take before April 27 so Maya can write it in time. Tell Gary V one specific thing about jazz that's on your mind lately — that's the material.

---

## The one thing to know

The system is built to stay out of your way except when it needs you. Gary V will only come to you when there's a real decision to make. When he does, it'll be short and specific. Your job is to keep making music — the system documents and promotes it.

---

_Questions? Tell Gary V. He'll know or find out._
