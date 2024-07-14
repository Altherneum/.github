# Lost notes
- VM Hyper-V stopés le derniers jours

# To test
- Tester auto shut down
- Block file type (bat, ps1, CMD, etc)
- Password policy
- Firewall
- OpenVPN IP check

# To do
- Nettoyer [Github ... /note/notes-network.md](https://github.com/Altherneum/.github/blob/main/note/notes-network.md) | [/note/notes-network.md](/note/notes-network.md)
- Routage [Github ... /note/Network/Cisco/routage.md](https://github.com/Altherneum/.github/blob/main/note/Network/Cisco/routage.md)

# Test Approbation de domaine
## Utilisateurs et ordinateurs Active Directory Domaine enfant distant approbation
- Créer une zone `@_M2I` similaire à la façon de faire sur le serveur AD principale

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

# CV update
Avec Philipe LAMBERT

---
- Attention aux langages et pré faire des phrases de speech
- Mots clés qui permettent de créer un speech sans relier comme un robot
- Transformer instabilité pro en force
  - Vision globale, adaptivité, expériences multiples
---
- âge
- photo
- Formation en cours date de fin
- Riche ROME pole emploi
- Né avec un clavier entre les mains
- Hobie
- lien si imprimer












# PowerShell
```
$i = 0                # $i = 0
$i++                  # $i is incremented by 1
$j = $i--             # $j takes on the value of $i before the decrement

$a = 1,2,3
$b = 9,8,7
$i = 0
$j = 1
$b[$j--] = $a[$i++]   # $b[1] takes on the value of $a[0], then $j is
                      # decremented, $i incremented

$i = 2147483647       # $i holds a value of type int
$i++                  # $i now holds a value of type double because
                      # 2147483648 is too big to fit in type int

[int]$k = 0           # $k is constrained to int
$k = [int]::MaxValue  # $k is set to 2147483647
$k++                  # 2147483648 is too big to fit, imp-def behavior

$x = $null            # target is unconstrained, $null goes to [int]0
$x++                  # value treated as int, 0->1
```

# Unary
```
# Unary plus
Description:
An expression of the form + unary-expression is treated as if it were written as 0 + unary-expression (§7.7). The integer literal 0 has type int.

This operator is right associative.

Examples:
+123L         # type long, value 123
+0.12340D     # type decimal, value 0.12340
+"0xabc"      # type int, value 2748

# Unary minus
Description:
An expression of the form - unary-expression is treated as if it were written as 0 - unary-expression (§7.7). The integer literal 0 has type int. The minus operator can be any one of the dash characters listed in §7.2.

This operator is right associative.

Examples:
-$true     # type int, value -1
-123L      # type long, value -123
-0.12340D  # type decimal, value -0.12340

# The unary -join operator
Description:
The unary -join operator produces a string that is the concatenation of the value of one or more objects designated by unary-expression. (A separator can be inserted by using the binary version of this operator (§7.8.4.4).)

unary-expression can be a scalar value or a collection.
```









## Variable env
Permet de créer des commandes auto













## Commandes utiles

- `ShowCommand` [Affiche la commande](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/show-command?view=powershell-7.4) en mode visuel
- `h` affiche l'historique de commande
- `slmgr` Détail de license Windows
  - `slmgr -xpr` Affiche si la license Windows est active
  - `slmgr -dli` Affiche le détail de la license Windows
  - `slmgr dlv` Affiche tout les détailes de license

- `sconfig` Outil de configuration du serveur

- `netstat -na | more`

- `Dir`
- `LS`
- `bcdedit` (Données de configuration de démarrage)
- `RunAs` (Lance une commande en tant que)
  - De préférance sans charger le profil Windows `/noprofile`
- `mmc` Microsoft Management Console

- `Get-ADUser` Utilisateur de l'AD

- `Get-WinEvent -LogName System -MaxEvents 5` Affiche les 5 derniers logs système
- `Get-WinEvent -LogName System -Newest 1`
- `Get-WinEvent -LogName System -MaxEvents 10 | Format-Table -AutoSize -Wrap`
- `Get-WinEvent -LogName System | Where-Object {$_.TimeCreated -like "*10/07/2024*"}`

- `Get`, `Set`, `Add`, `New` ... Lister les props 

- `Get-Process | Measure-Object`
- `Get-Process | Measure-Object -Sum -Average`

- `$p=1;$p.GetType()` Int32
- `"A".GetType()` String

- `(Get-Service Winrm).stop()` Stop Winrm





# Droit partage
Pour modifier,
Doit avoir droit edit sur Partage du dossier
Et sur l'onglet sécurité

si restriction, est prio sur permission





# TPM
TPM.MSC permet de vérifier si TPM est présent

# Bitlocker
- Doit avoir TPM 2.0
- Comment activer ???
- commande : `manage-bde`