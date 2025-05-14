# Cas spécifique
## 0.1 + 0.2
- `0.1 + 0.2 == 0.3` est `false`
- La console indique `0.1 + 0.2 = 0.30000000000000004`
## Autres aditions étranges
- `999999999999999` = `999999999999999`
- `9999999999999999` = `10000000000000000`

- `10000000000000000` = `10000000000000000`
- `10000000000000000 + 1` vaut `10000000000000000`
- `10000000000000000 + 1.1` vaut `10000000000000002`
## Floating point calcul
- `parseInt(0.000001)` est `0`
- `parseInt(0.0000001)` est `1`
- `parseInt(1 / 1999999)` est `5`
## Console output manipulés
```js
(![] + [])[+[]] +
  (![] + [])[+!+[]] +
  ([![]] + [][[]])[+!+[] + [+[]]] +
  (![] + [])[!+[] + !+[]];
```
soit aussi en une ligne `(![] + [])[+[]] + (![] + [])[+!+[]] + ([![]] + [][[]])[+!+[] + [+[]]] + (![] + [])[!+[] + !+[]];`, et va retourner `'fail'`
## Exemples d'output manipulés
- `+![]` est `0`
- `+!![]` est `1`
- `!![]` est `true`
- `![]` est `false`
- `[][[]]` est `undefined`
- `+!![] / +![]` est `Infinity`
- `[] + {}` est `"[object Object]"`
- `+{}` est `NaN`
## Autres cas
- `![] + []` est `'false'`
- `![]` est `false`
- `true + true` est `2`
- `(true + true) * (true + true) - true` est `3`
## Array concat
`[1, 2, 3] + [4, 5, 6]` est `'1,2,34,5,6'`
## ParseInt F*ck
- `parseInt("f*ck")` est `NaN`
- `parseInt("f*ck", 16)` est `15`
- `parseInt("Infinity", 18)` est `NaN`
- `parseInt("Infinity", 19)` est `18`
NaN est un nombre
- Le type d'objet de `NaN` (`Not a number`, soit "pas un nombre") est `'number'`
  - `typeof NaN` est `'number'`
## Sources
- [github.com/denysdovhan/wtfjs/blob/master/README.md](https://github.com/denysdovhan/wtfjs/blob/master/README.md)
