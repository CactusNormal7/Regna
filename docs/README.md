# docs/

| Fichier | Contenu | Modifiable ? |
| ------- | ------- | ------------ |
| [`regna.pdf`](regna.pdf) | Game Design Document (GDD) v1 — vision produit, système de cartes, modes de jeu | Non (source externe) |
| [`regna-setup.md`](regna-setup.md) | Guide de démarrage : clone → env → run + référence monorepo | Oui — mettre à jour quand les commandes ou prérequis changent |
| [`visual-charter.md`](visual-charter.md) | Charte graphique : pixel ×4, palette, motion, polices, anti-patterns | Oui — mettre à jour quand la direction artistique change |
| [`TECHNICAL-LOG.md`](TECHNICAL-LOG.md) | Journal **append-only** des décisions d'architecture, DB, env, tooling | Oui — ajouter des entrées, jamais supprimer |

## Quoi mettre où

- **Décision technique** (stack, DB, env, contrat client↔server) → `TECHNICAL-LOG.md`
- **Comment utiliser / lancer** (scripts, env vars, CLI) → README du package concerné (`apps/*/README.md`, `packages/*/README.md`)
- **Direction artistique** → `visual-charter.md`
- **Bootstrap / install** → `regna-setup.md`
- **Game design** → `regna.pdf` (source de vérité produit)

## `_archive/`

Fichiers obsolètes ou doublons conservés pour référence historique. Ne pas référencer depuis le code ou la doc active.
