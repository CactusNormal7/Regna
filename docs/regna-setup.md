# Regna — Monorepo setup (pnpm, Turborepo, Nuxt 4, Fastify)

Corrected guide aligned with this repository. French version of the visual doc: `docs/HTML text.html`.

---

## 1. Prerequisites — install pnpm

```bash
npm install -g pnpm
pnpm --version
```

Corepack is also valid: `corepack enable && corepack prepare pnpm@11.1.3 --activate`.

---

## 2. Root monorepo

```bash
mkdir regna && cd regna
pnpm init
pnpm add -D turbo typescript
mkdir -p packages/engine apps/client apps/server
```

### `pnpm-workspace.yaml`

```yaml
packages:
  - "packages/*"
  - "apps/*"

# Optional: allow native installs for some dependencies (matches this repo)
allowBuilds:
  "@parcel/watcher": true
  esbuild: true
```

### `turbo.json` (Turborepo 2.x uses `tasks`, not `pipeline`)

```json
{
  "tasks": {
    "build": {
      "dependsOn": ["^build"],
      "outputs": ["dist/**"]
    },
    "dev": {
      "cache": false,
      "persistent": true
    },
    "typecheck": {}
  }
}
```

### Root `package.json` essentials

```json
{
  "name": "Regna",
  "packageManager": "pnpm@11.1.3",
  "scripts": {
    "dev": "turbo run dev",
    "build": "turbo run build",
    "typecheck": "turbo run typecheck"
  },
  "devDependencies": {
    "turbo": "^2.9.14",
    "typescript": "^6.0.3"
  }
}
```

**Turborepo + pnpm:** Do **not** combine the root `packageManager` field with `devEngines.packageManager` in the same `package.json`. Turborepo reports that it will ignore `packageManager` and workspace resolution can fail (e.g. “Missing `packageManager` field” / “Could not resolve workspaces”). Use **only** `"packageManager": "pnpm@…"`.

---

## 3. `packages/engine` — shared rules engine

```bash
cd packages/engine
pnpm init
pnpm add zod
pnpm add -D typescript
npx tsc --init --strict --target ES2022 --module NodeNext --moduleResolution NodeNext --outDir dist
```

### `packages/engine/package.json` (important)

The **`name`** field must match workspace dependencies (e.g. `"@chess/engine"`), not only the folder name `engine`.

```json
{
  "name": "@chess/engine",
  "version": "1.0.0",
  "type": "module",
  "main": "./dist/index.js",
  "scripts": {
    "dev": "tsc --watch",
    "build": "tsc"
  },
  "dependencies": {
    "zod": "^4.4.3"
  },
  "devDependencies": {
    "typescript": "^6.0.3"
  }
}
```

Pure TypeScript, no UI or Fastify here; consumed by both `apps/client` and `apps/server`.

---

## 4. `apps/server` — Fastify + Socket.IO

```bash
cd apps/server
pnpm init
pnpm add fastify fastify-plugin @fastify/cors socket.io drizzle-orm postgres zod
pnpm add "@chess/engine@workspace:*"
pnpm add -D typescript tsx @types/node drizzle-kit
```

Example excerpt:

```json
{
  "name": "server",
  "type": "module",
  "scripts": {
    "dev": "tsx watch src/index.ts",
    "build": "tsc"
  },
  "dependencies": {
    "@chess/engine": "workspace:*"
  }
}
```

---

## 5. `apps/client` — Nuxt 4 + PixiJS

This repo uses **Nuxt 4** (not Nuxt 3).

```bash
pnpm dlx nuxi@latest init apps/client
# In prompts: minimal, pnpm; avoid duplicating a nested git repo if you already have one at monorepo root.
```

If pnpm blocks postinstall builds:

```bash
pnpm approve-builds
```

Dependencies (align with current app):

```bash
cd apps/client
pnpm add pixi.js @vueuse/core vue vue-router "@chess/engine@workspace:*"
pnpm add -D @vite-pwa/nuxt
pnpm add nuxt@^4
```

### `nuxt.config.ts` (minimal, as in repo)

```ts
export default defineNuxtConfig({
  modules: ['@vite-pwa/nuxt'],
  pwa: {
    manifest: {
      name: 'Regna',
      short_name: 'Regna',
      theme_color: '#3D5AFE'
    }
  }
})
```

**PWA:** Do not use `@nuxtjs/pwa` — it is unmaintained and not appropriate for Nuxt 4; use **`@vite-pwa/nuxt`**.

App package naming in this repo: `"name": "client"` with `"private": true` is fine.

---

## 6. Final install & dev

From the repository root (where `pnpm-workspace.yaml` lives):

```bash
pnpm install
pnpm dev
```

Run only the client:

```bash
cd apps/client && pnpm dev
```

**pnpm:** Prefer `pnpm install` from the root so every workspace package links consistently. Installing from a subpackage still resolves the workspace root in many setups; the important part is keeping all `package.json` files coherent.

---

## 7. Expected layout

```text
Regna/
├── packages/
│   └── engine/           # npm name: @chess/engine
├── apps/
│   ├── server/
│   └── client/           # Nuxt 4 + PixiJS
├── pnpm-workspace.yaml
├── turbo.json
└── package.json
```

---

## Changelog vs old HTML draft

| Issue | Correction |
|--------|------------|
| `@regna/engine` vs real package | Workspace package is **`@chess/engine`**. |
| `@regna/client` / `@regna/server` | Apps use **`client`** and **`server`**. |
| Nuxt “3” | Stack is **Nuxt 4**. |
| `turbo.json` | Use **`tasks`**, declare **`typecheck`** if the root runs `turbo run typecheck`. |
| Turborepo error on `pnpm dev` | Root needs **`packageManager`** and must **not** conflict with **`devEngines.packageManager`**. |
| Workspace resolution | **`name`** in `packages/engine/package.json` must match **`@chess/engine`**. |
| Server deps | Include **`fastify-plugin`** when using Fastify plugins in this repo. |
| `npx tsc --init` | Add `--moduleResolution NodeNext` when using `"module": "NodeNext"`. |

---

## Exporting to PDF

- **From the editor:** open `docs/regna-setup.md`, use Markdown preview, then **Print → Save as PDF**.
- **Pandoc** (install [Pandoc](https://pandoc.org) and a LaTeX engine if needed):  
  `pandoc docs/regna-setup.md -o docs/regna-setup.pdf`