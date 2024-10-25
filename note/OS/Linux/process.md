# Processus et services 
## Top processus
- `top`

![ssh top](https://github.com/Altherneum/.github/assets/84735589/e7e272f8-3da0-4ca9-a531-391a38c27ea9)

## free RAM
- `free` affiche l'utilisation de la RAM
- `free --mega` affiche en méga octet (Fonctionne aussi avec `--giga`)

![ssh free](https://github.com/Altherneum/.github/assets/84735589/4817a67a-97d9-4a29-9e72-a00d2818800f)

## Process statuses
- `ps` Permet de lister les processus en cours
- L’option `ps a` affiche tous les processus en cours d’exécution de tous les utilisateurs du système
- L’option `ps u` fournit des informations supplémentaires telles que le pourcentage d’utilisation de la mémoire et du CPU, le code d’état du processus et le propriétaire des processus
- L’option `ps x` Liste de tous les processus qui ne sont pas exécutés à partir du terminal
- Les options peuvent être cumulés `ps aux`
### Autres options de Process statuses
- L'option `ps -u [User]` Liste les processus d'un utilisateur
- `ps -T` Liste les processus actifs à partir du terminal
- `ps -C [Nom]` Liste les processus en filtrant par nom
- `ps -e` Liste de tout les process
- `ps -ef` Liste tout les process et leurs utilisateurs UID
- `pstree` Arbre des processus

## PIDof
La commande `pidof` est utilisée pour trouver l’ID d’un processus, à condition que vous connaissiez le nom du processus
- `pidof [options] [program]`
  - `-c` Renvoie uniquement les PID dans un seul répertoire racine
  - `-o` Omettez certains PID (incluez les processus à omettre après l'indicateur)
  - `-s` Ne renvoie qu'un seul PID
  - `-x` Renvoie également les PID des shells qui exécutent des scripts
    - Par exemple, pour obtenir le PID du processus `snapd`, exécutez `pidof snapd`

## Tuer un processus
### killall Command
- La commande `killall` tue les processus par leur nom. Par défaut, il envoie un signal `SIGTERM`
- La commande peut tuer plusieurs processus avec une seule commande

- `killall [process]`

- `-e` Trouvez une correspondance exacte pour le nom du processus.
- `-I` Ignorez la casse (majuscules) lorsque vous essayez de trouver le nom du processus
- `-i` Demandez une confirmation supplémentaire lorsque vous interrompez le processus
- `-u` Tuez uniquement les processus appartenant à un utilisateur spécifique
- `-v` Indiquez si le processus a été arrêté avec succès

#### Killall basé sur le l'âge
En plus de tuer des processus en fonction de leur nom, la commande `killall` peut également être utilisée pour tuer en fonction de l'âge du processus : `killall -o 15m`, `killall -y 15m`
- `-o` Utilisez cette option avec une durée pour tuer tous les processus en cours d'exécution depuis plus de cette durée
- `-y` Utilisez cette option avec une durée pour tuer tous les processus qui sont en cours d'exécution depuis moins de cette durée
- Les unités sont `s`, `m`, `h`, `d`, `w`, `M`, `y` pour les secondes, minutes, heures, jours, semaines, mois et années respectivement

### Kill
- La commande `kill` tue un seul processus à la fois avec l'ID de processus donné
- Il envoie un signal `SIGTERM` ordonnant à un processus de s'arrêter
- Il attend que le programme exécute sa routine d'arrêt

- `kill [process ID]`

- `kill -9 [PID]` Tuer de force le PID
  - `kill -SIGKILL [processID]`

- `-signal` spécifier un signal autre que `SIGTERM`
- `-l` liste des envoie de signaux ;
  - `man 7 signal` exemples :
    - `SIGHUP` recharger ses fichiers de configuration
    - `SIGINT` arrêter le programme en utilisant Ctrl+C
    - `SIGKILL` terminer un processus immédiatement et ne peut pas être intercepté
    - `SIGTERM` demander à un processus de se terminer. Il s'agit du signal envoyé par défaut par la commande `kill`

### PKill
- La commande `pkill` est similaire à la commande pgrep, dans le sens où elle tue un processus en fonction de son nom, en plus d'autres facteurs de recherche
- Par défaut, `pkill` envoie le signal `SIGTERM`. La syntaxe est :

- `pkill [options] [pattern]`

- `-n` Ne tuez que les processus les plus récents découverts
- `-o` Ne tuez que le plus ancien des processus découverts
- `-u` Tuez uniquement les processus appartenant à l'utilisateur spécifié
- `-x` Tuez uniquement les processus qui correspondent exactement au pattern
- `-signal` Envoyez un signal spécifique au processus, plutôt que `SIGTERM`

- L'exemple suivant montre comment tuer le processus le plus récent créé par l'utilisateur "bosko" : `pkill -n -u bosko`

### XKill
Xkill est un programme utilitaire distribué avec le "X Window System" qui demande au serveur X de mettre fin de force à sa connexion à un client
#### XKill sans paramètres
Lorsqu'il est exécuté sans argument de ligne de commande, le programme affiche un curseur spécial (généralement un réticule ou une tête de mort)

`xkill`
![image XKill](/note/assets/images/Xkill.png)
#### XKill avec paramètres
- `xkill [resource]`

## Jobs
`CTRL+Z` stop une commande en cours
`BG` le fait partir en fond
`jobs` Tâche en cours
`jobs -l` Liste des job avec ID
`FG [ID]` Relance le job en foreground
`sleep 200 &` Sleep 200s en tache de fond via le `&`
### Attendre un job
`wait [PID]` Attend la fin du processus [PID] avant de continuer 

## Services
- `Systemctl`
### Relancer un service
  - `Systemctl restart [SystemProcess]`
  - `Systemctl reload [SystemProcess]`

### Arrêter ou démarrer un service
  - `Systemctl stop [SystemProcess]`
  - `Systemctl start [SystemProcess]`

### Status d'un service
  - `Systemctl status [SystemProcess]`

### Pauser ou tuer un service
  - `Systemctl kill [SystemProcess]`
  - `Systemctl freeze [SystemProcess]`

### Désactiver ou réactiver un service
  - `Systemctl disable [SystemProcess]`
  - `Systemctl enable [SystemProcess]`