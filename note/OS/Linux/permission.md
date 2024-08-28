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
- `chown -R [USER]:[GROUP] [FILE]` mode récursif
### Changer le groupe
- `chgrp [GROUPE] [FILE]`
  - Change le groupe du fichier

# WIP / To Do
## Chmod numérique
### Calculer une permission
- Additionner les valeurs afin de créer un chiffre
- `R = 4`
- `W = 2`
- `X = 1`

### Appliquer pour un utilisateur, groupe et autre
- Cumuler les 3 chiffres pour créer le nombre définissant les permission à appliquer

```
740 = RWXR-----
777 = RWXRWXRWX
644 = RW-R--R--
```

### Exemples de chmod numérique
`chmod -R 755 /var/www` Applique les permissions `RWXR-XR-X` de manière récursive sur `/var/www` (Exemple pour Apache2)

## Umask
### Définition de umask
- `umask` (user file creation mode mask, masque de création de fichier par l'utilisateur)
- Le `umask` définit les permissions par défaut d'un répertoire ou d'un fichier créé
- L’umask est utilisé par `open`, `mkdir`, `touch` et d’autres appels systèmes qui créé ou modifie les permissions sur les nouveaux fichiers ou répertoires

### Précisions sur umask
- Par défaut, tous les fichiers sont créés avec les droits `666` (`rw-rw-rw—`)
- Par défaut tous les répertoires sont créés avec les droits `777` (`rwxrwxrwx`)
- Puis le masque est appliqué
- Le masque est le même pour l'ensemble des fichiers
- Un masque ne modifie pas les droits des fichiers existants, mais seulement ceux des nouveaux fichiers

```
0 = RWX
1 = RW-
2 = R-X
3 = R--
4 = -WX
5 = -W-
6 = --X
7 = ---
```

### Vérifier le umask actuel
Utilisez l’option `-S` pour afficher les valeurs de permissions `umask` pour les utilisateurs, groupes et autres

`umask -S`

### Exemples d'umask
- `umask 022` (`RWXR-XR-X`)
- `umask a=rwx` (`RWXRWXRWX`)
- `umask u=rwx,g=rwx,o=rwx` (`RWXRWXRWX`)

### Variations d'umask
- `dmask` (Directory) pour les dossiers uniquement
- `fmask` (File) pour les fichiers uniquement