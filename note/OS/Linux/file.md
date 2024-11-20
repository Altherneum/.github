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

## Écrire sur un fichier
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