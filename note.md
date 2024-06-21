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





# Roue de Deming
- [WikiPedia.org / roue de Deming](https://fr.wikipedia.org/wiki/Roue_de_Deming)





# GPO auto shut down à 20H
- Créer une GPO sur l'UO `Ordinateurs`
  - Nommer la GPO `C_Shutdown_20H`
- `Clique droit` sur la GPO : `Modifier`
  - `Configuration ordinateur`
  - `Préférences`
  - `Paramètres du panneau de configuration`
  - `Tâches planifiées`
- `Clique droit`, `Nouveau`, `Tâche planifiée (au minimum Windows 7)`
  - `Nom` : `Shutdown_20H`
  - `Lors de l'exécution de la tâche, utilisez le compte d'utilisateur suivant` : `Système`
- Onglet : `Action`, `Nouveau`
  - `Programme / script` : `C:\Windows\System32\shutdown.exe`
  - `Ajouter arguments` : `-s -t 0 -f` (Fermeture forcé des applications) 
  - Ou l'`Arguments` : `-s -t 0 -soft` (Fermeture douce des applications)
- Onglet `Déclancheur`, `Nouveau`
  - `Tout les jours` : `20H 00m 00s`
## Vérifier la GPO auto shut down
- `gpupdate /force && shutdown -r -t 0` pour appliquer la GPO et relancer la machine
- `Planificateur de tâches` en tant qu'administrateur
  - `Bibliothèque du Planificateur de tâches`


# Password Policy
- Créer une GPO sur l'UO `@_FORMATION`
  - Nommer la GPO `GPO_C_Password`
- `Clique droit` sur la GPO : `Modifier`
- `Configuration ordinateur`
  - `Stratégies`
  - `Paramètres Windows`
  - `Paramètres de sécurité`
  - `Stratégie de comptes`
  - `Stratégie de mot de passe`, ainsi que `Stratégie de verrouillage du compte`
## Stratégie de mot de passe
- `Longueur minimale du mot de passe` : `14`
- `Le mot de passe doit respecter des exigences de complexité` : [X]
- `Durée de vie maximale du mot de passe` : `30`
- `Durée de vie minimale du mot de passe` : `1`
## Stratégie de verrouillage du compte
- `Durée de verrouillage des comptes` : `30` minutes
- `Réinitialiser le compteur de verouillages du compte après` : `30` minutes
- `Seuil de verrouillage du compte` : `5`


# FireWall forcé
- Créer une GPO sur l'UO `Ordinateurs`
  - Nommer la GPO `GPO_C_Firewall`
- `Clique droit` sur la GPO : `Modifier`
- `Configuration ordinateur`
- `Stratégies`
- `Modèles d'administration`
- `Réseau`
- `Connexions réseau`
- `Pare-feu Windows Defender`
- `Profil du domaine`
- `Pare-feu Windows Defender : Protéger toutes les connexions réseau` : `Activer`




# OpenVPN
- [OpenVPN setup from std.rocks](https://std.rocks/fr/vpn_openvpn_windows_server.html)
- Appendix : Copier les fichiers de .CFG sur Git
- NB : Y'a des bugs et j'ai oublié comment j'ai patch, regarder les fichiers de config à l'identique
- Clef publique sur partage WinSRV
- Penser à auto install le soft et move key /autoConfig d'openVPN

# Block software install
- [IT-connect](https://www.it-connect.fr/gpo-comment-empecher-les-utilisateurs-dexecuter-certains-logiciels/)

# Block shell & .BAT
- ....

# To test
- Tester auto shut down
  - Dans l'outils prévus
  - Password policy
  - Firewall
  - OpenVPN IP check