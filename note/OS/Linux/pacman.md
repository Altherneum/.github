# pacman
Utilitaire de gestion de package
## Installer un package avec pacman
- `-S`, `--sync` Synchroniser les paquets
  - Les paquets sont installés directement depuis les dépôts distants, y compris toutes les dépendances nécessaires à leur exécution 
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
- `pacman -U`, `--upgrade` Mettez à niveau ou ajoutez des packages au système et installez les dépendances requises depuis les dépôts de synchronisation
- Vous pouvez spécifier une URL ou un chemin d'accès
- Il s'agit d'un processus de type « suppression puis ajout »
## Ne pas demander la confirmation de pacman
- `pacman --noconfirm <PACKAGE>` Acquitte automatiquement tous les messages et demandes de confirmation
- À éviter sauf si vous souhaitez exécuter pacman dans un script
## Installer uniquement les packages requis avec pacman
- `pacman --needed <PACKAGE>` Installe seulement la cible qui n'est pas installée ou à jour.
## Chercher un package avec pacman
### Chercher un package pacman installé via query
- `pacman -Q`, `--query` Interroger la base de données des packages
- Cette opération permet de visualiser les packages installés et leurs fichiers, ainsi que les méta-informations sur chaque package (dépendances, conflits, date d'installation, date de compilation, taille)
- Cette opération peut être effectuée sur la base de données locale des packages ou sur des fichiers de packages individuels
  - Dans le premier cas, si aucun nom de package n'est fourni en ligne de commande, tous les packages installés seront interrogés
- De plus, différents filtres peuvent être appliqués à la liste des packages. Voir `--query`
#### Chercher un package pacman installé via query et grep
- `pacman -Q | grep <PACKAGE>`
### Lister les dossiers d'un package pacman
- `pacman -Qo <package>`, `--owns --query <package>` Liste tous les dossiers inclus dans `<package>`
- Plusieurs packages peuvent être donnés sur la ligne de commande
### Lister les fichiers d'un package pacman
- `pacman -Ql <package>`, `--list --query <package>` Liste tous les fichiers inclus dans `<package>`
- Plusieurs packages peuvent être donnés sur la ligne de commande
## Nettoyer le cache de pacman
- `pacman -c <PACKAGE>`, `--clean` Supprimez du cache les paquets qui ne sont plus installés ainsi que les bases de données de synchronisation actuellement inutilisées pour libérer de l'espace disque
- Lorsque pacman télécharge des paquets, il les enregistre dans un répertoire de cache
  - De plus, les bases de données sont enregistrées pour chaque base de données de synchronisation téléchargée et ne sont pas supprimées
- Utilisez un paramètre `--clean` pour supprimer uniquement les paquets qui ne sont plus installés
  - Utilisez-en deux pour supprimer tous les fichiers du cache
  - Dans les deux cas, vous aurez le choix entre oui et non pour supprimer les paquets et/ou les bases de données téléchargées inutilisées
## Supprimer le lock de pacman
`sudo rm /var/lib/pacman/db.lck` Permet de supprimer le fichier `db.lck` A.K.A `database.lock` vérouillant pacman
## Supprimer les paquets temporaires
- `pacman -Scc` Permet de supprimer les paquets temporaires 
  - Peut débloquer pacman dans le cas : `erreur : la synchronisation de toutes les bases de données a échoué (verrouillage de la base de données impossible)`
## Mettre à jour via pacman
### Mettre à jour le système via pacman
- `-u`, `--sysupgrade` Met à jour tous les packages périmés
- Chaque package installé sur votre système va être examiné et mis à jour si un package plus récent existe
  - Une liste de tous les packages à mettre à jour sera affichée et demandera une confirmation à l'utilisateur avant de lancer la mise à jour
  - Les dépendances sont automatiquement résolues et sont installés ou mises à jour si besoin
- Soumettre cette option deux fois pour activer la rétrogration de package
  - Dans ce cas pacman va sélectionner les packages synchronisés dont la version ne correspond pas avec la version locale
  - Cela peut être utile pour les utilisateurs qui passent du dépôt testing au dépôt stable.
### Mettre à jour les bases de données pacman
- `-y`, `--refresh` Téléchargez une nouvelle copie des bases de données des dépôts de packages `repo.db` depuis le(s) serveur(s) défini(s) dans `pacman.conf`
- L'ajout de deux options `--refresh` ou `-y` forcera l'actualisation de toutes les bases de données de paquets, même si elles semblent être à jour
  - N'est nécessaire que dans des cas rares, comme après un changement manuel du fichier `mirrorlist`, ou si les bases de données sont corrompues.
  - Son utilisation fréquente est inutile et consomme inutilement la bande passante des miroirs.
- Le triple `-y` (`-Syyy`) N'a aucun effet supplémentaire
  - Le système ignore tout au-delà de deux y, car le niveau de force est déjà atteint avec deux 
## Mettre tout à jour via pacman
- `pacman -Syu`
  - `s` Permet de synchroniser / installer
  - `y` Permet de télécharger une copie fraiche du `repo.db`
  - `u` Permet de mettre à jour tout les paquets périmés
- ⚠️ Conseil
  - Suivre les recommandations de l' Wiki est essentiel
  - Les guides tiers, notamment sur YouTube, peuvent promouvoir des pratiques inutiles comme `-Syyu` ou `-Syyyu`
  - Utilisez `pacman -Syu` pour la mise à jour quotidienne 
## Installer un package local via pacman
`pacman -U <path><package>.pkg.tar.gz` Permet d'installer un paquet sous la forme de fichier
## Vérifier la raison de l'installation d'un package
- `pacman -Qi <PACKAGE>`
  - `-Q` Query
  - `-i` Affiche les informations d'un paquet (`-ii` pour les fichiers de configuration protégés)
### Exemple d'information sur un package
Exemple des informations du package `pacman`, via `pacman -Qi pacman`
```
Nom                      : pacman
Version                  : 7.0.0.r6.gc685ae6-6
Description              : A library-based package manager with dependency support
Architecture             : x86_64
URL                      : https://www.archlinux.org/pacman/
Licences                 : GPL-2.0-or-later
Groupes                  : --
Fournit                  : libalpm.so=15-64
Dépend de                : bash  coreutils  curl  libcurl.so=4-64  gawk  gettext  glibc  gnupg  gpgme  libgpgme.so=45-64  grep  libarchive  libarchive.so=13-64  openssl  libcrypto.so=3-64  pacman-mirrorlist  systemd
Dépendances opt.         : base-devel: required to use makepkg [installé]
                           perl-locale-gettext: translation support in makepkg-template
Requis par               : appstream-glib  archlinux-keyring  base  base-devel  yay
Optionnel pour           : --
Est en conflit avec      : --
Remplace                 : --
Taille installée         : 4,82 MiB
Paqueteur                : Christian Hesse <eworm@archlinux.org>
Compilé le               : mar. 03 juin 2025 23:33:38
Installé le              : lun. 08 sept. 2025 03:34:01
Motif d’installation     : Installé comme dépendance d’un autre paquet
Script d’installation    : Non
Validé par               : Signature
```
