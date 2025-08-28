# pacman
Utilitaire de gestion de package
## Installer un package avec pacman
- `-S`, `--sync` Synchroniser les paquets. Les paquets sont installés directement depuis les dépôts distants, y compris toutes les dépendances nécessaires à leur exécution 
- Par exemple, `pacman -S qt` télécharge et installe qt et tous les paquets dont il dépend
- Si un nom de paquet existe dans plusieurs dépôts, vous pouvez spécifier explicitement le dépôt pour préciser le paquet à installer : `pacman -S testing/qt`
- Vous pouvez également spécifier la version requise : `pacman -S "bash>=3.2"`
  - Les guillemets sont nécessaires, sinon le shell interprète `>` comme une redirection vers un fichier
- Vous pouvez aussi utiliser `pacman -Su` pour mettre à jour tous les packages périmés
### Gestion des versions via pacman
- Lors d'une mise à jour, pacman compare les versions pour déterminer quels packages ont besoin d'être mis à jour. Cette opération se déroule comme ceci :
  - **__Alphanumérique__**: `1.0a` < `1.0b` < `1.0beta` < `1.0p` < `1.0pre` < `1.0rc` < `1.0` < `1.0.a` < `1.0.1`
  - **__Numérique__**: `1` < `1.0` < `1.1` < `1.1.1` < `1.2` < `2.0` < `3.0.0`
- De plus, il est possible d'intégrer une valeur date au nom de version : celle-ci sera prioritaire pour les comparaisons de version, à moins bien sûr que deux valeurs de date ne soient égales
  - Le format de date est `version`-`rel`
  - Par exemple `2:1.0-1` est toujours plus récent que `1:3.6-1`
## Supprimer un package avec pacman
- `-R`, `--remove` Supprime des packages de votre système
- On peut aussi marquer des groupes à supprimer : dans ce cas tous les packages du groupe seront supprimés
- Les fichiers appartenant aux packages précisés seront supprimés et la base de donnée sera mise à jour
- La plupart des fichiers de configuration seront sauvegardés avec l'extension .pacsave sauf si l'option --nosave est saisie
## Mettre à jour un paque via pacman
- `-U`, `--upgrade` Mettez à niveau ou ajoutez des packages au système et installez les dépendances requises depuis les dépôts de synchronisation
- Vous pouvez spécifier une URL ou un chemin d'accès
- Il s'agit d'un processus de type « suppression puis ajout »
## Ne pas demander la confirmation de pacman
- `--noconfirm` Acquitte automatiquement tous les messages et demandes de confirmation
- À éviter sauf si vous souhaitez exécuter pacman dans un script
## Installer uniquement les packages requis avec pacman
- `--needed` Installe seulement la cible qui n'est pas installée ou à jour.
## Lister les fichiers d'un package pacman
- `-l <package>`, `--list <package>` Liste tous les fichiers inclus dans `<package>`
- Plusieurs packages peuvent être donnés sur la ligne de commande
## Chercher un package avec pacman
### Chercher un package pacman installé via search
- `-s`, `--search <regexp>` Recherchez dans chaque package installé localement les noms ou descriptions correspondant à l'expression régulière
- Lorsque vous incluez plusieurs termes de recherche, seuls les packages dont les descriptions correspondent à TOUS ces termes sont renvoyés
### Chercher un package pacman installé via query
- `-Q`, `--query` Interroger la base de données des packages
- Cette opération permet de visualiser les packages installés et leurs fichiers, ainsi que les méta-informations sur chaque package (dépendances, conflits, date d'installation, date de compilation, taille)
- Cette opération peut être effectuée sur la base de données locale des packages ou sur des fichiers de packages individuels
  - Dans le premier cas, si aucun nom de package n'est fourni en ligne de commande, tous les packages installés seront interrogés
- De plus, différents filtres peuvent être appliqués à la liste des packages. Voir `--query`
## Nettoyer le cache de pacman
- `-c`, `--clean` Supprimez du cache les paquets qui ne sont plus installés ainsi que les bases de données de synchronisation actuellement inutilisées pour libérer de l'espace disque
- Lorsque pacman télécharge des paquets, il les enregistre dans un répertoire de cache
  - De plus, les bases de données sont enregistrées pour chaque base de données de synchronisation téléchargée et ne sont pas supprimées
- Utilisez un paramètre `--clean` pour supprimer uniquement les paquets qui ne sont plus installés
  - Utilisez-en deux pour supprimer tous les fichiers du cache
  - Dans les deux cas, vous aurez le choix entre oui et non pour supprimer les paquets et/ou les bases de données téléchargées inutilisées
## Mettre à jour le système via pacman
- `-u`, `--sysupgrade` Met à jour tous les packages périmés
- Chaque package installé sur votre système va être examiné et mis à jour si un package plus récent existe
  - Une liste de tous les packages à mettre à jour sera affichée et demandera une confirmation à l'utilisateur avant de lancer la mise à jour
  - Les dépendances sont automatiquement résolues et sont installés ou mises à jour si besoin
- Soumettre cette option deux fois pour activer la rétrogration de package
  - Dans ce cas pacman va sélectionner les packages synchronisés dont la version ne correspond pas avec la version locale
  - Cela peut être utile pour les utilisateurs qui passent du dépôt testing au dépôt stable.
- Il est possible de spécfier manuellement d'autres cibles : ainsi `-Su <package>` déclenchera une mise à jour du système pour installer ou mettre à jour le package
## Mettre à jour les bases de données pacman
- `-y`, `--refresh` Téléchargez une nouvelle copie des bases de données des dépôts de packages `repo.db` depuis le(s) serveur(s) défini(s) dans `pacman.conf`
## Installer un package local via pacman
`pacman -U <path><package>.pkg.tar.gz` Permet d'installer un paquet sous la forme de fichier