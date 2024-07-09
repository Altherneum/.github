# PowerShell
- [learn.microsoft.com /powershell/scripting/lang-spec/ chapter-07](https://learn.microsoft.com/fr-fr/powershell/scripting/lang-spec/chapter-07?view=powershell-7.4)
- [Doc](https://learn.microsoft.com/fr-fr/powershell/scripting/overview?view=powershell-7.4)

## Autres
- `;` Permet de faire plusieurs commandes à la suite

## Commandes utiles
- `$PSVersionTable` Version PowerShell
- `PowerShell` Passe en mode PowerShell
- `PWSH` Passe en mode PowerShell 7.x

## Commentaires
- Commentaire `# Text à commenter` 
- Commentaire multi ligne
```
<#
Text à commenter
#>
```

## Help
- `Get-Help Test123` Affiche l'aide sur la commande Test123
  - `get-help get-member`
- `Get-Command` Rechercher une commande
  - `Get-Command *` Recherche toutes les commandes
  - `Get-Command -Name Get-Childitem -Args Cert: -Syntax`
  - `Get-Command -Verb New` Retrouver à partir du verbe
  - `Get-Command -Noun Service` Retrouver à partir du pronom
  - `Get-Command -Name *Service*` Retrouver les commandes contenant service
  - `Get-Command New-*`
  - `(Get-Command).count` Le nombre de commande
- `Get-Module` Liste les modules importés dans la version actuelle

## Variable
- [learn.microsoft.com/fr-fr/powershell/scripting/lang-spec/chapter-04?view=powershell-7.4](https://learn.microsoft.com/fr-fr/powershell/scripting/lang-spec/chapter-04?view=powershell-7.4)
- Le nom commence toujours par le signe “$”, et ne comporte ni espace, ni accent
- `$Nom = "exemple"`
- `[int]$Nom = 123`
- `$debutPhrase + $finPhrase`
- `$debutPhrase + " du text au milieu " + $finPhrase`
- `$myArray = "apple", "orange", "cherry"`
- `$j = $i`
- Afficher une variable `$variable` ou `Write-Host $variable` 

### Types
#### Spéciaux
- `null`
- `bool` False, true
#### Text
- `char` 'A'
- `string` "ABC"
#### Nombres
- `int` -2147483648 to +2147483647, inclusive
- `byte` 0 to 255, inclusive
- `long` -9223372036854775808 to +9223372036854775807, inclusive
- `float` / `single` 32-bit IEEE single-precision
- `double` 64-bit IEEE double-precision
- `decimal` -79228162514264337593543950335 to 79228162514264337593543950335
#### Array
- [learn.microsoft.com/fr-fr/powershell/scripting/lang-spec/chapter-09?view=powershell-7.4#9-arrays](https://learn.microsoft.com/fr-fr/powershell/scripting/lang-spec/chapter-09?view=powershell-7.4#9-arrays)
```
$items = 10,"blue",12.54e3,16.30D
```

```
$items[1] = -2.345
$items[2] = "green"
```

```
$a = New-Object 'object[,]' 2,2 # 2-D array of length 4
$a[0,0] = 10
$a[0,1] = $false
$a[1,0] = "red"
$a[1,1] = $null
```
#### Hashtable
```
$myHashtable = @{
    "Fruit1" = "Apple"
    "Fruit2" = "Orange"
    "Fruit3" = "Cherry"
}
```

### Environnement 
- `Get-ChildItem Env:` ou `gci` : Lister les variables d'environnement
  - `$env:variable = "test"` Créer une variable d'environnement
  - `$Env:USERNAME` Le nom de l'utilisateur Windows
  - `$Env:COMPUTERNAME` Le nom de l'ordinateur

- `Get-PSProvider`

### Variables automatiques
- `$?`, Contient true si la dernière opération a réussi ou false dans le cas contraire.
- `$ˆ`, Contient le premier mot de la dernière commande tapée dans la console.
- `$_` ou `$PSitem`, Contient l'objet courant transmis par le pipe `|`
- `$$`, Contient la dernière valeur de la commande saisie dans la console

### Portée
- `$local:Var3 = "Local Variable"`
- `$script:Var2 = "Script Variable"`
- `$global:Var1 = "Global Variable"`

### Autre
- `Get-Variable NomDeVariable` : obtenir le contenu
  - `Get-Variable -Name "NET*"`
- `Clear-Variable NomDeVariable` : vider le contenu
- `New-Variable NomDeVariable` : créer une nouvelle variable
- `Remove-Variable NomDeVariable` : supprimer
- `Set-Variable NomDeVariable` : configurer la valeur
  - `Set-Variable -Name "myVariable" -Description "This is my sample variable"`

### Conversion
```
[int]$i = 10   # constrains $i to designating ints only
$i = "Hello"   # error, no conversion to int
$i = "0x10"    # ok, conversion to int
$i = $true     # ok, conversion to int

[bool]-10        # a bool with value True
[int]-10.70D     # a decimal with value -10
[int]10.7        # an int with value 11
[long]"+2.3e+3"  # a long with value 2300
[char[]]"Hello"  # an array of 5 char with values H, e, l, l, and o.
```
## Fonction
### Créer une fonction
```
function Get-Version {
    $PSVersionTable.PSVersion
}
```

```
function Test-MrParameter {
    param (
        $ComputerName
    )

    Write-Output $ComputerName
}
```

### Read & Write host
- `$motDePasse = Read-Host "Entre le mot de passe"`
- `Write-Host "Vous avez entré : $motDePasse"`

### Strings
#### Fonction String
$var.Replace("a", "b")
$var.ToUpper()
'ABC'.ToLower()

#### Subscripting String
$s = "Hello"   # string, Length 5, positions 0-4
$c = $s[1]     # returns "e" as a string
$c = $s[20]    # no such position, returns $null
$c = $s[-1]    # returns "o", i.e., $s[$s.Length-1]

### Math
- `E`, Static property (read-only), double, Natural logarithmic base
- `PI`, Static property (read-only), double, Ratio of the circumference of a circle to its diameter
- `Abs`, Static method, numeric/numeric, Absolute value (the return type is the same as the type of the argument passed in)
- `Acos`, Static method, double / double, Angle whose cosine is the specified number
- `Asin`, Static method, double / double, Angle whose sine is the specified number
- `Atan`, Static method, double / double, Angle whose tangent is the specified number
- `Atan2`, Static method, double / double y, double x, Angle whose tangent is the quotient of two specified numbers x and y
- `Ceiling`, Static method, decimal / decimal, double / double, smallest integer greater than or equal to the specified number
- `Cos`, Static method, double / double, Cosine of the specified angle
- `Cosh`, Static method, double / double, Hyperbolic cosine of the specified angle
- `Exp`, Static method, double / double, e raised to the specified power
- `Floor`, Static method, decimal / decimal, double / double, Largest integer less than or equal to the specified number
- `Log`, Static method, double / double number, double / double number, double base
- `Logarithm` of number using base e or base base
- `Log10`, Static method, double / double, Base-10 logarithm of a specified number
- `Max`, Static method, numeric/numeric, Larger of two specified numbers (the return type is the same as the type of the arguments passed in)
- `Min`, Static method, numeric/numeric, numeric, Smaller of two specified numbers (the return type is the same as the type of the arguments passed in)
- `Pow`, Static method, double / double x, double y, A specified number x raised to the specified power y
- `Sin`, Static method, double / double, Sine of the specified angle
- `Sinh`, Static method, double / double, Hyperbolic sine of the specified angle
- `Sqrt`, Static method, double / double, Square root of a specified number
- `Tan`, Static method, double / double, Tangent of the specified angle
- `Tanh`, Static method, double / double, Hyperbolic tangent of the specified angle

### File type
- `System.IO.DirectoryInfo`
- `System.IO.FileAttributes`
- `System.IO.FileInfo`

### Date
- `System.DateTime`
- `[datetime]::now`

### Generic Measure Info
- `Microsoft.PowerShell.Commands.GenericMeasureInfo`
- `Microsoft.PowerShell.Commands.TextMeasureInfo`

### Random
- `Get-Random`
#### Random entre plusieurs choix
```
$Vars = "pile", "face" | Get-Random

$choixEntre = Read-Host "Entrez Pile ou face ?"
If ($choixEntre -like $aDeviner) {
    Write-Host "Vous avez gagné !"
}
Else{
    Write-Host "Pas de chance, c'était l'autre !"
}
```
#### Random Int
`[Int]$randomInt = Get-Random -Maximum 100`

## Conditions et boucles
### If else et elseif
#### If
```
[int]$nombre = Read-Host “Entrez un nombre”
if ( $nombre -gt 0 )
{
    Write-Host “> 0”
}
```
#### If Else
```
[int]$nombre = Read-Host “Entrez un nombre”
if ( $nombre -gt 0 )
{
    Write-Host “> 0”
}
else
{
    Write-Host “<= 0”
}
```
#### If elseif else
```
[int]$nombre = Read-Host “Entrez un nombre”
if ( $nombre -gt 0 )
{
    Write-Host “> 0”
}
elseif ($nombreEntre -eq 0)
{
    Write-Host “= 0”
}
else
{
    Write-Host “< 0”
}
```
#### Opérateurs de conditions
##### Comparaison
- `-eq`, Est égal à
  - `1 -eq 1`
- `-ne`, Non égal à
  - `0 -ne 2`
- `-gt`, Supérieur à
  - `2 -gt 1`
- `-ge`, Supérieur ou égal à
  - `2 -ge 1`
- `-lt`, Inférieur à
  - `1 -lt 2`
- `-le`, Inférieur ou égal à
  - `2 -le 2`
- `-like`, Caractère générique, sans respect de la casse
  - `"bonjour" -like "bonjour"`
- `-ilike`, Caractère générique, sans respect de la casse
  - `"bonjour" -like "Bonjour"`
- `-clike` Caractère générique, avec respect de la casse
  - `"Bonjour" -clike "Bonjour"`
- `-notlike`, Caractère générique sans correspondance, sans respect de la casse
  - `"bonjour" -like "au revoir"`
- `-is`, De type
  - `"bonjour" -is [String]`
- `-isnot`, Non de type
  - `"bonjour" -isnot [int]`
- `-contains`
- `-notcontains`
- `-in`
- `-notin`

##### Regex
- `-match`, [Regex](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_regular_expressions?view=powershell-7.4) de caractères génériques. [Liste](https://learn.microsoft.com/en-us/dotnet/standard/base-types/regular-expression-language-quick-reference) ([Exemple](https://www.it-connect.fr/powershell-et-les-regex-expressions-regulieres/))
  - `"book" -match "oo"`
  - `"big" -match "b[iou]g"` Vrai pour big, bog, ou bug
  - `42 -match '[0-9][0-9]'` Vrai si cela correspond à deux nombres
- `-notmatch`
  - `"book" -notmatch "stone"`

##### Arithmétiques
- `+` Additionne des entiers, Permet d’effectuer des concaténations de chaînes de caractères
- `-` Soustraie des éléments
- `/` Divise des éléments
- `*` Multiplie des éléments
- `%` Affiche le reste d’une division

##### Précision sur les opérateurs
- Ajouter un `i` devant la condition la rend non sensible à la case
  - `-eq`, `-ieq`
- Ajouter un `c` devant la condition la rend sensible à la case
  - `-eq`, `-ceq`
### Foreach
```
foreach ($e in $a) {
    $e
}
```

### For
```
for ($iterateur=0; $iterateur -lt 3; $iterateur++)
{
    Write-Host "J'aime le comique de répétition !"
}
```

### Switch
```
$action=Read-Host "entrez l'action (ajouter/supprimer/modifier/afficher) à effectuer"
switch -Exact ($action)
{
    'ajouter'   {Write-Host "Vous avez choisi l'action Ajouter"}
    'supprimer'   {Write-Host "Vous avez choisi l'action Supprimer"}
    'modifier'   {Write-Host "Vous avez choisi l'action Modifier"}
    'afficher' {Write-Host "Vous avez choisi l'action Afficher"}
}
```

### While
```
$nombreSecret = 42
while (Read-Host “Entrez un nombre” -ne $nombreSecret)
{
    Write-Host “Vous n’avez pas trouvé le nombre secret. Recommencez ! “
}
Write-Host "Le nombre secret a été dévoilé"
```

### Break
Break stope une boucle

### Try catch
```
try {
    Get-QuelqueChose
}
catch {
    Write-Host "Une erreur est apparue : $_"
}
```

### Try catch finaly
```
try {
    Get-QuelqueChose
}
catch {
    Write-Host "Une erreur est apparue : $_"
}
finally {
    Write-Host "Exécute peut importe si il y a une erreur ou non"
}
```
