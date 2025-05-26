# Tuer un processus
## killall Command
- La commande `killall` tue les processus par leur nom. Par défaut, il envoie un signal `SIGTERM`
- La commande peut tuer plusieurs processus avec une seule commande

- `killall [process]`

- `-e` Trouvez une correspondance exacte pour le nom du processus.
- `-I` Ignorez la casse (majuscules) lorsque vous essayez de trouver le nom du processus
- `-i` Demandez une confirmation supplémentaire lorsque vous interrompez le processus
- `-u` Tuez uniquement les processus appartenant à un utilisateur spécifique
- `-v` Indiquez si le processus a été arrêté avec succès

### Killall basé sur le l'âge
En plus de tuer des processus en fonction de leur nom, la commande `killall` peut également être utilisée pour tuer en fonction de l'âge du processus : `killall -o 15m`, `killall -y 15m`
- `-o` Utilisez cette option avec une durée pour tuer tous les processus en cours d'exécution depuis plus de cette durée
- `-y` Utilisez cette option avec une durée pour tuer tous les processus qui sont en cours d'exécution depuis moins de cette durée
- Les unités sont `s`, `m`, `h`, `d`, `w`, `M`, `y` pour les secondes, minutes, heures, jours, semaines, mois et années respectivement

## Kill
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

## PKill
- La commande `pkill` est similaire à la commande pgrep, dans le sens où elle tue un processus en fonction de son nom, en plus d'autres facteurs de recherche
- Par défaut, `pkill` envoie le signal `SIGTERM`. La syntaxe est :

- `pkill [options] [pattern]`

- `-n` Ne tuez que les processus les plus récents découverts
- `-o` Ne tuez que le plus ancien des processus découverts
- `-u` Tuez uniquement les processus appartenant à l'utilisateur spécifié
- `-x` Tuez uniquement les processus qui correspondent exactement au pattern
- `-signal` Envoyez un signal spécifique au processus, plutôt que `SIGTERM`

- L'exemple suivant montre comment tuer le processus le plus récent créé par l'utilisateur "bosko" : `pkill -n -u bosko`

## XKill
Xkill est un programme utilitaire distribué avec le "X Window System" qui demande au serveur X de mettre fin de force à sa connexion à un client
### XKill sans paramètres
Lorsqu'il est exécuté sans argument de ligne de commande, le programme affiche un curseur spécial (généralement un réticule ou une tête de mort)

`xkill`
![image XKill](https://github.com/Altherneum/.github/blob/main/note/assets/images/Xkill.png?raw=true)
### XKill avec paramètres
- `xkill [resource]`