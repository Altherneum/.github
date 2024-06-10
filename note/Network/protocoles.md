# ICMP
- Internet Control Message Protocol.  
- ICMP est un protocole de niveau 3 (modèle OSI), encapsulé dans un datagramme IP. Il 
contient des informations, mais pas de données des couches OSI supérieures, et sa taille 
par défaut est de 32 bits
- ex : ping

# ARP
- Address Resolution Protocol.  
- L’Address Resolution Protocol est un protocole utilisé pour associer l'adresse de protocole de couche réseau d'un hôte distant, à son adresse de protocole de couche de liaison.


# NAT
- Network address translation
- En réseau informatique, on dit qu'un routeur fait du network address translation « traduction d'adresse réseau » lorsqu'il fait correspondre des adresses IP à d'autres adresses IP.
- En particulier, un cas courant est de permettre à des machines disposant d'adresses privées qui font partie d'un intranet et ne sont ni uniques ni routables à l'échelle d'Internet, de communiquer avec le reste d'Internet en utilisant vers l'extérieur des adresses externes publiques, uniques et routables.

# PAT
- Port Address Translation du port serveur
- PAT fonctionne de la même manière que NAT, mais avec une étape supplémentaire de modification du numéro de port. PAT attribue un numéro de port unique à chaque connexion d'un périphérique interne à Internet et l'ajoute à la table de mappage

# ACL
- Access Control List
## ACL réseau
- En réseau, une liste des adresses, ports et protocoles autorisés ou interdits.
## ACL RWX
- Système permettant de faire une gestion plus fine des droits d'accès aux fichiers que ne le permet la méthode employée par les systèmes UNIX.
- lecture (**R**ead) `R`
- écriture (**W**rite) `W`
- exécution (e**X**ecute) `X`

# DHCP
- Dynamic Host Configuration Protocol
- Protocole réseau dont le rôle est d’assurer la configuration automatique des paramètres IP d’une station ou d'une machine, notamment en lui attribuant automatiquement une adresse IP et un masque de sous-réseau
- Il peut aussi configurer l’adresse de la passerelle par défaut et configurer des serveurs de noms comme DNS ou NBNS
- Seuls les ordinateurs en service utilisent une adresse de l’espace d’adressage ;
- Toute modification des paramètres (adresse de la passerelle, des serveurs de noms) est répercutée sur les stations lors du redémarrage
- [Voire IP dynamique](#ip-dynamique)

# DNS
- Domain Name System
- Service informatique distribué qui associe les noms de domaine Internet avec leurs adresses IP ou d'autres types d'enregistrements
- Pour faciliter l'accès aux hôtes sur un réseau IP, un mécanisme a été mis en place pour associer un nom à une adresse IP. Ce nom, plus simple à retenir qu'une suite de chiffres, est appelé « nom de domaine ». Résoudre un nom de domaine consiste à trouver l'adresse IP qui lui est associée.
- ![Image topologie DNS](https://upload.wikimedia.org/wikipedia/commons/thumb/9/91/Dns-raum.svg/400px-Dns-raum.svg.png)

- A record ou address record (également appelé enregistrement d’hôte) qui fait correspondre un nom d'hôte ou un nom de domaine ou un sous-domaine à une adresse IPv4 de 32 bits distribués sur quatre octets ex: 123.234.1.2 ;
- AAAA record ou IPv6 address record qui fait correspondre un nom d'hôte à une adresse IPv6 de 128 bits distribués sur seize octets ;
- CNAME record ou canonical name record qui permet de faire un alias d'un domaine vers un autre.
- MX record ou mail exchange record qui définit les serveurs de courriel pour ce domaine ;
- PTR record ou pointer record qui associe une adresse IP à un enregistrement de nom de domaine, aussi dit « reverse » puisqu'il fait exactement le contraire du A record ;
- NS record ou name server record qui définit les serveurs DNS de ce domaine ;
- SOA record ou Start Of Authority record qui donne les informations générales de la zone : serveur principal, courriel de contact, différentes durées dont celle d'expiration, numéro de série de la zone ;
- SRV record qui généralise la notion de MX record, mais qui propose aussi des fonctionnalités avancées comme le taux de répartition de charge pour un service donné, standardisé dans la RFC 278227 ;
- NAPTR record ou Name Authority Pointer record qui donne accès à des règles de réécriture de l'information, permettant des correspondances assez lâches entre un nom de domaine et une ressource. Il est spécifié dans la RFC 340328 ;
- TXT record permet à un administrateur d'insérer un texte quelconque dans un enregistrement DNS (par exemple, cet enregistrement est utilisé pour implémenter la spécification Sender Policy Framework) ;
- d'autres types d'enregistrements sont utilisés occasionnellement, ils servent simplement à donner des informations (par exemple, un enregistrement de type LOC indique l'emplacement physique d'un hôte, c'est-à-dire sa latitude et sa longitude). Certaines personnes[Qui ?] disent que cela aurait un intérêt majeur mais n'est que très rarement utilisé sur le monde Internet.

- [wikipedia.org/wiki/Domain_Name_System](https://fr.wikipedia.org/wiki/Domain_Name_System)

# TCP
- Transmission Control Protocol
- Norme de communication qui permet aux programmes applicatifs et aux dispositifs informatiques d'échanger des messages sur un réseau
- Il est conçu pour envoyer des paquets sur Internet et assurer la transmission réussie des données et des messages sur les réseaux

- Une session TCP fonctionne en trois phases :
  - l'établissement de la connexion ;
  - les transferts de données ;
  - la fin de la connexion.

- [wikipedia.org/wiki/Transmission_Control_Protocol](https://fr.wikipedia.org/wiki/Transmission_Control_Protocol)

# UDP
- User Datagram Protocol
- Protocoles de télécommunication utilisés par Internet. Il fait partie de la couche transport du modèle OSI
- Aucune communication préalable n'est requise pour établir la connexion, au contraire de TCP (qui utilise le procédé de handshaking)
- À cause de l'absence du mécanisme d'établissement de liaison, ce protocole expose le programme qui l'utilise aux problèmes éventuels de fiabilité du réseau
- Il est utilisé quand il est nécessaire soit de transmettre des données très rapidement

- [wikipedia.org/wiki/User_Datagram_Protocol](https://fr.wikipedia.org/wiki/User_Datagram_Protocol)

# CSMA CD
- Carrier Sense Multiple Access with Collision Detection
- Protocole qui gère le partage de l'accès physique.  
Il est utilisé dans les premières normes du réseau Ethernet.
- Cette méthode permet à une station d'écouter le support physique de liaison (câble ou fibre) pour déterminer si une autre station transmet une trame de données (niveau déterminé de tension électrique ou de lumière). Si tel n'est pas le cas (donc s'il n'y a pas eu de signal), elle suppose qu'elle peut émettre.
- Listen before talking : si une station veut émettre, elle écoute le réseau pour savoir s'il y a déjà une autre émission en cours (présence ou non de porteuse). Si oui elle attend, sinon elle émet.

# Proxy
- « mandataire »
- Composant logiciel informatique qui joue le rôle d'intermédiaire en se plaçant entre deux hôtes pour faciliter ou surveiller leurs échanges
- Dans le cadre plus précis des réseaux informatiques, un proxy est alors un programme servant d'intermédiaire pour accéder à un autre réseau, généralement Internet. Par extension, on appelle aussi « proxy » un matériel comme un serveur mis en place pour assurer le fonctionnement de tels services.

Les serveurs proxys sont notamment utilisés pour assurer les fonctions suivantes :
- accélération de la navigation : mémoire cache, compression de données
- historique (logs) : journalisation des requêtes
- la sécurité du réseau local
- le filtrage : restrictions de sites, blocage des publicités ou des contenus lourds (Java, Flash)
- l'anonymat
- la répartition de charge

![proxy image](https://www.it-connect.fr/wp-content-itc/uploads/2021/11/schema-proxy-contourner-restriction-02.png)

## Proxy filtrant
- L'utilité des serveurs proxys est importante, notamment dans le cadre de la sécurisation des systèmes d'information.
- Par exemple, il est presque systématique en entreprise ou dans les établissements scolaires que l'accès Internet se fasse à travers un serveur proxy. L'internaute ne voit pas la différence, sauf quand il tente de naviguer sur un site interdit, auquel cas il pourra recevoir un message d'erreur : un tel proxy est appelé proxy filtrant. 
- Il se peut aussi qu'une boite de dialogue s'ouvre et demande un identifiant et un mot de passe avant de pouvoir surfer sur Internet.

## Reverse proxy
- Un proxy inverse (reverse proxy) ou serveur mandataire inverse1 est un type de serveur, habituellement placé en frontal de serveurs web.
- Contrairement au serveur proxy qui permet à un utilisateur d'accéder au réseau Internet, le proxy inverse permet à un utilisateur d'Internet d'accéder à des serveurs internes.
- Une des applications courantes du proxy inverse est la répartition de charge (load-balancing).

## Web proxy
- Normalement, l'utilisation d'un proxy complet se fait en configurant son navigateur ou son ordinateur.
- Mais il existe une catégorie de proxy beaucoup plus simple d'utilisation : les proxys web. 
- Il s'agit d'un simple site web dont la page offre un champ permettant de taper l'adresse du site que l'on souhaite visiter. Une fois saisie, la page demandée est affichée à l'intérieur de la première page. 
- Mais l'adresse qui apparaît dans la barre d'adresse est toujours celle du proxy.
- Exemple : [https://www.proxysite.com/fr/](https://www.proxysite.com/fr/)

# VPN
- virtual private network
- réseau privé virtuel
- Système permettant de créer un lien direct entre des ordinateurs distants, connectés à des réseaux locaux différents, qui isole leurs échanges du reste du trafic se déroulant sur des réseaux de télécommunication publics.
- On utilise notamment cette technologie en situation de télétravail ainsi que dans le cadre de l'informatique en nuage.
- Un VPN permet d'accéder à des ordinateurs distants comme si l'on était connecté au réseau local. Il permet d'avoir un accès au réseau interne (réseau d'entreprise, par exemple) ou de créer un réseau de pairs.
- Un VPN dispose généralement aussi d'une « passerelle » permettant d'accéder à l'internet, ce qui permet de changer l'adresse IP source publique de ses connexions
- ![Image VPN](https://upload.wikimedia.org/wikipedia/commons/thumb/0/0f/VPN_site-to-site.jpg/400px-VPN_site-to-site.jpg)

# DMZ
- demilitarized zone
- zone démilitarisée
- Sous-réseau séparé du réseau local et isolé de celui-ci ainsi que d'Internet (ou d'un autre réseau) par un pare-feu.
- Ce sous-réseau contient les machines étant susceptibles d'être accédées depuis Internet, et qui n'ont pas besoin d'accéder au réseau local.
- Les services susceptibles d'être accédés depuis Internet seront situés en DMZ, et tous les flux en provenance d'Internet sont redirigés par défaut vers la DMZ par le pare-feu.
- Le pare-feu bloquera donc les accès au réseau local à partir de la DMZ pour garantir la sécurité. En cas de compromission d'un des services dans la DMZ, le pirate n'aura accès qu'aux machines de la DMZ et non au réseau local.
- ![Image DMZ](https://upload.wikimedia.org/wikipedia/commons/thumb/7/78/Demilitarized_Zone_Diagram.png/290px-Demilitarized_Zone_Diagram.png)