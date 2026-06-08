# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project

**Regna** (Chess Evolved) — a card-based chess variant. Players choose decks and powers before each match; cards can alter board rules, pieces, and victory conditions mid-game.

## Commands

All run from the repo root unless noted.

```bash
pnpm dev          # client (localhost:3000) + server (localhost:3001) in parallel via Turbo
pnpm build        # build all packages
pnpm typecheck    # type-check all packages

# Client only
cd apps/client && pnpm dev
cd apps/client && pnpm font:check   # verify m6x11.ttf is present

# Server only
cd apps/server && pnpm dev
curl http://localhost:3001/health

# Database (from apps/server)
pnpm db:generate                        # regenerate Prisma client after schema edits
pnpm db:migrate -- --name my_change     # new migration in dev
pnpm db:migrate:deploy                  # apply migrations (CI / fresh clone)
pnpm db:status                          # check migration sync
pnpm db:push                            # prototype schema without migration file
pnpm db:studio                          # open Prisma Studio
```

## Monorepo layout

pnpm workspaces + Turborepo. Build order: `@chess/engine` → `client` / `server`.

| Package | Path | Role |
| ------- | ---- | ---- |
| `@chess/engine` | `packages/engine` | Pure TS + Zod — chess rules, card validators, shared types. **No** UI or server imports. |
| Client | `apps/client` | Nuxt 4 + PixiJS + PWA. Game rendering, pages, composables. |
| Server | `apps/server` | Fastify + Socket.IO + Prisma + Supabase Postgres. |

The engine package is the source of truth for all game rules and is imported by both client and server. Never add Vue/Nuxt or Fastify/Socket.IO imports to `packages/engine`.

## Architecture

### Client (`apps/client`)

Nuxt 4 standard layout (`app/`, `pages/`, `components/`, `composables/`). Game rendering uses **PixiJS v8** — not the DOM.

Key rendering scaffolding:

| Path | Role |
| ---- | ---- |
| `lib/visual/constants.ts` | `PIXEL_SCALE` (4), `CELL_PX` (64), palette, motion timings |
| `lib/pixi/texture.ts` | `loadPixelTexture` — always `SCALE_MODE.NEAREST` |
| `lib/pixi/layers.ts` | `createPixiLayers()` — board / pieces / fx / ui containers |
| `lib/pixi/board.ts` | `cellToPixel`, `snapToGrid` |
| `lib/pixi/tween.ts` | Delta-time ease-out tweens (~150–250 ms for moves) |
| `lib/pixi/camera.ts` | Screen shake (≤8 px amplitude, ≤200 ms) |
| `composables/usePixiApp.ts` | Pixi app lifecycle |
| `composables/usePixiBoard.ts` | Board + piece layer setup |

Sprites are served from the repo root `src/sprites/` via a Nitro public asset alias (`/sprites/…`). **Do not** put runtime sprites under `apps/client/public/`.

### Server (`apps/server`)

Fastify entry at `src/index.ts`. Environment loaded via `src/load-env.ts` (overrides shell exports so stale `export DATABASE_URL=…` cannot interfere). Prisma client at `src/db/prisma.ts`, Supabase SDK at `src/lib/supabase.ts`.

Database: **Prisma** owns migrations in `prisma/migrations/`. The `supabase/` directory is a stub only — Supabase is the hosted Postgres provider, not the migration tool. Prisma CLI commands use `DIRECT_DATABASE_URL` (session pooler `:5432`); the runtime app uses `DATABASE_URL` (transaction pooler `:6543`).

### Environment (server)

Copy `.env.example` → `apps/server/.env` and fill from Supabase Dashboard.

| Variable | Purpose |
| -------- | ------- |
| `DATABASE_URL` | Runtime — transaction pooler `:6543` |
| `DIRECT_DATABASE_URL` | Prisma CLI — session pooler `:5432` |
| `SUPABASE_URL`, `SUPABASE_*_KEY` | Supabase SDK (`SERVICE_ROLE` server-only) |
| `JWT_SECRET`, `JWT_REFRESH_SECRET` | Auth tokens |

## Visual rules

- **Scale:** native 16×16 (tiles) / 16×32 (pieces) → display at **integer ×4** (64 px cell). Never fractional scale.
- **Filtering:** `SCALE_MODE.NEAREST` everywhere. Never linear/bilinear on game textures.
- **CSS:** `image-rendering: pixelated` for CSS sprites. No `border-radius`, `box-shadow`, or `backdrop-filter` on in-game UI.
- **Font:** **m6x11** only on game screens. Add `m6x11.ttf` to `apps/client/public/fonts/` (see `public/fonts/README.md` for attribution).
- **Board:** `board_plain_*` for menus/builder/previews; `board_persp_*` for live match (`/play`).
- **Palette:** `#1a1a2e`, `#16213e`, `#3D5AFE`, `#e94560`, `#eaeaea`.

## Sprite paths

All sprites live under `src/sprites/` at the repo root.

```typescript
// Chess pieces
'/sprites/chess pieces/16x32 pieces/W_King.png'
'/sprites/chess pieces/16x16 pieces/WhitePieces.png'
'/sprites/boards/board_plain_01.png'
```

Note the space in `chess pieces/` — always quote or encode paths.

## Documentation map

| Doc | Content |
| --- | ------- |
| `docs/TECHNICAL-LOG.md` | Append-only log of architecture / DB / env decisions |
| `docs/visual-charter.md` | Art direction detail (human-readable) |
| `docs/regna-setup.md` | Full bootstrap instructions |
| `docs/regna.pdf` | Game design document (GDD) |
| `src/PRODUCT-PLAN.md` | Engineering roadmap, DB schema, API contracts |

When to update docs after a change:
- New script / env var / CLI usage → **README of the affected package**
- Architecture, DB, cross-service contract → **`docs/TECHNICAL-LOG.md`** (append only)
- Install or run steps changed → **`docs/regna-setup.md`**
- Visual direction change → **`docs/visual-charter.md`**

## Commits

Conventional Commits: `type(scope): short imperative summary`  
Scopes: `engine`, `client`, `server`, `docs`, `infra`  
Examples: `feat(engine): validate card cost on play`, `fix(server): cors preflight on game join`

## graphify

This project has a knowledge graph at graphify-out/ with god nodes, community structure, and cross-file relationships.

Rules:
- For codebase questions, first run `graphify query "<question>"` when graphify-out/graph.json exists. Use `graphify path "<A>" "<B>"` for relationships and `graphify explain "<concept>"` for focused concepts. These return a scoped subgraph, usually much smaller than GRAPH_REPORT.md or raw grep output.
- If graphify-out/wiki/index.md exists, use it for broad navigation instead of raw source browsing.
- Read graphify-out/GRAPH_REPORT.md only for broad architecture review or when query/path/explain do not surface enough context.
- After modifying code, run `graphify update .` to keep the graph current (AST-only, no API cost).

<!-- rtk-instructions v2 -->
# RTK (Rust Token Killer) - Token-Optimized Commands

## Golden Rule

**Always prefix commands with `rtk`**. If RTK has a dedicated filter, it uses it. If not, it passes through unchanged. This means RTK is always safe to use.

**Important**: Even in command chains with `&&`, use `rtk`:
```bash
# ❌ Wrong
git add . && git commit -m "msg" && git push

# ✅ Correct
rtk git add . && rtk git commit -m "msg" && rtk git push
```

## RTK Commands by Workflow

### Build & Compile (80-90% savings)
```bash
rtk cargo build         # Cargo build output
rtk cargo check         # Cargo check output
rtk cargo clippy        # Clippy warnings grouped by file (80%)
rtk tsc                 # TypeScript errors grouped by file/code (83%)
rtk lint                # ESLint/Biome violations grouped (84%)
rtk prettier --check    # Files needing format only (70%)
rtk next build          # Next.js build with route metrics (87%)
```

### Test (60-99% savings)
```bash
rtk cargo test          # Cargo test failures only (90%)
rtk go test             # Go test failures only (90%)
rtk jest                # Jest failures only (99.5%)
rtk vitest              # Vitest failures only (99.5%)
rtk playwright test     # Playwright failures only (94%)
rtk pytest              # Python test failures only (90%)
rtk rake test           # Ruby test failures only (90%)
rtk rspec               # RSpec test failures only (60%)
rtk test <cmd>          # Generic test wrapper - failures only
```

### Git (59-80% savings)
```bash
rtk git status          # Compact status
rtk git log             # Compact log (works with all git flags)
rtk git diff            # Compact diff (80%)
rtk git show            # Compact show (80%)
rtk git add             # Ultra-compact confirmations (59%)
rtk git commit          # Ultra-compact confirmations (59%)
rtk git push            # Ultra-compact confirmations
rtk git pull            # Ultra-compact confirmations
rtk git branch          # Compact branch list
rtk git fetch           # Compact fetch
rtk git stash           # Compact stash
rtk git worktree        # Compact worktree
```

Note: Git passthrough works for ALL subcommands, even those not explicitly listed.

### GitHub (26-87% savings)
```bash
rtk gh pr view <num>    # Compact PR view (87%)
rtk gh pr checks        # Compact PR checks (79%)
rtk gh run list         # Compact workflow runs (82%)
rtk gh issue list       # Compact issue list (80%)
rtk gh api              # Compact API responses (26%)
```

### JavaScript/TypeScript Tooling (70-90% savings)
```bash
rtk pnpm list           # Compact dependency tree (70%)
rtk pnpm outdated       # Compact outdated packages (80%)
rtk pnpm install        # Compact install output (90%)
rtk npm run <script>    # Compact npm script output
rtk npx <cmd>           # Compact npx command output
rtk prisma              # Prisma without ASCII art (88%)
```

### Files & Search (60-75% savings)
```bash
rtk ls <path>           # Tree format, compact (65%)
rtk read <file>         # Code reading with filtering (60%)
rtk grep <pattern>      # Search grouped by file (75%). Format flags (-c, -l, -L, -o, -Z) run raw.
rtk find <pattern>      # Find grouped by directory (70%)
```

### Analysis & Debug (70-90% savings)
```bash
rtk err <cmd>           # Filter errors only from any command
rtk log <file>          # Deduplicated logs with counts
rtk json <file>         # JSON structure without values
rtk deps                # Dependency overview
rtk env                 # Environment variables compact
rtk summary <cmd>       # Smart summary of command output
rtk diff                # Ultra-compact diffs
```

### Infrastructure (85% savings)
```bash
rtk docker ps           # Compact container list
rtk docker images       # Compact image list
rtk docker logs <c>     # Deduplicated logs
rtk kubectl get         # Compact resource list
rtk kubectl logs        # Deduplicated pod logs
```

### Network (65-70% savings)
```bash
rtk curl <url>          # Compact HTTP responses (70%)
rtk wget <url>          # Compact download output (65%)
```

### Meta Commands
```bash
rtk gain                # View token savings statistics
rtk gain --history      # View command history with savings
rtk discover            # Analyze Claude Code sessions for missed RTK usage
rtk proxy <cmd>         # Run command without filtering (for debugging)
rtk init                # Add RTK instructions to CLAUDE.md
rtk init --global       # Add RTK to ~/.claude/CLAUDE.md
```

## Token Savings Overview

| Category | Commands | Typical Savings |
|----------|----------|-----------------|
| Tests | vitest, playwright, cargo test | 90-99% |
| Build | next, tsc, lint, prettier | 70-87% |
| Git | status, log, diff, add, commit | 59-80% |
| GitHub | gh pr, gh run, gh issue | 26-87% |
| Package Managers | pnpm, npm, npx | 70-90% |
| Files | ls, read, grep, find | 60-75% |
| Infrastructure | docker, kubectl | 85% |
| Network | curl, wget | 65-70% |

Overall average: **60-90% token reduction** on common development operations.
<!-- /rtk-instructions -->