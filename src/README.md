# `src/` — assets & product engineering docs

| Path | Role |
|------|------|
| [`sprites/`](./sprites/) | Runtime sprite assets (see `.cursor/rules/sprites.mdc`) |
| [`PRODUCT-PLAN.md`](./PRODUCT-PLAN.md) | **Master plan** — roadmap, DB schema, API, Socket contracts, milestones |
| [`PRODUCT-PLAN.pdf`](./PRODUCT-PLAN.pdf) | Export PDF (même contenu ; regénérer via `scripts/generate-product-plan-pdf.sh`) |

**Sources produit :** `docs/PDF document.pdf` (GDD Chess Evolved v1), `docs/1.md`, `docs/regna-setup.md`.

**Stack cible :** monorepo pnpm — `packages/engine`, `apps/client` (Nuxt 4 + PixiJS + PWA), `apps/server` (Fastify + Socket.IO + Drizzle + Postgres).
