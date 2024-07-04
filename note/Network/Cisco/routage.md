# Routage
show ip route
## Routage simple
- Afin de router vers le réseau `172.17.0.0` le paquet va prendre le chemin suivant
![image cisco](https://github.com/Altherneum/.github/blob/main/note/assets/images/PacketTracer_hxJE4ozS93.png?raw=true)
- Pour créer ce routage, le `Routeur5` doit savoir ou aller
- On va donc lui indiquer que le `CopyRouteur5` connait le chemin et préciser l'interface Ethernet.
- Dans le `Routeur5` créer la route statique pour aller au réseau `172.17.0.0` via l'interface entourée du `CopyRouteur5` `(Gig0/2)`
![image cisco](https://github.com/Altherneum/.github/blob/main/note/assets/images/PacketTracer_nD1Ro5DoIZ.png?raw=true)
![Interface du routeur](https://github.com/Altherneum/.github/blob/main/note/assets/images/PacketTracer_FvUjtKC88s.png?raw=true)

## Routage intermédiaire
- Lors une route casse, nous allons devoir créer une nouvelle route afin de rediriger le traffic au bon endroit
![Image cisco avec route en moins](https://github.com/Altherneum/.github/blob/main/note/assets/images/PacketTracer_1LaxJbFkfa.png?raw=true)
![Image cisco bis](https://github.com/Altherneum/.github/blob/main/note/assets/images/PacketTracer_xEZwjLLbZI.png?raw=true)
- On va donc créer une nouvelle route statique sur le routeur `Routeur5` et le `CopyRouteur5`
- `CopyRouteur5(1)` connait déjà toutes les routes et n'aura donc aucune route à créer

- Le `Routeur5` va donc avoir une nouvelle route pour lui indiquer que le `CopyRouteur5(1)` connait la route, qui lui même va rediriger vers le `CopyRouteur5` pour aller sur le réseau `172.17.0.0`
- L'inverse va être fait, le `CopyRouteur` va avoir une nouvelle route statique vers `CopyRouteur(1)` qui lui même va rediriger à son tour vers `Routeur5` pour aller vers le réseau `172.18.0.0`

## Routage dynamique
[RIP](https://fr.wikipedia.org/wiki/Routing_Information_Protocol) vs [OSPF](https://fr.wikipedia.org/wiki/Open_Shortest_Path_First)
- `RIP (Routing Information Protocol)` sera le routage sera le chemin avec le moins de saut (Routeur)
- D'autre comme `OSPF (Open Shortest Path First)` prendront la route la plus rapide (Exemple un réseau fibré ou un réseau sans latence), plustôt que la route avec le moins de saut

### Routage RIP
#### Routage RIP automatique
- Sur le routeur : `CopyRouteur5(1)`
-  `enable ` Passe en mode Super user
- `configure terminal ` Passe en mode configuration
- `router RIP` Active le routage RIP
- `version 2` (optionnel, si vous voulez utiliser RIPv2)
- `network [network_address]`
  - `network 172.17.0.0`
  - `network 192.168.3.0`
  - `network 192.168.2.0` Active la découverte automatique de route dynamique vers tout ces réseaux

#### Vérification
- `show ip route`
- `show ip protocols`
- `show ip rip database`

### Routage OSPF
Exemple sur le routeur `Routeur5` 
(R1 sur l'image) NB : à modifier avec les PKT
- `enable`
- `configure terminal`
- `router ospf [process-id]`
  - `router OSPF 1`
- `router-id [Unique_ID]`
  - `router-id 1.1.1.1`
- `network [network_address] [wildcard_mask] area [area_id]`
  - `network 10.255.255.0   0.0.0.3     area 0`
  - `network 10.255.255.8   0.0.0.3     area 0`
  - `network 172.16.0.0     0.0.0.255   area 0`

![cisco OSPF image](https://github.com/Altherneum/.github/blob/main/note/assets/images/ms-teams_9knjVRjsVE.png?raw=true)

Il ne crée que les branches qui lui sont rattachés


- `show ip route ospf`
- `show ip ospf neighbor`
- `show ip ospf database`
- `no ip ospf network`

To filter
```
Exemple de Configuration
Supposons que nous avons un réseau avec les segments suivants :
- Réseau 192.168.1.0/24 dans la zone 0
- Réseau 10.0.0.0/8 dans la zone 1
La configuration OSPF serait la suivante :
Router> enable
Router# configure terminal
Router(config)# router ospf 1
Router(config-router)# network 192.168.1.0 0.0.0.255 area 0
Router(config-router)# network 10.0.0.0 0.255.255.255 area 1
Router(config-router)# exit
Router(config)# exit

pourquoi area 1 & 2 et pas que 0 ??????
```
















TO CHECK
#### Routage RIP manuel
- `router RIP` Active le routage RIP
- `ip route 192.168.10.0 255.255.255.0 192.168.254.1` Configure le routage de l'adresse `10.0` vers `254.1`
- `network 172.18.0.0` active le routage dynamique vers le réseau 172.18.0.0 (doit être fait sur tout les réseaux)

- `show running-config`











# Enhanced Interior Gateway Routing Protocol (EIGRP)
TO FILTER
```
est un protocole de routage avancé développé par Cisco. Il combine les avantages des protocoles de routage distance-vector et link-state, offrant une convergence rapide et une grande scalabilité. Voici un aperçu détaillé de ses caractéristiques, fonctionnement et configuration.
Caractéristiques de EIGRP
- Protocole Hybride : EIGRP est souvent considéré comme un protocole hybride car il utilise des caractéristiques à la fois des protocoles distance-vector et link-state.
- Convergence Rapide : Grâce à son algorithme DUAL (Diffusing Update Algorithm), EIGRP peut trouver rapidement des routes de remplacement sans recalculer toute la table de routage.
- Métrique Composite : EIGRP utilise une métrique composite basée sur la bande passante, le délai, la charge, la fiabilité et la MTU. Par défaut, seuls la bande passante et le délai sont utilisés.
- Support pour VLSM et CIDR : EIGRP supporte les masques de sous-réseau variables (VLSM) et le routage sans classe (CIDR), permettant une gestion plus efficace des adresses IP.
- Mises à Jour Partielles : Au lieu d'envoyer des mises à jour complètes, EIGRP envoie des mises à jour partielles et incrémentales lorsque les changements de topologie se produisent, ce qui réduit l'utilisation de la bande passante.
- Tables Multiples : EIGRP maintient plusieurs tables : une table de voisinage, une table de topologie et une table de routage.
- Support Multicast et Unicast : Les mises à jour de routage peuvent être envoyées en multicast (224.0.0.10) ou en unicast.
Fonctionnement de EIGRP
- Découverte de Voisins : Les routeurs EIGRP envoient des paquets Hello pour découvrir et maintenir des adjacences avec des routeurs voisins.
- Formation de la Table de Voisinage : Les routeurs voisins qui répondent aux paquets Hello sont ajoutés à la table de voisinage.
- Échange d'Informations de Routage : Les routeurs échangent des mises à jour de routage pour construire leur table de topologie.
- Algorithme DUAL : EIGRP utilise l'algorithme DUAL pour garantir des chemins sans boucle et déterminer les routes optimales vers chaque destination.
- Tables de Routage : Les informations de la table de topologie sont utilisées pour construire la table de routage.
Configuration de Base de EIGRP sur un Routeur Cisco
```

```
- Accéder au mode de configuration globale :
Router> enable
Router# configure terminal
- Activer EIGRP et spécifier un AS (Autonomous System) Number :
Router(config)# router eigrp [as_number]
- Définir les réseaux à annoncer :
Router(config-router)# network [network_address] [wildcard_mask]
Exemple de Configuration
Supposons que nous avons un réseau avec les segments suivants :
- Réseau 192.168.1.0/24
- Réseau 10.0.0.0/8
La configuration EIGRP serait la suivante :
Router> enable
Router# configure terminal
Router(config)# router eigrp 1
Router(config-router)# network 192.168.1.0 0.0.0.255
Router(config-router)# network 10.0.0.0 0.255.255.255
Router(config-router)# exit
Router(config)# exit
```

```
Vérification de la Configuration
Pour vérifier la configuration et le fonctionnement de EIGRP, vous pouvez utiliser les commandes suivantes :
- Afficher les routes EIGRP :
Router# show ip route eigrp
- Afficher les voisins EIGRP :
Router# show ip eigrp neighbors
- Afficher la table de topologie EIGRP :
Router# show ip eigrp topology
Conclusion
EIGRP est un protocole de routage puissant et flexible, idéal pour les réseaux de moyenne à grande taille. Il offre une convergence rapide, une utilisation efficace de la bande passante et une grande scalabilité. Bien que plus complexe à configurer que des protocoles comme RIP, ses avantages en termes de performance et de fonctionnalités en font un choix populaire pour les réseaux Cisco.
```















# Exemple
PTK : multi-routeur-routage-cable-serial-dce.pkt
## RTR 1
- `ip address 192.168.255.2` (interface SE 0)
- `ip address 192.168.255.9` (interface SE 1)
- `ip address 172.17.255.254` (interface Fa 2) (vers switch)
## RTR 2
- `ip address 192.168.255.1` (interface SE 0)
- `ip address 192.168.255.6` (interface SE 1)
- `ip address 172.17.255.254` (interface Fa 2) (vers switch)
## RTR 3
- `ip address 192.168.255.10` (interface SE 0)
- `ip address 192.168.255.5` (interface SE 1)
- `ip address 172.17.255.254` (interface Fa 2) (vers switch)

## Routage
Tout les routeurs
- `routeur OSPF 1`
- `router-id x.x.x.x`
  - `router-id 1.1.1.1` RTR1
  - `router-id 2.2.2.2` RTR2
  - `router-id 3.3.3.3` RTR3
- `network 192.168.255.0  0.0.0.3       area 0`
- `network 172.16.0.0     0.0.255.255   area 0`
- `network 172.17.0.0     0.0.255.255   area 0`
- `network 172.18.0.0     0.0.255.255   area 0`