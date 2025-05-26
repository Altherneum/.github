# Process statuses
- `ps` Permet de lister les processus en cours
## Exemple de PS
```
root@vps:~# ps
    PID TTY          TIME CMD
1043929 pts/2    00:00:00 su
1043931 pts/2    00:00:00 bash
1045770 pts/2    00:00:00 ps
```

## Autres options de Process statuses
- L'option `ps -u [User]` Liste les processus d'un utilisateur
- `ps -T` Liste les processus actifs à partir du terminal
- `ps -A`, `-e` Sélectionnez tout
- `ps -a` Sélectionnez tous les processus avec TTY, sauf les chefs de session
- `ps a`  Sélectionnez tous avec TTY, y compris les autres utilisateurs
- `ps -u`, `U`, `--user <UID>` Sélectionnez par identifiant ou le nom d'utilisateur actuel
- `ps -U`, `--User <UID>` Identifiant ou nom d'utilisateur réel
- `ps u` Format orienté utilisateur
- `ps x` processus sans contrôle de TTY's
- `ps X` Format registre
- `ps -C [Nom]` Liste les processus en filtrant par nom
- `ps -e` Liste de tout les process
- `ps -ef` Liste tout les process et leurs utilisateurs UID
## PSTree
- `pstree` Arbre des processus