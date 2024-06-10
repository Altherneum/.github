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

# Câbles
![câbles](https://media.fs.com/images/community/wp-content/uploads/2016/12/T-568A-vs.-T-568B.jpg)

## Croisé
![câble croisé](https://media.fs.com/images/community/upload/wangEditor/201911/06/_1573024232_I7qO4uoRQQ.jpg)
- Permet de relier deux récepteurs ensemble sans passer par un réseau interne.  
- Connecte deux dispositifs du même type pour communiquer ensemble, comme un ordinateur à un autre ordinateur, ou un commutateur à un autre commutateur.
## Droit
![câble droit](https://media.fs.com/images/community/upload/wangEditor/201911/06/_1573024176_ciNUcjMTY5.jpg)
- Les câbles droits sont principalement utilisés pour connecter des appareils non similaires, tandis que les câbles croisés sont principalement utilisés pour connecter des appareils similaires.

### Catégorie
![catégorie de câble](https://i0.wp.com/www.learnabhi.com/wp-content/uploads/2018/03/ethernet-cable-min.jpg?w=1290&ssl=1)

![catégorie câble 2](https://telecom.samm.com/Data/EditorFiles/images/blog/015-what-is-the-ethernet/history-of-ethernet-lan-cables-categories.png)
[telecom.samm.com /history-of-ethernet-lan-cables-categories](https://telecom.samm.com/history-of-ethernet-lan-cables-categories)

## Fibre
[doc.altherneum.fr /cours/fibre](https://doc.altherneum.fr/cours/fibre.html)

## Câble TERRA
[wikipedia.org /wiki/TERA](https://fr.wikipedia.org/wiki/TERA)

# CSMA CD
- Carrier Sense Multiple Access with Collision Detection
- Protocole qui gère le partage de l'accès physique.  
Il est utilisé dans les premières normes du réseau Ethernet.
- Cette méthode permet à une station d'écouter le support physique de liaison (câble ou fibre) pour déterminer si une autre station transmet une trame de données (niveau déterminé de tension électrique ou de lumière). Si tel n'est pas le cas (donc s'il n'y a pas eu de signal), elle suppose qu'elle peut émettre.
- Listen before talking : si une station veut émettre, elle écoute le réseau pour savoir s'il y a déjà une autre émission en cours (présence ou non de porteuse). Si oui elle attend, sinon elle émet.