# Les shells linux
## Évolution des Shells Unix : de Thompson à Bash
Voici un résumé chronologique structuré pour un cours, détaillant la transition des premiers interpréteurs de commandes vers le standard moderne
### Le Thompson Shell (1971) : L'origine interactive
Créé par Ken Thompson et introduit avec la **Version 1 d'Unix** le **3 novembre 1971**, le *Thompson shell* (`sh`) est l'ancêtre de tous les shells Unix
- **Concept :** Il fonctionnait principalement comme un interpréteur de commandes interactif simple
- **Limitations majeures :** Il ne possédait pas de langage de programmation intégré. Les structures de contrôle (comme `if` ou `goto`) et la gestion des variables devaient être appelées via des programmes externes (`/bin/if`, `/bin/glob`)
- **Innovations :** Il a introduit les concepts fondamentaux de redirection (`<`, `>`) et de tuyaux (piping), bien que la syntaxe des tuyaux ait évolué (d'abord `>`, puis `^`, et enfin `|`)

### Le PWB/Mashey Shell (1975-1977) : La transition
Développé par John Mashey pour le *Programmer's Workbench UNIX*, ce shell est une extension du Thompson shell
- **Apport :** Il a introduit les premières **variables shell** et des mécanismes de contrôle de flux rudimentaires directement dans l'interpréteur, tentant de combler le fossé entre l'interaction simple et le scriptable
- **Statut :** Il reste une étape intermédiaire, contraint par la nécessité de conserver la compatibilité avec le Thompson shell

### Le Bourne Shell (1977-1979) : La révolution du scripting
Écrit par Stephen Bourne aux laboratoires Bell, il fut officiellement publié avec la **Version 7 d'Unix en 1979** (développement débuté vers 1977)
- **Rupture technologique :** Contrairement à son prédécesseur, il fut conçu dès le départ comme un **langage de script puissant**. Il introduit la syntaxe `if/then/else`, les boucles `for/while`, les variables typées et la substitution de commandes
- **Syntaxe :** Inspiré par le langage **Algol 68**, il adopte la syntaxe `$variable` et le caractère `#` pour les commentaires (ajouté vers 1981)
- **Performance :** Une grande partie du développement fut consacrée à l'optimisation de la vitesse d'exécution des scripts, surpassant le Thompson shell sur ce point. Il devint le standard pour l'administration système (`/bin/sh`)

### Le C Shell (1978) : L'alternative interactive
Développé parallèlement par Bill Joy à l'Université de Berkeley et sorti en **1978** (2BSD)
- **Objectif :** Améliorer l'expérience utilisateur interactive (et non le scripting)
- **Fonctionnalités clés :** Historique des commandes, alias, et contrôle des jobs (exécution en arrière-plan). Sa syntaxe imite le langage **C**, ce qui le rendit populaire auprès des développeurs mais moins adapté aux scripts complexes que le Bourne shell

### Le Korn Shell (ksh) (1983) : L'hybridation professionnelle
Développé par David Korn aux laboratoires Bell et publié en **1983**, le *Korn Shell* (`ksh`) représente une étape charnière visant à unifier la puissance du scripting système avec le confort de l'interaction utilisateur

Alors que l'univers Unix était divisé entre le Bourne shell (excellent pour le scripting mais pauvre en interaction) et le C Shell (apprécié des utilisateurs pour son historique et ses alias, mais critiqué pour ses scripts peu portables), David Korn a conçu le ksh pour combler cette lacune

L'objectif était de créer un interpréteur unique capable de satisfaire à la fois les administrateurs systèmes et les développeurs interactifs, tout en restant totalement compatible avec le standard industriel de l'époque, le Bourne shell

Le Korn Shell se distingue par l'intégration native de fonctionnalités qui nécessitaient auparavant des outils externes ou étaient absentes :
- **Compatibilité et Extension** : Il est entièrement compatible avec la syntaxe du Bourne shell (sh), garantissant l'exécution des scripts existants, tout en y ajoutant des extensions puissantes
- **Fonctionnalités Interactives** : Il intègre enfin dans un shell de type Bourne l'historique des commandes, l'édition de ligne (permettant de modifier une commande avant validation avec des raccourcis type emacs ou vi) et la complétion automatique
- **Programmation Avancée** : Le ksh introduit des concepts de programmation structurée absents de ses prédécesseurs directs, tels que les tableaux (arrays), les fonctions shell natives, et un traitement arithmétique entier plus robuste ($((expression))). Il permet également une gestion fine des signaux et des processus
- **Performance** : Conçu avec un accent particulier sur l'efficacité, le Korn Shell est souvent plus rapide à l'exécution que le Bourne shell et le C Shell, notamment grâce à une implémentation optimisée des built-in commands

### Le Bourne-Again Shell (Bash) (1989) : La synthèse moderne
Créé par Brian Fox pour le projet **GNU** et publié le **8 juin 1989**
- **Philosophie :** "Bourne Again" est un jeu de mots signifiant à la fois "né de nouveau" et "encore Bourne". Il est conçu pour être compatible avec le *Bourne shell* tout en intégrant les meilleures fonctionnalités interactives du *C shell* et du *Korn shell* (ksh, 1983)
- **Apports majeurs :** Il combine la puissance de script du Bourne shell avec l'historique des commandes, l'édition de ligne (modes emacs/vi), la complétion par tabulation et l'arithmétique entière
- **Statut actuel :** Il est devenu le shell par défaut de la plupart des distributions **Linux** et de macOS (jusqu'en 2019), servant de standard de facto pour le scripting portable