# Skill: review_for_voice
_Owner: Rosa_
_Last updated: 2026-04-10_

---

## Purpose

Run a full voice and brand review on a draft post. The goal is to ensure it sounds like Humberto — specific, human, direct — before it reaches the approval gate.

---

## When to use

When a draft in `03_Content/drafts/` is ready for review. Called by Gary V as part of the standard workflow. Rosa runs this on every piece of content before it moves to approved.

---

## Required inputs

- Draft content file (from `03_Content/drafts/`)
- `01_Strategy/voice_rules.md`
- `01_Strategy/brand_profile.md`
- Original brief (for context on intent — ask Nico if not attached to the file)

---

## Process

1. **Read the draft.** Do not jump straight to checklist — read it as a complete piece first. Does it feel right?

2. **Check for banned phrases.** Scan every sentence against the banned list in `voice_rules.md`. Flag each one.

3. **Check for specificity.** Does the post contain at least one real, specific detail? (Venue name, tune title, student outcome, concept name.) If it's all general — that's a fail regardless of other scores.

4. **Check tone match.** Does the tone fit the content type? (See tone adjustments table in `voice_rules.md`.)

5. **Check length.** Is it the right length for the platform and content type? Too long? Padded? Too short for a complex topic?

6. **Check the CTA.** Is there one CTA (if one was required)? Is it clear? Does it match an offer in `offers.md`?

7. **Check emoji use.** Intentional or decorative? More than 2 in a single post is almost always too many.

8. **Decide: pass or return.**

   - **Pass:** Post sounds like Humberto. Specific details present. No banned phrases. Appropriate length. CTA correct.
   - **Minor fix:** One or two small issues (a slightly awkward phrase, one banned word). Fix directly. Note the change. Pass.
   - **Return:** Core framing is wrong, multiple banned phrases, no specific detail, or tone is significantly off. Return to Maya with specific inline notes — not vague feedback.

9. **Update status:**
   - Pass → move file to `03_Content/review/`, update DB status to `review`
   - Return → leave in `03_Content/drafts/`, add Rosa's notes to file, create task for Maya

---

## Inline note format (for returns)

Add a section at the bottom of the draft file:

```markdown
---
## Rosa's Review Notes — [YYYY-MM-DD]

**Decision:** Needs revision

**Issues:**
- Line 3: "excited to announce" — banned phrase. Replace with the actual fact you're announcing.
- Post lacks a specific detail — what tune? What venue? What did the student actually do?
- CTA is vague: "check it out" — replace with a direct ask.

**Suggested direction:**
[Optional: a specific rewrite suggestion or angle note]
```

---

## Output format

- Pass: content file in `03_Content/review/`, DB status = `review`
- Return: content file stays in `03_Content/drafts/`, Rosa's notes appended, task created for Maya

---

## Validation checklist

- [ ] Banned phrases: none found
- [ ] Specific detail: present
- [ ] Tone: matches content type
- [ ] Length: appropriate
- [ ] CTA: correct (if present)
- [ ] Emoji: intentional (0–2)
- [ ] Read as a human: would Humberto say this out loud?

---

## Failure cases

| Situation | Action |
|-----------|--------|
| Brief is not available for context | Proceed using the content itself as context; note this in the review |
| Draft is a repurposed piece from Teo | Same review process — no exceptions for repurposed content |
| The draft is technically correct but feels flat | Return it. "No banned phrases" is not the same as "sounds like Humberto." |
| Multiple revisions have not improved the core problem | Escalate to Gary V — may need a new brief or a different approach |
