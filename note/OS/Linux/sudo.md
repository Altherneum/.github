# Sudo
## Super user do
- `su` Se connecte en tant que "Super User" (root)
- `sudo [CMD]` Lance la commande en tant que le "Super User"
  - `sudo su` Se connecter en tant que "Super User" si l'utilisateur actuel est dans la liste des sudoers

## Lancer une commande en tant que l'utilisateur
- `sudo -u [USER] [CMD]` Lance la commande en tant que l'utilisateur
  - Le compte root lance : `sudo -u jesus whoami` retourne "jesus"
  - Identique à : `su -c [CMD] [USER]`
    - Ou `su [USER] -c [CMD]`
 
## Se connecter au compte d'un utilisateur
- `su [USER]` Se connecter en tant que l'utilisateur
  - Identique à : `su - [USER]`
  - Identique à : `su -l [USER]`

- `su –p [USER]` Conserve le shell actuel et se login sur le compte de l'utilisateur
  - Identique à : `su –m [USER]`

## Se connecter avec sudo
- `sudo -i -u [USER]` Se connecte en tant que l'utilisateur, en utilisant sa configuration du shell
- `sudo -s -u [USER]` Executer le shell actuel en tant que l'utilisateur (Vous restez au même endroit)

### Se connecter et lancer une commande
- `sudo -i -u [USER] [CMD]` Se connecte au compte et lancer une commande
  - Exemple (Afficher le `$HOME` de l'utilisateur) : `sudo -i -u user echo \$HOME`