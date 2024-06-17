# Routeur Win22-SRV-RTR-1
- Ouvrir les connexions réseau du serveur Win22-RTR-1
- Déconnecter une à une les cartes sur Hyper-V pour les identifier
- Renommer les cartes en suivant leurs noms sur le routeur Windows

## Carte réseau 02-serveur
- `192.168.10.254`
- `255.255.255.0`

## Carte réseau 03-client
- `192.168.20.254`
- `255.255.255.0`

## Carte réseau 01-NAT
- `DHCP`

## Renommer le PC
- `Win22-SRV-RTR-1`

## Rôle accès à distance
- `Gestionnaire de serveur`
- `Gérer`
- `Ajouter des rôles et fonctionnalités`
- Rôles des serveurs : `Accès à distance`
- Service de rôle : `DirectAccess et VPN (accès à distance)`
- Service de rôle : `Routage`
- Outils : `Routage et accès à distance` est disponible

## Configuration du routage et accès à distance
- Clique droit sur le `Win22-SRV-RTR-1`
- `Configurer et activer le routage et l'accès distance`
- `Configuration personnalisée`
- Activer `Routage réseau` et `NAT`
- Le service va démarrer

### NAT
- Dans `Win22-SRV-RTR`, `IPv4` : `Clique droit` sur la carte `NAT`
- `Nouvelle interface`
- Choisir la carte `01-NAT`
- `Interface publique et connectée à internet`, et `Activer NAT sur cette interface`

## Sur la machine client
### Sortir du domaine
- Sortir le client du domaine en le mettant dans le `WORKGROUP`
- La permission administrateur du domaine va être demandée `FORMATION\Administrateur`
## Passer sur la carte réseau Clients
- Sur `Hyper-V`
- `Fichier`, `Paramètres`
- `Carte réseau` : `Clients`
## Passer sur le réseau 192.168.20.x
- `192.168.20.15`
- `255.255.255.0`
- `192.168.20.254`
- Le DNS ne changent pas
## Vérifier le nouveau réseau
- Commande : `nslookup www.formation.lan`, `nslookup 192.168.10.10`, et `nslookup 192.168.10.11`
- Le Win22-SRV-1 va répondre via le DNS
```
C:\Users\PC-1>nslookup 192.168.10.10
Serveur :   WIN22-SRV-1.FORMATION.LAN
Address:  192.168.10.10

Nom :    WIN22-SRV-1.FORMATION.LAN
Address:  192.168.10.10


C:\Users\PC-1>nslookup 192.168.10.11
Serveur :   WIN22-SRV-1.FORMATION.LAN
Address:  192.168.10.10

Nom :    WIN22-SRV-2.FORMATION.LAN
Address:  192.168.10.11


C:\Users\PC-1>nslookup www.formation.lan
Serveur :   WIN22-SRV-1.FORMATION.LAN
Address:  192.168.10.10

Nom :    win22-srv-1.formation.lan
Address:  192.168.10.10
Aliases:  www.formation.lan
```

## Ajout d'une zone sur Win22-SRV-1
### Nouvelle zone de recherches inversés
- `Clique droit` sur `Zone de recherche inversée`, `Nouvelle zone`
- `Enregistrer la zone dans Active Directory` à cocher
- `Vers tout les serveurs DNS exécutés sur des controleurs de domaine dans ce domaine : FORMATION.LAN`
- Ajouter la zone `192.168.20`
- Ce qui donne la zone `20.168.192.in-addr.arpa`

### Enregistrer l'ancienne zone de recherche inversé dans l'active directory
- `Zone de recherche inversé`
- `Clique droit` sur la zone `10.168.192.in-addr.arpa`, `Propriétés`
- `Type` : `Zone principale`, `Modifier`
- `Enregistrer la zone dans Active Directory` à cocher

### Passer zones en mise à jours sécurisé
#### Zone de recherche inversés sécurisé
- `Clique droit` sur chaque `zone de recherche inversés`
- `Propriétés`
- `Mises à jours dynamiques` : `Sécurisés uniquement`

#### Zone FORMATION.LAN sécurisé
- `Clique droit` sur `FORMATION.LAN` dans la `zone de recherche directes`
- `Type` : `Zone principale`, `Modifier`
- Ajouter la zone `Enregistrer la zone dans Active Directory`
- Passer `Mises à jours dynamiques` : `Sécurisés uniquement`