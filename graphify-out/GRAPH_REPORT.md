# Graph Report - .  (2026-06-07)

## Corpus Check
- Corpus is ~27,363 words - fits in a single context window. You may not need a graph.

## Summary
- 395 nodes · 492 edges · 47 communities (30 shown, 17 thin omitted)
- Extraction: 72% EXTRACTED · 28% INFERRED · 0% AMBIGUOUS · INFERRED: 136 edges (avg confidence: 0.91)
- Token cost: 21,900 input · 6,400 output

## Community Hubs (Navigation)
- [[_COMMUNITY_PixiJS Rendering Modules|PixiJS Rendering Modules]]
- [[_COMMUNITY_Server Dependencies|Server Dependencies]]
- [[_COMMUNITY_Client Visual Layer|Client Visual Layer]]
- [[_COMMUNITY_Workspace Package Config|Workspace Package Config]]
- [[_COMMUNITY_Database and Prisma Layer|Database and Prisma Layer]]
- [[_COMMUNITY_Client Dependencies|Client Dependencies]]
- [[_COMMUNITY_Game Design Architecture|Game Design Architecture]]
- [[_COMMUNITY_Project Setup and Config|Project Setup and Config]]
- [[_COMMUNITY_Engine TypeScript Config|Engine TypeScript Config]]
- [[_COMMUNITY_Project Documentation|Project Documentation]]
- [[_COMMUNITY_Graphify Skill Reference|Graphify Skill Reference]]
- [[_COMMUNITY_Engine Package Metadata|Engine Package Metadata]]
- [[_COMMUNITY_Chess Board Sprites|Chess Board Sprites]]
- [[_COMMUNITY_Server TypeScript Config|Server TypeScript Config]]
- [[_COMMUNITY_16x16 Piece Sprites|16x16 Piece Sprites]]
- [[_COMMUNITY_Black 16x32 Pieces|Black 16x32 Pieces]]
- [[_COMMUNITY_White 16x32 Pieces|White 16x32 Pieces]]
- [[_COMMUNITY_Server DB Scripts|Server DB Scripts]]
- [[_COMMUNITY_Pixi Composables|Pixi Composables]]
- [[_COMMUNITY_Package Manifests|Package Manifests]]
- [[_COMMUNITY_Nuxt Sprite Config|Nuxt Sprite Config]]
- [[_COMMUNITY_V1 Extra Sprites|V1 Extra Sprites]]
- [[_COMMUNITY_Graphify Pipeline Stages|Graphify Pipeline Stages]]
- [[_COMMUNITY_Claude Hooks Config|Claude Hooks Config]]
- [[_COMMUNITY_MCP Server Settings|MCP Server Settings]]
- [[_COMMUNITY_Client TypeScript Config|Client TypeScript Config]]
- [[_COMMUNITY_Animation Motion System|Animation Motion System]]
- [[_COMMUNITY_AI Tool Config Files|AI Tool Config Files]]
- [[_COMMUNITY_MCP Supabase Server|MCP Supabase Server]]
- [[_COMMUNITY_Font Check Script|Font Check Script]]
- [[_COMMUNITY_Visual Constants Barrel|Visual Constants Barrel]]
- [[_COMMUNITY_VSCode Config|VSCode Config]]
- [[_COMMUNITY_App Vue Component|App Vue Component]]
- [[_COMMUNITY_Claude Settings JSON|Claude Settings JSON]]
- [[_COMMUNITY_usePixiApp Composable|usePixiApp Composable]]
- [[_COMMUNITY_usePixiBoard Composable|usePixiBoard Composable]]
- [[_COMMUNITY_Pixi Layers Type|Pixi Layers Type]]
- [[_COMMUNITY_Graphify Neo4j Export|Graphify Neo4j Export]]
- [[_COMMUNITY_Graphify God Nodes|Graphify God Nodes]]
- [[_COMMUNITY_VSCode Settings JSON|VSCode Settings JSON]]

## God Nodes (most connected - your core abstractions)
1. `compilerOptions` - 17 edges
2. `Regna Product Plan` - 11 edges
3. `scripts` - 10 edges
4. `scriptsDoc` - 10 edges
5. `compilerOptions` - 10 edges
6. `graphify Knowledge Graph Skill` - 9 edges
7. `White Pieces Sprite Sheet (16x32, default style)` - 9 edges
8. `Black King Sprite (16x32)` - 9 edges
9. `White Bishop Sprite (16x32)` - 8 edges
10. `White King Sprite (16x32)` - 8 edges

## Surprising Connections (you probably didn't know these)
- `Monorepo Layout (engine / client / server)` --semantically_similar_to--> `Monorepo Quick Start and Layout`  [INFERRED] [semantically similar]
  CLAUDE.md → README.md
- `PixiJS Visual Scaffold` --conceptually_related_to--> `m6x11 Bitmap Font`  [EXTRACTED]
  docs/TECHNICAL-LOG.md → apps/client/pages/index.vue
- `Regna Setup Guide` --references--> `m6x11 Bitmap Font`  [EXTRACTED]
  docs/regna-setup.md → apps/client/pages/index.vue
- `Regna Visual Charter` --references--> `m6x11 Bitmap Font`  [EXTRACTED]
  docs/visual-charter.md → apps/client/pages/index.vue
- `Regna Database Schema` --implements--> `Buildcraft System`  [EXTRACTED]
  apps/server/prisma/migrations/20260522133053_init/migration.sql → docs/_archive/perplexity-gdd-and-stack-chat.md

## Import Cycles
- None detected.

## Hyperedges (group relationships)
- **PixiJS Rendering Pipeline (layers + textures + board preview)** — pixi_layers_ts_createpixilayers, pixi_texture_ts_loadpixeltexture, pixi_mount_board_preview_ts_mountboardpreview, composables_usepixiapp_ts_usepixiapp [INFERRED 0.90]
- **Pixel Art Visual System (scale, filtering, palette)** — visual_constants_ts_pixel_scale, nearest_neighbor_pixel_art, integer_scale_pixel_art, visual_constants_ts_regna_colors [INFERRED 0.85]
- **Board Preview Composition Flow (component → composable → mount)** — components_pixiboardpreview_vue, composables_usepixiboard_ts_usepixiboard, pixi_mount_board_preview_ts_mountboardpreview [EXTRACTED 1.00]
- **Server Environment Loading Pattern** — server_load_env, server_src_env, server_scripts_prisma_direct, server_prisma_config [EXTRACTED 0.95]
- **Prisma Database Lifecycle (Config, Migrations, Client)** — server_prisma_config, server_migration_init, server_db_prisma [INFERRED 0.90]
- **Monorepo Build Pipeline (Turbo + pnpm workspaces)** — root_package_json, root_turbo_json, engine_package_json [EXTRACTED 0.95]
- **graphify Core Pipeline: AST + Semantic + Community Detection** — skills_graphify_ast_extraction, skills_graphify_semantic_extraction, skills_graphify_community_detection [EXTRACTED 1.00]
- **Regna Project Documentation: README + CLAUDE.md + Monorepo Layout** — readme_regna_project, claude_md_regna_project, claude_md_monorepo_layout [INFERRED 0.85]
- **Incremental Graph Maintenance: Update + Cluster-Only + Watch + Hook** — references_update_incremental, references_update_cluster_only, references_hooks_post_commit, references_add_watch_folder_watcher [INFERRED 0.85]
- **Database Environment and ORM Integration** — concept_prisma_supabase_integration, concept_env_variables, concept_load_env_override [EXTRACTED 0.95]
- **Engine + Server + Shared Contracts Runtime System** — concept_chess_engine_package, concept_authoritative_server, concept_socketio_contracts, concept_packages_shared [EXTRACTED 0.95]
- **Visual Design and Rendering System** — concept_visual_design_8bit, concept_pixel_scale_x4, concept_motion_system, concept_m6x11_font [EXTRACTED 0.95]
- **16x16 Standard Theme Chess Pieces** — 16x16_pieces_blackpieces, 16x16_pieces_whitepieces [INFERRED 0.95]
- **16x16 Simplified Theme Chess Pieces** — 16x16_pieces_blackpieces_simplified, 16x16_pieces_whitepieces_simplified [INFERRED 0.95]
- **16x16 Wood Theme Chess Pieces** — 16x16_pieces_blackpieces_wood, 16x16_pieces_whitepieces_wood [INFERRED 0.95]
- **16x16 Wood Simplified Theme Chess Pieces** — 16x16_pieces_blackpieces_woodsimplified, 16x16_pieces_whitepieces_woodsimplified [INFERRED 0.95]
- **All 16x16 Chess Piece Sprite Sheets** — 16x16_pieces_blackpieces, 16x16_pieces_blackpieces_simplified, 16x16_pieces_blackpieces_wood, 16x16_pieces_blackpieces_woodsimplified, 16x16_pieces_whitepieces, 16x16_pieces_whitepieces_simplified, 16x16_pieces_whitepieces_wood, 16x16_pieces_whitepieces_woodsimplified [INFERRED 0.95]
- **Complete White Chess Pieces 16x32 Pixel Art Set** — 16x32_pieces_w_bishop, 16x32_pieces_w_king, 16x32_pieces_w_knight, 16x32_pieces_w_pawn, 16x32_pieces_w_queen, 16x32_pieces_w_rook, 16x32_pieces_whitepieces_sheet, 16x32_pieces_whitepieceswood_sheet [INFERRED 0.95]
- **Individual White Chess Piece Sprites (16x32)** — 16x32_pieces_w_bishop, 16x32_pieces_w_king, 16x32_pieces_w_knight, 16x32_pieces_w_pawn, 16x32_pieces_w_queen, 16x32_pieces_w_rook [INFERRED 0.95]
- **White Chess Pieces 16x32 Style Variants (default vs wood)** — 16x32_pieces_whitepieces_sheet, 16x32_pieces_whitepieceswood_sheet [INFERRED 0.95]

## Communities (47 total, 17 thin omitted)

### Community 0 - "PixiJS Rendering Modules"
Cohesion: 0.10
Nodes (16): CameraShake, PixiLayers, BoardPreviewVariant, mountBoardPreview(), MountBoardPreviewOptions, perspBoardUrl(), plainBoardCellCenter(), plainBoardUrl() (+8 more)

### Community 1 - "Server Dependencies"
Cohesion: 0.06
Nodes (32): dependencies, @chess/engine, dotenv, fastify, @fastify/cors, pg, @prisma/adapter-pg, @prisma/client (+24 more)

### Community 2 - "Client Visual Layer"
Cohesion: 0.09
Nodes (22): PixiBoardPreview Component, usePixiApp(), usePixiBoard(), Integer ×4 Scale for Pixel Art Fidelity, Layered Rendering Order (board→pieces→fx→ui), Nearest-Neighbor Filtering for Pixel Art, Pixi Board Coordinate Utils, Pixi Camera Shake Module (+14 more)

### Community 3 - "Workspace Package Config"
Cohesion: 0.08
Nodes (24): author, description, devDependencies, turbo, typescript, keywords, license, main (+16 more)

### Community 4 - "Database and Prisma Layer"
Cohesion: 0.13
Nodes (14): Dual Pooler Strategy (Prisma CLI vs Runtime), globalForPrisma, args, result, Prisma Client Singleton, Supabase Admin Client, Load Server Env (dotenv), Prisma Direct CLI Script (+6 more)

### Community 5 - "Client Dependencies"
Cohesion: 0.10
Nodes (19): dependencies, @chess/engine, nuxt, pixi.js, vue, vue-router, @vueuse/core, devDependencies (+11 more)

### Community 6 - "Game Design Architecture"
Cohesion: 0.18
Nodes (19): Perplexity GDD & Stack Chat (Chess Evolved), Authoritative Server Rule, Buildcraft System, Card System (Deck + Draw + Timing), @chess/engine Package, Chess Evolved Game Design Document, Regna Database Schema, ELO Matchmaking System (+11 more)

### Community 7 - "Project Setup and Config"
Cohesion: 0.17
Nodes (19): Index Page (Home), Check Font Script, Pixel Chess Sprite License (Dani Maccari), Server Environment Variables, load-env.ts Override Pattern, m6x11 Bitmap Font, Monorepo Structure (pnpm + Turborepo), Motion & Animation System (+11 more)

### Community 8 - "Engine TypeScript Config"
Cohesion: 0.11
Nodes (17): compilerOptions, declaration, declarationMap, exactOptionalPropertyTypes, isolatedModules, jsx, module, moduleDetection (+9 more)

### Community 9 - "Project Documentation"
Cohesion: 0.12
Nodes (17): Documentation Map (when to update which doc), Monorepo Layout (engine / client / server), Regna Project — CLAUDE.md Root Config, Visual Rules (pixel scale, nearest filter, palette), m6x11 Font Attribution (Daniel Linssen), m6x11 Font Setup Instructions, Client Lib Scaffold (pixi, visual constants), Client Visual Direction (8-bit pixel, fluid motion) (+9 more)

### Community 10 - "Graphify Skill Reference"
Cohesion: 0.14
Nodes (15): graphify Skill Definition, Folder Watcher (--watch), URL Ingest (/graphify add), Wiki Export (--wiki), Confidence Score Rubric (EXTRACTED/INFERRED/AMBIGUOUS), Node ID Naming Convention, Extraction Subagent Prompt Spec, GitHub Clone and Cross-Repo Merge (+7 more)

### Community 11 - "Engine Package Metadata"
Cohesion: 0.13
Nodes (14): author, dependencies, zod, description, devDependencies, typescript, keywords, license (+6 more)

### Community 12 - "Chess Board Sprites"
Cohesion: 0.26
Nodes (14): Perspective Chess Board Variant 1 (Blue-Grey), Perspective Chess Board Variant 2 (Sage Green), Perspective Chess Board Variant 3 (Dark Grey), Perspective Chess Board Variant 4 (Navy-Cream), Perspective Chess Board Variant 5 (Brown-Tan), Plain Chess Board Variant 1 (Dark Blue-Grey / Cream), Plain Chess Board Variant 2 (Sage Green / Light), Plain Chess Board Variant 3 (Slate Grey / Mid-Grey) (+6 more)

### Community 13 - "Server TypeScript Config"
Cohesion: 0.15
Nodes (12): compilerOptions, esModuleInterop, module, moduleResolution, outDir, resolveJsonModule, rootDir, skipLibCheck (+4 more)

### Community 14 - "16x16 Piece Sprites"
Cohesion: 0.35
Nodes (11): Black Pieces Sprite Sheet (Standard), Black Pieces Sprite Sheet (Simplified), Black Pieces Sprite Sheet (Wood), Black Pieces Sprite Sheet (Wood Simplified), White Pieces Sprite Sheet (Standard), White Pieces Sprite Sheet (Simplified), White Pieces Sprite Sheet (Wood), White Pieces Sprite Sheet (Wood Simplified) (+3 more)

### Community 15 - "Black 16x32 Pieces"
Cohesion: 0.65
Nodes (11): Black Bishop Sprite (16x32), Black King Sprite (16x32), Black Knight Sprite (16x32), Black Pawn Sprite (16x32), Black Queen Sprite (16x32), Black Rook Sprite (16x32), Black Pieces Sprite Sheet (16x32, standard style), Black Pieces Sprite Sheet (16x32, wood/brown style) (+3 more)

### Community 16 - "White 16x32 Pieces"
Cohesion: 0.69
Nodes (11): White Bishop Sprite (16x32), White King Sprite (16x32), White Knight Sprite (16x32), White Pawn Sprite (16x32), White Queen Sprite (16x32), White Rook Sprite (16x32), White Pieces Sprite Sheet (16x32, default style), White Pieces Sprite Sheet (16x32, wood/warm style) (+3 more)

### Community 17 - "Server DB Scripts"
Cohesion: 0.20
Nodes (10): scripts, build, db:generate, db:migrate, db:migrate:deploy, db:push, db:status, db:studio (+2 more)

### Community 18 - "Pixi Composables"
Cohesion: 0.29
Nodes (5): PixiTickHandler, usePixiApp(), UsePixiAppOptions, usePixiBoard(), UsePixiBoardOptions

### Community 19 - "Package Manifests"
Cohesion: 0.60
Nodes (5): Client Package JSON, Engine Package JSON, Root Package JSON (Monorepo), Turborepo Config, Server Package JSON

### Community 20 - "Nuxt Sprite Config"
Cohesion: 0.50
Nodes (3): clientRoot, repoSprites, Sprite Alias / Public Asset Pattern

### Community 21 - "V1 Extra Sprites"
Cohesion: 1.00
Nodes (4): V1 Board Variant 1 (Blue-Cream Checkerboard), V1 Board Variant 2 (Pale Yellow-Green Checkerboard), V1 Board Variant 3 (Blue-Grey Monochrome Checkerboard), Custom Mouse Cursor Sprite (V1)

### Community 22 - "Graphify Pipeline Stages"
Cohesion: 0.67
Nodes (4): AST Structural Extraction (Part A), Community Detection and Clustering, graphify Full Pipeline (Steps 1-9), Semantic LLM Extraction (Part B)

## Knowledge Gaps
- **173 isolated node(s):** `PreToolUse`, `enabledMcpjsonServers`, `enableAllProjectMcpServers`, `supabase`, `conventionalCommits.scopes` (+168 more)
  These have ≤1 connection - possible missing edges or undocumented components.
- **17 thin communities (<3 nodes) omitted from report** — run `graphify query` to explore isolated nodes.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **Why does `scripts` connect `Server DB Scripts` to `Server Dependencies`?**
  _High betweenness centrality (0.004) - this node is a cross-community bridge._
- **What connects `PreToolUse`, `enabledMcpjsonServers`, `enableAllProjectMcpServers` to the rest of the system?**
  _179 weakly-connected nodes found - possible documentation gaps or missing edges._
- **Should `PixiJS Rendering Modules` be split into smaller, more focused modules?**
  _Cohesion score 0.10416666666666667 - nodes in this community are weakly interconnected._
- **Should `Server Dependencies` be split into smaller, more focused modules?**
  _Cohesion score 0.06060606060606061 - nodes in this community are weakly interconnected._
- **Should `Client Visual Layer` be split into smaller, more focused modules?**
  _Cohesion score 0.09230769230769231 - nodes in this community are weakly interconnected._
- **Should `Workspace Package Config` be split into smaller, more focused modules?**
  _Cohesion score 0.07692307692307693 - nodes in this community are weakly interconnected._
- **Should `Database and Prisma Layer` be split into smaller, more focused modules?**
  _Cohesion score 0.13333333333333333 - nodes in this community are weakly interconnected._