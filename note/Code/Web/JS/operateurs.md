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
