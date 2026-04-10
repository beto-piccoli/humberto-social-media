# Skill: repurpose_long_form_content
_Owner: Teo_
_Last updated: 2026-04-10_

---

## Purpose

Extract new content from existing published posts, teaching notes, gig recaps, or other source material. Get more from what already exists without diluting the original.

---

## When to use

When:
- A published post has ideas that could become their own standalone posts
- Humberto has written something longer (a teaching note, a reflection) that has multiple good angles
- The queue is short and new briefs aren't ready yet
- A post performed well and a variation or follow-up is worth making
- Content exists for one platform and needs adapting for another

Do NOT use when:
- The source content is less than 7 days old (too soon — let it breathe)
- The source content was already repurposed and the derivative hasn't gone through the full cycle

---

## Required inputs

- Source content file or slug
- Source content text (full)
- `01_Strategy/voice_rules.md`
- Platform and content type target for the repurposed piece

---

## Process

1. **Read the source content fully.** Identify all the ideas, moments, and specific details embedded in it.

2. **List extraction candidates.** What could stand alone?
   - A specific concept explained briefly
   - A teaching insight that's buried in a longer post
   - A moment from a gig recap that could be a standalone reflection
   - A question implied by the original post
   - A different audience angle on the same material

3. **Select one candidate per repurpose session.** Don't try to extract everything at once.

4. **Determine the repurpose type:**
   - `short-from-long` — a shorter post extracting one idea
   - `platform-adapt` — same concept, different platform format
   - `format-adapt` — same platform, different format (post → story)
   - `extract-quote` — a notable line becomes its own post (as a quote card or text post)
   - `angle-shift` — same event, different angle (gig recap → teaching insight from that gig)

5. **Write the repurposed piece.** Rules:
   - It must stand alone — don't require the original to make sense
   - Keep at least one specific detail from the source (don't strip it into pure generality)
   - Adapt the format for the target platform (shorter for Instagram, etc.)
   - Do not reuse the same hook/opening line as the source

6. **Create the content file** using Teo's format (see `agent_teo.md`)
   - Reference the source slug in `source_content` frontmatter
   - Mark `repurpose_type`

7. **Move file to `03_Content/drafts/`**

8. **Log in `09_Logs/repurposing_log.md`**

9. **Update DB:** INSERT content_items, link to source via notes field

---

## Output format

Teo's content file format (see `agent_teo.md` for full template). File in `03_Content/drafts/`.

---

## Validation checklist

- [ ] Source content is at least 7 days old
- [ ] Selected extraction candidate can stand alone
- [ ] Repurposed piece has at least one specific detail
- [ ] Does not duplicate the source post's opening
- [ ] Platform format adjustments made
- [ ] Source slug referenced in file
- [ ] Repurposing log updated
- [ ] DB entry created

---

## Failure cases

| Situation | Action |
|-----------|--------|
| Source content has no extractable ideas beyond what was already said | Don't force it. Log as "no repurposing potential" in the opportunity log. |
| Source content is a one-off (a specific dated event) | Strip the date-specific elements. If what's left is still meaningful, proceed. If not, skip. |
| Repurposed piece ends up nearly identical to the original | Discard. Either find a genuinely different angle or skip this source. |
| Source content has third-party references (named musicians, students) | Remove or anonymize the reference before repurposing, same as the original rule. |
