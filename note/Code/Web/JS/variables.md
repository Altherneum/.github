# Variables
## Qu'est-ce qu'une variable ?
Une variable est comme une boîte à outils dans votre ordinateur. Elle stocke un morceau d'information (des données) que vous pouvez utiliser ultérieurement
## Le Principe de Scope (Portée)
Le concept le plus important à comprendre est la portée des variables : Elle détermine où une variable peut être accessible dans votre code.
### var
- `var`: La portée de `var` est globale
  - La portée globale signifie que la variable est accessible depuis n'importe quel endroit dans le code, même si elle n'est pas déclarée à l'intérieur d'une fonction ou d'un bloc.
  - C'est un risque de "pollution de portée" (scope pollution) et est généralement déconseillé, surtout dans les projets nouveaux car il peut entraîner des problèmes de portée (scope) qui peuvent rendre le code difficile à déboguer
  - Il a été introduit par Microsoft
  - C'est l'ancien type de variable en JavaScript
### let
- `let`: La portée de `let` est locale
  - La portée locale signifie que la variable peut être accessible uniquement dans le bloc de code où elle a été déclarée
  - C'est le type de variable moderne en JavaScript
  - Il permet de déclarer une variable et de lui assigner une valeur, mais la variable ne peut pas être réassignée après sa déclaration (sauf si on utilise la "borrowing")
  - C'est la solution recommandée pour les nouvelles variables
### const
- `const`: La portée de `const` est locale
  - Comme `let`, la variable ne peut pas être modifiée après sa déclaration, mais elle est immuable (une fois qu'elle est initialisée), (On peut seulement la définir)
### Exemple Illustratif
```
const abc = "abc";
var canChange = "abd";

function myFunc() {
  var message = "Bonjour le monde";
  console.log(message); // Bonjour le monde

  let name = "Bob";
  console.log(name); // Bob

  console.log(abc); // abc
  
  console.log(canChange); // abd
  canChange = "abc!";
  console.log(canChange); // abc!
}

myFunc();

console.log(message); // Uncaught ReferenceError: message is not defined
console.log(name); //
                   // Rien ne sera visible
```
- Dans cet exemple, `message` est accessible de l'extérieur de la fonction
  - Si on essayait de modifier `message` depuis l'extérieur, on ne le ferait pas.
- Et `name` est seulement accessible à l'intérieur de la fonction `myFunc`

## Types de variables
Comprendre les différents types de données est crucial pour écrire du code correct et efficace
### Nombres 
- `Numbers`
- Représentent des valeurs numériques
  - Exemples: `10`, `-5`, `3.14`
  - `Number`: La base pour représenter les nombres
(par exemple, `number = 10;`)
  - `parseInt()`: Convertit une chaîne en un nombre (en utilisant le séparateur de milliers)
    - Exemple : `parseInt("123")` retournera `123`
(Si la chaîne ne contient pas un séparateur de milliers, elle renverra `NaN`)
  - `parseFloat()`: Convertit une chaîne en un nombre (avec des décimales)
    - Exemple : `parseFloat("3.14159")` retournera `3.14`
### Chaînes de caractères 
- `Strings`
- Représentent des séquences d'octets, généralement utilisées pour afficher des informations ou stocker du texte, ou une chaîne de caractères
  - Exemples: `"Bonjour"`, `'JavaScript'`, `“Hello”`
### Booléens 
- `Booleans`
- Représentent des valeurs qui peuvent être vraies (`true`) ou fausses (`false`)
- Souvent utilisés pour contrôler le flux du programme
  - Exemples: `let isValid = true;`
### Tableaux 
- `Arrays`
- Une liste ordonnée de valeurs, comme une collection d'éléments
Peuvent contenir des nombres, des chaînes, des booléens, etc
  - Exemples: `let myArray = [1, 2, "Hello"];`
### Objets 
- `Objects`
- Des collections d'attributs et de méthodes
- Comme les tableaux mais avec des propriétés et méthodes
  - Exemples: `let myPerson = { name: "John", age: 30 };`