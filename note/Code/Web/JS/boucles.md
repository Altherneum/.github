# Boucles

## for
- `for` exécute un bloc de code un nombre spécifique de fois
### Syntaxe de la boucle for
```
for (variable_initialisation; condition; variable_de remplacement) {
  // bloc de code à exécuter pour chaque élément dans la boucle
}
```
- `variable_initialisation`
  - C'est la variable qui prendra la valeur du premier élément de la collection que vous allez parcourir
  - Elle est initialisée avec la valeur du premier élément
- `condition`
  - C'est une expression booléenne (true ou false) qui détermine quand le bloc de code à l'intérieur de la boucle doit être exécuté
  - La boucle continue tant que cette condition est vraie
- `variable_de remplacement`
  - C'est la variable qui prendra la valeur du dernier élément de la collection que vous allez parcourir
  - Elle est remplacée par le dernier élément à chaque itération de la boucle
### Exemple de boucle for
```
for (let i = 0; i < 5; i++) {
  console.log(i);
}
```
```
let nombres = [1, 2, 3, 4, 5];

for (let i = 0; i < nombres.length; i++) {
  console.log("Nombre " + i + ": " + nombres[i]);
}
```
### for...in
- La boucle `for...in` est utilisée pour parcourir les *propriétés* d'un objet. Contrairement à la boucle `for...in` qui utilise un tableau, la boucle `for...in` retourne également le nom de chaque propriété
```
let personne = {
  nom: "Alice",
  age: 30,
  ville: "Paris"
};

for (let prop in personne) {
  if (personne.hasOwnProperty(prop)) {
    console.log("Propriété : " + prop);
    console.log("Valeur : " + personne[prop]);
  }
}
```

## while
- `while` exécute un bloc de code tant que la condition est vraie
### Syntaxe de la boucle while
```
let i = 0;
while (i < 5) {
  console.log(i);
  i++;
}
```
### do while
```
let i = 0;

do {
  console.log("Iteration : " + i);

  if (i === 3) {
    console.log("Ceci est l'instruction 'else'");
    break; // Sort de la boucle si i est égal à 3
  }

  i++; // Incrémenter l'itération pour éviter une boucle infinie.
} while (i < 5);

console.log("Fin de la boucle.");
```

## Fonctionnalités importantes des boucles
### break
- `break`
  - Permet d'interrompre immédiatement la boucle
#### Exemple de break sur une boucle while
```
let i = 0;

while (i < 5) {
  i++;

  if (i === 3) {
    break;
  }
}
```
#### Exemple de break sur une boucle for
```
for (let i = 0; i < 5; i++) {
  if (i === 3) {
    break;
  }
}
```

### return
- `return`
  - Une autre façon de faire arrêter une boucle, plus concise avec `return`
#### sans retourner de valeur
```
let i = 0;

while (i < 5) {
  i++;

  if (i === 3) {
    return;
  }
}
```
#### retourner une valeur
```
let i = 0;

while (i < 5) {
  i++;

  if (i === 3) {
    return i;
  }
}
```
Permet d'arrêter la boucle et récupérer la valeur `i`

### continue
- `continue`
  - Permet de passer à l'itération suivante de la boucle, sans exécuter le reste du bloc de code dans la boucle
#### Exemple de continue sur une boucle while
```
let i = 0;

while (i < 5) {
  i++;

  if (i === 3) {
    continue;
  }
  
  console.log("OK");
}
```
- Ici lors de l'itération avec comme valeur `i === 3`, la boucle n'affichera pas le message "`OK`"
  - `continue` indique d'arrêter l'itération, et de passer à la suivant (donc passer à l'itération ou `i` vaut `4`)
#### Exemple de continue sur une boucle for
```
for (let i = 0; i < 5; i++) {
  if (i === 3) {
    continue;
  }
  
  console.log("OK");
}
```