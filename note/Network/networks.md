# Area network

## PAN
- Personal Area Network
- Un réseau personnel ou désigne un type de réseau informatique restreint en matière d'équipements, généralement mis en œuvre dans un espace d'une dizaine de mètres. D'autres appellations pour ce type de réseau sont : réseau domestique ou réseau individuel
- ![PAN](https://static.packt-cdn.com/products/9781788621434/graphics/assets/ce1b33ed-826d-47c7-8fb5-d9d2215a2d93.png)
- Exemple : Bluetooth

## LAN
- Local Area network
- Un réseau local, en anglais Local Area Network ou LAN, est un réseau informatique où les terminaux qui y participent s'envoient des trames au niveau de la couche de liaison sans utiliser l’accès à internet.

## WAN
- Wide Arean network
- Un réseau étendu, souvent désigné par son acronyme anglais WAN, est un réseau informatique ou un réseau de télécommunications couvrant une grande zone géographique, typiquement à l'échelle d'un pays, d'un continent, ou de la planète entière. Le plus grand WAN est le réseau Internet.

## WLAN²
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
Ouverture d'un intranet vers l'exterieur de confiance

## Intranet
Réseau privé d'entreprise

# Topologie réseau
![Topologie réseau](https://sti2d.ecolelamache.org/reseau_topologie.jpg)

## Ring
- Jeton donné à tout le monde, avec un temps de parole.  
- La discussion est en sens unique dans le cercle, la packet doit faire un tour complet (adresse MAC pour savoir à qui la packet est destiné)

## Star
Avec un routeur / hub

## Bus
Sur une ligne ou tout les périphériques reçoivent l'information

## Mesh
Toutes les machines sont interconnectés, similaire au réseau mondial

### Risques des topologies
Sur certains réseau, si une branche casse / ne fonctionne plus, le reste du réseau peut être impacté

# Hub vs Switch vs Routeur
## Hub (concentrateur)
- Lorsqu'un paquet est reçu sur un port, celui-ci est envoyé aux autres ports afin que tous les segments du réseau local puissent accéder à tous les paquets.  
- Un hub est souvent utilisé pour connecter des segments d'un réseau local (LAN).
![hub gif](https://media.fs.com/images/community/upload/wangEditor/201909/12/_1568281840_ZK4myJNWO8.gif)

## Switch (commutateur)
- Le switch fonctionne au niveau de la couche de liaison des données (couche 2) et parfois dans la couche réseau (couche 3) du modèle de référence OSI (Open Systems Interconnection) et prend donc en charge tout protocole du paquet.  
- Les réseaux locaux, qui utilise des switchs pour joindre des segments, sont appelés LAN Switch (Commutateurs LAN) ou, dans le cas de réseaux Ethernet, des LAN Switch Ethernet (réseaux locaux Ethernet commutés).  
- Dans les réseaux, le switch Ethernet est le périphérique qui filtre et transmet les paquets entre segments LAN.
![switch gif](https://media.fs.com/images/community/upload/wangEditor/201909/12/_1568281863_IvmTIjDdFk.gif)

## Routeur
- Un routeur est connecté au moins à deux réseaux, généralement deux réseaux LAN ou WAN (réseaux étendus) ou un réseau local (LAN) et ses réseaux ISP (Internet Service Provider).  
- Le routeur est généralement situé entre passerelles où il se connecte à deux ou plusieurs réseaux. En utilisant ses caractéristiques spécifiques, le routeur détermine le meilleur trajet pour le transfert des paquets.