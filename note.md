# Adressage
## Win22-SRV-3
- Win 22 Server `datacenter user experience`
- Carte réseau sur : `Experimental`

- Login : `Administrateur`
- Password : `SuperUser11`

- Domaine : `m2i.edu`
- Niveau de forêt : `Windows Server 2016`
- Mot de passe : `SuperUser11`

- `193.0.124.38`
- `255.255.255.248`

## Win10-PC-2
- Win 10 Desktop : `Windows 10 21h2`
- Carte réseau sur : `Experimental`

- Login : `PC-2`
- Password : `SuperUser11`
- Question de sécurité : `SuperUser11` x 3

- IP : `193.0.124.33`
- Masque : `255.255.255.248`
- Gateway : `193.0.124.38`
- DNS : `192.0.124.38`

- Domaine : `m2i.edu`

## Commutateur
- `Experimental`
- `Interne`

## Utilisateurs
### Alain
- `Alain` `TERRIEUR`
- Login : `Alain.TERRIEUR`
- Mot de passe : `SuperUser11`
- `Groupe` : `Informatique`, `Comptabilité`, `Administration`
### Alex
- `Alex` `TERRIEUR`
- Login : `Alex.TERRIEUR`
- Mot de passe : `SuperUser11`
### Jean
- `Jean` `SAISRIEN`
- Login : `Jean.SAISRIEN`
- Mot de passe : `SuperUser11`

## Groupes
### Informatique
- `G_IT_RW`
### Administration
- `G_AD_RW`
### Comptabilité
- `G_CO_RW`

## Imprimantes
### Partage_Imprimante_1
- Adresse IP : `193.0.124.37`
- Nom : `Partage_Imprimante_1`
- Nom du port : `Partage_Imprimante_1_193.0.124.37`
### Imprimante 1
- `Generic / Text Only`
- Sur `Partage_Imprimante_1`

# Tâches
## Scénario
- Vous êtes administrateur système pour une petite entreprise. Vous devez configurer un nouveau serveur Windows Server 2022 pour fournir les services suivants : 
  - `Gestion des utilisateurs et des ordinateurs dans un domaine Active Directory`
  - `Partage de fichiers et d'imprimantes`
  - `Hébergement d'un site Web `
  - Nom du serveur : `Win22-SRV-3`
  - Nom du Client : `Win10-PC-2`
  - Pool DHCP `193.0.124.32/29` : `255.255.255.248`
  - Network ID : `193.0.124.32`
  - Adresse range : `193.0.124.33 - 193.0.124.38`
  - Broadcast Address: `193.0.124.39`
  - Domaine : `M2i.edu`

## Tâches 
- [x] Installer et configurer Windows Server 2022. 
- [x] Promouvoir le serveur au rôle de contrôleur de domaine. 
- [x] Implémenter sur le contrôleur de domaine le service DHCP 
  - [x] le serveur doit avoir la dernière adresse ip du segment donné
- [x] Créer 3 unités d'organisation (OU) et des utilisateurs dans Active Directory. (Comptabilité, administration et informatique) 
- [x] Créer un compte utilisateur dans chaque unité d’organisation. 
- [X] Créer des partages réseau pour les sauvegarde, nommez-le « Backup ». 
- [X] Configurer un serveur d'impression. 
- [ ] Configurer l'accès à distance sur le serveur via le Bureau à distance,  
- [X] Installer et configurer IIS. 
- [x] Créer un site Web et le publier. 
- [x] VÉRIFICATION DE VOS CONFIGS 
- [X] Connecter le client au domaine, le client doit obtenir sa configuration IP (hôte, passerelle et DNS) du serveur 
- [X] Ouvrez une session sur le domaine avec un compte utilisateur non administrateur 
- [ ] Tester la fonctionnalité bureau à distance depuis le client 
- [X] Vérifiez l’accès à l’un des répertoires partagés sur le serveur 




# IIS
[IT-Connect.fr](https://www.it-connect.fr/installer-et-configurer-iis-10-sur-windows-server-2022/)

- Site par défaut : `file:///C:/inetpub/wwwroot/iisstart.htm`

## Ajouter un site
- Application `Gestionnaire des services internet (IIS)`
- Sur la catégorie `NOM DU SERVEUR`, `Sites`, faire `Clique droit` : `Ajouter un site WEB`
  - `Nom du site` : `Site`
  - `Nom d'hôte` : `Site`
  - `Chemin d'accès` : `C:\inetpub\Site`





## Win22-SRV-3
### Rôles ajoutés
- AD DS
- DHCP
- Accès à distance
### Configuration IP
- Srv & PC passé en statique
### DHCP
 --------------------------- A COPIER EN DOC
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