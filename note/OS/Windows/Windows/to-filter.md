
# Windows
## Commandes utiles

- `ShowCommand` [Affiche la commande](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/show-command?view=powershell-7.4) en mode visuel

- `sconfig` Outil de configuration du serveur
  - CMD ou PS ?
- `bcdedit` (Données de configuration de démarrage)
  - To test
- `mmc` Microsoft Management Console
  - To test

- `Get-ADUser` Utilisateur de l'AD
- `Get`, `Set`, `Add`, `New` ... Lister les props 

## Droit partage
Pour modifier,
Doit avoir droit edit sur Partage du dossier
Et sur l'onglet sécurité

si restriction, est prio sur permission

## TPM
TPM.MSC permet de vérifier si TPM est présent

## Bitlocker
- Doit avoir TPM 2.0
- Comment activer ???
- commande : `manage-bde`
## WinRM
- Permet la gestion à distance de Windows
- Ports :
  - `HTTP` : `5985`
  - `HTTPS` : `5986`
- Windows Remote Management (WinRM)

- `Get-Service WinRM`

### Activer WinRM
- `Enable-PSRemoting`
- ou `winrm quickconfig`
## MSG Win
Send msg to network computer
`msg <user_name>`
msg 1 hello

-or-

msg 0 hello

It would be curious if you get the same error. The ‘*’ sends to every session, so one of them is having a problem. But oh well, it works !









# Test Approbation de domaine
## Utilisateurs et ordinateurs Active Directory Domaine enfant distant approbation
- Créer une zone `@_Altherneum` similaire à la façon de faire sur le serveur AD principale

### Partage
- Créer dossier
- Supprimer héritage
- Nouvelle UO (Groupe, utilisateurs, ordinateurs, ...)

### Utilisateurs et ordinateurs
- Dans utilisateurs et Ordinateurs AD
  - Créer UO User etc, partage, etc
  - TO DO -----------------------------------------

## Serveur 1
- Crée groupe dans IT
  - Universelle
  - `U_IT_RW`
  - Ajouter G_IT, dans U_IT
  - Nordine aura accès au ressource d'ETUDE.LOCAL et depuis ETUDE a accès à FORMATION aussi

### Test
Attention pleins de groupes ont étés ajoutés les un dans les autres pour tester le shared folder du domaine enfant ETUDE.LOCAL, mais ne marche pas (Groupe Universel added, and added on ETUDE groups IT)

### Conclusion
Tout a été crée, peut inter connecté des domaines, mais partage de fichier impossible

REGISTER LA ZONE DANS L'AD (Dans DNS) ?????











# Domaine AD
AD DS (Entra ID / Azure ID)
Objet
UO
Domaine
Forêt (Qui est : Tenant(Locataire)??? / Annuaire)



# Local key
Get-PSDrive

Name           Used (GB)     Free (GB) Provider      Root                                               CurrentLocation
----           ---------     --------- --------      ----                                               ---------------
Alias                                  Alias
C                 161,49         61,48 FileSystem    C:\                                                     Users\User
Cert                                   Certificate   \
Env                                    Environment
Function                               Function
G                   4,39         10,61 FileSystem    G:\
HKCU                                   Registry      HKEY_CURRENT_USER
HKLM                                   Registry      HKEY_LOCAL_MACHINE
Variable                               Variable
WSMan                                  WSMan

# local key list
ls hkcu:
ls hklm:







# Disques 
- DAS direct access storage (Direct Attached Storage est le terme utilisé pour un système de disque dur en attachement direct, par opposition au NAS qui est en attachement réseau)
- SAS Serial Attached SCSI (technique d'interface pour disques durs, elle constitue une évolution des bus SCSI)
- NAS Network Attached Storage (serveur de fichiers autonome, relié à un réseau)
- SAN storage area network (est un réseau spécialisé permettant de mutualiser des ressources de stockage, système de stockage en block (Exemple 64Ko))
