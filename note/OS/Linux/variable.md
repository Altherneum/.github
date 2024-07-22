# Variables
- `A="ABC"`, `echo $a` Affecter et afficher une variable
- Utiliser une fonction variable dans un echo : `echo $(date)`
- `unset $var` Supprime la variable

## Array
- `Alphabet=(A B C)` Permet de créer un `Array`
Variable avec default value à faire

- `Alphabet[1]="B"`
- `Alphabet[3]="C"`
- `Alphabet="A"`

- `i=3`
- `echo "Les premières lettres : ${Alphabet[0]}, ${Alphabet[1]} et ${Alphabet[$i]}"`
- `echo "Les lettres sont ${Alphabet[*]}"`
  - `echo "Les lettres sont : ${Alphabet[@]}"`













# Variable math
- `expr $a + 1`
- `expr $a - 2`
- `expr $a / 3`
- `expr $a \* 2`
# Math BC
```
a=3.5
b=1.5
c=$(echo "$a * $b" | bc -l)
echo "C vaut $c)
```












# Variables spéciales
- ![alt text](image-3.png) variables spéciales
  - `script.sh abc param2`
  - utiliser `$0` va retourner le param °0

- `$BASH_VERSION`
- `$(Which sh)`

[frederic-lang.developpez.com/tutoriels/linux/prog-shell/?page=les-variables](https://frederic-lang.developpez.com/tutoriels/linux/prog-shell/?page=les-variables) Copier les chapitres manquants !