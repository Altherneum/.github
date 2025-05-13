# Opérateurs
## Opérateurs Arithmétiques
- `+` : Addition
  - `1 + 2 = 3`
- `-` : Soustraction
  - `5 - 2 = 3`
- `*` : Multiplication
  - `5 * 2 = 10`
- `/` : Division
  - `10 / 2 = 5`
- `%` : Modulo (remainder)
  - `10 % 3 = 1`

## Opérateurs Logiques
- `&&` : AND
  - Retourne `true` si **tous** les opérandes sont `true`
  - Exemple : `true && true = true`
- `||` : OR
  - Retourne `true` si **au moins un** des opérandes est `true`
  - Exemple : `true || false = true`
- `!` : NOT
  - Inverse le sens d'un opérateur logique
  - Exemple : `!true = false`

## Opérateurs de Comparaison
### Égal à
- `==` : Égal à
  - `3 == 3` est `true`
  - `5 == 3` est `false`

### Différent de
- `!=` : Différent de
  - `5 != 3` est `true`
  - `5 != 5` est `false`

### Égal à stricte
- `===` : Égal à [comparaison stricte](#comparaison-stricte)
  - `5 === 5` est `true`
  - `"5" === "5"` est `true`
  - `"5" === 5` est `false`

### Différent de stricte
- `!==` : Différent de [comparaison stricte](#comparaison-stricte)
  - `5 !== 3` est `true`
  - `"5" !== "3"` est `true`
  - `"5" !== 5` est `true`
  - `5 !== 5` est `false`

### Inférieur à
- `<` : Inférieur à
  - `5 < 3` est `true`
  - `3 < 5` est `false`
- `>` : Supérieur à
  - `5 > 3` est `true`
  - `3 > 5` est `false`

### Inférieur ou égal à
- `<=` : Inférieur ou égal à
  - `5 <= 5` est `true`
  - `3 <= 5` est `true`
  - `5 <= 3` est `false`

### Supérieur ou égal à
- `>=` : Supérieur ou égal à
  - `5 >= 3` est `true`
  - `5 >= 5` est `true`
  - `3 >= 5` est `false`

### Comparaison stricte
#### Définition d'une comparaison stricte
- L'opérateur de comparaison `==` convertit les valeurs vers un type correspondant
- L'opérateur de comparaison `===` compare la valeurs et le type
#### Exemples de comparaisons
- Comparaisons classique
  - `0 == ""` est `true`
  - `1 == "1"` est `true`
  - `1 == true` est `true`
- Comparaisons strictes
  - `0 === ""` est `false`
  - `1 === "1"` est `false`
  - `1 === true` est `false`

### Cas spécifique
#### 0.1 + 0.2
- `0.1 + 0.2 == 0.3` est `false`
- La console indique `0.1 + 0.2 = 0.30000000000000004`
#### Floating point calcul
- `parseInt(0.000001)` est `0`
- `parseInt(0.0000001)` est `1`
- `parseInt(1 / 1999999)` est `5`
#### Console output manipulés
```js
(![] + [])[+[]] +
  (![] + [])[+!+[]] +
  ([![]] + [][[]])[+!+[] + [+[]]] +
  (![] + [])[!+[] + !+[]];
```
Ce script va retourner `'fail'`
#### Exemples d'output manipulés
- `+![]` est `0`
- `+!![]` est `1`
- `!![]` est `true`
- `![]` est `false`
- `[][[]]` est `undefined`
- `+!![] / +![]` est `Infinity`
- `[] + {}` est `"[object Object]"`
- `+{}` est `NaN`
#### Autres cas
- `![] + []` est `'false'`
- `![]` est `false`
- `true + true` est `2`
- `(true + true) * (true + true) - true` est `3`
#### Array concat
`[1, 2, 3] + [4, 5, 6]` est `'1,2,34,5,6'`
#### ParseInt F*ck
- `parseInt("f*ck")` est `NaN`
- `parseInt("f*ck", 16)` est `15`
- `parseInt("Infinity", 18)` est `NaN`
- `parseInt("Infinity", 19)` est `18`
NaN est un nombre
- Le type d'objet de `NaN` (`Not a number`, soit "pas un nombre") est `'number'`
  - `typeof NaN` est `'number'`
## Sources
- [github.com/denysdovhan/wtfjs/blob/master/README.md](https://github.com/denysdovhan/wtfjs/blob/master/README.md)
