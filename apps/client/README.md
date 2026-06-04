# Regna — client (`apps/client`)

Nuxt 4 shell + **PixiJS** game layer. Shared rules: `@chess/engine`. Assets: `src/sprites/` → served at `/sprites/…`.

## Visual direction

**8-bit pixel** (16×16 / 16×32), display **×4** (64 px cell), **fluid motion** — [`docs/visual-charter.md`](../../docs/visual-charter.md).

| Context | Board asset |
| ------- | ------------- |
| Menus, deck, previews | `board_plain_*` |
| Live match | `board_persp_*` |

**Font:** [m6x11](https://managore.itch.io/m6x11) at 16 / 32 / 48 px — copy `m6x11.ttf` to `public/fonts/` (see `public/fonts/README.md`).

## Scripts

| Script | Purpose |
| ------ | ------- |
| `pnpm dev` | Nuxt dev (http://localhost:3000) |
| `pnpm build` | Production build |
| `pnpm preview` | Preview production build |

## Lib (scaffold)

| Path | Role |
| ---- | ---- |
| `lib/visual/constants.ts` | `PIXEL_SCALE`, `CELL_PX`, colors, motion timings |
| `lib/pixi/texture.ts` | `loadPixelTexture` (nearest) |
| `lib/pixi/layers.ts` | `createPixiLayers()` board / pieces / fx / ui |
| `lib/pixi/tween.ts` | ease-out tweens (delta-time) |
| `lib/pixi/camera.ts` | short screen shake |
| `lib/pixi/board.ts` | `cellToPixel`, `snapToGrid` |
| `app/assets/css/pixel-theme.css` | m6x11 + CSS variables (charter palette) |
| `composables/usePixiApp.ts` | Step B — Pixi app lifecycle |
| `composables/usePixiBoard.ts` | Step C — board + test piece |
| `components/PixiBoardPreview.vue` | Plain / persp toggle on home |

```typescript
import { loadPixelTexture, createPixiLayers, cellToPixel } from "~/lib/pixi";
import { PIXEL_SCALE, CELL_PX } from "~/lib/visual";
```

Sprites example: `/sprites/chess pieces/16x32 pieces/W_King.png`

## Setup

```bash
# Step A — font (once)
# Download m6x11.ttf → public/fonts/
pnpm font:check

pnpm install
pnpm dev
# http://localhost:3000 — board preview (steps B+C)
```

Monorepo: [`docs/regna-setup.md`](../../docs/regna-setup.md).
