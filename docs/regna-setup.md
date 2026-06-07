# Regna — guide de démarrage

Authoritative bootstrap guide for this repository. **Architecture and install-related decisions over time:** see **`docs/TECHNICAL-LOG.md`** (append-only).

---

## Démarrage rapide (repo existant)

```bash
# 1. Prérequis
corepack enable && corepack prepare pnpm@11.1.3 --activate
node --version  # 20+

# 2. Dépendances
pnpm install

# 3. Env server
cp .env.example apps/server/.env
# Remplir apps/server/.env depuis le Dashboard Supabase (§ Env variables ci-dessous)

# 4. Base de données
cd apps/server
pnpm db:generate
pnpm db:migrate:deploy
cd ../..

# 5. Font (étape manuelle, une fois par machine)
# Télécharger m6x11.ttf → apps/client/public/fonts/m6x11.ttf
# https://managore.itch.io/m6x11 — attribution : Daniel Linssen
cd apps/client && pnpm font:check && cd ../..

# 6. Lancer
pnpm dev
# Client → http://localhost:3000
# Server → http://localhost:3001/health
```

---

## Variables d'environnement (server)

Fichier : `apps/server/.env` (copié de `.env.example`, jamais commité).

| Variable | Rôle | Source |
| -------- | ---- | ------ |
| `DATABASE_URL` | Runtime — transaction pooler **:6543** | Dashboard Supabase → Database → Connection string |
| `DIRECT_DATABASE_URL` | Prisma CLI — session pooler **:5432** | Même dashboard, URL `:5432` |
| `SUPABASE_URL` | SDK Supabase | Dashboard → API → Project URL |
| `SUPABASE_ANON_KEY` | SDK côté client (non-secret) | Dashboard → API → anon key |
| `SUPABASE_SERVICE_ROLE_KEY` | SDK côté server — **ne jamais exposer au client** | Dashboard → API → service_role key |
| `JWT_SECRET`, `JWT_REFRESH_SECRET` | Auth tokens — générer localement | `openssl rand -hex 32` |
| `CORS_ORIGIN` | Origine autorisée | `http://localhost:3000` en dev |
| `PORT` | Port API | `3001` par défaut |

> **Règle d'override :** `apps/server/.env` est chargé avec `override: true` — il écrase les éventuels `export DATABASE_URL=…` dans votre shell. Évite les conflits après un reset de mot de passe Supabase.

---

## Base de données (Prisma + Supabase)

Postgres hébergé sur [Supabase](https://supabase.com). **Prisma** est l'ORM et le gestionnaire de migrations — `supabase/migrations/` n'est pas utilisé.

```bash
cd apps/server

# Après avoir modifié prisma/schema.prisma
pnpm db:migrate -- --name nom_du_changement   # crée et applique la migration
pnpm db:generate                              # régénère le client Prisma

# Vérifier l'état
pnpm db:status

# Prototype sans fichier de migration (dev uniquement)
pnpm db:push

# Interface graphique
pnpm db:studio
```

`db:migrate*`, `db:status`, `db:push` et `db:studio` passent par `scripts/prisma-direct.ts` qui injecte `DIRECT_DATABASE_URL` — le pooler transaction `:6543` génère des erreurs "prepared statement" avec la CLI Prisma.

---

## Monorepo from scratch (référence)

Cette section documente comment la structure a été créée. Pour un clone existant, seul le démarrage rapide ci-dessus est nécessaire.

### Structure pnpm + Turborepo

```bash
mkdir regna && cd regna
pnpm init
pnpm add -D turbo typescript
mkdir -p packages/engine apps/client apps/server
```

**`pnpm-workspace.yaml`**

```yaml
packages:
  - "packages/*"
  - "apps/*"

allowBuilds:
  "@parcel/watcher": true
  "@prisma/engines": true
  esbuild: true
  prisma: true
```

**`turbo.json`** — Turborepo 2.x utilise `tasks`, pas `pipeline`

```json
{
  "tasks": {
    "build": { "dependsOn": ["^build"], "outputs": ["dist/**"] },
    "dev":   { "cache": false, "persistent": true },
    "typecheck": {}
  }
}
```

**`package.json` racine**

```json
{
  "name": "Regna",
  "packageManager": "pnpm@11.1.3",
  "scripts": {
    "dev": "turbo run dev",
    "build": "turbo run build",
    "typecheck": "turbo run typecheck"
  }
}
```

> **Attention Turborepo :** ne pas combiner `packageManager` et `devEngines.packageManager` dans le même `package.json`. Turborepo ignore alors `packageManager` et la résolution des workspaces échoue ("Missing packageManager"). N'utiliser que `"packageManager": "pnpm@…"`.

### `packages/engine` — moteur de règles

```bash
cd packages/engine
pnpm init
pnpm add zod
pnpm add -D typescript
npx tsc --init --strict --target ES2022 --module NodeNext --moduleResolution NodeNext --outDir dist
```

Le champ `"name"` **doit** être `@chess/engine` (pas seulement `engine`) pour que les dépendances `workspace:*` se résolvent.

```json
{
  "name": "@chess/engine",
  "type": "module",
  "main": "./dist/index.js",
  "scripts": { "dev": "tsc --watch", "build": "tsc" }
}
```

TypeScript pur, sans imports UI ni Fastify — partagé par `apps/client` et `apps/server`.

### `apps/server` — Fastify + Socket.IO + Prisma

```bash
cd apps/server
pnpm add fastify @fastify/cors socket.io @prisma/client @prisma/adapter-pg @supabase/supabase-js dotenv pg zod
pnpm add "@chess/engine@workspace:*"
pnpm add -D typescript tsx @types/node @types/pg prisma
```

> `fastify-plugin` n'est nécessaire que pour les plugins Fastify avec encapsulation — ne pas l'ajouter par défaut.

### `apps/client` — Nuxt 4 + PixiJS

```bash
pnpm dlx nuxi@latest init apps/client
# Choisir : minimal, pnpm, pas de git nested

pnpm approve-builds   # si pnpm bloque les postinstall scripts

cd apps/client
pnpm add pixi.js @vueuse/core vue vue-router "@chess/engine@workspace:*"
pnpm add -D @vite-pwa/nuxt
pnpm add nuxt@^4
```

> Ne pas utiliser `@nuxtjs/pwa` — abandonné, incompatible Nuxt 4. Utiliser **`@vite-pwa/nuxt`**.

---

## Structure attendue

```text
Regna/
├── packages/
│   └── engine/          # @chess/engine — moteur pur TS
├── apps/
│   ├── server/          # Fastify + Socket.IO + Prisma
│   └── client/          # Nuxt 4 + PixiJS + PWA
├── src/
│   └── sprites/         # Assets source (chess pieces, boards…)
├── docs/                # GDD, charte, setup, technical log
├── .env.example         # Modèle → cp vers apps/server/.env
├── pnpm-workspace.yaml
└── turbo.json
```

---

## MCP Supabase (optionnel)

`.mcp.json` à la racine — `project_ref=jtzhqebywdvdjmfgxewd`. Activer dans Cursor Settings → Tools & MCP.
