# Fonction
En JavaScript, les fonctions sont un élément fondamental du langage. Elles permettent de définir des blocs de code réutilisables pour effectuer une tâche spécifique.  Elles sont essentielles pour la modularité et l'organisation du code.

## Définition d'une Fonction
Une fonction est définie en utilisant le mot-clé `function`
### Exemple de fonction sans paramètres
```
function maFonction() {
  console.log("Ceci est une fonction qui affiche ce message");
}

maFonction();
```
### Exemple de fonction avec paramètres
Les paramètres sont des variables que vous passez à une fonction pour pouvoir la faire fonctionner
```
function maFonction(parametre1, parametre2) {
  console.log("Paramètre 1: " + parametre1);
  console.log("Paramètre 2: " + parametre2);
}

maFonction("Bonjour", "le monde");
```
## Explications d'une fonction
- `function` : Le mot-clé qui indique que nous créons une nouvelle fonction
- `maFonction` : Le nom de la fonction (doit être unique dans l'exécutable)
  - Choisissez un nom descriptif et facile à comprendre
- `(parametre1, parametre2)` : Les paramètres (arguments) qui sont passés à la fonction lors de son appel
  - Ils peuvent être des valeurs par défaut ou des arguments que l'on fournit explicitement
- `{ ... }` : Le corps de la fonction, contenant le code exécutable qui sera appliqué lorsque la fonction est appelée

## Appel d'une Fonction
Pour exécuter une fonction, on l'appelle en lui donnant son nom comme argument
#### Appel de fonction sans paramètre
Appel de la fonction `maFonction` sans paramètres
```
maFonction();
```
#### Appel de fonction avec paramètre
```
maFonction("Bonjour", "le monde");
```
- `maFonction("Bonjour", "le monde")` :  On appelle la fonction `maFonction` et lui passe les arguments "Bonjour" et "le monde"

## Valeurs de retour
- La valeur de retour ou `return` est le résultat que la fonction renvoie après l'exécution
- Elle peut être un nombre, une chaîne de caractères, ou n'importe quel type de données
### Exemple de return
```
function additionner(a, b) {
  return a + b;
}

let resultat = additionner(5, 3);
console.log("Résultat : " + resultat);
```
### Explications du return
- `additionner(a, b)` : Cette fonction prend deux arguments, `a` et `b`
- `return a + b;` : La fonction renvoie la somme de `a` et `b`
- `let resultat = additionner(5, 3);` : On appelle la fonction `additionner` avec les arguments 5 et 3. Le résultat (8) est stocké dans la variable `resultat`
  - Utiliser `console.log(additionner(5, 3));` aura le même effet tout en l'affichant directement sans le stocker dans une variable

## Types de Fonctions en JavaScript
JavaScript supporte plusieurs types de fonctions
## Fonctions Fléchées (Arrow Functions)
- C'est une version plus concise et moderne des fonctions
- Elles sont souvent utilisées pour les opérations simples.
### Exemples de d'Arrow function avec paramètres et sans accolade
```
const afficherBonjour = () => "Bonjour";
console.log(afficherBonjour());
```
### Exemples de d'Arrow function avec paramètres et sans accolade
```
const multiplier = (x, y) => x * y;
console.log(multiplier(5, 3));
```
### Exemples de d'Arrow function avec paramètres et avec accolade
```
const multiplier = (x) => {
    return x * 5;
};

console.log(multiplier(3));
```
### Exemples de d'Arrow function avec paramètres multiples et avec accolade
```
const multiplier = (x, y) => {
  return x * y;
};

console.log(multiplier(5, 3));
```

## Fonctions Fleuries (Arrow Functions)
Elles sont plus courtes que les fonctions fonctionnelles et offrent des fonctionnalités supplémentaires comme la suppression de `this`.
```
// Exemple d'une fonction fleureuse
const monObjet = { valeur };
monObjet.mettereValue = "Bonjour";

const afficherObjet = (objet) => console.log(objet.mettereValue); //  La fonction fleureuse est plus courte

console.log(afficherObjet({ valeur })); //Output : Bonjour
```

## Fonctions void
- Les fonctions sans corps (sans arguments) sont appelées `void`
- Elles ne retournent aucune valeur
### Exemple de fonction void
```
void function() {
    console.log("This function will execute but return undefined.");
}();
```

## Exemples supplémentaires
### Calcul d'une moyenne
```
function calculerMoyenne(liste) {
    if (!liste || liste.length === 0) {
        return 0; // Gérer le cas où la liste est vide ou inexistante
    }
    const somme = liste.reduce((a, b) => a + b, 0);  // Calcul de la somme
    return somme / liste.length;
}

let resultat = calculerMoyenne([1, 2, 3, 4, 5]);
console.log("Moyenne : " + resultat);
```
### Fonction pour vérifier si un nombre est pair
```
function estPair(nombre) {
    return nombre % 2 === 0;
}

let nombre = 7;
if (estPair(nombre)) {
    console.log("Le nombre est pair.");
} else {
    console.log("Le nombre n'est pas pair.");
}
```

## Fonctions et commandes intégrés à JavaScript
### Typeof
- [developer.mozilla.org typeof](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/typeof)
  - `console.log(typeof 42);`
  - `console.log(typeof 'blubber');`
  - `console.log(typeof true);`
  - `console.log(typeof undeclaredVariable);`