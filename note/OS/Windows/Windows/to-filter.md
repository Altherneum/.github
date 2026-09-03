
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