# `src/` — assets & product engineering docs

| Path | Role |
|------|------|
| [`sprites/`](./sprites/) | Runtime sprite assets (see `.cursor/rules/sprites.mdc`) |
| [`PRODUCT-PLAN.md`](./PRODUCT-PLAN.md) | Master plan — roadmap, DB schema, API, Socket contracts |
| [`PRODUCT-PLAN.pdf`](./PRODUCT-PLAN.pdf) | PDF export (`scripts/generate-product-plan-pdf.sh`) |

**Product sources:** `docs/regna.pdf` (GDD), `docs/regna-setup.md` (install).

**Stack:** pnpm monorepo — `packages/engine`, `apps/client` (Nuxt 4 + PixiJS), `apps/server` (Fastify + Prisma + Supabase).

**Database:** `cp .env.example apps/server/.env`, fill credentials, then `cd apps/server && pnpm db:migrate:deploy && pnpm db:generate`. Details: `docs/regna-setup.md` § Supabase + Prisma.
