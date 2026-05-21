# Regna — technical log

**Purpose:** Append-only record of **technical decisions**, **architecture / database changes**, and **installation / operations** updates. Product and game-design vision stay in **`docs/regna.pdf`** (and related design docs); this file is for **engineering**.

**When to add an entry (mandatory):**

- Changes to **monorepo layout**, package boundaries, or Turborepo / pnpm workspace config.
- **Database**: Drizzle schema, migrations, environment variables for Postgres, or data model changes.
- **API contracts** between client and server (Socket.IO events, REST payloads) when they affect compatibility.
- New **dependencies** or **tooling** that others must install or configure.
- **Non-trivial infra** (deploy, env files, secrets handling).

**Also update** `docs/regna-setup.md` whenever **bootstrap or install steps** change (keep the log entry cross-referencing that commit or section).

---

## Entry template (copy below the line)

```markdown
### YYYY-MM-DD — short title

**Author / context:** (optional)

**What changed**

- …

**Why**

- …

**Follow-up**

- [ ] Migration / rollout notes: …
- **Docs:** `regna-setup.md` § updated? yes/no
```

---

## Entries

### 2026-05-21 — Technical log created

**What changed**

- Introduced this file and the Cursor rule that requires logging architecture / DB / install changes here.

**Why**

- Keep agents and contributors aligned on **why** the stack looks the way it does and how setup evolves.

**Follow-up**

- Append a new block per meaningful change; never delete historical entries (revert with a new entry if needed).
