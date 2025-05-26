# PIDof
La commande `pidof` est utilisée pour trouver l’ID d’un processus, à condition que vous connaissiez le nom du processus
- `pidof [options] [program]`
  - `-c` Renvoie uniquement les PID dans un seul répertoire racine
  - `-o` Omettez certains PID (incluez les processus à omettre après l'indicateur)
  - `-s` Ne renvoie qu'un seul PID
  - `-x` Renvoie également les PID des shells qui exécutent des scripts
    - Par exemple, pour obtenir le PID du processus `snapd`, exécutez `pidof snapd`