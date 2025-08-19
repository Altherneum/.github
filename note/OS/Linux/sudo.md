# Sudo
**__Super user do__**
## Ajouter un utilisateur au groupe sudo
### Usermod sudo
- `usermod -aG sudo [USERNAME]`
### /etc/sudoers
- `nano /etc/sudoers`
- `username ALL=(ALL:ALL) ALL`
  - Le premier ALL indique que l'utilisateur peut exécuter sudo à partir de n'importe quel hôte
  - Le (ALL:ALL) indique que l'utilisateur peut exécuter la commande en tant qu'utilisateur et n'importe quel groupe
  - Le troisième ALL indique que toutes les commandes peuvent être exécutées
## Se connecter avec sudo
- `sudo -i -u [USER]` Se connecte en tant que l'utilisateur, en utilisant sa configuration du shell
- `sudo -s -u [USER]` Executer le shell actuel en tant que l'utilisateur (Vous restez au même endroit)
### Se connecter et lancer une commande
- `sudo -i -u [USER] [CMD]` Se connecte au compte et lancer une commande
  - Exemple (Afficher le `$HOME` de l'utilisateur) : `sudo -i -u user echo \$HOME`

# SU
**__Super User__**
## Se connecter en root
[C0OHejfYhfE](https://youtube.com/watch?v=C0OHejfYhfE)
- `su` Se connecte en tant que "Super User" (root)  si l'utilisateur actuel est dans la liste des sudoers
- `sudo [CMD]` Lance la commande en tant que le "Super User"
  - `sudo su` Se connecter en tant que "Super User"
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

# Se déconnecter
- `logout`
- `exit`
- `CTRL + D`
- `pkill -KILL -u [user]`, ou `killall -u [user]`
  - `who`, ou `w` Pour voir la liste des utilisateurs connectés
