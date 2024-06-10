# Area network

## PAN
- Personal Area Network
- Un réseau personnel ou désigne un type de réseau informatique restreint en matière d'équipements, généralement mis en œuvre dans un espace d'une dizaine de mètres. D'autres appellations pour ce type de réseau sont : réseau domestique ou réseau individuel
- ![PAN](https://static.packt-cdn.com/products/9781788621434/graphics/assets/ce1b33ed-826d-47c7-8fb5-d9d2215a2d93.png)
- Exemple : Bluetooth

## LAN
- Local Area network
- Un réseau local, en anglais Local Area Network ou LAN, est un réseau informatique où les terminaux qui y participent s'envoient des trames au niveau de la couche de liaison sans utiliser l’accès à internet.

## VLAN
- Virtual LAN
- Réseau local virtuel
- Les VLAN permettent :
  - de séparer les flux
  - de segmenter le réseau : réduire la taille d'un domaine de collision
  - d'améliorer la sécurité : permet de créer un ensemble logique isolé pour améliorer la sécurité.
- Le seul moyen pour communiquer entre des machines appartenant à des VLAN différents est alors de passer par un routeur.
- Par conséquent, les VLAN permettent aussi d'améliorer la gestion du réseau et d'optimiser la bande passante.

## WAN
- Wide Arean network
- Un réseau étendu, souvent désigné par son acronyme anglais WAN, est un réseau informatique ou un réseau de télécommunications couvrant une grande zone géographique, typiquement à l'échelle d'un pays, d'un continent, ou de la planète entière. Le plus grand WAN est le réseau Internet.

## WLAN
- Wireless Local Area Network
- Un réseau local sans fil est un réseau informatique sans fil qui relie deux ou plusieurs appareils utilisant une communication sans fil pour former un réseau local dans une zone limitée telle qu'une maison, une école, un laboratoire informatique, un campus ou un immeuble de bureaux.

## MAN
- Metropolitan area network
- Un réseau métropolitain désigne un réseau composé d'ordinateurs habituellement utilisé dans les campus ou dans les villes.
- Le réseau utilise généralement des fibres optiques.

# Type de réseau

## Internet
Réseau mondial

## Extranet
- L'Extranet est l'utilisation du réseau internet dans laquelle une organisation structure ce réseau pour s'interconnecter avec ses partenaires commerciaux ou ses parties prenantes.
- Par opposition, un réseau intranet, se limite au réseau interne à l'organisation, sans utiliser d'infrastructure tierce.

## Intranet
- Un intranet est un réseau informatique privé utilisé par les employés d'une entreprise ou de toute autre entité organisationnelle et qui utilise les mêmes protocoles qu'Internet.
- Cette utilisation n'est pas nécessairement locale, un intranet pouvant s'étendre à travers le réseau étendu [WAN](#WAN).

# Topologie réseau
![Topologie réseau](https://sti2d.ecolelamache.org/reseau_topologie.jpg)

## Ring
- Un réseau en anneau est une forme de réseau informatique visant à raccorder l'ensemble des ordinateurs. 
- Toutes les entités sont reliées entre elles dans une boucle fermée.
- Les données circulent dans une direction unique, d'une entité à la suivante.

## Star
- Dans une topologie de réseau en étoile aussi appelé Hub and spoke, les équipements du réseau sont reliés à un système matériel central.
- Celui-ci a pour rôle d'assurer la communication entre les différents équipements du réseau.
- En pratique, l'équipement central peut être un concentrateur, un commutateur ou un routeur.

## Bus
- En informatique, un réseau en bus est une architecture de communication où la connexion des clients est assurée par un bus partagé par tous les utilisateurs au moyen d'arrêt de bus d'où le nom "réseau en bus". 

## Mesh
- Le réseau maillé est une topologie de réseau où tous les hôtes sont connectés pair à pair sans hiérarchie centrale, formant ainsi une structure en forme de filet. 
- Par conséquent, chaque nœud doit recevoir, envoyer et relayer les données
- Issue de la recherche militaire et utilisée notamment par les armées américaine et française, cette architecture reproduit le modèle de l'Internet tout en l'optimisant pour le sans-fil
- Assure une grande tolérance aux pannes et aux interférences

### Risques des topologies
Sur certains réseau, si une branche casse / ne fonctionne plus, le reste du réseau peut être impacté

# Hub vs Switch vs Routeur
## Hub (concentrateur)
- Lorsqu'un paquet est reçu sur un port, celui-ci est envoyé aux autres ports afin que tous les segments du réseau local puissent accéder à tous les paquets.  
- Un hub est souvent utilisé pour connecter des segments d'un réseau local (LAN).
- ![hub gif](https://media.fs.com/images/community/upload/wangEditor/201909/12/_1568281840_ZK4myJNWO8.gif)

## Switch (commutateur)
- Le switch fonctionne au niveau de la couche de liaison des données (couche 2) et parfois dans la couche réseau (couche 3) du modèle de référence OSI (Open Systems Interconnection) et prend donc en charge tout protocole du paquet.  
- Les réseaux locaux, qui utilise des switchs pour joindre des segments, sont appelés LAN Switch (Commutateurs LAN) ou, dans le cas de réseaux Ethernet, des LAN Switch Ethernet (réseaux locaux Ethernet commutés).  
- Dans les réseaux, le switch Ethernet est le périphérique qui filtre et transmet les paquets entre segments LAN.
- ![switch gif](https://media.fs.com/images/community/upload/wangEditor/201909/12/_1568281863_IvmTIjDdFk.gif)

## Routeur
- Un routeur est connecté au moins à deux réseaux, généralement deux réseaux LAN ou WAN (réseaux étendus) ou un réseau local (LAN) et ses réseaux ISP (Internet Service Provider).  
- Le routeur est généralement situé entre passerelles où il se connecte à deux ou plusieurs réseaux. En utilisant ses caractéristiques spécifiques, le routeur détermine le meilleur trajet pour le transfert des paquets.