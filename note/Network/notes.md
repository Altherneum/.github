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



## Calculer les sous réseaux et nombre d'hôtes
### Déterminer le nombre de sous réseau
- Déterminer la classe de l'adresse IP par défaut  
(Voire [cours IP # Masque](https://doc.altherneum.fr/cours/ip.html#Masque) et [cours IP # IPv4](https://doc.altherneum.fr/cours/ip.html#IPv4))
- Soustraire le masque donné
- Ce qui donne `2 ^ [Résultat]` sous réseaux possibles

#### Exemple
```
192       . 168       . 1         . 116
1100 0000 . 1010 1000 . 0000 0001 . 0111 0100

255       . 255       . 255       . 240
1111 1111 . 1111 1111 . 1111 1111 . 1111 0000
```

- Ici la classe par défaut d'une adresse en 192.xxx. .... est une classe C (`/24`)
- Et le masque donné est (`/28`)
- `28 - 24 = 4`, le nombre de sous réseau maximum possible est donc `2 ^ 4`

#### Exemple 2
```
192       . 168       . 1         . 116
1100 0000 . 1010 1000 . 0000 0001 . 0111 0100

255       . 255       . 255       . 0
1111 1111 . 1111 1111 . 1111 1111 . 0000 0000
```
- Classe C (`/24`)
- Mois le masque (`/24`)
- `24 - 24 = 0` Il n'y a qu'un seul sous réseau possible

### Déterminer le nombre d'hôtes
- Déterminer le nombre de bits à 0 du masque
- Le nombre d'hôte est donc `2 ^ [Valeur] - 2`

#### Exemple 3
```
255       . 255       . 255       . 240
1111 1111 . 1111 1111 . 1111 1111 . 1111 0000
```

- Ici le masque est composé de 4 bits avec une valeur de 0 à sa fin
- Ce qui donne `2 ^ 4 - 2` = 14 hôtes maximum possible

#### Exemple 4
```
255       . 255       . 255       . 0
1111 1111 . 1111 1111 . 1111 1111 . 0000 0000
```
- Ici il y a 8 bits à 0 sur le masque
- `2 ^ 8 - 2` = 254 adresses disponibles pour connecter des hôtes

### Piège de l'adresse broadcast

Pour savoir si une adresse est disponible ou une adresse de broadcast : 
- Adresse à vérifier : `172.16.3.255`(`/23`)
- Adresse réseau : `172.16.2.0`(`/23`)
```
1010 1100 . 0001 0000 . 0000 0010 . 1111 1111    IP
1111 1111 . 1111 1111 . 1111 1110 . 0000 0000    Masque
1010 1100 . 0001 0000 . 0000 0010 . 0000 0000    Résultat condition ET
```

Cela donne donc
- `172 . 16 . 2 . 0` en adresse réseau
- `2 ^ 9 - 2` = 510 adresses disponibles
- `172 . 16 . 2 . 255` est toujours dans le même réseau et laisse encore `510-255` = 255 adresses libres
- La dernière adresse libre pour un hôte est donc `172 . 16 . 3 . 254`
- Le broadcast est donc sur `172 . 16 . 3 . 255`

### Créer un réseau de taille fixe
#### Exemple 5
- Créer un réseau de 520 hôtes :
```
| 2^9 | 2^8 | 2^7 |2^6 |2^5 |2^4 |2^3|2^2|2^1|2^0| Nombres d'hôtes possibles
| 512 | 256 | 128 | 64 | 32 | 16 | 8 | 4 | 2 | 1 |
|  x  |     |     |    |    |    |   |   |   |   |
```

`2 ^ 9 - 2` = 510
Le masque va permettre de stocker 510 hôtes
Il aura besoin de 9 bits sur 0 à sa fin : 
- `xxxx xxxx.xxxx xxxx.xxxx xxx0.0000 0000`
- Soit xxx.xxx.xxx.xxx ou /x

#### Exemple 6
Créer un réseau de 1500 hôtes
```
|2^11|2^10| 2^9 | 2^8 | 2^7 |2^6 |2^5 |2^4 |2^3|2^2|2^1|2^0|
|2048|1024| 512 | 256 | 128 | 64 | 32 | 16 | 8 | 4 | 2 | 1 |
|    |    |      |    |     |    |    |    |   |   |   |   |
```
`2 ^ x - 2` = x
Il aura besoin de x bits sur 0 à sa fin : 
- `xxxx xxxx.xxxx xxxx.xxxx xxxx.xxxx xxxx`
- Soit xxx.xxx.xxx.xxx ou /x




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