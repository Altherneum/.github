# DNS
- Domain Name System
- Le Domain Name System ou DNS est un service informatique distribué qui associe les noms de domaine Internet avec leurs adresses IP ou d'autres types d'enregistrements

## Liste d'enregistrement DNS
- `SRV` Service  
Permettent à des services tels que la messagerie instantanée et la VoIP d’être redirigés vers un hôte et un port distincts

- `NS` Name Server  
Spécifient les serveurs de noms faisant autorité pour un domaine ou des sous-domaines

- `SOA` Start of Authority  
Stockent les informations concernant les domaines. Ils redirigent la propagation de la zone DNS vers les serveurs de noms secondaires.

- `CNAME` Canonical Name  
Fournit un alias pour un autre domaine lorsque vous voulez qu’un sous domaine pointe vers un autre site internet

- `A` Address  
nom de domaine complet vers une adresse IPv4

- `AAAA` Quad A  
nom de domaine complet vers une adresse IPv6

- `TXT` Text  
Permettent aux administrateurs d’ajouter une quantité limitée de notes lisibles par l’humain et la machine. Ils peuvent servir à valider des e-mails, vérifier un site et son propriétaire

- `MX` Mail e**X**changer  
Utilise des serveurs de messagerie pour déterminer l’endroit où livrer les e-mails d’un domaine.

- `PTR` Pointer  
Les enregistrements PTR sont utilisés dans le cadre des recherches DNS inversées. Alors que les enregistrements de type A et AAAA permettent de mapper des FQDN à des adresses IP, les enregistrements PTR font le contraire : ils mappent les adresses IP aux noms de domaine

# Création d'un serveur DNS

A VERIFIER
<details>

## Passer le DNS en statique
- Explorateur de fichiers
- Paramètres carte réseau
- Ethernet
- Propriétés
- IPv4
- IP statique en suivant [# DNS](#DNS)

![DNS IP settings](https://github.com/Altherneum/.github/blob/main/note/assets/chrome_ChaWlB2FCn.png?raw=true)

- Puis faire un [flushDNS](#flushdns)

### flushdns
- Une fois l'adresse IP modifiée
- Vérifier la configuration  
`ipconfig /all`
- Penser à flush le DNS  
`ipconfig /flushdns` Vide le cache DNS
- Penser à ping pour vérifier  
`ping 192.168.10.10`

### Renommer l'ordinateur et changer le suffixe DNS
- Ce PC
- Propriétés
- Paramètres avancés du système 
- Nom de l'ordinateur
- Modifier
- Changer le nom du serveur `WIN22-SRV-1`
- Aller sur "Autre"
- Passer le suffix DNS vers `FORMATION.LAN`
- Redémarrer et vérifier via
`ipconfig /all`

</details>
FIN A VERIFIER

# Ajouter le rôle DNS
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

# Configurer le rôle DNS
![DNS config](https://github.com/Altherneum/.github/blob/main/note/assets/chrome_B4Jm3xvMDQ.png?raw=true)
- Aller dans la liste des outils pour configurer le DNS

## Créer la zone DNS
- Clique droit sur le serveur `WIN22-SRV-1`
- Nouvelle zone
- Zone principale
- Zone de recherche directe
- Nommer la zone `FORMATION.LAN`
- Autoriser les mises à jours dynamiques sécurisée et non sécurisée

![Resultat](https://github.com/Altherneum/.github/blob/main/note/assets/chrome_EjU5ccZeDI.png?raw=true)

## Créer la zone DNS inversé
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

## Créer l'alias DNS
- Clique droit sur le serveur `FORMATION.LAN`
- Nouvel alias (CNAME)...
- Nom de l'alias `www`
- Nom de domaine pleinement qualifié (FQDN) : `www.FORMATION.LAN.`
- Aller sur nom de domaine complet (FQDN) : "Parcourir"
- Cliquer sur les postes pour cibler le `WIN22-SRV-1`

![Resultat](https://github.com/Altherneum/.github/blob/main/note/assets/chrome_ALsvPrTtJ3.png?raw=true)

### Vérifier l'alias
Pour vérifier l'alias
- `nslookup www`
```
C:\Users\Administrateur>nslookup www
Serveur :   localhost
Address:  127.0.0.1

Nom :    win22-srv-1.FORMATION.LAN
Address:  192.168.10.10
Aliases:  www.FORMATION.LAN
```

## Deuxièmes DNS de secours
- Clique droit sur le serveur `FORMATION.LAN`
- Propriétés
- Catégorie `Transferts de zone`
- `Uniquement vers les serveurs listés dans l'onglet Serveurs de nom`
- Catégorie `Serveurs de noms`
- Bouton `Ajouter`
- `Nom de domaine complet (FQDN) du serveur` : `WIN22-SRV-2.FORMATION.LAN` ⚠ N'existe pas encore
- Ajouter son adresse IP `192.168.10.11` ⚠ N'existe pas encore

![Resultat](https://github.com/Altherneum/.github/blob/main/note/assets/chrome_dUHEL06aZH.png?raw=true)

### Vérifier le DNS de secours
![Resultat](https://github.com/Altherneum/.github/blob/main/note/assets/chrome_ghchyrj6yf.png?raw=true)

![Resultat](https://github.com/Altherneum/.github/blob/main/note/assets/chrome_EBOcB1Cvtg.png?raw=true)

### Forcer la mise à jour du PTR
- Dans `Zones de recherche directes`
- Double cliquer sur `WIN22-SRV-1`
- Cocher `Mettre à jour l'enregistrement de pointeur (PTR) associé`
- `Appliquer`
- Retirer la case cochée, et appliquer à nouveau

## Délégation
- Dans `Zones de recherche directes`
- Clique droit sur `FORMATION.LAN`
- `Nouvelle délégation`
- `Domaine délégué` : `m2i`
- `Nom de domaine pleinement qualifié` : `m2i.FORMATION.LAN`
- Ajouter Server `SRV03.m2i.FORMATION.LAN` ⚠ N'existe pas encore ⚠ Faux exemple
- Ajouter son IP `192.168.10.20` ⚠ N'existe pas encore ⚠ Faux exemple

## Redirecteurs
- Clique droit sur `WIN22-SRV-1`
- `Propriétés`
- `Redirecteurs`
- `Modifier`
- Ajouter l'adresse IP `9.9.9.9` ⚠ N'existe pas encore ⚠ Faux exemple  
(Serveur qui gère la zone `FORMATION.LAN`)