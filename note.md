# Lost notes
- VM Hyper-V stopés le derniers jours

# To test
- Tester auto shut down
  - Dans l'outils prévus
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
## To Do

- use the backtick (`) character to break commands into multiple lines.
```
$result = Get-Process `
| Where-Object { $_.CPU -gt 10 } `
| Select-Object -First 5
```
- `;` sert à plusieurs commandes sur la même ligne
- `|` Pipe sert à faire plusieurs commandes à la suite avec le résultat (output) de la précédente
- Splatting
```
Use Splatting in PowerShell
Splatting in PowerShell is a method of passing parameters to commands that makes your code cleaner and easier to read, especially when dealing with commands that have a large number of parameters. Instead of listing each parameter and its value in a single line, you can use a hashtable or an array to define the parameters and their values and then pass that collection to the command.

Here is an example to illustrate splatting: The usual way of writing a long script:

Get-ChildItem -Path "C:\Users\Admin\Reports\Monthly" -Filter "*.log" -Recurse -File -Depth 2

With PowerShell splatting:
$params = @{
    Path = 'C:\Users\Admin\Reports\Monthly'
    Filter = '*.log'
    Recurse = $true
    File    = $true
}
 
Get-ChildItem @params
In this example, $params is a hashtable that contains the parameters for the Get-ChildItem cmdlet. The @ symbol before $params tells PowerShell to treat it as a splatting variable.

Splatting makes scripts easier to maintain and modify. For instance, if you need to change a parameter value, you can do it in one place rather than searching through a long command. It also improves readability by avoiding long lines of code and making the parameters stand out clearly.

Remember, when using splatting with hashtables, the keys must match the parameter names of the cmdlet or function you’re calling.
```
- Créer un fichier `.ps1` et Edit
- ????
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
- Le not
```
-not $true         # False
-not -not $false   # False
-not 0             # True
-not 1.23          # False
!"xyz"             # False
```
- Unary
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

Examples:
-join (10, 20, 30)             # result is "102030"
-join (123, $false, 19.34e17)  # result is "123False1.934E+18"
-join 12345                    # result is "12345"
-join $null                    # result is ""
```




# Note 08/07
## Variable env
Permet de créer des commandes auto
## VM
- Créer une VM : [VMCreator.ps1](Https://github.com/Altherneum/.github/blob/main/note/OS/Windows/MV-Creator.ps1)
## Commandes utiles
- `Get-VMSwitch` Commande qui liste les switchs
- `New-VMSwitch -Name <switch-name> -NetAdapterName <netadapter-name>`
## Argument ou paramètres utiles
- `-WhatIf` Argument qui explique la commande
- `-Confirm:$true` Demande de confirmer la commande