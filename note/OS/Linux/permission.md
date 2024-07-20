# Permission
## Format de permission
- `drwxrwxrwx` Permission avec tout d'autorisé sur un dossier
- `-rw-------` Permission ou seul le propriétaire peut lire et écrire sur le fichier
  - `d(File Type) rwx(Proprio) rwx(groupe) rwx(Autres)`

### Explications des lettres
- `R` = Read
- `W` = Write
- `X` = eXecute

## Chmod
- `Chmod` pour changer les permissions
- Vous devez être `sudo` / root si ce n'est pas votre fichier

### Lettres
- `u` utilisateur (Créateur du fichier)
- `g` groupe
- `o` other / autres
- `a` all (user, group & other)
  - `ugo` est identique à `a`

### Opérateurs
- `+` Ajouter
- `-` Supprimer
- `=` Toutes les permissions seront supprimés, puis applique permissions suivantes

## Exemples de commande
- `chmod +x [FILE]` Ajoute la permission exécuter sur le fichier pour le propriétaire, groupe, et autres
- `chmod a=rwx [FILE]` Met toutes les permissions pour le propriétaire, groupe, et autres
- `chmod o= [FILE]` Retire tout les droits sur les autres
- `chmod o+x [FILE]` Ajout d'exécution pour les autres
- `chmod u-x,g-w,o+r [FILE]` Retire execute pour le propriétaire, retire groupe de write, et ajoute write pour les autres
- `chmod o=x` Other n'aura que Execute
- `chmod ugo=x` Tout les droits n'auront que execution

### Récursif
- `chmod -R [LETTRES] [PATH]` Recursif sur tout les sous fichiers / dossiers
- `chmod -R u=rwx,go= /home/username` Donne tout les droits au propriétaire et aucun droit au groupe et aux autres sur le dossier `/home/username`

## Changer le propriétaire ou groupe
### Changer le propriétaire
- `chown [USER] [FILE]`
  - Change le propriétaire du fichier
### Changer le groupe
- `chgrp [GROUPE] [FILE]`
  - Change le groupe du fichier

# WIP / To Do
## Chmod numérique
![alt text](/image.png)
R--RWXRWX = 477

## Umask
![alt text](/image-1.png)
umask va retirer les permission
ex : umask 777 = retire toutes les permission
Utilisé lors des créations de fichiers / dossiers