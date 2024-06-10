# Simulateur de réseau
- yEd : dessins réseau
- Cisco packet tracer : émulateur réseau
- Confluence : logiciel de wiki, utilisé comme logiciel de travail collaboratif

# ICMP
- Internet Control Message Protocol.  
- ICMP est un protocole de niveau 3 (modèle OSI), encapsulé dans un datagramme IP. Il 
contient des informations, mais pas de données des couches OSI supérieures, et sa taille 
par défaut est de 32 bits
- ex : ping

# ARP
- Address Resolution Protocol.  
- L’Address Resolution Protocol est un protocole utilisé pour associer l'adresse de protocole de couche réseau d'un hôte distant, à son adresse de protocole de couche de liaison.

# CSMA CD
- Carrier Sense Multiple Access with Collision Detection
- Protocole qui gère le partage de l'accès physique.  
Il est utilisé dans les premières normes du réseau Ethernet.
- Cette méthode permet à une station d'écouter le support physique de liaison (câble ou fibre) pour déterminer si une autre station transmet une trame de données (niveau déterminé de tension électrique ou de lumière). Si tel n'est pas le cas (donc s'il n'y a pas eu de signal), elle suppose qu'elle peut émettre.
- Listen before talking : si une station veut émettre, elle écoute le réseau pour savoir s'il y a déjà une autre émission en cours (présence ou non de porteuse). Si oui elle attend, sinon elle émet.