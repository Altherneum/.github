# Fichier
## File
- `file [FICHER]` Affiche le type de fichier

## Lire un fichier
Afficher le contenu des fichiers :
### More
- `more` Page par page
  - `ESPACE` Avancer d'un écran
  - `RETURN` Avancer d'une ligne

### Less
- `less` Commande `more` avec des commandes de déplacement
  - `e` Avancer d'une ligne
  - `y` Reculer d'une ligne
  - `f` Avancer d'une page
  - `b`  Reculer d'une page
  - `h` ou `?` Aide
  - `q` Quitter la commande `more`

### Autres commande pour lire un fichier
- `cat [FICHIER]` Concaténation
- `head [FICHIER]` Première lignes du fichier
- `tail [FICHIER]` Dernière lignes du fichier

## Écrire un fichier
- `nano` Lance l'éditeur de texte nano
- `nano [FILE]` Lance nano sur le fichier ciblé
  - `{ctrl} + X` Permet de fermer nano
  - `{ctrl} + O` Permet de sauvegarder le fichier

- `vi [Fichier]` Ouvre l'éditeur de texte vi
  - `:q` Quitter (Quit)
    - `:q!` Quitter de force
  - `:w` Sauvegarder (Write)
  - `:wq` Sauvegarder et quitter
  - `:[NUMBER]` Se déplacer à la ligne
    - (Exemple : `:10` = Ligne 10)

## Écrire ou rediriger vers un fichier
### Écrire en écrasant le fichier
- `[CMD|FILE|Text] > [FILE]` Créer le fichier et écrit dedans, si il existe il sera écrasé

### Écrire à la fin du fichier
- `[CMD|FILE|Text] >> [FILE]` Créer le fichier si il n'exsite pas, et ajoute le contenu dedans sans écraser à la fin du document

### Envoyer depuis un fichier vers autre chose
- `[CMD|FILE...] < [FILE]` Envoie les informations de la droite vers la gauche
  - `Cat < File1 > new_file` Envoie `File1` dans `cat`, puis envoie le tout dans `new_file`

### Écrire les erreurs dans un fichier
- `[CMD_Erreur] 2> [file]` Redirige les erreurs dans le fichier
  - `toto 2> error_log`
  - `find / -name toto 2> error_log` Enverra que les erreurs dans le log, et conserve les bons résultats dans la console
  - `find / -name toto 2> error_log > good_log` Envoie les erreurs dans `error_log`, et les bons résultats dans `good_log`

### Écrire tout les résultats dans un fichier
- `[CMD] &> [FILE]` Envoie les résultats et les erreurs dans le fichier
  - `[CMD] > [FILE] 2>&1` Envoie les résultats et les erreurs dans le fichier

### Rediriger vers une commande via le pipe
Le résultat de la commande devant le pipe (`|`), devient la commande après le pipe
- `systemctl | wc -l` Compte le nombre de ligne du résultat de la commande systemctl

## Touch
- `touch [FILE]` Modifie la date d'accès au fichier à la date actuelle
  - Si le fichier n'existe pas, il sera crée

## Supprimer un fichier
- `rm [FICHIER]` Supprime un fichier
  - `rm -r [PATH]` Supprime les fichiers dans path de manière récursive
  - `rm -i [FICHIER]` Demande la confirmation

## Copy paste
- `cp [à copier] [destination]` Permet de copier un ou plusieurs fichiers vers un emplacement spécifié
- `cp [fichier à copier] [dossier à copier] [fichier à copier] [dossier à copier] [destination]` Permet de copier une liste de dossiers et fichiers vers l'emplacement spécifié
- `cp -f [fichier] [destination]` Permet de forcer l'écrasement d'anciens fichiers et dossiers
- `cp -a [fichier] [destination]` Permet de conserver les mêmes droits et métadonnées que le fichier d’origine
- `cp -r [dossier] [destination]` Permet de copier de manière récursive
- `cp -s [fichier] [destination]` Permet de créer un lien symbolique vers le fichier d’origine.

## Move file
- `mv [FILE] [NEW_FILE]`

## Lien symbolique
La commande `ln` sous Linux et Unix permet de créer des liens vers des fichiers ou répertoires, offrant ainsi plusieurs chemins d'accès aux mêmes données sans duplication
### Lien physique (Hard link)
- Créés par défaut, ils pointent directement vers l'inode (les données réelles sur le disque)
- Ils doivent se trouver sur le même système de fichiers et ne peuvent pas être créés pour des répertoires
- La suppression d'un lien physique n'affecte pas les autres liens pointant vers ces mêmes données
### Lien symbolique (Symlinks)
- Créés avec l'option `-s`, ils agissent comme des raccourcis pointant vers le chemin d'un autre fichier ou répertoire
- Ils peuvent traverser différents systèmes de fichiers et pointer vers des répertoires, mais ils deviennent "cassés" si la cible originale est supprimée ou déplacée
### Syntaxe des liens
- La syntaxe de base est `ln [OPTIONS] TARGET LINK_NAME`
- Par exemple, `ln fichier1 fichier2` ; crée un lien physique,
  - Tandis que `ln -s fichier1 fichier2` crée un lien symbolique

## Locate a file
### WhereIs
- `whereis <cmd>` Affiche le chemin de du binaire, de la source, et du manuel de la commande
### Locate
Le paquet `mlocate` n'est pas présent par défaut sur certains Linux

- `locate "<NAME>"`
- `locate "*.html" -n 20`
  - `-d path`, `--database=path`
  - `-r`, `--regex`
  - `-l N`, `--limit=N`
### Find
- `find <startingdirectory> <options> <name>`
- `find /home -iname my-file`
- `find ./ -name “*.txt”`
  - `-iname` insensitive to caps
  - `-name` sensitive to caps
  - `-iregex` insensitive to caps regex
  - `-regex` sensitive to caps regex

## Exécuter un fichier
### Rendre le fichier exécutable
Voire les permissions ; [#chmod +x <fichier>](#chmod)
### Lancer un fichier de script
- Taper son nom `File.sh`
  - il peut aussi être sans le `.sh` dans le cadre des fichiers exécutables `ELF 64-bit LSB executable, x86-64` (visible via [#File](#file))

- Taper son nom relatif `./File.txt` ou `/[PATH]/[FILE].sh`
  - Ou un nom dupliqué : (Ex rm en fichier alors que la commande rm existe)
- Le déplacer dans `/bin` puis `source [PATH]` le fichier ou est `bin` (Sourcer une seul fois pour ajouter le path dans `$PATH`)

### Source pour include un script temporairement
- Lancer la commande : `Source [FICHIER]` (En mémoire jusqu'au relancement du shell !)
  - Utile pour par exemple créer une liste d'alias
- équivaut à `. [FICHIER]` permet de l'inclure dans le shell en cours d'utilisation

# Fichiers utiles
- `more /etc/sudoers` Liste des comptes SU
- `more /etc/shells` Liste des shells disponibles
- `more /etc/passwd` Affiche la liste des utilisateurs et processus et leurs 
- `more etc/shadow` Liste des mot de passe (chiffrés via `crypt`)
- `more /etc/motd` Le MOTD (Message Of The Day) affiché après une connection
- `nano /etc/motd.d/[NAME].motd` Permet de créer des MOTD
- `more /etc/os-release` Version et codename de l'OS
- `more /etc/utmp` Contient un enregistrement des utilisateurs connectés au système
- `more /var/adm/wtmp` Contient les informations comptables de connexion
- `more /etc/security/failedlogin` Contient un enregistrement des tentatives de connexion invalides
