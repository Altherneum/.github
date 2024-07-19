# User
## Add user
- Dans l'ensemble, adduser est souvent plus convivial et pratique pour ajouter des utilisateurs
- Tandis que useradd est plus approprié pour une utilisation dans des scripts

- `adduser` / `useradd`
  - `useradd [USER]` Créer un utilisateur
  - `useradd -m -s /bin/bash [USER]` Créer l'utilisateur et son `/home` et précise comme shell `bash`

## Edit user
- `usermod`
### Ajouter à un groupe principal
- `usermod -g [GROUP] [USER]` Ajoute l'utilisateur à un groupe principal
### Ajouter à des groupes secondaires
- `usermod -a -G [GROUP] [USER]` Ajoute l'utilisateur au groupe secondaire
- `usermod -a -G [GROUP],[GROUP2],[GROUP3] [USER]` Ajoute plusieurs groupes secondaires à l'utilisateur
### Retirer à des groupes
- `deluser [USER] [GROUP]` Retire l'utilisateur du groupe secondaire

## Delete user
- `userdel` / `deluser`
  - `userdel [USER]`
  - `userdel -r [USER]` Supprime son home
  - `userdel -f [USER]` Supprime le home même si l'utilisateur est connecté (pour expulser), peut créer des incohérance

# Group
- `addgroup` / `groupadd`
  - `addgroup [GROUPName]` Créer un groupe
## Edit group
- `groupmod` / `modgroup`
  - `groupmod -n [GROUPName] [NEWGroupName]` Renomme le groupe
## Delete group
- `groupdel` / `delgroup`
  - `groupdel [GROUPName]`

# Exemple pour créer des utilisateurs
## Crée l'utilisateur
- `useradd [USER]`
## Ajouter des groupes secondaires
- `sudo usermod --append --groups [GROUP1],[GROUP2],... [USERNAME]`
## Changer le mot de passe si besoin
- `sudo passwd [USER]`
  - Tapper le mot de passe

## Lister les utilisateurs
- `more /etc/passwd` Liste des utilisateurs
- `cut -d: -f1 /etc/passwd` Liste uniquement les utilisateurs sans le reste du fichier
- `awk -F: '{ print $1}' /etc/passwd` Liste uniquement les utilisateurs sans le reste du fichier

## Lister les groupes
- `more /etc/group` Liste les groupes et leurs utilisateurs
- `groups [USER]` Liste les groupes de l'utilisateur
- `more /etc/gshadow` Fichier de DB des groupes avec mot de passe