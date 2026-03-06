# Poweroff, reboot, halt et shutdown
## poweroff
- Fonction : Arrête complètement l'ordinateur. 
  - C'est l'**__équivalent d'une coupure de courant__**.
- Syntaxe : `poweroff`
- Utilisation : `poweroff`
- Option : 
    - `-f` : Force l'arrêt, même si des programmes sont en cours d'exécution. (Attention : peut entraîner une perte de données !)
    - `-h` : Affiche un message d'avertissement avant d'arrêter.
- Exemple : `poweroff` (Arrête le système sans avertissement)
- Exemple : `poweroff -f` (Force l'arrêt, même si des programmes sont en cours d'exécution)

## shutdown
- Fonction : Arrête ou redémarre le système. C'est la commande la plus flexible et recommandée pour les arrêts planifiés.
- Syntaxe : `shutdown [options] [+temps]`
- Utilisatio : 
    - Arrêt immédiat : `shutdown`
    - Arrêt planifié : `shutdown +minutes [-r] message` (où `minutes` est le nombre de minutes avant l'arrêt, et `-r` indique un redémarrage)
- Option : 
    - `-h` : Arrête le système.
    - `-r` : Redémarre le système.
    - `-c` : Annule un arrêt planifié en cours.
    - `+minutes` : Indique le nombre de minutes avant l'arrêt.
    - `[-m]` : Permet d'utiliser des commandes avec les privilèges root (utile pour les arrêts planifiés).
    - `message` : Affiche un message aux utilisateurs connectés avant l'arrêt.
- Exemple : 
    - `shutdown -h +5` (Arrête le système dans 5 minutes)
    - `shutdown -r now` (Redémarre le système immédiatement)
    - `shutdown -h -c` (Annule un arrêt planifié en cours)
    - `shutdown -h +10 "Arrêt du système pour maintenance."` (Arrête dans 10 minutes avec un message)
### Systemctl poweroff
- `systemctl poweroff` (Peut être requis dans certains cas)
### reboot avec shutdown
- Vous pouvez utiliser `shutdown` pour planifier un arrêt, puis utiliser `reboot` après l'arrêt.
- Exemple : `shutdown +5 -r "Redémarrage du système."` (Arrête le système dans 5 minutes et redémarre immédiatement avec un message)

## reboot
- Fonction : Redémarre le système.
- Syntaxe : `reboot`
- Utilisation : `reboot`
- Option : 
    - `-f` : Force le redémarrage, même si des programmes sont en cours d'exécution. (Attention : peut entraîner une perte de données !)
    - `-r` : Alias pour `reboot`.
- Exemple : `reboot` (Redémarre le système)
- Exemple : `reboot -f` (Force le redémarrage, même si des programmes sont en cours d'exécution)
### Systemctl reboot
`systemctl reboot` (Peut être requis dans certains cas)

## halt
- Fonction : Arrête le système de manière plus "propre" que `poweroff`
  - Elle signale aux périphériques matériels (comme le disque dur) qu'ils doivent s'arrêter.
- Syntaxe : `halt [options]`
- Utilisation : `halt`
- Option : 
    - `-i` : Arrête le système en mode "idle" (si supporté).
    - `-d` : Arrête le système en mode "deep sleep" (si supporté).
    - `-f` : Force l'arrêt.
- Exemple : `halt` (Arrête le système)
- Note : La commande `halt` est moins couramment utilisée que `shutdown` ou `poweroff`
  - Elle peut ne pas fonctionner sur tous les systèmes.


## Vérification de l'état du système
Avant d'utiliser ces commandes, vous pouvez vérifier l'état du système avec : 
- `uname -a` : Affiche la version du noyau Linux.
- `uptime` : Affiche le temps de fonctionnement du système et les utilisateurs connectés.
- `who` : Liste les utilisateurs actuellement connectés au système.


### Conseils & Précautions
- Sauvegardes : Avant d'utiliser ces commandes, assurez-vous d'avoir sauvegardé toutes vos données importantes.
- Arrêts planifiés : Utilisez `shutdown +minutes` pour programmer des arrêts et avertir les utilisateurs connectés.
- Forcez l'arrêt avec prudence : Utilisez `-f` (force) uniquement si nécessaire, car cela peut entraîner une perte de données.
- Annuler un arrêt planifié : Si vous avez programmé un arrêt et que vous souhaitez le modifier ou l'annuler, utilisez `shutdown -c`.