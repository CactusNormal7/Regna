# Regna — server (`apps/server`)

Fastify API, Socket.IO realtime, Prisma + Supabase Postgres. Shared game rules live in `@chess/engine`.

## Setup

```bash
cp ../../.env.example .env
# Fill credentials (Supabase Dashboard → API + Database)
pnpm install
pnpm db:generate
pnpm db:migrate:deploy
pnpm dev
curl http://localhost:3001/health
```

Full bootstrap: [`docs/regna-setup.md`](../../docs/regna-setup.md) § Supabase + Prisma.

## Environment

| Variable | Role |
| -------- | ---- |
| `DATABASE_URL` | Runtime — transaction pooler **:6543** |
| `DIRECT_DATABASE_URL` | Prisma CLI — session pooler **:5432** |
| `SUPABASE_URL`, `SUPABASE_*_KEY` | Supabase SDK (`SERVICE_ROLE` server-only) |
| `JWT_SECRET`, `JWT_REFRESH_SECRET` | Auth tokens (generate locally, not from Supabase) |

`apps/server/.env` overrides stale shell exports (`export DATABASE_URL=…`).

## Scripts

| Script | Command | Purpose |
| ------ | ------- | ------- |
| `dev` | `pnpm dev` | API with hot reload (`tsx watch`) |
| `build` | `pnpm build` | Prisma generate + compile to `dist/` |
| `typecheck` | `pnpm typecheck` | Type-check without emit |
| `db:generate` | `pnpm db:generate` | Regenerate Prisma client (no DB) |
| `db:migrate` | `pnpm db:migrate -- --name change` | New migration in dev |
| `db:migrate:deploy` | `pnpm db:migrate:deploy` | Apply migrations (clone / prod) |
| `db:status` | `pnpm db:status` | Migration sync check |
| `db:push` | `pnpm db:push` | Prototype schema without migration file |
| `db:studio` | `pnpm db:studio` | Prisma Studio UI |

`db:migrate*`, `db:status`, `db:push`, and `db:studio` run via `scripts/prisma-direct.ts`, which swaps in `DIRECT_DATABASE_URL` before invoking the Prisma CLI.

## Layout

```text
apps/server/
├── prisma/schema.prisma      # DB schema (source of truth)
├── prisma/migrations/        # SQL migrations
├── scripts/prisma-direct.ts  # Prisma CLI wrapper
├── src/
│   ├── index.ts              # Fastify entry
│   ├── load-env.ts           # .env loader (override shell)
│   ├── db/prisma.ts          # Prisma client (pooler at runtime)
│   └── lib/supabase.ts       # Service-role Supabase client
└── generated/prisma/         # Generated client (gitignored)
```
