





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










Fonctionnement des VLAN
-	Segmentation Logique : Les VLAN permettent de regrouper des ports de commutateur (switch) en réseaux logiques indépendamment de leur emplacement physique. Chaque VLAN constitue un domaine de broadcast distinct.
-	Isolation et Sécurité : Les VLAN isolent le trafic réseau, ce qui améliore la sécurité en empêchant les utilisateurs d'un VLAN d'accéder directement aux ressources d'un autre VLAN sans l'utilisation d'un routeur ou d'un dispositif de routage.
-	Performance : En limitant les domaines de broadcast, les VLAN réduisent le trafic inutile sur le réseau, améliorant ainsi les performances globales.
Types de VLAN
-	VLAN de Données : Utilisés pour le trafic utilisateur normal.
-	VLAN de Gestion : Utilisés pour accéder et gérer les équipements réseau.
-	VLAN Voix : Optimisés pour le trafic VoIP (Voice over IP).
-	VLAN Natifs : Utilisés pour transmettre le trafic non étiqueté lorsqu'un trunk est configuré entre des switches.
Configuration des VLAN sur les Switches Cisco
# Création d'un VLAN
Pour créer un VLAN sur un switch Cisco, vous utilisez les commandes en mode de configuration globale :
```
Switch> enable
Switch# configure terminal
Switch(config)# vlan [vlan_id]
Switch(config-vlan)# name [vlan_name]
Switch(config-vlan)# exit
Switch(config)# exit
```
Par exemple, pour créer un VLAN 10 nommé "Sales" :
```
Switch> enable
Switch# configure terminal
Switch(config)# vlan 10
Switch(config-vlan)# name Sales
Switch(config-vlan)# exit
Switch(config)# exit
```
# Assigner des Ports à un VLAN
Pour attribuer des ports spécifiques à un VLAN :
```
Switch> enable
Switch# configure terminal
Switch(config)# interface [interface_id]
Switch(config-if)# switchport mode access
Switch(config-if)# switchport access vlan [vlan_id]
Switch(config-if)# exit
Switch(config)# exit
```
Par exemple, pour assigner le port FastEthernet 0/1 au VLAN 10 :
```
Switch> enable
Switch# configure terminal
Switch(config)# interface fastethernet 0/1
Switch(config-if)# switchport mode access
Switch(config-if)# switchport access vlan 10
Switch(config-if)# exit
Switch(config)# exit
```
Configuration d'un Trunk
Pour permettre à un switch de transporter le trafic de plusieurs VLAN sur une seule interface physique, vous configurez un port en mode trunk :
```
Switch> enable
Switch# configure terminal
Switch(config)# interface [interface_id]
Switch(config-if)# switchport mode trunk
Switch(config-if)# switchport trunk encapsulation dot1q
Switch(config-if)# switchport trunk allowed vlan [vlan_list]
Switch(config-if)# exit
Switch(config)# exit
```
Par exemple, pour configurer le port GigabitEthernet 0/1 en mode trunk pour les VLAN 10 et 20 :
```
Switch> enable
Switch# configure terminal
Switch(config)# interface gigabitethernet 0/1
Switch(config-if)# switchport mode trunk
Switch(config-if)# switchport trunk encapsulation dot1q
Switch(config-if)# switchport trunk allowed vlan 10,20
Switch(config-if)# exit
Switch(config)# exit
```
# Vérification de la Configuration
Pour vérifier les VLAN configurés et leurs associations avec les interfaces, utilisez les commandes suivantes :
-	Afficher les VLAN configurés :
`Switch# show vlan brief`

-	Afficher la configuration des trunks :
`Switch# show interfaces trunk`

-	Afficher les détails d'un VLAN spécifique :

`Switch# show vlan id [vlan_id]`
Par exemple, pour afficher les détails du VLAN 10 :

`Switch# show vlan id 10`
# Conclusion
- Les VLAN sont un outil puissant pour segmenter, sécuriser et optimiser les réseaux sur les équipements Cisco. Leur configuration permet une gestion plus flexible et efficace des ressources réseau, en particulier dans les environnements d'entreprise. En utilisant les commandes Cisco appropriées, vous pouvez facilement créer, configurer et gérer les VLAN pour répondre aux besoins spécifiques de votre réseau.
- Le routage inter-VLAN (inter-VLAN routing) permet la communication entre différents VLANs (Virtual Local Area Networks) au sein d'un réseau. Dans les environnements Cisco, il existe plusieurs méthodes pour configurer le routage inter-VLAN, notamment l'utilisation d'un routeur avec des interfaces sous-interface (Router on a Stick) ou l'utilisation de commutateurs de niveau 3 (Layer 3 switches) qui ont des capacités de routage.
