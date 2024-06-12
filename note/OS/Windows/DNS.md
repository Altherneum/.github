# DNS
- Domain Name System
- Le Domain Name System ou DNS est un service informatique distribué qui associe les noms de domaine Internet avec leurs adresses IP ou d'autres types d'enregistrements

## Ajouter le rôle DNS
- Gestionnaire de serveur
![](https://github.com/Altherneum/.github/blob/main/note/assets/chrome_FgY8qWm1tz.png?raw=true)
- Gérer
- Ajouter des rôles et fonctionnalité
- Suivant * 3 
- Cocher rôle DNS ![DNS checkbox](https://github.com/Altherneum/.github/blob/main/note/assets/chrome_C6XVGkeqrD.png?raw=true)
- Suivant * 3
- Installer

![DNS config](https://github.com/Altherneum/.github/blob/main/note/assets/chrome_k9aumJnmnC.png?raw=true)

## Configurer le rôle DNS
Outils DNS

![Outils DNS](https://github.com/Altherneum/.github/blob/main/note/assets/chrome_5GF5YqqLxJ.png?raw=true)

#### Créer la zone DNS
- Clique droit sur SRV
- Nouvelle zone
- Zone principale
- Suivant
- Nommer zone FORMATION.LAN
- Suivant
- Autoriser les mises à jours dynamique sécu et non sécu
- Suivant

![Resultat](https://github.com/Altherneum/.github/blob/main/note/assets/chrome_EjU5ccZeDI.png?raw=true)

#### DNS inversé
- Recherche invesré
- Principale
- Suivant
- ID réseau : 192.168.10
- Autoriser màj séco non sécu

![Resultat](https://github.com/Altherneum/.github/blob/main/note/assets/chrome_2jJk7YWiZA.png?raw=true)

#### Vérifier le DNS
- Puis `/ipconfig registerdns`
- puis `nslookup 192.168.10.10`
- puis `nslookup WIN22-SRV-1`

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