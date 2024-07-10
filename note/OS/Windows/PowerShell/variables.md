# Variable
- [learn.microsoft.com/fr-fr/powershell/scripting/lang-spec/chapter-04?view=powershell-7.4](https://learn.microsoft.com/fr-fr/powershell/scripting/lang-spec/chapter-04?view=powershell-7.4)
- Le nom commence toujours par le signe “$”, et ne comporte ni espace, ni accent
- `$Nom = "exemple"`
- `[int]$Nom = 123`
- `$debutPhrase + $finPhrase`
- `$debutPhrase + " du text au milieu " + $finPhrase`
- `$myArray = "apple", "orange", "cherry"`
- `$j = $i`
- Afficher une variable `$variable` ou `Write-Host $variable` 

## Types
### Spéciaux
- `null`
- `bool` False, true
### Text
- `char` 'A'
- `string` "ABC"
### Nombres
- `int` -2147483648 to +2147483647, inclusive
- `byte` 0 to 255, inclusive
- `long` -9223372036854775808 to +9223372036854775807, inclusive
- `float` / `single` 32-bit IEEE single-precision
- `double` 64-bit IEEE double-precision
- `decimal` -79228162514264337593543950335 to 79228162514264337593543950335
### Array
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
### Hashtable
```
$myHashtable = @{
    "Fruit1" = "Apple"
    "Fruit2" = "Orange"
    "Fruit3" = "Cherry"
}
```

## Environnement 
- `Get-ChildItem Env:` ou `gci` : Lister les variables d'environnement
  - `$env:variable = "test"` Créer une variable d'environnement
  - `$Env:USERNAME` Le nom de l'utilisateur Windows
  - `$Env:COMPUTERNAME` Le nom de l'ordinateur

- `Get-PSProvider`

## Variables automatiques
- `$?`, Contient true si la dernière opération a réussi ou false dans le cas contraire.
- `$ˆ`, Contient le premier mot de la dernière commande tapée dans la console.
- `$_` ou `$PSitem`, Contient l'objet courant transmis par le pipe `|`
- `$$`, Contient la dernière valeur de la commande saisie dans la console

## Portée
- `$local:Var3 = "Local Variable"`
- `$script:Var2 = "Script Variable"`
- `$global:Var1 = "Global Variable"`

## Autre
- `Get-Variable NomDeVariable` : obtenir le contenu
  - `Get-Variable -Name "NET*"`
- `Clear-Variable NomDeVariable` : vider le contenu
- `New-Variable NomDeVariable` : créer une nouvelle variable
- `Remove-Variable NomDeVariable` : supprimer
- `Set-Variable NomDeVariable` : configurer la valeur
  - `Set-Variable -Name "myVariable" -Description "This is my sample variable"`

## Conversion
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

## Strings
### Fonction String
- `"abc".Replace("a", "1")` = "1bc"
- `"abc".ToUpper()` = "ABC"
- `"ABC".ToLower()` = "abc"

### Subscripting String
- `$s = "Hello"`   # string, Length 5, positions 0-4
- `$c = $s[1]`     # returns "e" as a string
- `$c = $s[20]`    # no such position, returns $null
- `$c = $s[-1]`    # returns "o", i.e., $s[$s.Length-1]

### Join strings
- `-join (10, 20, 30)` = "102030"
- `-join("abc","abc")` = abcabc
- `-join (123, $false, 19.34e17)` = "123False1.934E+18"
- `-join 12345` = "12345"
- `-join $null` = ""