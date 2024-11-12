# Autres informations
## Observateur d’événements
Logs Windows, peut-être fait sur un PC comme un domaine
- Sur un domaine, penser à rendre les journeaux non remplacables lorsque pleins
- (Clique droit sur Journaux windows, Propriétés, Ne pas remplacer événement)

## Profil de session Windows
### Mandataire / Obligatoire
  - Un profil utilisateur obligatoire est un profil utilisateur itinérant qui a été préconfiguré par un administrateur pour spécifier des paramètres pour les utilisateurs
  - Les paramètres couramment définis dans un profil obligatoire incluent (sans s’y limiter) les icônes qui s’affichent sur le bureau, les arrière-plans du bureau, les préférences utilisateur dans le Panneau de configuration, les sélections d’imprimantes, etc
  - Les modifications de configuration effectuées pendant la session d’un utilisateur qui sont normalement enregistrées dans un profil utilisateur itinérant ne sont pas enregistrées lorsqu’un profil utilisateur obligatoire est attribué
  - Fichier `MAN.DAT` : `C:\Users\UserName` par défaut
  - Les profils utilisateur deviennent des profils obligatoires lorsque l'administrateur renomme le fichier `NTuser.dat` du profil de chaque utilisateur dans le système de fichiers du serveur de profils de `NTuser.dat` en `NTuser.man`
    - L'extension `.man` fait du profil utilisateur un profil en lecture seule

### Roaming / Itinérants
  - Un profil utilisateur itinérant redirige les profils utilisateur vers un partage de fichiers afin que les utilisateurs reçoivent les mêmes paramètres de système d’exploitation et d’application sur plusieurs ordinateurs
  - Déployer des profils utilisateur itinérants : 
    - [learn.microsoft.com](https://learn.microsoft.com/fr-fr/windows-server/storage/folder-redirection/deploy-roaming-user-profiles)
    - [it-connect.fr](https://www.it-connect.fr/active-directory-creer-des-profils-itinerants-pour-ses-utilisateurs/)
  - Le profil unique d'un utilisateur est automatiquement disponible lorsqu'il se connecte à n'importe quel ordinateur du réseau.  
    - Les utilisateurs n'ont pas besoin de créer un profil sur chaque ordinateur qu'ils utilisent sur un réseau.
  - Lorsque l'ordinateur d'un utilisateur doit être remplacé, il peut l'être facilement car toutes les informations de profil de l'utilisateur sont conservées séparément sur le réseau, indépendamment d'un ordinateur individuel.  
    - Lorsque l'utilisateur se connecte au nouvel ordinateur pour la première fois, la copie serveur du profil de l'utilisateur est copiée sur le nouvel ordinateur

### Temporary / Temporaire
- Un profil utilisateur temporaire est émis chaque fois qu'une condition d'erreur empêche le chargement du profil utilisateur
- Les profils temporaires sont supprimés à la fin de chaque session et les modifications apportées par l'utilisateur aux paramètres et fichiers de son bureau sont perdues lorsque l'utilisateur se déconnecte

- [Documentation Microsoft](https://learn.microsoft.com/en-us/previous-versions/windows/desktop/legacy/bb776898(v=vs.85))

## Outils d'administration Windows
- Délégation de contrôle
  - Donne des droits customs à quelqu'un (comme changer les mot de passe)
- Onglet Utilisateurs et ordinateurs Active Directory
  - Clique droit sur une UO 
- Il faudra installer la console AD sur le profil de l'utilisateur "RSAT" (Remote server administration tool)
  - Ajouter une fonctionnalité facultative, Cliquer sur "Ajouter une fonctionnalité", chercher "RSAT"
    - ![Image RSAT](https://github.com/Altherneum/.github/blob/main/note/assets/images/RSAT.png?raw=true)
  - PowerShell : `Get-WindowsCapability -Name *RSAT* -Online`, `Add-WindowsCapability -online -Name Rsat.ActiveDirectory.DS-LDS.Tools~~~~0.0.1.0`
  - Shell : `DISM.exe /Online /add-capability -CapabilityName:"Microsoft.Windows.WordPad~~~~0.0.1.0"`
- Outils d'administration Windows sera disponible
  - ![Dans le menu Windows](https://github.com/Altherneum/.github/blob/main/note/assets/images/OutilsAdministrationWin.png?raw=true)