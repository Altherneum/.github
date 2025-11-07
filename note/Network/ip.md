# Adresse IP
- Une adresse IP (Internet Protocol) est un numéro d'identification unique attribué à chaque appareil connecté à un réseau informatique ou à Internet, permettant l'identification et la communication entre les dispositifs
  - Elle fonctionne comme une adresse postale ou un numéro de téléphone pour les appareils, facilitant l'acheminement des paquets de données d'un émetteur à un destinataire sur le réseau
- Les adresses IP sont généralement représentées sous deux formats principaux : 
  - IPv4, qui utilise une notation décimale avec quatre nombres compris entre 0 et 255 séparés par des points (par exemple, 127.0.0.1)
  - Et IPv6, qui utilise une notation hexadécimale plus longue pour offrir un espace d'adressage massivement plus vaste
- Cette identification est essentielle pour le routage des données, car chaque paquet transmis contient l'adresse IP de l'émetteur et celle du destinataire

## Adresse de réseau
- L'adresse de réseau permet de savoir si 2 machines peuvent communiquer entre elles
- Si ces 2 machines ont une adresse réseau identique, alors, elles appartiennent au même réseau local et elles peuvent communiquer via un switch
  - Si elles n'ont pas la même adresse réseau, le PC devra demander à sa passerelle (le routeur) de diriger le paquet vers un réseau pouvant connaitre cette IP

## Exemple d'adresse
- Soit l'adresse IP suivante : `192.168.0.10` `/24` (`255.255.255.0`)
- Soit l'adresse réseau : `192.168.0.0`, écrit sous forme décimale pointée
- Et avec comme adresse de broadcast : `192.168.0.255`

## IPv4
- Internet Protocol version 4

- ![IPV4](https://github.com/Altherneum/.github/blob/main/note/assets/images/Adresse_Ipv4.png?raw=true)

- Codées sur 32 bits. Au maximum 4"'294"967'296, soit 232 adresses peuvent donc être attribuées simultanément en théorie
- L'épuisement des adresses IPv4 a conduit au développement d'une nouvelle version d'IP, IPv6

-  La plage d'attribution s'étend de `0.0.0.0` à `255.255.255.255`

## IPv6
- Internet Protocol version 6
- Une adresse IPv6 est longue de 128 bits, soit 16 octets
- IPv6 est l'aboutissement des travaux menés au sein de l'IETF au cours des années 1990 pour succéder à IPv4
- Grâce à des adresses de 128 bits, IPv6 dispose d'un espace d'adressage bien plus important qu'IPv4 (plus de 340 sextillions)
- Exemple d'adresse IPv6 : `2001:0db8:0000:85a3:0000:0000:ac1f:8001`
- Il est permis d’omettre de un à trois chiffres zéros non significatifs dans chaque groupe de quatre chiffres hexadécimaux.  
Ainsi, l’adresse IPv6 ci-dessus est équivalente à la suivante : `2001:db8:0:85a3:0:0:ac1f:8001`
- Une unique suite de un ou plusieurs groupes consécutifs de 16 bits tous nuls peut être omise  
Ainsi, l’adresse IPv6 ci-dessus peut être abrégée en la suivante : `2001:db8:0:85a3::ac1f:8001`
- [wikipedia.org/wiki/IPv6](https://fr.wikipedia.org/wiki/IPv6)

## Classes d'adresses
- Chaque adresse IP appartient à une classe qui correspond à une plage d’adresses IP
- Ces classes d’adresses sont au nombre de 5 c'est-à-dire les classes A, B, C, D et E
- Le fait d’avoir des classes d’adresses permet d’adapter la taille du réseau

- __Classe A__ : `0.0.0.0` à `126.255.255.255` `/8` (`255.0.0.0`)
- __Classe B__ : `128.0.0.0` à `191.255.255.255` `/16` (`255.255.0.0`)
- __Classe C__ : `192.0.0.0` à `223.255.255.255` `/24` (`255.255.255.0`)
- __Classe D (multicast)__ : `224.0.0.0` à `239.255.255.255`
- __Classe E (réservée)__ : `240.0.0.0` à `255.255.255.255`

## Masque
### Définition
- Le masque est un séparateur entre la partie réseau et la partie machine d'une adresse IP
- On l'appel aussi CIDR (Classless Inter-Domain Routing) dans son format `IP/CIDR` indiquant le nombre de bits dans le masque
- Le masque, comme l'adresse IP, est une suite de 4 octets, soit 32 bits. Chacun des ces bits peut prendre la valeur 1 ou 0
- Un masque de sous-réseau divise également une adresse IP en deux parties, créant ainsi deux composants différents d'un réseau.
### Classes
- Classe A : `255.0.0.0` `/8` (224-2 = 16 777 214 hôtes)
- Classe B : `255.255.0.0` `/16` (216-2 = 65 534 hôtes)
- Classe C : `255.255.255.0` `/24` (28-2 = 254 hôtes)
- `255.255.255.255` `/32` (20-0 = 1 hôte)
### Liste de masque
Nombres d'IP par réseau, Nombres de réseaux, Masque au format CIDR (Nombres de bits du masque), Masque au format numérique
- IP : `1`, Réseaux : `0`, CIDR : `/32`, Masque : `255.255.255.255`
- IP : `2`, Réseaux : `1`, CIDR : `/31`, Masque : `255.255.255.254`
- IP : `4`, Réseaux : `2`, CIDR : `/30`, Masque : `255.255.255.252`
- IP : `8`, Réseaux : `3`, CIDR : `/29`, Masque : `255.255.255.248`
- IP : `16`, Réseaux : `4`, CIDR : `/28`, Masque : `255.255.255.240`
- IP : `32`, Réseaux : `5`, CIDR : `/27`, Masque : `255.255.255.224`
- IP : `64`, Réseaux : `6`, CIDR : `/26`, Masque : `255.255.255.192`
- IP : `128`, Réseaux : `7`, CIDR : `/25`, Masque : `255.255.255.128`
- IP : `256`, Réseaux : `8`, CIDR : `/24`, Masque : `255.255.255.0`
- IP : `512`, Réseaux : `9`, CIDR : `/23`, Masque : `255.255.254.0`
- IP : `1 K`, Réseaux : `10`, CIDR : `/22`, Masque : `255.255.252.0`
- IP : `2 K`, Réseaux : `11`, CIDR : `/21`, Masque : `255.255.248.0`
- IP : `4 K`, Réseaux : `12`, CIDR : `/20`, Masque : `255.255.240.0`
- IP : `8 K`, Réseaux : `13`, CIDR : `/19`, Masque : `255.255.224.0`
- IP : `16 K`, Réseaux : `14`, CIDR : `/18`, Masque : `255.255.192.0`
- IP : `32 K`, Réseaux : `15`, CIDR : `/17`, Masque : `255.255.128.0`
- IP : `64 K`, Réseaux : `16`, CIDR : `/16`, Masque : `255.255.0.0`
- IP : `128 K`, Réseaux : `17`, CIDR : `/15`, Masque : `255.254.0.0`
- IP : `256 K`, Réseaux : `18`, CIDR : `/14`, Masque : `255.252.0.0`
- IP : `512 K`, Réseaux : `19`, CIDR : `/13`, Masque : `255.248.0.0`
- IP : `1 M`, Réseaux : `20`, CIDR : `/12`, Masque : `255.240.0.0`
- IP : `2 M`, Réseaux : `21`, CIDR : `/11`, Masque : `255.224.0.0`
- IP : `4 M`, Réseaux : `22`, CIDR : `/10`, Masque : `255.192.0.0`
- IP : `8 M`, Réseaux : `23`, CIDR : `/9`, Masque : `255.128.0.0`
- IP : `16 M`, Réseaux : `24`, CIDR : `/8`, Masque : `255.0.0.0`
- IP : `32 M`, Réseaux : `25`, CIDR : `/7`, Masque : `254.0.0.0`
- IP : `64 M`, Réseaux : `26`, CIDR : `/6`, Masque : `252.0.0.0`
- IP : `128 M`, Réseaux : `27`, CIDR : `/5`, Masque : `248.0.0.0`
- IP : `256 M`, Réseaux : `28`, CIDR : `/4`, Masque : `240.0.0.0`
- IP : `512 M`, Réseaux : `29`, CIDR : `/3`, Masque : `224.0.0.0`
- IP : `1024 M`, Réseaux : `30`, CIDR : `/2`, Masque : `192.0.0.0`
- IP : `2048 M`, Réseaux : `31`, CIDR : `/1`, Masque : `128.0.0.0`
- IP : `4096 M`, Réseaux : `32`, CIDR : `/0`, Masque : `0.0.0.0`

## IP fixes et dynamiques
### IP fixe
- La principale différence entre les adresses IP statiques et dynamiques est qu'une adresse IP statique reste la même
- Une adresse IP statique est un indicateur d'une configuration manuelle attribué à un dispositif.
### IP dynamique
- Tandis qu'une adresse IP dynamique change chaque fois que le dispositif se connecte.
- [voir DHCP](#DHCP)

## Portée des IP
### IP publique
- Les adresses IPv4 sont dites publiques si elles sont enregistrées et routables sur Internet, elles sont donc uniques mondialement.
- À l'inverse, les adresses privées ne sont utilisables que dans un réseau local, et ne doivent être uniques que dans ce réseau.
- La traduction d'adresse réseau, réalisée notamment par les box internet, transforme des adresses privées en adresses publiques et permet d’accéder à Internet à partir d'un poste du réseau privé.
### IP privée
- Un réseau privé est un réseau qui utilise les plages d'adressage IP définies par la RFC 19181,2 « Address Allocation for Private Internets ».
- Ces adresses ne sont pas routées sur Internet.
- Un réseau privé peut être numéroté librement avec les plages d'adresses privées prévues à cet effet.
- Par opposition aux adresses publiques d'Internet, ces adresses ne sont pas uniques, plusieurs réseaux pouvant utiliser les mêmes adresses.
### Adresses utiles

- [wikipedia.org/wiki/Reserved_IP_addresses](https://wikipedia.org/wiki/Reserved_IP_addresses)
### Adresse broadcast
- L'adresse de broadcast est une adresse IP qui termine en .255 dans des réseaux de classe A, B ou C, cette adresse est celle qui permet de faire de la diffusion à toutes les machines du réseau

## Liste des IP
- **__Spéciale__** `0.0.0.0` à `0.255.255.255` `/8` (`/255.0.0.0`) Ce réseau
- **__Publique__** `1.0.0.0` à `9.255.255.255` `/8` (`255.0.0.0`)
- **__Privée__** `10.0.0.0` à `10.255.255.255` `/8` (`/255.0.0.0`)
- **__Publique__** `11.0.0.0` à `100.63.255.255` `/8` (`255.0.0.0`)
- **__Privée__** `100.64.0.0` à `100.127.255.255` `/10` (`255.192.0.0`) Espace partagé pour Carrier Grade NAT
- **__Publique__** `100.128.0.0` à `126.255.255.255` `/8` (`255.0.0.0`)
- **__Spéciale__** `127.0.0.0` à `127.255.255.255` `/8` (`/255.0.0.0`) Boucle locale (`localhost`) est le nom habituel qui désigne une interface logique de l’ordinateur local
- **__Publique__** `128.0.0.0` à `169.253.255.255` `/16` (`255.255.0.0`)
- **__Spéciale__** `169.254.0.0` à `169.254.255.255` `/16` (`/255.255.0.0`) APIPA (Auto provisionning) (pas de DHCP ou IP statique déjà existante en doublon)
- **__Publique__** `169.255.0.0` à `172.15.255.255` `/16` (`255.255.0.0`)
- **__Privée__** `172.16.0.0` à `172.31.255.255` `/12` (`255.240.0.0`)
- **__Publique__** `172.32.0.0` à `191.255.255.255` `/16` (`255.255.0.0`)
- **__Spéciale__** `192.0.0.0` à `192.0.0.255` `/24` (`255.255.255.0`) Réservé par l'IETF
- **__Publique__** `192.0.1.0` à `192.0.1.255` `/24` (`255.255.255.0`)
- **__Spéciale__** `192.0.2.0` à `192.0.2.255` `/24` (`255.255.255.0`) Réseau de test TEST-NET-1 / documentation
- **__Publique__** `192.0.3.0` à `192.88.98.255` `/24` (`255.255.255.0`)
- **__Spéciale__** `192.88.99.0` à `192.88.99.255` `/24` (`255.255.255.0`) IPv6 vers IPv4 (6to4) anycast
- **__Publique__** `192.88.100.0` à `192.167.255.255` `/24` (`255.255.255.0`)
- **__Privée__** `192.168.0.0` à `192.168.255.255` `/16` (`/255.255.0.0`)
- **__Publique__** `192.169.0.0` à `198.17.255.255` `/24` (`255.255.255.0`)
- **__Spéciale__** `198.18.0.0` à `198.19.255.255` `/15` (`255.254.0.0`) Tests de performance
- **__Publique__** `198.20.0.0` à `198.51.99.255` `/24` (`255.255.255.0`)
- **__Spéciale__** `198.51.100.0` à `198.51.100.255` `/24` (`255.255.255.0`) Réseau de test TEST-NET-2 / documentation
- **__Publique__** `198.51.101.0` à `203.0.112.255` `/24` (`255.255.255.0`)
- **__Spéciale__** `203.0.113.0` à `203.0.113.255` `/24` (`255.255.255.0`) Réseau de test TEST-NET-3 / documentation
- **__Publique__** `203.0.114.0` à `223.255.255.255` `/24` (`255.255.255.0`)
- **__Spéciale__** `224.0.0.0` à `239.255.255.255` `/4` (`240.0.0.0`) Multicast « Multidiffusion »
- **__Spéciale__** `240.0.0.0` `255.255.255.254` `/4` (`240.0.0.0`) Réservé à un usage ultérieur non précisé (Sauf 255.255.255.254)
- **__Spéciale__** `255.255.255.253` à `255.255.255.254` `/31` (`255.255.255.252`) Point to Point Network (Uniquement deux adresses disponibles)
- **__Spéciale__** `255.255.255.255` à `255.255.255.255` `/32` (`255.255.255.255`) broadcast limité

# Passerelle
En informatique, une passerelle (en anglais, gateway) est le nom générique d'un dispositif permettant de relier deux réseaux informatiques de types différents, par exemple un réseau local et le réseau Internet  
Il existe différents types de passerelles :
- un répéteur est une passerelle de niveau 1,
- un pont une passerelle de niveau 2
- un relais, souvent appelé routeur, une passerelle de niveau 3

# MAC
- Une adresse MAC, parfois nommée adresse physique, est un identifiant physique stocké dans une carte réseau ou une interface réseau similaire.  
- Elle est unique au monde. Toutes les cartes réseau ont une adresse MAC, même celles contenues dans les PC et autres appareils connectés.
- Lié au protocole ARP
- Cet identifiant est codé sur 48 bits, soit 6 octets, et est habituellement présenté sous forme hexadécimale

## Composition d'une adresse MAC
- 1 bit d” « individualité »: si le bit = 0 alors c’est une adresse unicast, sinon (bit=1) c’est un adresse multicast ou broadcast
- 1 bit d” « universalité »: si le bit=0 alors c’est le constructeur qui a défini l’adresse. C’est la fameuse notion de BIA – Burned-in Address. Si le bit=1 alors c’est l’administrateur de votre société qui a défini l’adresse. Chose très très rare donc à oublier.
- 22 bits – OUI (Organization Unit Identifier): identifie le constructeur parmi ses concurrents (Broadcom, Intel, Atheros…)
- 24 derniers bits : valeur définie par le constructeur pour rendre unique cette adresse MAC parmi toutes ses cartes réseaux

## Comprendre une adresse MAC
- Les 24 premiers bits (Diffusion+Local+OUI) identifient le type d’adresse et le constructeur

## Adresses particulières
- `FF:FF:FF:FF:FF:FF` Adresse broadcast
- `01:00:0C:CC:CC:CC` Cisco Discovery Protocol
- `01:80:C2:00:00:00` Spanning Tree Protocol
- `33:33:xx:xx:xx:xx` Adresses multicast IPv6
- `01:00:5E:xx:xx:xx` Adresses multicast IPv4
- `00:00:0c:07:ac:xx` Adresses HSRP
- `00:00:5E:00:01:XX` Adresses VRRP

# Exemple d'ipconfig Windows
## Ipconfig
```
C:\Users\user>ipconfig

Configuration IP de Windows

Carte Ethernet Ethernet :

   Suffixe DNS propre à la connexion. . . :

   Adresse IPv6. . . . . . . . . . . . . .: 2a01:e0a:912:5c0:7735:7686:d892:8c55

   Adresse IPv6 temporaire . . . . . . . .: 2a01:e0a:912:5c0:b8f3:b0a7:3505:32de

   Adresse IPv6 de liaison locale. . . . .: fe80::2d49:eb25:4822:8328%7

   Adresse IPv4. . . . . . . . . . . . . .: 192.168.1.73

   Masque de sous-réseau. . . . . . . . . : 255.255.255.0

   Passerelle par défaut. . . . . . . . . : fe80::3627:92ff:fe53:95e8%7

                                       192.168.1.254
```

## Ipconfig /all
```
C:\Users\user>ipconfig /all

Configuration IP de Windows

   Nom de l’hôte . . . . . . . . . . : win-user
   Suffixe DNS principal . . . . . . :
   Type de noeud. . . . . . . . . .  : Hybride
   Routage IP activé . . . . . . . . : Non
   Proxy WINS activé . . . . . . . . : Non

Carte Ethernet Ethernet :

   Suffixe DNS propre à la connexion. . . :
   Description. . . . . . . . . . . . . . : Realtek PCIe GbE Family Controller
   Adresse physique . . . . . . . . . . . : 3C-7C-3F-ED-BF-B9
   DHCP activé. . . . . . . . . . . . . . : Oui
   Configuration automatique activée. . . : Oui
   Adresse IPv6. . . . . . . . . . . . . .: 2a01:e0a:912:5c0:7735:7686:d892:8c55(préféré)
   Adresse IPv6 temporaire . . . . . . . .: 2a01:e0a:912:5c0:b8f3:b0a7:3505:32de(préféré)
   Adresse IPv6 de liaison locale. . . . .: fe80::2d49:eb25:4822:8328%7(préféré)
   Adresse IPv4. . . . . . . . . . . . . .: 192.168.1.73(préféré)
   Masque de sous-réseau. . . . . . . . . : 255.255.255.0
   Bail obtenu. . . . . . . . . . . . . . : lundi 21 juillet 2025 21:42:47
   Bail expirant. . . . . . . . . . . . . : mardi 22 juillet 2025 09:42:45
   Passerelle par défaut. . . . . . . . . : fe80::3627:92ff:fe53:95e8%7
                                       192.168.1.254
   Serveur DHCP . . . . . . . . . . . . . : 192.168.1.254
   IAID DHCPv6 . . . . . . . . . . . : 87850047
   DUID de client DHCPv6. . . . . . . . : 00-01-00-01-2F-7C-DF-15-3C-7C-3F-ED-BF-B9
   Serveurs DNS. . .  . . . . . . . . . . : 192.168.1.254
                                       fd0f:ee:b0::1
   NetBIOS sur Tcpip. . . . . . . . . . . : Activé
```

## Définition
- Votre routeur : [192.168.1.254](http://192.168.1.254/)
- Votre adresse locale (privée) : IPv4 `192.168.1.73`, IPv6 `2a01:e0a:912:5c0:7735:7686:d892:8c55`
- DHCP : Attribution d'adresse locale automatique ou statique : COURS DHCP
- Masque de sous-réseau : Masque permettant de calculer les parties d'adresse réseau et les emplacements adresse machines
- Serveur DNS : Serveur permettant de convertir une adresse web (Exemple : `Altherneum.fr`) en adresse IPv4 publique

## Adresse publique
### Adresse IPv6 publique
```
C:\Users\user>curl ifconfig.me
2a01:abc1:abc1:abc1:abc1:abc1:abc1:abc1
```
### Adresse IPv4 publique
```
C:\Users\user>curl -4 ifconfig.me
88.123.456.789
```