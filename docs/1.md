<img src="https://r2cdn.perplexity.ai/pplx-full-logo-primary-dark%402x.png" style="height:64px;margin-right:32px"/>

# Chess Evolved

1. Vision générale

Chess Evolved est un jeu d’échecs en ligne profondément modifié, où les règles classiques servent de socle à un système riche de pouvoirs, de règles alternatives et de synergies entre pièces. L’objectif n’est pas de remplacer les échecs, mais de les faire évoluer vers une expérience plus expressive, surprenante et stratégique.

Le cœur du jeu repose sur trois piliers, avec une priorité claire :

Buildcraft : construire une armée cohérente avant la partie, via le choix de pouvoirs et de règles.
Stratégie profonde : chaque décision compte, et les synergies peuvent être exploitées à haut niveau.
Surprise contrôlée : des twists forts, parfois chaotiques, mais toujours compréhensibles dans le cadre des règles.

La dimension compétitive est envisagée, mais n’est pas la priorité initiale. Le fun, l’expérimentation et la richesse systémique passent avant l’équilibrage strict.

2. Public cible

Le jeu s’adresse principalement à :

des joueurs ayant déjà des bases en échecs (règles connues, déplacements compris) ;
des joueurs attirés par des jeux complexes, systémiques, avec une forte courbe d’apprentissage ;
des profils venant du deckbuilding et des jeux à synergies (Hearthstone, roguelikes, etc.).

Les débutants complets aux échecs ne sont pas la cible principale. Même pour les joueurs expérimentés, les règles devront être réapprises partiellement.

3. Philosophie de design

Niveau de transformation des échecs : 6,5 / 10

Les échecs restent reconnaissables.
Mais les règles fondamentales peuvent être altérées.

Tout peut être cassé :

le plateau peut changer de taille ;
de nouvelles pièces peuvent apparaître ;
les conditions de victoire peuvent évoluer.

Pas de règles inviolables : si un pouvoir ou une règle spéciale l’autorise, tout est possible.

4. Structure d’une partie

4.1 Déroulement général

Parties live uniquement (temps réel).
Tours alternés, comme aux échecs classiques.
Certains pouvoirs spécifiques peuvent être activés pendant le tour adverse.

4.2 Durée

Durée variable selon :

le mode de jeu ;
les règles choisies ;
la complexité des pouvoirs.

4.3 Conditions de victoire

Le plus souvent par échec et mat.
Toutefois :

la définition même de l’échec et mat peut être modifiée ;
des règles peuvent affecter le roi (immunités, transformations, déplacements alternatifs).

5. Buildcraft \& préparation de partie

Avant chaque partie, les joueurs :

choisissent des pouvoirs associés à leurs pièces ;
définissent certaines règles spécifiques si le mode l’autorise ;
construisent une identité stratégique claire.

L’aléatoire est volontairement secondaire et réservé à des modes spécifiques.

6. Système de cartes (cœur du jeu)

Les cartes constituent le cœur absolu du gameplay. Sans elles, le jeu n’existe pas réellement. Les pièces d’échecs forment un socle stratégique, mais toute l’expressivité, la profondeur et la surprise proviennent du système de cartes.

6.1 Deck \& pioche

Chaque joueur dispose d’un deck de 10 à 15 cartes.
Les cartes sont universelles (pas de factions pour l’instant).
À chaque tour :

le joueur pioche automatiquement une carte (si possible) ;
lorsque le deck est vide, la défausse est mélangée pour reformer un nouveau deck (boucle à la Hearthstone).

Il n’existe pas de défausse volontaire ni de manipulation directe du deck. Certaines cartes spécifiques peuvent cependant :

permettre une pioche supplémentaire ;
revenir en main ou dans le deck ;
être à usage unique.

6.2 Rôle des cartes

Les cartes peuvent absolument tout faire :

modifier ou casser temporairement les règles ;
affecter les pièces (alliées ou ennemies) ;
transformer le plateau ;
créer des fenêtres de jeu explosives ;
retourner complètement une partie si elles sont bien jouées.

Une carte bien utilisée peut changer radicalement le cours du jeu.

6.3 Timing d’utilisation

Les cartes sont jouables avant ou après un déplacement de pièce, selon leur type.
Un tour se termine explicitement par une action de validation (bouton de fin de tour).
Par défaut, les cartes ne sont pas jouables pendant le tour adverse (évolutif selon les modes).

6.4 Système de ressources : points d’action

Le jeu repose sur un système de points d’action (PA) par tour, inspiré de jeux comme Dofus.

Chaque joueur dispose d’un nombre limité de PA par tour.
Les PA sont :

visibles par l’adversaire ;
prédictibles ;
rares et tendus ;
potentiellement explosifs dans certaines configurations.

Les PA peuvent être :

consommés par des cartes ;
consommés par certaines actions de pièces ;
gagnés exceptionnellement via des conditions complexes (cartes, situations, règles custom).

Il n’existe pas de montée automatique rapide des PA. Toute génération est lente, conditionnelle et fortement contrôlée.

6.5 Coûts et rareté

Les cartes ont des coûts variables en PA.
Les cartes les plus puissantes sont :

plus coûteuses ;
plus situationnelles ;
parfois réservées au mid / late game.

Certaines cartes peuvent avoir un coût supérieur au plafond de PA normal, mais devenir jouables via des stratégies spécifiques permettant de dépasser ce plafond temporairement.

6.6 Coûts alternatifs

Outre les PA, certaines cartes peuvent exiger :

le sacrifice d’une pièce ;
l’exposition ou la fragilisation du roi ;
la destruction de cases du plateau ;
un désavantage futur assumé.

Ces coûts narratifs et stratégiques sont pleinement assumés.

6.7 Interaction carte contre carte

Les cartes peuvent :

contrer d’autres cartes ;
annuler ou inverser leurs effets ;
transformer une carte adverse.

Les cartes en main sont cachées.
Certaines cartes spécifiques peuvent être révélées ou rendues visibles.

7. Pièces \& passifs initiaux

Avant la partie, les joueurs peuvent choisir :

un ou plusieurs passifs légers globaux ;
ou des modifications mineures de certaines pièces.

Ces passifs jouent un rôle similaire aux runes de LoL ou aux héros de Hearthstone :

ils définissent une orientation ;
ils ne remplacent jamais le jeu de cartes.

8. Équilibrage, chaos \& conditions de défaite

L’équilibrage fin n’est pas prioritaire dans les premières versions.
Le chaos est assumé, mais contrôlé par les coûts, le timing et la rareté.

8.1 Conditions de défaite

Une défaite peut survenir par :

mauvaise gestion des cartes ;
erreurs stratégiques aux échecs ;
incompréhension ou sous-estimation des synergies adverses.

Ces trois causes doivent coexister.

8.2 Échec et mat

L’échec et mat existe toujours.
Il est volontairement plus difficile à atteindre que dans les échecs classiques.
Les cartes permettent fréquemment de :

retarder ;
empêcher ;
détourner un mat imminent.

Les ouvertures rapides et triviales (ex : mat du berger) doivent être structurellement impossibles.

8. Équilibrage \& comeback

8.1 État actuel

L’équilibrage fin n’est pas une priorité immédiate.
L’objectif initial est de créer des mécaniques amusantes et expressives.

8.2 Principes

Aucun joueur ne doit devenir totalement intouchable.
Des mécaniques de comeback doivent exister, même indirectes.

9. Modes de jeu

9.1 Mode standard

Buildcraft avant partie.
Pouvoirs visibles.
Règles custom limitées.

9.2 Modes alternatifs (plus tard)

Pouvoirs partiellement ou totalement aléatoires.
Déblocage de pouvoirs en cours de partie.
Variantes inspirées de jeux type Clash Royale.

10. Online \& social

Matchmaking live.
Classement ELO-like.
Parties privées.
Partage de presets de règles.
Mode sandbox pour expérimenter librement.

11. Progression \& méta-jeu

Déblocage via :

XP ;
ranking ;
succès.

Pas de lootboxes à court terme.
Modèle proche de LoL / Hearthstone :

progression débloque du contenu ;
chacun joue avec ce qu’il a débloqué.

12. Identité des parties

Les parties doivent être mémorables, même si la forme exacte n’est pas encore figée :

“Cette partie-là, c’était celle du cavalier destructeur.”

L’identité d’une partie repose sur :

le build choisi ;
les synergies exploitées ;
les règles actives.

13. Direction artistique \& feeling

Ton : fun, absurde par moments, jamais dark.
Univers visuel : riche, potentiellement chargé.
Lisibilité : secondaire face à la profondeur.
Courbe d’apprentissage assumée.

14. Déroulement détaillé d’un tour

Un tour de jeu est structuré de manière claire afin de conserver un rythme lisible malgré la complexité des systèmes.

14.1 Début de tour

Rafraîchissement des points d’action (PA)

Le joueur récupère son nombre de PA de base.
Les bonus ou malus persistants sont appliqués.

Pioche

Le joueur pioche automatiquement 1 carte.
Si le deck est vide, la défausse est mélangée pour former un nouveau deck.

Résolution des effets de début de tour

Effets passifs.
Effets conditionnels déclenchés par l’état du plateau.

14.2 Phase d’actions

Pendant cette phase, le joueur peut, dans l’ordre qu’il souhaite :

jouer une ou plusieurs cartes (dans la limite de ses PA et du plafond par tour) ;
déplacer des pièces ;
activer certaines capacités de pièces (si elles en disposent).

Les actions consomment des PA.

Certaines cartes :

doivent être jouées avant un déplacement ;
d’autres après ;
certaines modifient directement les règles du tour en cours.

Il n’existe pas de limite stricte au nombre d’actions, seulement une limite indirecte via les PA.

14.3 Fin de tour

Le joueur valide explicitement la fin de son tour.
Les effets de fin de tour sont résolus.
Les effets temporaires expirent si nécessaire.

15. Exemples de cartes

Les cartes ci-dessous sont des exemples conceptuels destinés à illustrer la philosophie du système.

15.1 Fracture de ligne

Coût : 2 PA
Timing : avant déplacement
Effet : choisissez une ligne (rangée ou colonne). Jusqu’à votre prochain tour, aucune pièce ne peut traverser cette ligne.
Type : contrôle de plateau

15.2 Surcharge tactique

Coût : 0 PA
Coût alternatif : votre roi ne peut pas se déplacer pendant 2 tours
Timing : après déplacement
Effet : gagnez immédiatement 2 PA supplémentaires ce tour.
Type : accélération / risque

15.3 Sacrifice calculé

Coût : 1 PA
Timing : à tout moment pendant votre tour
Effet : sacrifiez une de vos pièces non-roi. Piochez 2 cartes.
Type : ressource / tempo

15.4 Champ instable

Coût : 3 PA
Timing : avant déplacement
Effet : choisissez 3 cases. Jusqu’à la fin de la partie, ces cases deviennent instables : toute pièce qui s’y arrête perd 1 PA à son propriétaire au prochain tour.
Type : altération persistante du plateau

15.5 Décret d’urgence

Coût : 4 PA (au-dessus du plafond standard)
Condition spéciale : jouable uniquement si vous contrôlez moins de pièces que votre adversaire
Timing : début de tour
Effet : annulez tous les effets persistants actifs jusqu’à la fin du tour adverse.
Type : comeback / reset partiel

16. Pitch final

Chess Evolved est un jeu de stratégie en ligne où l’échiquier sert de champ de bataille à un système de cartes profond, explosif et exigeant, capable de transformer chaque partie en une expérience unique et mémorable.

voila un projet, qu'est ce que tu pense qu'il faut utiliser comme stack technique, je pense a 2 choix, soit unity, soit TS

Pour Chess Evolved tel que tu le décris, je partirais clairement sur une stack web **TypeScript** plutôt que Unity pour la première version jouable, surtout vu ton profil actuel.[^1_1]

## Pourquoi TypeScript est plus logique ici

- Ton jeu est fondamentalement un jeu de logique, de règles et de cartes, pas un jeu d’animation/3D où Unity brille.[^1_2][^1_3]
- Tu es déjà très solide en **TS** et en environnement web strictement typé, donc tu réduis la friction, les réécritures et la dette technique.
- C’est un jeu online, temps réel mais tour par tour : un front web + backend temps réel (WebSocket) colle parfaitement à ce besoin.[^1_4][^1_5]
- Unity WebGL est souvent jugé lourd et peu optimal pour du web pur, surtout pour des jeux de stratégie/boardgame où le CPU et la bande passante importent plus que le rendu.[^1_6][^1_7][^1_1]


### Stack TS concrète que je te proposerais

Frontend (web uniquement au début)

- Framework : React ou Vue/Nuxt (vu ton usage de Nuxt, je pousserais Nuxt 3 / Vue 3 + TypeScript strict).
- Rendu échiquier \& UI :
    - Soit canvas minimal (PixiJS si tu veux du confort),
    - Soit DOM/SVG si tu veux aller très vite au début (l’important est la lisibilité, pas les effets).[^1_1]
- State management : Zustand/Redux (React) ou Pinia (Vue) pour gérer : état de la partie, main de cartes, PA, effets persistants.

Backend temps réel

- Node.js + TypeScript strict (Express/Fastify + WebSocket comme ws ou Socket.IO).[^1_5][^1_4]
- Modèle : serveur autoritaire qui applique les règles (déplacements, cartes, PA, conditions de victoire) pour éviter la triche.
- Persistance :
    - Phase proto : PostgreSQL ou même SQLite pour stocker comptes, decks, presets, replays.
    - Plus tard : base + Redis pour matchmaking/ELO si besoin.[^1_8][^1_2]

Moteur “règles / simulation”

- Noyau pur TS, sans dépendance UI :
    - Représentation du plateau, des pièces, de l’état (PA, effets persistants, cartes en main/pioche/défausse).
    - Système d’effets / cartes : pattern data-driven (JSON/TS objects + moteur d’interprétation) pour pouvoir ajouter des cartes sans recoder le moteur à chaque fois.
- Ce module est partagé entre le backend (source de vérité) et éventuellement le front pour des prévisualisations locales.

Multijoueur \& infra

- Protocole : WebSocket, messages structurés avec des types partagés (via un monorepo type Turborepo / pnpm workspace pour partager les types TS entre front et back).
- Hébergement :
    - Phase alpha : un simple VPS (Docker ou non) + reverse proxy (Caddy/NGINX).
    - Plus tard : scaling horizontal des serveurs de parties (chaque instance gère N rooms), avec un petit service de matchmaking.


## Quand Unity devient intéressant malgré tout

Unity peut avoir du sens si :

- Tu veux absolument sortir très tôt sur mobile/desktop avec une **même** base client, et tu acceptes la lourdeur WebGL.[^1_3][^1_2][^1_8]
- Tu veux pousser la DA vers quelque chose de plus animé, avec effets visuels lourds, camera moves, etc.
- Tu aimes l’écosystème Unity (Asset Store, Netcode for GameObjects, Photon, PlayFab, etc.) et tu es prêt à monter en compétence C\# + Unity.[^1_2][^1_8]

Mais :

- Pour un jeu de cartes + règles complexes très typé “web”, l’overhead Unity (builds lourds, WebGL capricieux, perfs CPU moindres) sera souvent un frein, surtout en solo/ petite équipe.[^1_7][^1_6][^1_1]


## Reco finale

- Prototype jouable + itération sur le système de cartes et de règles : stack full **TypeScript** (front web + backend Node).
- Si, plus tard, tu veux une version “premium” desktop/mobile avec une DA plus spectaculaire, tu pourras envisager un client Unity qui parle au même backend réseau.

Si tu veux, je peux te proposer un schéma concret d’architecture (modules TS, types d’events WebSocket, structure du moteur de règles) adapté exactement aux mécaniques que tu as décrites.
<span style="display:none">[^1_10][^1_11][^1_12][^1_9]</span>

<div align="center">⁂</div>

[^1_1]: preferences.typescript_strictness

[^1_2]: https://www.reddit.com/r/gamedev/comments/1niql4l/webbased_turnbased_strategy_game/

[^1_3]: https://www.getgud.io/blog/how-to-create-a-multiplayer-game-that-scales-the-ultimate-tech-stack-guide/

[^1_4]: https://www.visartech.com/blog/visartech-tech-stack-frontend/

[^1_5]: work.development_environment

[^1_6]: https://news.ycombinator.com/item?id=32054857

[^1_7]: https://www.reddit.com/r/AskProgramming/comments/154jc29/what_tools_do_i_need_for_a_turnbased_multiplayer/

[^1_8]: https://www.reddit.com/r/Unity3D/comments/4dl8dl/unity_webgl_benchmarks_limitations_and_suggestions/

[^1_9]: https://backtrace.io/blog/memory-and-performance-issues-in-unity-webgl-builds

[^1_10]: https://uversedigital.com/2025/07/29/choosing-the-right-multiplayer-framework-for-your-game-in-2025/

[^1_11]: https://www.reddit.com/r/gamedev/comments/ftroed/recommended_tech_stack_for_a_chatbased/

[^1_12]: https://www.youtube.com/watch?v=9EAEc965kys


---

# Prend en compte cela, j'aimerais que le jeu soit jouable sur PC et Mobile, facilement

Que me recommande tu ??

Je ne pense pas que le jeux puisse avoir une refonte complete, donc le premier choix sera final

Pour un jeu comme Chess Evolved, jouable sur PC **et** mobile, avec un choix de stack “définitif”, je te recommande de partir sur une **stack web TypeScript + PWA** plutôt que Unity.[^2_1][^2_2][^2_3]

## Pourquoi TS + Web est le meilleur compromis

- Un seul client web responsive couvre directement PC, tablette et mobile via navigateur, sans store ni builds séparés.[^2_4][^2_1]
- En ajoutant une couche PWA, les joueurs peuvent “installer” le jeu sur mobile (icône, plein écran, cache) avec une expérience proche d’une app native.[^2_5][^2_3][^2_6]
- Pour un jeu de plateau/stratégie, les contraintes de perfs sont largement gérables avec une app web bien optimisée, alors que Unity WebGL reste plus lourd, surtout sur mobile.[^2_7][^2_8][^2_9]
- Tu restes à 100% dans un écosystème que tu maîtrises (TS strict, tooling web), ce qui est crucial si tu ne veux pas de refonte totale plus tard.


## Architecture concrète recommandée

Frontend

- Framework : **Nuxt 3 / Vue 3 + TypeScript** (logique avec ce que tu utilises déjà).
- Layout responsive pensé mobile-first :
    - Plateau centré, zoom/scroll contrôlé, UI cartes et PA qui se réorganise entre mobile (pile verticale) et desktop (panneaux latéraux).[^2_2][^2_1][^2_4]
- Intégration PWA : manifest, Service Worker (Nuxt PWA module ou équivalent) pour installation, cache, temps de chargement raisonnables sur mobile.[^2_3][^2_6][^2_5]

Backend

- Node.js + TypeScript, serveur autoritaire pour les règles, WebSocket pour les parties live.[^2_10][^2_11]
- Même moteur de règles partagé entre front et back pour garantir la cohérence (monorepo TS).


## Comment assurer la jouabilité mobile dès le début

- Prototyper très tôt l’UX mobile (petits écrans, contrôles tactiles, lisibilité des cartes/effects) et ne jamais traiter mobile comme un “port” après coup.[^2_8][^2_1][^2_4]
- Limiter les assets lourds, animations coûteuses et effets inutiles pour garder de bonnes perfs sur smartphones moyens de gamme.[^2_6][^2_3]
- Tester constamment sur un téléphone réel, pas seulement dans un viewport responsive de navigateur.[^2_1][^2_6]


## Pourquoi ne pas choisir Unity comme base unique

- Unity est excellent pour le **multi-plateforme** avec un seul codebase, mais la cible “web + mobile browser” devient nettement plus lourde (WebGL, tailles de builds, temps de chargement), ce qui est overkill pour un jeu de plateau très systémique.[^2_12][^2_9][^2_7]
- Si tu figes Unity maintenant, tu t’enfermes dans C\#/Unity pour tout (UI, réseau, logique) et tu perds ton avantage de productivité en TS strict.[^2_7]

Si tu veux, je peux te détailler un plan plus précis de l’UI responsive (disposition plateau/cartes/infos) ou t’esquisser la structure du monorepo TS (packages front, back, moteur de règles partagé, types réseau).
<span style="display:none">[^2_13][^2_14][^2_15]</span>

<div align="center">⁂</div>

[^2_1]: https://www.linkedin.com/advice/3/how-can-you-design-responsive-web-game-different-devices-lad3c

[^2_2]: https://blog.flatironschool.com/from-board-game-to-app-how-to-build-a-single-page/

[^2_3]: https://thisisglance.com/learning-centre/do-pwas-perform-as-well-as-native-mobile-apps

[^2_4]: https://bubble.io/blog/responsive-web-app/

[^2_5]: https://www.reddit.com/r/PWA/comments/1fwlnaq/i_created_a_pwa_mobile_game/

[^2_6]: https://appinstitute.com/how-to-optimize-pwa-for-mobile-performance/

[^2_7]: https://www.arnia.com/unity-in-2025-the-ultimate-engine-for-cross-platform-app-and-game-development/

[^2_8]: https://www.reddit.com/r/gamedev/comments/1capgiq/how_to_make_my_game_responsive/

[^2_9]: https://backtrace.io/blog/memory-and-performance-issues-in-unity-webgl-builds

[^2_10]: preferences.typescript_strictness

[^2_11]: work.development_environment

[^2_12]: https://news.ycombinator.com/item?id=32054857

[^2_13]: https://www.reddit.com/r/AskProgramming/comments/154jc29/what_tools_do_i_need_for_a_turnbased_multiplayer/

[^2_14]: https://unity.com/blog/highlights-from-unite-2025-keynote

[^2_15]: https://www.reddit.com/r/webdev/comments/1mapyte/in_july_2025_is_there_a_way_to_build_once_for_web/

