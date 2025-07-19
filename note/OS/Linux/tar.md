# tar
- Le terme `tar` signifie `Tape Archiver`
- Il sert d'utilitaire de ligne de commande utilisé dans les systèmes d'exploitation Linux et de type Unix
- Il permet de créer et gérer des fichiers d'archive
- Il est couramment utilisé pour regrouper plusieurs fichiers et répertoires dans un seul fichier d'archive, qui peut ensuite être compressé à l'aide de divers algorithmes de compression tels que gzip ou bzip2

Extrait de `man tar`

## tar exemples
### Gestion des zip avec tar
- `tar -acf [FILE].zip [PATH]` Crée un fichier zip nommé `[FILE].zip` vers le dossier `[PATH]`
  - `unzip -o [FILE].zip -d [PATH]`, ou `tar −xvf [FILE].zip −C [PATH]` Extrait le zip nommé `[FILE].zip` vers le dossier `[PATH]`
### Compresser avec tar
- `tar -cf [FILE] [FILE2] [FILE3]...` Crée `[FILE]` à partir des fichiers `[FILE2]` et `[FILE3]`
  - `tar -cf [FILE] [FILE2] [FILE3]... -C [PATH]` Crée `[FILE]` à partir des fichiers `[FILE2]` et `[FILE3]` vers `[PATH]`
### Lister avec tar
- `tar -tvf [FILE]` Lister tous les fichiers dans `[FILE]` de manière verbose
### Extraire avec tar
- `tar -xf [FILE]` Extraire tous les fichiers de `[FILE]`
  - `tar -zxf [FILE]` Extraire tous les fichiers de `[FILE]` avec gzip
  - `tar -zxf [FILE] -C [PATH]` Extraire tous les fichiers de `[FILE]` avec gzip vers `[PATH]`

## Main operation mode
- `-A,`, `--catenate`, `--concatenate` ajouter des fichiers tar à une archive
- `-c,`, `--create` créer une nouvelle archive
- `--delete` supprimer de l'archive (pas sur les bandes magnétiques !)
- `-d,`, `--diff`, `--compare` trouver les différences entre l'archive et le système de fichiers
- `-r,`, `--append` ajouter des fichiers à la fin d'une archive
- `--test-label` tester l'étiquette du volume de l'archive et quitter
- `-t,`, `--list` lister le contenu d'une archive
- `-u,`, `--update` seulement ajouter les fichiers plus récents que la copie dans l'archive
- `-x,`, `--extract`, `--get` extraire des fichiers d'une archive

## Operation modifiers
- `--check-device` vérifie les nombres de périphériques lors de la création d'archives incrémentales (par défaut)
- `-g,`, `--listed-incremental=FILE` gère une nouvelle sauvegarde avancée GNU-format
- `-G,`, `--incremental` gère une ancienne sauvegarde GNU-format
- `--hole-detection=TYPE` utilise une technique pour détecter les trous
- `--ignore-failed-read` ne fait pas sortir le système avec un nombre non nul lorsque des fichiers sont illisibles
- `--level=NUMBER` affiche le niveau de dump pour l'archive listée incrémentale créée
- `--no-check-device` n’examine pas les nombres de périphériques lors de la création d’archives incrémentales
- `--no-seek` l’archive ne peut pas être rechercher
- `-n,`, `--seek` l’archive peut être rechercher
- `--occurrence[=NUMBER]` processe uniquement le `[NUMBER]`ème événement de chaque fichier dans l'archive ; cette option est valide uniquement avec l'un des commandes `--delete`, `--diff`, `--extract` ou `--list` et lorsque une liste de fichiers est donnée soit sur la ligne de commande, soit via l’option `-T`
- `--sparse-version=MAJOR[.MINOR]` définit la version du format sparse (implique `--sparse`)
- `-S,`, `--sparse` gère efficacement les fichiers sparses

## Local file name selection
- `--add-file=FILE` ajoute le fichier `FILE` à l'archive (utile si son nom commence par un point)
- `-C,`, `--directory=DIR` change vers le répertoire `DIR`
- `--exclude=PATTERN` exclut les fichiers, donnés comme `PATTERN`
- `--exclude-backups` exclut les fichiers de sauvegarde et les fichiers bloqués
- `--exclude-caches` exclut les contenus des dossiers contenant `CACHEDIR.TAG`, à l'exception du fichier lui-même
- `--exclude-caches-all` exclut les dossiers contenant `CACHEDIR.TAG`
- `--exclude-caches-under` exclut tout le contenu sous les dossiers contenant `CACHEDIR.TAG`
- `--exclude-ignore=FILE` lit les patterns d’exclusion pour chaque répertoire depuis `FILE`, si elle existe
- `--exclude-ignore-recursive=FILE` lit les patterns d’exclusion pour chaque répertoire et ses sous-répertoires depuis `FILE`, si elle existe
- `--exclude-tag=FILE` exclut tout ce qui se trouve dans les dossiers contenant `FILE`, à l'exception de `FILE` lui-même
- `--exclude-tag-all=FILE` exclut les dossiers contenant `FILE`
- `--exclude-tag-under=FILE` exclut tout ce qui se trouve sous les dossiers contenant `FILE`
- `--exclude-vcs` exclut les domaines de contrôle de version (version control)
- `--exclude-vcs-ignores` lit les patterns d’exclusion à partir des fichiers VCS ignore
- `--no-null` désactive l’effet de l’option précédente --null
- `--no-recursion` évite la récursion dans les sous-dossiers (par défaut)
- `--no-unquote` ne traite pas le caractère nul de l’entrée ou des noms de membres (par défaut)
- `--no-verbatim-files-from` `-T` traite les noms de fichiers commençant par un point comme options (par défaut)
- `--null` `-T` lit les noms-flottants en `null-terminated` ; implique `--verbatim-files-from`
- `--recursion` effectue la récursion dans les sous-dossiers (par défaut)
- `-T,`, `--files-from=FILE` récupère les noms à extraire ou à créer à partir de `FILE`
- `--unquote` décode les noms des fichiers ou des membres (par défaut)
- `--verbatim-files-from` `-T` lit les noms de fichiers en `verbatim` (pas d’échappement ni d’option de traitement)
- `-X,`, `--exclude-from=FILE` exclut les patterns listés dans `FILE`

## File name matching options (affect both exclude and include patterns)
- `--anchored` recherche les noms de fichiers qui commencent par un pattern
- `--ignore-case` ignore la casse
- `--no-anchored` recherche les noms de fichiers après n’importe quel `/` (la valeur par défaut pour l'exclusion)
- `--no-ignore-case` Recherche sensible à aux majuscules
- `--no-wildcards` recherche les chaînes de caractères verbatim
- `--no-wildcards-match-slash` ne correspond pas aux caractères `/`
- `--wildcards` utilise les caractères de wildcard (la valeur par défaut pour l’exclusion)
- `--wildcards-match-slash` correspond aux caractères `/` (la valeur par défaut pour l'exclusion)

## Overwrite control
- `--keep-directory-symlink` conserve les liens symboliques existants des dossiers lors de l'extraction
- `--keep-newer-files` ne remplace pas les fichiers existants qui sont plus récents que leurs copies d’archive
- `-k,`, `--keep-old-files` ne remplace pas les fichiers existants lors de l’extraction, les traitant comme des erreurs
- `--no-overwrite-dir` conserve la métadonnées des dossiers existants
- `--one-top-level[=DIR]` crée un sous-dossier pour éviter d'avoir des fichiers extraits en loose
- `--overwrite` écrase les fichiers existants lors de l’extraction
- `--overwrite-dir` écrase la métadonnées des dossiers existants lors de l’extraction (par défaut)
- `--recursive-unlink` supprime chaque fichier avant d’ajouter un fichier à l'archive
- `--remove-files` supprime les fichiers après avoir ajouté les fichiers à l’archive
- `--skip-old-files` ne remplace pas les fichiers existants lors de l’extraction, en ignorant silencieusement les fichiers qui sont traités comme des erreurs
- `-U,`, `--unlink-first` supprime chaque fichier avant d’ajouter un fichier à l’archive
- `-W,`, `--verify` tente de vérifier l'archive après la rédaction

## Select output stream
- `--ignore-command-error` ignore les erreurs de commande des enfants
- `--no-ignore-command-error` traite les non-zéros d'erreur de commandes comme des erreurs
- `-O,`, `--to-stdout` extraire les fichiers vers le flux standard (stdout)
- `--to-command=COMMAND` acheminer les fichiers extraits vers un autre programme

## Handling of file attributes
- `--atime-preserve[=METHOD]` préserve les temps d'accès des fichiers dumpés, soit en restaurant les temps après la lecture (`METHOD='replace'` ; par défaut), soit en ne mettant pas de temps dans le premier lieu (`METHOD='system'`)
- `--clamp-mtime` ne met que du temps lorsque le fichier est plus récent que ce qui a été donné avec `--mtime`
- `--delay-directory-restore` retarde la mise à jour des temps d’accès et des permissions des dossiers extraits jusqu’à la fin de l’extraction
- `--group=NAME` force (symbolique) GID pour les fichiers ajoutés
- `--group-map=FILE` utilise FILE pour mapper les noms des groupes et des noms de fichiers
- `--mode=CHANGES` force (symbolique) mode changements pour les fichiers ajoutés
- `--mtime=DATE-OR-FILE` met à jour le temps d’accès du fichier en fonction de la date ou du fichier
- `-m,`, `--touch` ne récupère pas le temps modifié du fichier
- `--no-delay-directory-restore` annule l'effet de `--delay-directory-restore` option
- `--no-same-owner` extrait les fichiers en tant que vous (par défaut pour les utilisateurs ordinaires)
- `--no-same-permissions` applique l’utilitaire de permissions de l’archive (par défaut pour les utilisateurs ordinaires)
- `--numeric-owner` utilise toujours des nombres pour les noms d’utilisateur/groupe
- `--owner=NAME` force (symbolique) le nom comme propriétaire des fichiers ajoutés
- `--owner-map=FILE` utilise FILE pour mapper les UIDs et les noms de fichiers
- `-p`, `--preserve-permissions`, `--same-permissions` extrait des informations sur les permissions des fichiers (par défaut pour l’utilisateur superutilisateur)
- `--same-owner` essaie d’extraire les fichiers avec la même propriété que dans l’archive (par défaut pour l’utilisateur superutilisateur)
- `--sort=ORDER` ordre de tri du répertoire : aucun (par défaut), nom ou inode
- `-s`, `--preserve-order`, `--same-order` les arguments de type fichier dans le même ordre que les fichiers dans l’archive

## Handling of extended file attributes
- `--acls` Activez le support des ACLs POSIX
- `--no-acls` Désactive le support des ACLs POSIX
- `--no-selinux` Désactive le support du contexte SELinux
- `--no-xattrs` Désactive le support des attributs étendus
- `--selinux` Activez le support du contexte SELinux
- `--xattrs` Activez le support des attributs étendus
- `--xattrs-exclude=MASK` spécifiez un motif d’exclusion pour les clés des attributs Xattr
- `--xattrs-include=MASK` spécifiez un motif d’inclusion pour les clés des attributs Xattr

## Device selection and switching
- `--force-local` l’archive file est local même si il a un point-virgule
- `-f,`, `--file=ARCHIVE` utilise le fichier ou le périphérique `ARCHIVE`
- `-F`, `--info-script=NAME`, `--new-volume-script=NAME` exécute le script à la fin de chaque bande (implique `-M`)
- `-L,`, `--tape-length=NUMBER` change la taille du disque après l’écriture NUMBER x 1024 octets
- `-M,`, `--multi-volume` crée/liste/extraire un archive multi-volume
- `--rmt-command=COMMAND` utilise le commande rmt donnée (au lieu de rmt)
- `--rsh-command=COMMAND` utilise la commande rsh donnée au lieu de rsh
- `--volno-file=FILE` utilise/met l’information du numéro de volume dans un FILE

## Device blocking
- `-b,`, `--blocking-factor=BLOCKS` bloque x 512 octets par enregistrement
- `-B,`, `--read-full-records` bloque comme on lit (pour les tubes 4.2BSD)
- `-i,`, `--ignore-zeros` ignore les blocs zéros dans l’archive (signifie EOF)
- `--record-size=NUMBER` NUMBER de bytes par enregistrement, multiple de 512

## Archive format selection
- `-H,`, `--format=FORMAT` crée un archive avec le format donné
- `--old-archive`, `--portability` est identique à `--format=v7
- `--pax-option=keyword[[:]=value][,keyword[[:]=value]]...` contrôle les mots clés Pax
- `--posix` Identique à `--format=posix`
- `-V,`, `--label=TEXT` crée un archive avec le nom de volume `TEXT`; au moment de l’extraction/lecture, utilisez `TEXT` comme une sous-chaîne de globbing pour le nom du volume

### FORMAT is one of the following
- `gnuGNU` format pour tar 1.13.x
- `oldgnuGNU` format selon tar <= 1.12
- `paxPOSIX` format conforme à tar >= 1003.1-2001 (pax)
- `posixsame` est identique à `pax`
- `ustarPOSIX` format pour tar 1003.1-1988 (ustar)
- `v7old` format pour tar V7

## Compression options
- `-a,`, `--auto-compress` utilise le suffix de l’archive pour déterminer le programme de compression
- `-I`, `--use-compress-program=PROG` filtre les archives en fonction de l’argument PROG (doit accepter -d)
- `-j,`, `--bzip2` filtre les archives en utilisant le programme de compression bzip2
- `-J,`, `--xz` filtre les archives en utilisant le programme de compression xz
- `--lzip` filtre les archives en utilisant le programme de compression lzip
- `--lzma` filtre les archives en utilisant le programme de compression xz
- `--lzop` filtre les archives en utilisant le programme de compression lzop
- `--no-auto-compress` ne fait pas l’utilisation du suffix de l’archive pour déterminer le programme de compression
- `--zstd` filtre les archives en utilisant le programme de compression zstd
- `-z,`, `--gzip,`, `--ungzip`, `--ungzip` filtre les archives en utilisant le gzip
- `-Z,`, `--compress`, `--uncompress` filtre les archives en utilisant le compresssion

## Local file selection
- `--backup[=CONTROL]` crée une sauvegarde avant de supprimer, en choisissant version `CONTROL`
- `--hard-dereference` suit les liens fermés ; archive et dump les fichiers qu’ils désignent
- `-h,`, `--dereference` suit les liens symlink ; archive et dump les fichiers qu’ils pointent
- `-K`, `--starting-file=MEMBER-NAME` commence à la mémoire de `MEMBER-NAME` lorsqu’on lit l’archive
- `--newer-mtime=DATE` compare le temps de modification uniquement des données modifiées
- `-N`, `--newer=DATE-OR-FILE`, `--after-date=DATE-OR-FILE` ne stocke que les fichiers plus récents que `DATE-OR-FILE`
- `--one-file-system` reste dans le système de fichiers local lors de la création d’archive
- `-P,`, `--absolute-names` ne supprime pas les noms de fichier avec un préfixe '/'
- `--suffix=STRING` crée une sauvegarde avant de supprimer, en remplaçant le suffix standard ('~' sauf si l’environnement variable `SIMPLE_BACKUP_SUFFIX` est modifié)

## File name transformations
- `--strip-components=NUMBER` supprime `NUMBER` de composants au début des noms de fichiers lors de l'extraction
- `--transform=EXPRESSION`, `--xform=EXPRESSION` utilise `sed` pour remplacer l’expression `EXPRESSION` par une transformation de nom de fichier

## Informative output
- `--checkpoint[=NUMBER]` affiche des messages de progression tout les `NUMBER` fois (par défaut 10)
- `--checkpoint-action=ACTION` exécute l'ACTION sur chaque checkpoint
- `--full-time` imprime le temps de fichier à sa résolution complète
- `--index-file=FILE` envoie des informations de débogage vers `FILE`
- `-l,`, `--check-links` affiche un message si tous les liens ne sont pas dumpés
- `--no-quote-chars=STRING` désactive la mise en caractères entre guillemets pour les caractères de `STRING`
- `--quote-chars=STRING` ajoute une mise en caractères entre guillemets pour les caractères de `STRING`
- `--quoting-style=STYLE` définit le style de citation des noms ; voir ci-dessous pour les valeurs valides
- `-R,`, `--block-number` affiche un message si tous les blocs ne sont pas dumpés
- `--show-defaults` affiche les paramètres TAR par défaut
- `--show-omitted-dirs` lors de la liste ou de l'extraction, liste chaque répertoire qui ne correspond pas aux critères de recherche
- `--show-snapshot-field-ranges` montre les plages valides pour les champs de snapshot-file
- `--show-transformed-names` montre les noms de fichiers ou d'archive transformés
- `--totals[=SIGNAL]` affiche le total en bytes après avoir traité l'archive ; avec un argument, affiche le total en bytes lorsque cette `SIGNAL` est livrée ; Les noms sans `SIG` prefix sont également acceptables
- `--utc` imprime les temps de modification des fichiers en UTC
- `-v,`, `--verbose` liste les fichiers traités verbosement
- `--warning=KEYWORD` affiche un avertissement
- `-w`, `--interactive`, `--confirmation` demande une confirmation pour chaque action

## Compatibility options
- `-o` lors de la création, identique à `--old-archive` ; lors de l'extraction, identique à `--no-same-owner`