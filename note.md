





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
![Option nouvelle étendue DHCP](https://github.com/Altherneum/.github/blob/main/note/assets/chrome_ybPAvR8Gg4.png?raw=true)
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


# Zone inversé
IP vers Nom DNS CNAME


-----------------------------------------------
# AD enfant
- `Win22-SRV-4`
- Donner une IP
  - IP `192.168.10.12`
  - Gate : `192.168.10.254`
- Changer le nom du PC
- Suffix DNS : `M2I.FORMATION.LAN`
## DNS
- Role DNS
  - `Zone principale`
  - `Directe`
  - `M2I.FORMATION.LAN`
- Clique droit sur le serveur
  - Propriétés
  - Redirecteurs
  - Ajouter l'AD principale et secondaire si dispo
## AD DS
- Role AD DS
- `Ajouter un nouveau domaine à une forêt existante`
  - Sélectionner le type du domaine : `Domaine enfant`
  - Nom du domaine parent : `FORMATION.LAN`
  - Nouveau nom du domaine : `M2I`
  - Connexion avec le compte
    - `FORMATION\Administrateur`
    - `Respons11`
    - NetBIOS : `M2I`
## Domaines et approbations
- Outils : `Domaines et approbations Active Directory`
- `M2I.FORMATION.LAN` est dispo
- `Clique droit`, `gérer` permet de s'y co à distance
## Utilisateurs et ordinateurs Active Directory
- Créer une zone `@_M2I` similaire à la façon de faire sur le serveur AD principale
## Partage
- Créer dossier
- Supprimer héritage
- Nouvelle UO (Groupe, utilisateurs, ordinateurs, ...)

# AD enfant 2
- `Win22-SRV-5`
- Donner une IP
  - IP `192.168.10.13`
  - Gate : `192.168.10.254`
- Changer le nom du PC
- Ajouter suffix DNS `ETUDE.LOCAL`
## DNS
- Role DNS
- `Zone de recherche directe`
  - `Zone principale`
  - `Directe`
  - `ETUDE.LOCAL`
- Zone de stub
  - `FORMATION.LAN`
  - Ajouter IP server Formation.LAN `192.168.10.10` & `192.168.10.11`
### DNS Stub SRV1
- Sur `SRV 1`
- `Zone de stub`
  - `ETUDE.LOCAL`
  - Adresse IP machine `ETUDE.LOCAL` `192.168.10.13`
## AD DS
- Role AD DS
  - `Nouvelle forêt`
  - `ETUDE.LOCAL`
  - MDP
  - Décocher délégation
  - NetBiosName  : `ETUDE`
## Domaine et approbation
- Outils : `Domaines et approbations Active Directory` 
- `Clique droit` sur `ETUDE.LOCAL`
- `Propriétés`
- Onglet `Approbations`
- `Nouvelle approbation`
  - `FORMATION.LAN`
  - `Approbation de forêt`
  - `Bidirectionnel`
  - `Ce domaine et le domaine spécifié`
  - Entrer l'Administrateur de FORMATION.LAN `FORMATION\Administrateur` et son mot de passe
  - `Authentification pour toutes les ressources de la forêt`
  - `Authentification pour toutes les ressources de la forêt`
  - `Oui, confirmer l'approbation sortante`
  - `Oui, confirmer l'approbation sortante`
## Vérification
- Créer un PC client dans le domaine ETUDE.LOCAL
  - Connectez vous à un utilisateur de FORMATION.LOCAL
- Créer des ressources dans les domaine ETUDE.LOCAL
  - Utilisez les ressources d'ETUDE.LOCAL depuis FORMATION.LAN
- L'inverse est possible aussi






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












REGISTER LA ZONE DANS L'AD (Dans DNS)