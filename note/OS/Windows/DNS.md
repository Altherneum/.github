# DNS
- Domain Name System
- Le Domain Name System ou DNS est un service informatique distribué qui associe les noms de domaine Internet avec leurs adresses IP ou d'autres types d'enregistrements

## Ajouter le rôle DNS
![](https://github.com/Altherneum/.github/blob/main/note/assets/chrome_FgY8qWm1tz.png?raw=true)
- Gestionnaire de serveur
- Gérer
- Ajouter des rôles et fonctionnalité

- Suivant jusqu'à `Rôles de serveurs`

![DNS checkbox](https://github.com/Altherneum/.github/blob/main/note/assets/chrome_C6XVGkeqrD.png?raw=true)
- Cocher rôle DNS

- Suivant jusqu'à `Résultats`

- Installer

![DNS config](https://github.com/Altherneum/.github/blob/main/note/assets/chrome_B4Jm3xvMDQ.png?raw=true)
- Le DNS est désormais disponible sur la liste des outils

## Configurer le rôle DNS
![DNS config](https://github.com/Altherneum/.github/blob/main/note/assets/chrome_B4Jm3xvMDQ.png?raw=true)
- Aller dans la liste des outils pour configurer le DNS

### Créer la zone DNS
- Clique droit sur le serveur `WIN22-SRV-1`
- Nouvelle zone
- Zone principale
- Zone de recherche directe
- Nommer la zone `FORMATION.LAN`
- Autoriser les mises à jours dynamiques sécurisée et non sécurisée

![Resultat](https://github.com/Altherneum/.github/blob/main/note/assets/chrome_EjU5ccZeDI.png?raw=true)

### Créer la zone DNS inversé
- Clique droit sur le serveur `WIN22-SRV-1`
- Nouvelle zone
- Zone principale
- Zone de recherche inversée
- IPv4
- ID réseau : `192.168.10` (Ne pas préciser le dernier octet)
- Autoriser les mises à jours dynamiques sécurisée et non sécurisée

![Resultat](https://github.com/Altherneum/.github/blob/main/note/assets/chrome_2jJk7YWiZA.png?raw=true)

- Pour valider la configuration ; `/ipconfig registerdns`

### Vérifier le DNS
Pour vérifier le DNS :
- `nslookup 192.168.10.10`
- `nslookup WIN22-SRV-1`

```
C:\Users\Administrateur>nslookup 192.168.10.10
Serveur :   localhost
Address:  127.0.0.1

Nom :    WIN22-SRV-1.FORMATION.LAN
Address:  192.168.10.10


C:\Users\Administrateur>nslookup WIN22-SRV-1
Serveur :   localhost
Address:  127.0.0.1

Nom :    WIN22-SRV-1.FORMATION.LAN
Address:  192.168.10.10
```

### Alias DNS
- Outils
- DNS 
- Alias
- Nommer `www`
- Domaine sera `www.FORMATION.LAN`
- Aller sur Nom de domaine : FQDN "parcourir"
- Cliquer sur les postes pour cibler le `WIN22srv-1`
- Valider 

#### Vérifier l'alias DNS
- Verifier avec `nslookup www`
```
C:\Users\Administrateur>nslookup www
Serveur :   localhost
Address:  127.0.0.1

Nom :    win22-srv-1.FORMATION.LAN
Address:  192.168.10.10
Aliases:  www.FORMATION.LAN
```

### Deuxièmes DNS de secours
#### Zone recherche directe
- Pour vérifier SOA ; Doublie cliquer SOA
- NB : Numéro de série = même zone (DNS info identique & up to date)

- Vérifier NS ; Double clique sur Server de nom (NS)

#### Zone inversé
- PTR (Pointeur) indique à quel nom d'hôte correspond une adresse IPv4 ou IPv6

#### Création
- Zone directe
- Propriété
- Catégorie Transfert de zone
- Autoriser vers uniquement serveur listé du DNS
- Aller dans catégorie Serveurs de noms
- Ajouter
- Win22SRV-02.FORMATION.LAN
- Ajouter son IP 192.168.10.11 (sera fait plus tard)
- OK
- Les deux machines seront visibles en tant que DNS
- Valider
- F5 sur la zone inversé
- Sera visible

- Même chose sur recherche inversé

- Sur SRV1 de zone directe
- Double cliquer
- Mettre à jour PTR, appliquer
- Retirer et re appliquer

### Délégation
- FORMATION.LAN
- Nouvelle délégation
- Nommer `m2i`
- Net name sera `m2i.FORMATION.LAN`
- Suivant
- Ajouter Server SRV03.m2i.FORMATION.LAN (exemple bidon)
- Ajouter son IP 192.168.10.20 (exemple bidon)
- Terminer

### Redirecteur
- Clique droit propriété SRV1
- Redirecteur
- Ajouter IP 9.9.9.9 (ex bidon) (Serveur qui gère la zone (FORMATION.LAN))