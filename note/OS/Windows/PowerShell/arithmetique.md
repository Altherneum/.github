# Arithmétique
## Math
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

## Opérateurs arithmétiques
- `+` Additionne des entiers, Permet d’effectuer des concaténations de chaînes de caractères
- `-` Soustraie des éléments
- `/` Divise des éléments
- `*` Multiplie des éléments
- `%` Affiche le reste d’une division

## Random
- `Get-Random`
### Random entre plusieurs choix
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
### Random Int
`[Int]$randomInt = Get-Random -Maximum 100`