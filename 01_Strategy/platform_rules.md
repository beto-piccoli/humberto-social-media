# Platform Rules
_Owner: Omar (Publishing Operator) / Gary V_
_Last updated: 2026-04-10_

---

## Facebook (Primary — Active)

### Post formats available
| Format | Notes |
|--------|-------|
| Standard post (text + image) | Primary format |
| Event | For gigs and programs with dates |
| Video post | For clips, short-form video |
| Reel | Short-form video (separate from standard posts) |
| Story | 24-hour content — lower priority |
| Carousel | Multiple images — good for student work, photo sets |
| Link post | External links — use sparingly, Facebook deprioritizes |

### Length guidelines
| Content type | Recommended length |
|-------------|-------------------|
| Gig announcement | 3–6 lines |
| Teaching insight | 3–8 lines |
| Personal reflection | 4–10 lines |
| Student result | 2–4 lines |
| Community post | 2–5 lines |

### Facebook-specific rules
- Always include at least one image. Text-only posts underperform significantly.
- Events should be created as Facebook Events, not just posts
- Avoid putting links in the body of the post — put them in the first comment instead (algorithm preference)
- 3–5 hashtags max, placed at the end of the post
- Best posting times (general guideline): Tue–Thu, 9am–11am NST or 6pm–8pm NST
- Verify actual best times using Eva's monthly analysis once data accumulates

### Facebook content that tends to work well
- Real stories with a specific moment
- Photos from performances (especially good-quality ones)
- Honest reflections on teaching
- Community event promotion
- Behind-the-scenes content that's not too polished

### Facebook content to be careful with
- Link posts (deprioritized by algorithm)
- Text-only posts
- Promotional posts without a personal frame

---

## Instagram (Planned — not yet active)

_Set up when Facebook workflow is stable. Rules to be written by Omar and Nico at that point._

Key differences from Facebook:
- Visual-first: image quality matters more
- Shorter captions by default
- Hashtags behave differently (10–15, more specific)
- Stories and Reels are primary engagement drivers
- Link in bio limitation changes CTA strategy

---

## X / Twitter (Planned)

_Not yet active. Low priority for this career profile._

---

## YouTube (Planned)

_Long-form video potential — lesson content, performance clips. Requires production workflow. Plan separately when ready._

---

## Cross-platform notes

When content is designed for multiple platforms (`platform = 'multi'`):
- Write for Facebook first, then adapt per platform
- Never copy-paste verbatim — platform tone and format differ
- Tag content versions by platform in `content_versions` table
- Log each platform as a separate `content_items` entry linked to the same campaign

---

_Update this file when new platforms go active or when algorithm behavior changes significantly._
