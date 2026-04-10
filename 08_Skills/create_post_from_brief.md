# Skill: create_post_from_brief
_Owner: Maya_
_Last updated: 2026-04-10_

---

## Purpose

Turn a content brief from Nico into a finished draft post ready for Rosa's voice review. This is the primary content creation skill.

---

## When to use

When a content brief exists in the system and a draft needs to be written. Do not use this skill without a complete brief.

---

## Required inputs

- Complete content brief (from Nico — see `agent_nico.md` for brief format)
- `01_Strategy/voice_rules.md` (loaded and applied)
- `01_Strategy/brand_profile.md` (loaded for context)
- `01_Strategy/offers.md` (for CTA reference)
- Asset info (if image is specified in the brief)

---

## Process

1. **Read the brief fully.** Identify: core message, key details, CTA type, tone notes, platform, content type.

2. **Read voice_rules.md.** Pay particular attention to the banned phrases list before writing a single word.

3. **Draft the post.**
   - Lead with the most interesting specific detail — not a preamble
   - Include all key details specified in the brief
   - Use the CTA type from the brief — not a variant unless the brief allows flexibility
   - Stay within platform length guidelines
   - Use 0–2 hashtags in body if relevant, rest at the end

4. **Self-review against voice checklist:**
   - No banned phrases?
   - At least one specific detail?
   - Sounds like Humberto, not like a social media template?
   - Appropriate length?
   - CTA is single and clear?

5. **Create the content file** using the standard Maya format (see `agent_maya.md`)
   - Filename: `YYYY-MM-DD_slug.md` per naming conventions
   - Populate all frontmatter fields
   - Status: `draft`

6. **Move file to `03_Content/drafts/`**

7. **Update database:**
   - INSERT into `content_items` (status: draft)
   - INSERT into `content_versions` (version_number: 1)

8. **Notify Rosa** (via task in DB or Gary V routing) that draft is ready for review

---

## Output format

A Markdown file in `03_Content/drafts/` following Maya's content file format. See `agent_maya.md` for the exact template.

---

## Validation checklist

Before handing off to Rosa:
- [ ] Brief was read completely
- [ ] Core message is reflected in the post
- [ ] All required details from brief are included
- [ ] No banned phrases
- [ ] Length is appropriate
- [ ] CTA matches what was requested
- [ ] Frontmatter is complete
- [ ] File named correctly
- [ ] DB entry created

---

## Failure cases

| Situation | Action |
|-----------|--------|
| Brief is incomplete (missing core message, key details, or CTA) | Do not draft. Return to Nico with specific missing fields noted. |
| Brief has contradictory instructions | Flag to Gary V before writing |
| No image available but post needs one | Write the copy; note "IMAGE NEEDED" in Assets section; flag to Gary V |
| Draft feels forced or hollow after two attempts | Flag to Gary V — may need a brief revision or a different pillar angle |
| Brief asks for content that requires a banned phrase or unearned hype | Reframe within voice rules; if the brief itself is the problem, flag to Nico |
