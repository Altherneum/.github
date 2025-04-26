# Conditions
## if, else if, else
### if
- `if` : Exécute le bloc de code si la condition est vraie.
```
if (condition) {
  // Bloc de code à exécuter si la condition est vraie
}
```
## else
```
if (condition) {
  // Bloc de code à exécuter si la condition est vraie
}
else {
  // Bloc de code à exécuter si la condition est fausse
}
```
### else if
- `else if` : Exécute le bloc de code si une autre condition est vraie. Peut être utilisé plusieurs fois.
```
if (condition1) {
  // Bloc de code pour condition1
} else if (condition2) {
  // Bloc de code pour condition2
} else {
  // Bloc de code pour aucune des conditions précédentes
}
```
## Switch
- `switch` : Exécute le bloc de code correspondant à la valeur d'une variable
  - Peut être utilisé pour gérer plusieurs valeurs possibles
  - Attention aux erreurs potentielles
```
let valeur;

switch (valeur) {
  case 1:
    console.log("La valeur est 1");
    break;
  case 2:
    console.log("La valeur est 2");
    break;
  default:
    console.log("Valeur non reconnue");
}
```