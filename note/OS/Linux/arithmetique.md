# Expr
Expr permet d'évaluer des expressions, il ne supporte pas les opérations à virgule
- `expr 4 - 2`
- `expr $a + 1`
- `b=$(expr 1 + 1)`

- `PARAM1 | PARAM2` PARAM1 s’il est nul ou 0, sinon PARAM2
- `PARAM1 & PARAM2` PARAM1 si aucun paramètre n’est nul ou égal à 0, sinon 0
- `PARAM1 < PARAM2` PARAM1 est inférieur à PARAM2
- `PARAM1 <= PARAM2` PARAM1 est inférieur ou égal à PARAM
- `PARAM1 = PARAM2` PARAM1 est égal à PARAM2
- `PARAM1 != PARAM2` PARAM1 est différent de PARAM2
- `PARAM1 >= PARAM2` PARAM1 est supérieur ou égal à PARAM2
- `PARAM1 > PARAM2` PARAM1 est supérieur à PARAM2
- `PARAM1 + PARAM2` somme arithmétique de PARAM1 et PARAM2
- `PARAM1 - PARAM2` différence arithmétique de PARAM1 et PARAM2
- `PARAM1 * PARAM2` produit arithmétique de PARAM1 et PARAM2
- `PARAM1 / PARAM2` division arithmétique de PARAM1 par PARAM2
- `PARAM1 % PARAM2` reste arithmétique de la division de PARAM1 par PARAM2

# BC
## Expressions basiques de BC
- `- expr` Le résultat de la négation de l'expression.
- `++ var` La variable est incrémentée de un et la nouvelle valeur est le résultat de l'expression.
- `-- var` La variable est décrémentée de un et la nouvelle valeur est le résultat de l'expression.
- `var ++` Le résultat de l'expression est la valeur de la variable, et ensuite la variable est incrémentée de un.
- `var --` Le résultat de l'expression est la valeur de la variable, et ensuite la variable est décrémentée de un.
- `expr + expr` Le résultat de l'expression est la somme des deux expressions.
- `expr - expr` Le résultat de l'expression est la différence entre les deux expressions.
- `expr * expr` Le résultat de l'expression est le produit des deux expressions.
- `expr / expr` Le résultat de l'expression est le quotient des deux expressions. L'échelle du résultat est la valeur de la variable scale.
- `expr % expr` Le résultat de l'expression est le « reste » et il est calculé de la manière suivante : pour calculer a%b, a/b est d'abord calculé avec une échelle de scale chiffres. Ce résultat est utilisé pour calculer a-(a/b)*b à l'échelle du maximum entre scale+scale(b) et scale(a). Si scale vaut zéro et que les deux expressions sont entières, cette expression est la fonction de reste entier.
- `expr ^ expr` Le résultat de l'expression est la valeur de la première expression exposant la seconde. La seconde expression doit être un entier. (Si la seconde expression n'est pas un entier, un avertissement est généré et l'expression est tronquée pour obtenir une valeur entière.) L'échelle du résultat est scale si l'exposant est négatif. Si l'exposant est positif, l'échelle du résultat est le minimum entre l'échelle de la première expression fois la valeur de l'exposant, et le maximum entre scale et l'échelle de la première expression (ou, mathématiquement parlant, scale(a^b) = min(scale(a)*b, max(scale, scale(a))) ). Il faut noter que expr^0 renverra toujours la valeur 1.
- `( expr )` Ceci altère la priorité standard pour forcer l'évaluation de l'expression.
- `var = expr` La valeur de l'expression est affectée à la variable.
- `var <op>= expr` C'est équivalent à `var = var <op> expr` à l'exception que la partie « var » n'est évaluée qu'une seule fois. Cela peut faire une différence si « var » est un tableau.

## Expressions relationnelles de BC
Les expressions relationnelles sont un cas particulier des expressions qui sont toujours évaluées à 0 ou 1 : 0 si la relation est fausse et 1 si la relation est vraie. Elles peuvent apparaître dans n'importe quelle expression légale. (Le bc POSIX requiert que les expressions relationnelles ne peuvent être utilisées que dans les instructions if, for et while, et qu'un seul test relationnel peut y être effectué.) Les opérateurs relationnels sont
- `expr1 < expr2` Le résultat est 1 si expr1 est strictement inférieure à expr2.
- `expr1 <= expr2` Le résultat est 1 si expr1 est plus petite ou égale à expr2.
- `expr1 > expr2` Le résultat est 1 si expr1 est strictement supérieure à expr2.
- `expr1 >= expr2` Le résultat est 1 si expr1 est plus grande ou égale à expr2.
- `expr1 == expr2` Le résultat est 1 si expr1 est égale à expr2.
- `expr1 != expr2` Le résultat est 1 si expr1 n'est pas égale à expr2.

## Expressions booléens
Les opérateurs booléens sont également légaux. (Le bc POSIX ne possède PAS les opérations booléennes). Le résultat de toutes les expressions booléennes est 0 ou 1 (pour faux ou vrai) comme dans les expressions relationnelles. Les opérateurs booléens sont :
- `!expr` Le résultat est 1 si expr vaut 0.
- `expr && expr` Le résultat est 1 si les deux expressions sont non nulles.
- `expr || expr` Le résultat est 1 si (au moins) l'une des deux expressions est non nulle.

## Priorité de calcule de BC
La priorité dans les expressions est la suivante (de la plus basse à la plus haute) :
- opérateur `||`, associatif à gauche
- opérateur `&&`, associatif à gauche
- opérateur `!`, non associatif
- opérateurs relationnels, associatifs à gauche
- opérateur d'affectation, associatif à droite
- opérateurs `+` et `-`, associatifs à gauche
- opérateurs `*`, `/` et `%`, associatifs à gauche
- opérateur `^`, associatif à droite
- opérateur `-` unaire, non associatif
- opérateurs `++` et `--`, non associatifs

Cette priorité a été choisie de telle sorte que les programmes bc conformes à POSIX s'exécutent correctement. Cela conduira à ce que l'utilisation des opérateurs relationnels et logiques mène à un comportement inhabituel lors de leur utilisation dans des expressions d'affectation. 

- Considérez l'expression
`a = 3 < 5`
La plupart des programmeurs C supposeraient que cela affecte le résultat de « 3 < 5 » (la valeur 1) à la variable « a ». Ce que cela fait dans bc est d'affecter la valeur 3 à la variable « a » et de comparer ensuite 3 à 5. Il vaut mieux utiliser des parenthèses lors de l'utilisation d'opérateurs relationnels ou logiques en présence d'opérateurs d'affectation.

## Expressions spéciales
Il y a quelques expressions spéciales supplémentaires qui sont fournies dans bc. Elles se rapportent à des fonctions définies par l'utilisateur et à des fonctions standard. Elles apparaissent toutes sous la forme « nom(paramètres) ». Voyez la section sur les fonctions pour en savoir plus sur les fonctions définies par l'utilisateur. Les fonctions standard sont :

- `length ( expression )` La valeur de la fonction length est le nombre de chiffres significatifs de l'expression.
- `read ( )` La fonction read (une extension) lit un nombre à partir de l'entrée standard, où qu'elle soit appelée. Attention : cela peut causer des problèmes lors du mélange de données et d'un programme sur l'entrée standard. Le meilleur usage de cette fonction se situe dans un programme précédemment écrit qui a besoin d'entrée en provenance de l'utilisateur, mais qui ne permet jamais que l'utilisateur entre du code. La valeur de la fonction read est le nombre lu à partir de l'entrée standard en utilisant la valeur actuelle de la variable ibase comme base de conversion.
- `scale ( expression )` La valeur de la fonction scale est le nombre de chiffres après la virgule dans l'expression.
- `sqrt ( expression )` La valeur de la fonction sqrt est la racine carrée de l'expression. Si l'expression est négative, une erreur à l'exécution est générée.

## BC avec pipe
```
a=3.5
b=1.5
c=$(echo "$a * $b" | bc -l)
echo "C vaut $c"
```
- `"10^2" | bc` Puissance

## BC avec triple chevron
- `bc <<< "1 + $a"` Calculer avec une variable
- `b=$(bc <<< "1 + 1")` Assigner à une variable
- `c=$(bc <<< "$a * $b")` Assigner et calculer avec une variable

# Let
- `let "1+1"`
- `let "var=1+1"`
- `let "var+=1"`
- `let "var++"`
- `let "var=var+1"`
# Double parenthèse
- `((1+1))`
- `((var=1+1))`
- `((var+=1))`
- `((var++))`
- `var=$((var+1))`
- `((var=var+1))`