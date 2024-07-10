# Logique
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

## Conditions
### If
```
[int]$nombre = Read-Host “Entrez un nombre”
if ( $nombre -gt 0 )
{
    Write-Host “> 0”
}
```
### If Else
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
### If elseif else
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

## Boucles
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

#### Break
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

## Opérateurs de conditions
### Comparaison
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

#### Précision sur les opérateurs
- Ajouter un `i` devant la condition la rend non sensible à la case
  - `-eq`, `-ieq`
- Ajouter un `c` devant la condition la rend sensible à la case
  - `-eq`, `-ceq`

### Regex
- `-match`, [Regex](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_regular_expressions?view=powershell-7.4) de caractères génériques. [Liste](https://learn.microsoft.com/en-us/dotnet/standard/base-types/regular-expression-language-quick-reference) ([Exemple](https://www.it-connect.fr/powershell-et-les-regex-expressions-regulieres/))
  - `"book" -match "oo"`
  - `"big" -match "b[iou]g"` Vrai pour big, bog, ou bug
  - `42 -match '[0-9][0-9]'` Vrai si cela correspond à deux nombres
- `-notmatch`
  - `"book" -notmatch "stone"`