# Baie réseau
- Routeur
- Hub
- AD
- Serveur Web
- DHCP
- DMZ
- VLAN (1 par salle)
- PC

# Nota bene
- [ProxMox](https://www.proxmox.com/)
- [ipfire.org](https://www.ipfire.org/)

# Simulateur de réseau
- yEd : dessins réseau
- Cisco packet tracer : émulateur réseau
# Tools to check
- Confluence : logiciel de wiki, utilisé comme logiciel de travail collaboratif

# IP exemple CMD ipconfig
```
Description. . . . . . . . . . . . . . : TP-Link Wireless USB Adapter
Adresse physique . . . . . . . . . . . : 7C-8B-CA-06-90-87
DHCP activé. . . . . . . . . . . . . . : Oui
Configuration automatique activée. . . : Oui
Adresse IPv6 de liaison locale. . . . .: fe80::48a6:8d20:c31b:4a5a%28(préféré)
Adresse IPv4. . . . . . . . . . . . . .: 192.168.168.238(préféré)
Masque de sous-réseau. . . . . . . . . : 255.255.255.0
Bail obtenu. . . . . . . . . . . . . . : lundi 10 juin 2024 08:50:22
Bail expirant. . . . . . . . . . . . . : lundi 10 juin 2024 16:50:06
Passerelle par défaut. . . . . . . . . : 192.168.168.29
Serveur DHCP . . . . . . . . . . . . . : 192.168.168.29
IAID DHCPv6 . . . . . . . . . . . : 477924298
DUID de client DHCPv6. . . . . . . . : 00-01-00-07-2D-F6-55-FD-02-12-C3-7C-5D-A0
Serveurs DNS. . .  . . . . . . . . . . : 192.168.168.29
NetBIOS sur Tcpip. . . . . . . . . . . : Activé
```

# Outils IP log
[doc.altherneum.fr/outils/logger](https://doc.altherneum.fr/outils/logger.html)
# Outils IP subnet
[calculator.net/ip-subnet-calculator](https://www.calculator.net/ip-subnet-calculator.html)








# CIDR
/x
# Décimale pointé 
wwww.xxxx.yyyy.zzzz
# Calculer broadcast
Mettre tout les bits partie hôte à 1
# Calculer last adresse
Broad cast - 1
# Première adresse
Adresse réseau + 1
# Bits poids fort
# bits poids faible

# Créer un network de 1k poste Classe C
## Déterminer le masque
- 2^10=1024 (Le masque aura donc 10 bits à 0 sur sa fin)
- 1024 - 2 = 1022 (Adresses réservés (Nom réseau et broadcast))
- 1111 1111.1111 1111. 1111 1100.0000 0000 (Masque)
soit 255.255.252.0
## Déterminer l'IP
- Classe C = 192.168.0.0
soit 1100 0000.1010 1000.0000 0000.0000 0000
## Appliquer le ET logique
```
1100 0000.1010 1000.0000 0000.0000 0000 IP
1111 1111.1111 1111.1111 1100.0000 0000 masque
1100 0000.1010 1000.0000 0000.0000 0000 résultat
```

Passer tout les 0 partie hôte à 1 pour avoir le broad cast
```
1111 1111.1111 1111.1111 1100.0000 0000 masque
1100 0000.1010 1000.0000 0011.1111 1111 broadcast = 192.168.3.255
```

# Créer 8 sous réseau
- Adresse IP : 192.168.0.0/24
- 8 Sous réseau à créer
## Début
- Il faut donc prendre 3 bits (2^3 = 8) sur le masque
- Masque /24 = 1111 1111 . 1111 1111 . 1111 1111 . 0000 0000
- Le masque avec les 3 bits requis = `1111 1111 . 1111 1111 . 1111 1111 . 1110 0000` = `255.255.255.224`
- `192.168.0.0` = `1100 0000 . 1010 1000 . 0000 0000 . 0000 0000`
- Appliquer le ET logique
```
1100 0000 . 1010 1000 . 0000 0000 . 0000 0000 IP
1111 1111 . 1111 1111 . 1111 1111 . 1110 0000 Masque
1100 0000 . 1010 1000 . 0000 0000 . 0000 0000 Résultat
```
## Trouver l'adresse broadcast du réseau
Passer les bits de l'adresse hôte à 1 pour avoir le broad cast
```
1111 1111 . 1111 1111 . 1111 1111 . 1110 0000 Masque
1100 0000 . 1010 1000 . 0000 0000 . 0000 0000 Résultat
1100 0000 . 1010 1000 . 0000 0000 . 0001 1111 Broadcast
```
`1100 0000 . 1010 1000 . 0000 0000 . 0000 0000` = `192.168.0.31`
On sait donc que toutes les 31 adresse on change de sous réseau
## Déduire
Liste des adresse réseau 
- 192.168.0.0,
- 192.168.0.31, 
- 192.168.0.62, 
- 192.168.0.96, 
- 192.168.0.128, 
- 192.168.0.160, 
- 192.168.0.192, 
- 192.168.0.224

On dispose bien de 8 sous réseaux









# Créer un réseau de 80K IP
# Question
- Créer un réseau de `80'000 IPs`
- Adresse IP `172.16.0.0/16`
# Début
- `2^17` = `131 072 - 2` (Broadcast et nom du réseau) = `131 070 adresses` possibles
- Le masque aura donc `17 bits à 0`
`xxxx xxxx.xxxx xxx0.0000 0000.0000 0000`
- Le masque fournis est /16 (donc trop petit)
- Il devient `1111 1111.1111 1110.0000 0000.0000 0000`
- Ce qui vaut `255.254.0.0`
- L'IP était `172.16.0.0`, soit `1010 1100.0001 0000.0000 0000.0000 0000`
- En passant les bits hôte à 1 pour l'adresse de broadcast cela devient `1010 1100.0001 0001.1111 1111.1111 1111` ce qui vaut 172.17.255.255 en broadcast

# Créer plusieurs réseau
## Question
- IP = 192.168.100.0/24
- Souhaite un réseau de 60, 30 et 12 adresses
## Début
- `192.168.100.0` = `1110 0000.1010 1000.01100100.0000 0000`
- `/24` = `1111 1111.1111 1111.1111 1111.0000 0000`
## Réseau de 60
- `2^6 = 64` `64-2` = 62 adresses possibles
- Le masque aura donc 6 bits à 0 à sa fin
- `/24` = `1111 1111.1111 1111.1111 1111.0000 0000` est déjà bon
- Adresse réseau : `192.168.100.0/24`
- 1ère adresse : `192.168.100.1/24`
- BroadCast : Passer les bits hôte à 1 = 
```
1111 1111.1111 1111.1111 1111.0000 0000 Masque
1110 0000.1010 1000.0110 0100.0000 0000 IP
1110 0000.1010 1000.0110 0100.1111 1111 Broadcast
```
`1110 0000.1010 1000.0110 0100.1111 1111` = `192.168.100.255`
## Réseau de 60
- Début nouvelle adresse `192.168.101.000`
- `2^5 = 32` `32-2` = 30 adresses possible
- Le masque aura donc 5 bits à 0 sur sa fin
- `/25` = `1111 1111.1111 1111.1111 1111.1000 0000`