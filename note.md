





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