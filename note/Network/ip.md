# Adresse réseau IP
- L'adresse de réseau permet de savoir si 2 machines peuvent communiquer entre elles.  
- Si ces 2 machines ont une adresse réseau identique, alors, elles appartiennent au même réseau et elles peuvent communiquer.  

## Exemple
- Soit l'adresse IP suivante : `192.168.0.10` `/24` (`255.255.255.0`).  
- Soit l'adresse réseau : `192.168.0.0`, écrit sous forme décimale pointée.
- Et avec comme adresse de broadcast : `192.168.0.255`

## IPv4
- Internet Protocol version 4

- ![IPV4](https://github.com/Altherneum/.github/blob/main/note/assets/images/Adresse_Ipv4.png?raw=true)

- Codées sur 32 bits. Au maximum 4"'294"967'296, soit 232 adresses peuvent donc être attribuées simultanément en théorie
- L'épuisement des adresses IPv4 a conduit au développement d'une nouvelle version d'IP, IPv6

-  La plage d'attribution s'étend de `0.0.0.0` à `255.255.255.255`

- Classe A : `0.0.0.0` à `126.255.255.255` `/8` (`255.0.0.0`)
- Classe B : `128.0.0.0` à `191.255.255.255` `/16` (`255.255.0.0`)
- Classe C : `192.0.0.0` à `223.255.255.255` `/24` (`255.255.255.0`)
- Classe D (multicast) : `224.0.0.0` à `239.255.255.255`
- Classe E (réservée) : `240.0.0.0` à `255.255.255.255`

- `127.x.x.x` est réservé (voir [adresses utiles](#adresses-utiles))

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

## IP fixe
- La principale différence entre les adresses IP statiques et dynamiques est qu'une adresse IP statique reste la même
- Une adresse IP statique est un indicateur d'une configuration manuelle attribué à un dispositif.
## IP dynamique
- Tandis qu'une adresse IP dynamique change chaque fois que le dispositif se connecte.
- [voir DHCP](#DHCP)

## IP publique
- Les adresses IPv4 sont dites publiques si elles sont enregistrées et routables sur Internet, elles sont donc uniques mondialement.
- À l'inverse, les adresses privées ne sont utilisables que dans un réseau local, et ne doivent être uniques que dans ce réseau.
- La traduction d'adresse réseau, réalisée notamment par les box internet, transforme des adresses privées en adresses publiques et permet d’accéder à Internet à partir d'un poste du réseau privé.

- [iplocation.net/ip-lookup](https://www.iplocation.net/ip-lookup)

## IP privée
- Un réseau privé est un réseau qui utilise les plages d'adressage IP définies par la RFC 19181,2 « Address Allocation for Private Internets ».
- Ces adresses ne sont pas routées sur Internet.
- Un réseau privé peut être numéroté librement avec les plages d'adresses privées prévues à cet effet.
- Par opposition aux adresses publiques d'Internet, ces adresses ne sont pas uniques, plusieurs réseaux pouvant utiliser les mêmes adresses.
- `10.0.0.0` à `10.255.255.255` `/8` (`/255.0.0.0`)
- `172.16.0.0` à `172.31.0.0` `/16` (`/255.255.0.0`)
- `192.168.0.0` à `192.168.255.0` `/24` (`/255.255.255.0`)

## Adresses utiles
- `0.0.0.0` à `	0.255.255.255` `/8` (`/255.0.0.0`) Ce réseau
- `127.0.0.0` à `127.255.255.255` `/8` (`/255.0.0.0`) Boucle locale  
localhost est le nom habituel qui désigne une interface logique de l’ordinateur local
- `169.254.0.0` à `169.254.255.255` `/16` (`/255.255.0.0`) APIPA  
(Auto provisionning) (pas de DHCP ou IP statique déjà existante en doublon)
- `172.16.0.0` à `172.31.255.255` `/12` (`255.240.0.0`) [Adresse IP privée](#ip-privée)
- `192.88.99.0` à `192.88.99.255` `/24` (`255.255.255.0`) IPv6 vers IPv4 (6to4) anycast
- `192.168.0.0` à `192.168.255.255` `/16` (`/255.255.0.0`) [Adresse IP privée](#ip-privée)
- `198.18.0.0` à `198.19.255.255` `/15` (`255.254.0.0`) Tests de performance
- `224.0.0.0` à `239.255.255.255` `/4` (`240.0.0.0`) Multicast « Multidiffusion »
- `240.0.0.0` `255.255.255.254` `/4` (`240.0.0.0`) Réservé à un usage ultérieur non précisé (Sauf 255.255.255.254)
- `255.255.255.253` à `255.255.255.254` `/31` (`255.255.255.252`) Point to Point Network (Uniquement deux adresses disponibles)
- `255.255.255.255` à `255.255.255.255` `/32` (`255.255.255.255`) broadcast limité

- [wikipedia.org/wiki/Reserved_IP_addresses](https://wikipedia.org/wiki/Reserved_IP_addresses)

## Adresse broadcast
- L'adresse de broadcast est une adresse IP qui termine en .255 dans des réseaux de classe A, B ou C, cette adresse est celle qui permet de faire de la diffusion à toutes les machines du réseau

# Passerelle
En informatique, une passerelle (en anglais, gateway) est le nom générique d'un dispositif permettant de relier deux réseaux informatiques de types différents, par exemple un réseau local et le réseau Internet  
Il existe différents types de passerelles :
- un répéteur est une passerelle de niveau 1,
- un pont une passerelle de niveau 2
- un relais, souvent appelé routeur, une passerelle de niveau 3

# Masque
- Le masque est un séparateur entre la partie réseau et la partie machine d'une adresse IP.  
- Le masque, comme l'adresse IP, est une suite de 4 octets, soit 32 bits. Chacun des ces bits peut prendre la valeur 1 ou 0.  
- Un masque de sous-réseau divise également une adresse IP en deux parties, créant ainsi deux composants différents d'un réseau.
- Classe A : `255.0.0.0` `/8` (224-2 = 16 777 214)
- Classe B : `255.255.0.0` `/16` (216-2 = 65 534)
- Classe C : `255.255.255.0` `/24` (28-2 = 254)
- `255.255.255.255` /32 (20-0 =1)

- [wikipedia.org/wiki/Sous-réseau](https://fr.wikipedia.org/wiki/Sous-réseau)

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