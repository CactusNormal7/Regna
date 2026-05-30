# Regna — client (`apps/client`)

Nuxt 4 shell + **PixiJS** game layer. Shared rules: `@chess/engine`. Assets: `src/sprites/`.

## Visual direction

**8-bit pixel** at source (16×16 / 16×32), displayed at **×4** (64 px cell), with **fluid motion** (lerp, particles, short camera shake) — see [`docs/visual-charter.md`](../../docs/visual-charter.md).

| Context | Board asset |
| ------- | ------------- |
| Menus, deck, previews | `board_plain_*` |
| Live match (`/play`) | `board_persp_*` |

Rendering rules for agents: `.cursor/rules/visual-design.mdc` · sprite paths: `.cursor/rules/sprites.mdc`.

## Scripts

| Script | Purpose |
| ------ | ------- |
| `pnpm dev` | Nuxt dev server (default http://localhost:3000) |
| `pnpm build` | Production build |
| `pnpm preview` | Preview production build |

From repo root: `pnpm dev` runs client + server via Turbo.

## Pixi (planned conventions)

- `SCALE_MODE.NEAREST` on all gameplay textures.
- Integer scale **4** from native sprite size; snap static sprites to grid.
- Piece moves: ease-out tween ~150–250 ms; FX on cards/evolution via particles.
- UI over play: **bitmap fonts**, square pixel panels — no blurred CSS chrome.

## Setup

```bash
pnpm install
pnpm dev
```

Monorepo bootstrap: [`docs/regna-setup.md`](../../docs/regna-setup.md) § client.
