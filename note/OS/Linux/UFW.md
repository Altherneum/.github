# UFW
## Commencer avec UFW
### Installer UFW
- `sudo apt-get install ufw`
### Activer l’UFW
- `sudo ufw enable`
### Désactiver l'UFW
- `sudo ufw disable`
### Recharger UFW
- `sudo ufw reload` Cette commande va recharger UFW et appliquer les dernières règles ajoutés

## Ajouter des règles générales
### Bloquer tout le trafic entrant
- `sudo ufw default deny incoming`
### Autoriser le trafic sortant
- `sudo ufw default allow outgoing`

## Ajouter des règles par protocoles
### Autoriser le trafic SSH
- `sudo ufw allow ssh`
  - ou `sudo ufw allow OpenSSH`
  - ou `sudo ufw allow 22`
### Autoriser le HTTP/HTTPS
- `sudo ufw allow "WWW Full"` Ajouter le HTTP et HTTPS
### Autoriser Apache
- `sudo ufw allow "Apache Full"`
#### Autoriser le HTTP
- `sudo ufw allow 80`
- ou `sudo ufw allow http`
- entrant uniquement `ufw allow in http`
- sortant uniquement `ufw allow out http`
#### Autoriser le HTTPS
- `sudo ufw allow 443`
- ou `sudo ufw allow https`
- entrant uniquement `ufw allow in https`
- sortant uniquement `ufw allow out https`
#### Autoriser le ping
- ~~`sudo ufw allow out icmp`~~
- Fichier `/etc/ufw/before.rules`

```
-A ufw-before-output -p icmp --icmp-type destination-unreachable -j ACCEPT
-A ufw-before-output -p icmp --icmp-type source-quench -j ACCEPT
-A ufw-before-output -p icmp --icmp-type time-exceeded -j ACCEPT
-A ufw-before-output -p icmp --icmp-type parameter-problem -j ACCEPT
-A ufw-before-output -p icmp --icmp-type echo-request -j ACCEPT
```

## Ajouter des règles par ports
### Autoriser un port spécifique
- `sudo ufw allow 5789/tcp`
### Bloquer un port spécifique
- `sudo ufw deny 5789/tcp`

## Ajouter des règles par addresses
### Refuser le trafic en provenance d’une IP spécifique
- `sudo ufw deny from 192.168.1.10`

## Autres commandes
### Vérifier le statut et les règles de l’UFW
- `sudo ufw status verbose`
- `sudo ufw status numbered verbose`
### Lister les ports standards
- `sudo ufw app list`
### Rejeter du traffic
- `sudo ufw reject [ARGS]` Va refuser et envoyer une erreur à l'envoyeur
### Limiter du traffic
- `sudo ufw limit [ARGS]` limit connections from a specific IP address that has attempted to initiate 6 or more connections in the last 30 seconds
### Supprime une règle
- `sudo ufw delete [ARGS]`
  - Exemple `ufw delete allow http`
  - Exemple `ufw delete allow 80`
  - ~~Exemple `ufw delete deny icmp`~~
### Réstaurer UFW
- `sudo ufw reset`

## Aides d'UFW
### Version d'UFW
- `ufw --version`
### Aide d'UFW
- `ufw -h`



# To filter
- ufw show added
- ufw status numbered
  - ufw delete [RULE_NUMBER]