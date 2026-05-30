# Regna — charte graphique (v1)

**Direction :** 8-bit / pixel retro **lisible**, avec **fluidité moderne** (références : *Noita*, *Dead Cells*) — le jeu reste en pixels nets ; le mouvement, les FX et la caméra sont lisses.

## Intention

| Pilier | Signification |
| ------ | ------------- |
| **Pixel d’abord** | Grille, silhouettes, palette limitée — pas de vector flou ni de photos. |
| **Mouvement vivant** | Pièces, cartes et FX **interpolés** (easing, particules, shake léger) — pas d’animation uniquement frame-by-frame. |
| **Lisibilité jeu** | Un coup, une carte, une évolution doivent se lire en &lt; 1 s. |
| **Cohérence** | Même langage visuel **plateau + UI** (full pixel, validé v1). |

## Échelle & assets

- **Source :** tuiles **16×16**, pièces **16×32** (`src/sprites/chess pieces/`).
- **Affichage :** facteur **×4** → case **64×64 px**, pièce ~64×128 px à l’écran.
- **Filtrage :** `nearest` / `nearest-neighbor` uniquement — jamais de lissage bilinéaire sur les sprites jeu.
- **Rétina :** scaler par entier (×4, ×8) ; pas de ×1.5 ou ×2.5.

## Plateau

| Contexte | Asset |
| -------- | ----- |
| Menus, deck builder, previews | `boards/board_plain_*` |
| Partie en cours | `boards/board_persp_*` |

Grille logique 8×8 ; rendu Pixi aligné sur la case 64 px.

## UI (full pixel)

- Polices **bitmap / pixel** uniquement pour texte UI (pas de system-ui sur les écrans jeu).
- Bordures **1 px** (à l’échelle source), coins **carrés** — pas de `border-radius` sur les panneaux pixel.
- Boutons : états hover/pressed par **sprite ou palette swap**, pas de transition CSS floue.
- Icônes cartes / passifs : même densité pixel que les pièces (16 ou 32 px de base avant scale).

## Palette (v1 — à affiner)

| Rôle | Hex | Usage |
| ---- | --- | ----- |
| Fond | `#1a1a2e` | Arrière-plan app / scènes |
| Surface | `#16213e` | Panneaux, barres |
| Accent | `#3D5AFE` | Actions primaires, focus (PWA theme) |
| Danger / impact | `#e94560` | Dégâts, alertes, gros FX |
| Texte | `#eaeaea` | Corps |
| Texte muted | `#a0a0b0` | Secondaire |

Pas de dégradés sur les sprites ; les fonds UI peuvent utiliser un **dither** pixel si besoin de profondeur.

## Motion (Noita / Dead Cells)

- **Pièces :** déplacement entre cases en **lerp** (ease-out), ~150–250 ms ; option arc léger sur captures.
- **Cartes / pouvoirs :** flash + **particules** courtes ; pas d’écran bloqué &gt; 400 ms sans skip.
- **Caméra :** shake **court** et **rare** (évolution majeure, checkmate) ; pas de shake permanent.
- **Idle :** micro-mouvement optionnel (1–2 px, cycle lent) — jamais distraire la lecture des coups.

## Crédits assets

- Pack échecs : **DANI MACCARI** (Pixel Chess v1.2) — voir `src/sprites/chess pieces/README.txt`.

**Implémentation client :** [`apps/client/README.md`](../apps/client/README.md) · **Règles agents :** `.cursor/rules/visual-design.mdc`
