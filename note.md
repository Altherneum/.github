





## Win22-SRV-3
### Rôles ajoutés
- AD DS
- DHCP
- Accès à distance
### Configuration IP
- Srv & PC passé en statique
### DHCP
 --------------------------- A COPIER EN DOC
 --------------------------- CE SERVEUR N'EXISTE PLUS
- Outils `DHCP`
- Développez le nom du serveur DHCP, sélectionnez `IPv4` avec le `bouton droit`, puis sélectionnez `Nouvelle étendue`.
![Option nouvelle étendue DHCP](https://github.com/Altherneum/.github/blob/main/note/assets/images/chrome_ybPAvR8Gg4.png?raw=true)
- Nom de l'étendue : `m2i`
- Adresse de début : `193.0.124.33`
- Adresse de fin : `192.0.124.37`
- Longueur : `29`
  - Masque : `255.255.255.248`
- Aucune exclusions et retard
- Routeur : `193.0.124.38`
- Domaine parent : `m2i.edu`



-------------------------------------------------------------
# OpenVPN
- [OpenVPN setup from std.rocks](https://std.rocks/fr/vpn_openvpn_windows_server.html)
- Appendix : Copier les fichiers de .CFG sur Git
- NB : Y'a des bugs et j'ai oublié comment j'ai patch, regarder les fichiers de config à l'identique
- Clef publique sur partage WinSRV
- Penser à auto install le soft et move key /autoConfig d'openVPNWin
-------------------------------------------------------



# To test
- Tester auto shut down
  - Dans l'outils prévus
  - Password policy
  - Firewall
  - OpenVPN IP check






# To do
- Nettoyer [Github ... /note/notes-network.md](https://github.com/Altherneum/.github/blob/main/note/notes-network.md) | [/note/notes-network.md](/note/notes-network.md)






----------------------------------------------------
# PPTP VPN
## Pare-Feu
- Abaisser le parefeu ou activer `Partage de fichier imprimante` ⚠ dans les deux sens !!!
- Ajouter le rôle Accès distance
  - Fonction Routage
  - Fonction ...
----------------------------------------------------
## Role
Routage et accès à distance
## config
...






# Zone inversé
IP vers Nom DNS CNAME


-----------------------------------------------
## Utilisateurs et ordinateurs Active Directory Domaine enfant distant approbation
- Créer une zone `@_M2I` similaire à la façon de faire sur le serveur AD principale
## Partage
- Créer dossier
- Supprimer héritage
- Nouvelle UO (Groupe, utilisateurs, ordinateurs, ...)

## Utilisateurs et ordinateurs
- Dans utilisateurs et Ordinateurs AD
  - Créer UO User etc, partage, etc
  - TO DO -----------------------------------------

# Serveur 1
- Crée groupe dans IT
- Universelle
- `U_IT_RW`

- Ajouter G_IT, dans U_IT
- Nordine aura accès au ressource d'ETUDE.LOCAL et depuis ETUDE a accès à FORMATION aussi






Attention pleins de groupes ont étés ajoutés les un dans les autres pour tester le shared folder du domaine enfant ETUDE.LOCAL, mais ne marche pas (Groupe Universel added, and added on ETUDE groups IT)





REGISTER LA ZONE DANS L'AD (Dans DNS) ?????










- Sur CISCO faire pe PKT du réseau en OSPF
- Créer page cisco PKT
- Créer page PDF listing (set on anon)










# Configuration de RIP sur un Routeur Cisco
Pour configurer RIP sur un routeur Cisco, suivez les étapes ci-dessous.
⦁	Accéder au mode de configuration globale :
Router> enable
Router# configure terminal
⦁	Activer RIP :
Router(config)# router rip
⦁	Spécifier la version de RIP (optionnel, si vous voulez utiliser RIPv2) :
Router(config-router)# version 2
⦁	Déclarer les réseaux directement connectés :
Router(config-router)# network [network_address]
Par exemple, si le routeur a des interfaces dans les réseaux 192.168.1.0/24 et 10.0.0.0/8 :
Router(config-router)# network 192.168.1.0
Router(config-router)# network 10.0.0.0
⦁	Sortir du mode de configuration :
Router(config-router)# exit
Router(config)# exit
Exemple de Configuration Complète
Voici un exemple de configuration complète pour un routeur ayant des interfaces dans les réseaux 192.168.1.0/24 et 10.0.0.0/8 et utilisant RIPv2 :
Router> enable
Router# configure terminal
Router(config)# router rip
Router(config-router)# version 2
Router(config-router)# network 192.168.1.0
Router(config-router)# network 10.0.0.0
Router(config-router)# exit
Router(config)# exit
Vérification de la Configuration
Vous pouvez vérifier la configuration RIP et voir les routes apprises via RIP en utilisant les commandes suivantes :
⦁	Afficher la table de routage :
Router# show ip route
⦁	Afficher les informations spécifiques à RIP :
Router# show ip protocols
Router# show ip rip database
RIP est un protocole de routage simple et facile à configurer, idéal pour les petits réseaux. Cependant, en raison de ses limitations telles que le nombre maximum de sauts et la fréquence des mises à jour, il n'est pas adapté aux grands réseaux modernes. Pour des réseaux plus complexes et plus grands, des protocoles de routage plus avancés comme OSPF ou EIGRP sont généralement préférés.

# Configuration de Base d'OSPF sur un Routeur Cisco
⦁	Accéder au mode de configuration globale :
Router> enable
Router# configure terminal
⦁	Activer OSPF et assigner un process ID :
Router(config)# router ospf [process-id]
⦁	Définir les réseaux et leurs zones associées :
Router(config-router)# network [network_address] [wildcard_mask] area [area_id]
Exemple de Configuration
Supposons que nous avons un réseau avec les segments suivants :
⦁	Réseau 192.168.1.0/24 dans la zone 0
⦁	Réseau 10.0.0.0/8 dans la zone 1
La configuration OSPF serait la suivante :
Router> enable
Router# configure terminal
Router(config)# router ospf 1
Router(config-router)# network 192.168.1.0 0.0.0.255 area 0
Router(config-router)# network 10.0.0.0 0.255.255.255 area 1
Router(config-router)# exit
Router(config)# exit
Vérification de la Configuration
Pour vérifier la configuration et le fonctionnement d'OSPF, vous pouvez utiliser les commandes suivantes :
⦁	Afficher les routes OSPF :
Router# show ip route ospf
⦁	Afficher les voisins OSPF :
Router# show ip ospf neighbor
⦁	Afficher les bases de données OSPF :
Router# show ip ospf database
Conclusion
OSPF est un protocole de routage puissant et flexible, bien adapté aux réseaux de grande taille et complexes. Sa capacité à diviser les réseaux en zones et à fournir une convergence rapide en fait un choix populaire pour les réseaux d'entreprise. Bien qu'il soit plus complexe à configurer et à gérer que des protocoles de routage plus simples comme RIP, ses avantages en termes de performance et de scalabilité sont significatifs.

# Enhanced Interior Gateway Routing Protocol (EIGRP) 
est un protocole de routage avancé développé par Cisco. Il combine les avantages des protocoles de routage distance-vector et link-state, offrant une convergence rapide et une grande scalabilité. Voici un aperçu détaillé de ses caractéristiques, fonctionnement et configuration.
Caractéristiques de EIGRP
⦁	Protocole Hybride : EIGRP est souvent considéré comme un protocole hybride car il utilise des caractéristiques à la fois des protocoles distance-vector et link-state.
⦁	Convergence Rapide : Grâce à son algorithme DUAL (Diffusing Update Algorithm), EIGRP peut trouver rapidement des routes de remplacement sans recalculer toute la table de routage.
⦁	Métrique Composite : EIGRP utilise une métrique composite basée sur la bande passante, le délai, la charge, la fiabilité et la MTU. Par défaut, seuls la bande passante et le délai sont utilisés.
⦁	Support pour VLSM et CIDR : EIGRP supporte les masques de sous-réseau variables (VLSM) et le routage sans classe (CIDR), permettant une gestion plus efficace des adresses IP.
⦁	Mises à Jour Partielles : Au lieu d'envoyer des mises à jour complètes, EIGRP envoie des mises à jour partielles et incrémentales lorsque les changements de topologie se produisent, ce qui réduit l'utilisation de la bande passante.
⦁	Tables Multiples : EIGRP maintient plusieurs tables : une table de voisinage, une table de topologie et une table de routage.
⦁	Support Multicast et Unicast : Les mises à jour de routage peuvent être envoyées en multicast (224.0.0.10) ou en unicast.
Fonctionnement de EIGRP
⦁	Découverte de Voisins : Les routeurs EIGRP envoient des paquets Hello pour découvrir et maintenir des adjacences avec des routeurs voisins.
⦁	Formation de la Table de Voisinage : Les routeurs voisins qui répondent aux paquets Hello sont ajoutés à la table de voisinage.
⦁	Échange d'Informations de Routage : Les routeurs échangent des mises à jour de routage pour construire leur table de topologie.
⦁	Algorithme DUAL : EIGRP utilise l'algorithme DUAL pour garantir des chemins sans boucle et déterminer les routes optimales vers chaque destination.
⦁	Tables de Routage : Les informations de la table de topologie sont utilisées pour construire la table de routage.
Configuration de Base de EIGRP sur un Routeur Cisco
⦁	Accéder au mode de configuration globale :
Router> enable
Router# configure terminal
⦁	Activer EIGRP et spécifier un AS (Autonomous System) Number :
Router(config)# router eigrp [as_number]
⦁	Définir les réseaux à annoncer :
Router(config-router)# network [network_address] [wildcard_mask]
Exemple de Configuration
Supposons que nous avons un réseau avec les segments suivants :
⦁	Réseau 192.168.1.0/24
⦁	Réseau 10.0.0.0/8
La configuration EIGRP serait la suivante :
Router> enable
Router# configure terminal
Router(config)# router eigrp 1
Router(config-router)# network 192.168.1.0 0.0.0.255
Router(config-router)# network 10.0.0.0 0.255.255.255
Router(config-router)# exit
Router(config)# exit
Vérification de la Configuration
Pour vérifier la configuration et le fonctionnement de EIGRP, vous pouvez utiliser les commandes suivantes :
⦁	Afficher les routes EIGRP :
Router# show ip route eigrp
⦁	Afficher les voisins EIGRP :
Router# show ip eigrp neighbors
⦁	Afficher la table de topologie EIGRP :
Router# show ip eigrp topology
Conclusion
EIGRP est un protocole de routage puissant et flexible, idéal pour les réseaux de moyenne à grande taille. Il offre une convergence rapide, une utilisation efficace de la bande passante et une grande scalabilité. Bien que plus complexe à configurer que des protocoles comme RIP, ses avantages en termes de performance et de fonctionnalités en font un choix populaire pour les réseaux Cisco.
