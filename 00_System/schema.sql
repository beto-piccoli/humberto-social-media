-- ============================================================
-- Social Media System — SQLite Schema
-- Owner: Gary V (Social Media Director)
-- Created: 2026-04-10
-- Location: 06_Music_Career/Social_Media/00_System/schema.sql
-- ============================================================
-- Apply with: sqlite3 social_media.db < schema.sql
-- ============================================================

PRAGMA journal_mode=WAL;
PRAGMA foreign_keys=ON;

-- ------------------------------------------------------------
-- CAMPAIGNS
-- A campaign is a focused initiative with a clear objective,
-- audience, and time window. All content belongs to a campaign.
-- ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS campaigns (
    id              INTEGER PRIMARY KEY AUTOINCREMENT,
    slug            TEXT    NOT NULL UNIQUE,          -- e.g. "local-gigs-spring-2026"
    name            TEXT    NOT NULL,
    objective       TEXT    NOT NULL,                 -- what success looks like
    audience        TEXT,                             -- target audience description
    platforms       TEXT,                             -- comma-separated: facebook, instagram, etc.
    status          TEXT    NOT NULL DEFAULT 'active' CHECK(status IN ('active','paused','completed','archived')),
    start_date      TEXT,                             -- ISO 8601
    end_date        TEXT,
    owner_agent     TEXT    DEFAULT 'Nico',           -- agent responsible
    notes           TEXT,
    created_at      TEXT    NOT NULL DEFAULT (datetime('now')),
    updated_at      TEXT    NOT NULL DEFAULT (datetime('now'))
);

-- ------------------------------------------------------------
-- CONTENT ITEMS
-- One row per piece of content (a post, a reel idea, a story).
-- The canonical creative text lives in a Markdown file; this
-- row tracks status and metadata.
-- ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS content_items (
    id              INTEGER PRIMARY KEY AUTOINCREMENT,
    slug            TEXT    NOT NULL UNIQUE,          -- e.g. "2026-04-15_gig-announce-the-ship"
    title           TEXT    NOT NULL,
    campaign_id     INTEGER REFERENCES campaigns(id) ON DELETE SET NULL,
    pillar          TEXT,                             -- content pillar (see 01_Strategy/content_pillars.md)
    platform        TEXT    NOT NULL DEFAULT 'facebook' CHECK(platform IN ('facebook','instagram','x','youtube','multi')),
    content_type    TEXT    NOT NULL DEFAULT 'post'  CHECK(content_type IN ('post','story','reel','video','carousel','event','multi')),
    status          TEXT    NOT NULL DEFAULT 'idea'  CHECK(status IN ('idea','draft','review','approved','scheduled','published','analyzed','archived')),
    file_path       TEXT,                             -- relative path to the Markdown file
    publish_date    TEXT,                             -- ISO 8601 scheduled publish date
    published_at    TEXT,                             -- ISO 8601 actual publish timestamp
    assigned_to     TEXT    DEFAULT 'Maya',           -- agent responsible for this item
    reviewed_by     TEXT,
    approved_by     TEXT    DEFAULT 'Gary V',
    notes           TEXT,
    created_at      TEXT    NOT NULL DEFAULT (datetime('now')),
    updated_at      TEXT    NOT NULL DEFAULT (datetime('now'))
);

-- ------------------------------------------------------------
-- CONTENT VERSIONS
-- Every time a draft changes, a version snapshot is stored here.
-- The live version is always the highest version_number for a given item.
-- ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS content_versions (
    id              INTEGER PRIMARY KEY AUTOINCREMENT,
    content_item_id INTEGER NOT NULL REFERENCES content_items(id) ON DELETE CASCADE,
    version_number  INTEGER NOT NULL DEFAULT 1,
    body_text       TEXT    NOT NULL,                 -- full post copy at this version
    changed_by      TEXT    NOT NULL,                 -- agent name
    change_reason   TEXT,
    created_at      TEXT    NOT NULL DEFAULT (datetime('now')),
    UNIQUE(content_item_id, version_number)
);

-- ------------------------------------------------------------
-- ASSETS
-- Photos, audio clips, graphics, links to Press Kit items.
-- Assets can be attached to multiple content items.
-- ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS assets (
    id              INTEGER PRIMARY KEY AUTOINCREMENT,
    filename        TEXT    NOT NULL,
    asset_type      TEXT    NOT NULL CHECK(asset_type IN ('photo','video','audio','graphic','link','document')),
    description     TEXT,
    file_path       TEXT,                             -- local path or Drive URL
    source          TEXT,                             -- e.g. "Ritche Perez Dec 2025", "self-shot"
    tags            TEXT,                             -- comma-separated
    usable_for      TEXT,                             -- comma-separated platforms
    rights_cleared  INTEGER NOT NULL DEFAULT 1 CHECK(rights_cleared IN (0,1)),
    notes           TEXT,
    created_at      TEXT    NOT NULL DEFAULT (datetime('now'))
);

-- ------------------------------------------------------------
-- CONTENT_ASSETS (join table)
-- ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS content_assets (
    content_item_id INTEGER NOT NULL REFERENCES content_items(id) ON DELETE CASCADE,
    asset_id        INTEGER NOT NULL REFERENCES assets(id) ON DELETE CASCADE,
    PRIMARY KEY (content_item_id, asset_id)
);

-- ------------------------------------------------------------
-- PERFORMANCE METRICS
-- One row per post per measurement event (can have multiple
-- rows for the same post as it ages: day 1, day 7, day 30).
-- ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS performance_metrics (
    id              INTEGER PRIMARY KEY AUTOINCREMENT,
    content_item_id INTEGER NOT NULL REFERENCES content_items(id) ON DELETE CASCADE,
    platform        TEXT    NOT NULL,
    measured_at     TEXT    NOT NULL DEFAULT (datetime('now')),
    reach           INTEGER DEFAULT 0,
    impressions     INTEGER DEFAULT 0,
    likes           INTEGER DEFAULT 0,
    comments        INTEGER DEFAULT 0,
    shares          INTEGER DEFAULT 0,
    saves           INTEGER DEFAULT 0,
    clicks          INTEGER DEFAULT 0,
    profile_visits  INTEGER DEFAULT 0,
    video_views     INTEGER DEFAULT 0,
    engagement_rate REAL    DEFAULT 0.0,              -- calculated: (likes+comments+shares) / reach
    notes           TEXT
);

-- ------------------------------------------------------------
-- EXPERIMENTS
-- Tracks A/B tests, timing experiments, caption length tests, etc.
-- ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS experiments (
    id              INTEGER PRIMARY KEY AUTOINCREMENT,
    name            TEXT    NOT NULL,
    hypothesis      TEXT    NOT NULL,
    variable_tested TEXT    NOT NULL,                 -- e.g. "caption length", "post time", "CTA type"
    variant_a       TEXT    NOT NULL,
    variant_b       TEXT,
    status          TEXT    NOT NULL DEFAULT 'running' CHECK(status IN ('planned','running','concluded','archived')),
    start_date      TEXT,
    end_date        TEXT,
    result          TEXT,
    conclusion      TEXT,
    run_by          TEXT    DEFAULT 'Eva',
    created_at      TEXT    NOT NULL DEFAULT (datetime('now'))
);

-- ------------------------------------------------------------
-- TASKS
-- Operational tasks for agents. Lightweight — not a full PM tool.
-- For complex multi-step work, use Nina's task system instead.
-- ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS tasks (
    id              INTEGER PRIMARY KEY AUTOINCREMENT,
    title           TEXT    NOT NULL,
    description     TEXT,
    assigned_to     TEXT    NOT NULL,
    related_content INTEGER REFERENCES content_items(id) ON DELETE SET NULL,
    related_campaign INTEGER REFERENCES campaigns(id) ON DELETE SET NULL,
    priority        TEXT    NOT NULL DEFAULT 'normal' CHECK(priority IN ('low','normal','high','urgent')),
    status          TEXT    NOT NULL DEFAULT 'open'  CHECK(status IN ('open','in_progress','done','cancelled')),
    due_date        TEXT,
    completed_at    TEXT,
    notes           TEXT,
    created_at      TEXT    NOT NULL DEFAULT (datetime('now')),
    updated_at      TEXT    NOT NULL DEFAULT (datetime('now'))
);

-- ------------------------------------------------------------
-- INDEXES for common query patterns
-- ------------------------------------------------------------
CREATE INDEX IF NOT EXISTS idx_content_status ON content_items(status);
CREATE INDEX IF NOT EXISTS idx_content_platform ON content_items(platform);
CREATE INDEX IF NOT EXISTS idx_content_campaign ON content_items(campaign_id);
CREATE INDEX IF NOT EXISTS idx_content_publish_date ON content_items(publish_date);
CREATE INDEX IF NOT EXISTS idx_metrics_content ON performance_metrics(content_item_id);
CREATE INDEX IF NOT EXISTS idx_tasks_assigned ON tasks(assigned_to);
CREATE INDEX IF NOT EXISTS idx_tasks_status ON tasks(status);

-- ------------------------------------------------------------
-- VIEWS for quick reporting
-- ------------------------------------------------------------

-- Content queue: everything not yet published
CREATE VIEW IF NOT EXISTS v_content_queue AS
SELECT
    ci.id,
    ci.slug,
    ci.title,
    ci.platform,
    ci.content_type,
    ci.status,
    ci.pillar,
    c.name AS campaign_name,
    ci.publish_date,
    ci.assigned_to,
    ci.file_path
FROM content_items ci
LEFT JOIN campaigns c ON ci.campaign_id = c.id
WHERE ci.status NOT IN ('published','analyzed','archived')
ORDER BY ci.publish_date ASC, ci.created_at ASC;

-- Published content with basic metrics
CREATE VIEW IF NOT EXISTS v_published_with_metrics AS
SELECT
    ci.id,
    ci.slug,
    ci.title,
    ci.platform,
    ci.published_at,
    ci.pillar,
    pm.reach,
    pm.likes,
    pm.comments,
    pm.shares,
    pm.engagement_rate,
    pm.measured_at
FROM content_items ci
LEFT JOIN performance_metrics pm ON pm.content_item_id = ci.id
WHERE ci.status IN ('published','analyzed')
ORDER BY ci.published_at DESC;

-- Open tasks by agent
CREATE VIEW IF NOT EXISTS v_open_tasks AS
SELECT assigned_to, COUNT(*) AS open_count
FROM tasks
WHERE status IN ('open','in_progress')
GROUP BY assigned_to;

-- ------------------------------------------------------------
-- EVOLUTION REPORTS
-- One row per weekly review. Tracks the history of system
-- improvements and strategic decisions over time.
-- ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS evolution_reports (
    id              INTEGER PRIMARY KEY AUTOINCREMENT,
    week_label      TEXT NOT NULL UNIQUE,      -- e.g. "2026-W16"
    week_start      TEXT NOT NULL,             -- ISO date Monday
    week_end        TEXT NOT NULL,             -- ISO date Sunday
    file_path       TEXT NOT NULL,             -- relative path to the report MD file
    top_actions     TEXT,                      -- JSON array of 5 priority actions
    key_insight     TEXT,                      -- one-sentence summary of most important finding
    system_changes  TEXT,                      -- comma-separated list of changes implemented
    status          TEXT NOT NULL DEFAULT 'draft' CHECK(status IN ('draft','published','archived')),
    created_at      TEXT NOT NULL DEFAULT (datetime('now'))
);

CREATE INDEX IF NOT EXISTS idx_evolution_week ON evolution_reports(week_label);
