# Regna (Chess Evolved)

Monorepo for **Regna** — chess with cards, powers, and evolution mechanics. pnpm workspaces + Turborepo.

| Package | Path | Stack |
| ------- | ---- | ----- |
| **Engine** | [`packages/engine`](packages/engine) | Pure TypeScript + Zod — rules, no I/O |
| **Client** | [`apps/client`](apps/client) | Nuxt 4, PixiJS, PWA |
| **Server** | [`apps/server`](apps/server) | Fastify, Socket.IO, Prisma, Supabase Postgres |

## Prerequisites

- Node.js 20+
- [pnpm](https://pnpm.io) 11.x (`corepack enable && corepack prepare pnpm@11.1.3 --activate`)

## Quick start

```bash
git clone <repo-url> regna && cd regna
pnpm install

cp .env.example apps/server/.env
# Fill apps/server/.env — Supabase Dashboard (API keys + DB URLs)

cd apps/server
pnpm db:generate
pnpm db:migrate:deploy
cd ../..

pnpm dev          # client + server via Turbo
```

- **Client only:** `cd apps/client && pnpm dev`
- **Server only:** `cd apps/server && pnpm dev` → http://localhost:3001/health
- **Server scripts:** see [`apps/server/README.md`](apps/server/README.md) and `scriptsDoc` in [`apps/server/package.json`](apps/server/package.json)

## Root scripts

| Script | Purpose |
| ------ | ------- |
| `pnpm dev` | Run `dev` in all workspace packages (Turbo) |
| `pnpm build` | Build all packages |
| `pnpm typecheck` | Type-check all packages |

## Documentation

| Doc | Content |
| --- | ------- |
| [`docs/regna-setup.md`](docs/regna-setup.md) | Install, monorepo layout, Supabase + Prisma |
| [`docs/TECHNICAL-LOG.md`](docs/TECHNICAL-LOG.md) | Architecture and stack decisions (append-only) |
| [`docs/regna.pdf`](docs/regna.pdf) | Game design (GDD) |
| [`src/PRODUCT-PLAN.md`](src/PRODUCT-PLAN.md) | Engineering roadmap, DB schema, API contracts |
| [`src/README.md`](src/README.md) | Product docs and assets under `src/` |

## Repository layout

```text
Regna/
├── apps/
│   ├── client/          # Nuxt 4 + PixiJS
│   └── server/          # Fastify + Prisma + Supabase
├── packages/
│   └── engine/          # @chess/engine
├── docs/                # Setup, technical log, GDD
├── src/                 # PRODUCT-PLAN, sprites
├── .env.example         # Template → copy to apps/server/.env
├── pnpm-workspace.yaml
└── turbo.json
```

## Database

Schema and migrations are owned by **Prisma** in `apps/server/prisma/`, not `supabase/migrations/`. Hosted Postgres on [Supabase](https://supabase.com).

```bash
cd apps/server
pnpm db:migrate:deploy   # apply existing migrations
pnpm db:migrate -- --name my_change   # new migration after editing schema.prisma
pnpm db:generate
```

## Contributing

- Conventional Commits: `feat(server): …`, `fix(engine): …`
- Engine stays framework-agnostic (no Vue/Fastify in `packages/engine`)
- Log architecture / DB / env changes in `docs/TECHNICAL-LOG.md`
