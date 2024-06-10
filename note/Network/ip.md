# Adresse réseau
- L'adresse de réseau permet de savoir si 2 machines peuvent communiquer entre elles.  
- Si ces 2 machines ont une adresse réseau identique, alors, elles appartiennent au même réseau et elles peuvent communiquer.  

- Soit l'adresse IP suivante : 192.168.0.10 /24.  
- Soit l'adresse réseau : 192.168.0.0, écrit sous forme décimale pointée.

# Adresse broadcast
- L'adresse de broadcast est une adresse IP qui termine en .255 dans des réseaux de classe A, B ou C, cette adresse est celle qui permet de faire de la diffusion à toutes les machines du réseau

# Masque
- Le masque est un séparateur entre la partie réseau et la partie machine d'une adresse IP.  
- Le masque, comme l'adresse IP, est une suite de 4 octets, soit 32 bits. Chacun des ces bits peut prendre la valeur 1 ou 0.  
- Un masque de sous-réseau divise également une adresse IP en deux parties, créant ainsi deux composants différents d'un réseau.
- Classe A : `255.0.0.0` `/8` (224-2 = 16 777 214)
- Classe B : `255.255.0.0` `/16` (216-2 = 65 534)
- Classe C : `255.255.255.0` `/24` (28-2 = 254)
- `255.255.255.255` /32 (20-0 =1)

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

# IPv4
- Internet Protocol version 4
- ![IPV4](https://upload.wikimedia.org/wikipedia/commons/thumb/3/34/Adresse_Ipv4.svg/440px-Adresse_Ipv4.svg.png)
- Codées sur 32 bits. Au maximum 4"'294"967'296, soit 232 adresses peuvent donc être attribuées simultanément en théorie
- L'épuisement des adresses IPv4 a conduit au développement d'une nouvelle version d'IP, IPv6
-  La plage d'attribution s'étend de `0.0.0.0` à `255.255.255.255`

# IPv6

# IP fixe
# IP dynamique

# IP publique
- Toutes les adresses n'étant pas "privé"
- [iplocation.net/ip-lookup](https://www.iplocation.net/ip-lookup)

# IP privée
- `10.0.0.0 /255.0.0.0`
- `172.16.0.0` à `172.31.0.0` `/255.255.0.0`
- `192.168.0.0` à `192.168.255.0` `/255.255.255.0`

# DHCP
# DNS

# Passerelle

# Classe
- A (0 à 127) (binaire 0xxx xxxx)
- B(128 à 191) (10xx xxxx)
- C (192 à 223) (110x xxxx)
- D, E
- Classe Less

# Adresse utiles
- `127.0.0.0` & `127.0.0.1` `/255.0.0.0` Boucle locale
Dans le domaine des réseaux informatiques, localhost est le nom habituel qui désigne une interface logique de l’ordinateur local. En informatique, on travaille souvent en mode client-serveur : une ou plusieurs machines envoient des requêtes à un serveur central qui envoie les réponses appropriées.
- `169.254.0.0` `/255.255.0.0` (APIPA) (Auto provisionning) (pas de DHCP ou IP statique déjà existante en doublon)
- [wikipedia.org/wiki/Reserved_IP_addresses](https://wikipedia.org/wiki/Reserved_IP_addresses)