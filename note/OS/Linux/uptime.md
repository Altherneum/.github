# Uptime
La commande `uptime` sur Linux est un outil essentiel pour connaître l'état actuel de votre système

Elle affiche des informations importantes sur le temps d'arrêt du système, le temps de disponibilité et les ressources en cours d'utilisation

## Exemples de résultat d'uptime
```
root@vps:~# uptime
21:02:21 up 275 days, 15:00,  1 user,  load average: 1.20, 0.78, 0.63
```
### Uptime -p
Affiche la durée d'up `-p` ou `--pretty`
```
root@vps:~# uptime -p
up 39 weeks, 2 days, 15 hours, 2 minutes
```
### Uptime -s
Affiche la date depuis le démarrage du serveur `-s`, ou `--since`
```
root@vps:~# uptime -s
2024-08-23 06:01:26
```