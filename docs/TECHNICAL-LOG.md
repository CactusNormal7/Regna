# Regna — technical log

**Purpose:** Append-only record of **technical decisions**, **architecture / database changes**, and **installation / operations** updates. Product and game-design vision stay in **`docs/regna.pdf`** (and related design docs); this file is for **engineering**.

**When to add an entry (mandatory):**

- Changes to **monorepo layout**, package boundaries, or Turborepo / pnpm workspace config.
- **Database**: Prisma schema, migrations, environment variables for Postgres/Supabase, or data model changes.
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

### 2026-05-24 — Visual charter v1 (8-bit + fluid motion)

**What changed**

- `docs/visual-charter.md`: art direction (pixel ×4, plain/persp boards, full-pixel UI, palette, motion).
- `.cursor/rules/visual-design.mdc`: concrete Pixi/Vue rendering rules for agents.
- `regna-project.mdc`, `sprites.mdc`, `apps/client/README.md` cross-links.

**Why**

- Product target: retro 8-bit readability with Noita / Dead Cells–style motion; decisions validated (scale ×4, both board types, full-pixel UI).

**Follow-up**

- [ ] Choose and document bitmap font(s) in client when UI work starts.
- [ ] Implement shared Pixi scale/filter helpers once board code lands.
- **Docs:** `visual-charter.md` + client README updated? yes

### 2026-05-22 — Server env loading + stack cleanup

**What changed**

- `apps/server/src/load-env.ts`: single loader; `override: true` for runtime + Prisma CLI (shell exports no longer override `.env`).
- `scripts/prisma-direct.ts` (tsx): Prisma CLI entrypoint.
- `.env.example`: session pooler `:5432` for `DIRECT_DATABASE_URL`; removed project-specific comments.
- Removed unused `fastify-plugin` dep; trimmed server `package.json` boilerplate.
- Docs aligned (`regna-setup.md`, `PRODUCT-PLAN.md`, `src/README.md`).

**Why**

- Stale exported `DATABASE_URL` / `DIRECT_DATABASE_URL` caused P1000/P1001 against wrong host/password.
- Session pooler `:5432` is the reliable Prisma CLI target when direct `db.*` is unreachable.

**Follow-up**

- After a password reset in Supabase Dashboard, update both URLs in `apps/server/.env` (URL-encode special chars).
- **Docs:** `regna-setup.md` § Supabase + Prisma updated? yes

### 2026-05-22 — Prisma CLI + env contract (Regna MCP verified)

**What changed**

- `apps/server/scripts/prisma-direct.mjs`: `db:migrate*` / `db:status` / `db:studio` / `db:push` use `DIRECT_DATABASE_URL` (Prisma 7 + Supabase pooler quirk).
- `.env.example`: URL format placeholders; `apps/server/.env`: `SUPABASE_URL` + anon from hosted project (gitignored).
- `.mcp.json`: `type: http`, `project_ref=jtzhqebywdvdjmfgxewd`.
- Docs aligned (`regna-setup.md`, `PRODUCT-PLAN.md`).

**Why**

- MCP confirmed Regna DB (`jtzhqebywdvdjmfgxewd`); migrate via pooler `:6543` fails with prepared-statement errors.

**Follow-up**

- Each dev still fills `DATABASE_URL`, `DIRECT_DATABASE_URL`, `SUPABASE_SERVICE_ROLE_KEY`, JWT secrets in `apps/server/.env`.
- **Docs:** `regna-setup.md` § Supabase + Prisma updated? yes

### 2026-05-22 — Supabase stack review (cleanup)

**What changed**

- Removed vendored `.agents/skills/*` and `skills-lock.json` (Cursor/Supabase plugin skills suffice; not app code).
- `.env.example` / `apps/server/.env`: template only, no secrets.
- `docs/regna-setup.md`, `src/README.md`, `PRODUCT-PLAN.md`: correct Prisma workflows (`db:migrate:deploy` for clone; `DATABASE_URL=$DIRECT_DATABASE_URL` for new migrations).
- `supabase/config.toml`: trimmed to optional local CLI stub; schema owned by Prisma.

**Why**

- Prior session added agent-skill copies and conflicting migration docs; repo should track Regna code and authoritative setup only.

**Follow-up**

- Each dev fills `apps/server/.env` from Supabase Dashboard (MCP/CLI cannot expose DB password).
- **Docs:** `regna-setup.md` § Supabase + Prisma updated? yes

### 2026-05-22 — Supabase + Prisma (replace Drizzle)

**What changed**

- `apps/server`: Prisma 7 (`prisma/schema.prisma` aligned with PRODUCT-PLAN §5), `@supabase/supabase-js`, `src/db/prisma.ts`, `src/lib/supabase.ts`, health route.
- Removed `drizzle-orm`, `drizzle-kit`, `postgres` from server.
- Root `.env.example`, `.mcp.json` (optional Supabase MCP), minimal `supabase/config.toml` (local CLI only).
- `pnpm-workspace.yaml`: `allowBuilds` for `prisma` / `@prisma/engines`.

**Why**

- Product plan lists **Supabase hosted Postgres** as the preferred dev DB option; Prisma gives migrations + typed client for the Fastify server. One ORM only (no Drizzle + Prisma).

**Follow-up**

- [x] Schéma initial appliqué (`20260522133053_init`). Chaque dev : `cp .env.example apps/server/.env` + credentials Supabase.
- [ ] Optional: Supabase Auth v1.1 instead of custom JWT-only users.
- **Docs:** `regna-setup.md` § Supabase + Prisma updated? yes

### 2026-05-21 — Technical log created

**What changed**

- Introduced this file and the Cursor rule that requires logging architecture / DB / install changes here.

**Why**

- Keep agents and contributors aligned on **why** the stack looks the way it does and how setup evolves.

**Follow-up**

- Append a new block per meaningful change; never delete historical entries (revert with a new entry if needed).
