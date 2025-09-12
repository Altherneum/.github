# Variables
- `A="ABC"`, `echo $a` Affecter et afficher une variable
- Utiliser une fonction variable dans un echo : `echo $(date)`
- `unset $var` Supprime la variable

## Variable locale
local secret="Secret password to store in local"
### Exemple sans local
```
[arch@ARCH ~]$ cat file
secret="abc"
echo $secret
```
```
[arch@ARCH ~]$ bash ./file 
abc
```
```
[arch@ARCH ~]$ echo $secret

```
```
[arch@ARCH ~]$ source ./file
abc
```
```
[arch@ARCH ~]$ echo $secret
abc
```
### Exemple avec local
```
[arch@ARCH ~]$ cat file
func() {
    secret="abc"
    echo $secret
}
func
```
```
[arch@ARCH ~]$ bash ./file 
abc
```
```
[arch@ARCH ~]$ echo $secret

```
```
[arch@ARCH ~]$ source ./file
abc
```
```
[arch@ARCH ~]$ echo $secret

```
Même via `source`, il ne sera plus possible d'extraire une variable hors de portée de la fonction
- Elle restera dans la portée du script
  - Et ne peut donc pas être extraite
- Pollue moins la mémoire
- Évite d'avoir « deux » variables avec un nom commun (exemple : `x`) qui, autrement, n'en seraient qu'une
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

# Variables spéciales
- `script.sh abc param2`
  - utiliser `$1` va retourner le param °0 `$2 3 4 ...`
  - A TESTER
- `$*` Ensemble des paramètres positionnels (En un seul mot)
- `$@` Ensemble des paramètres positionnels (En plusieurs mots)
- `$#` Nombre de paramètres  positionnels
- `$?` Code retour du dernier processus / commande
- `$-` Options positionnées du shell
- `$$` Numéro du processus courant (le Shell)
- `$!` Numéro du dernier processus lancé en arrière-plan
- `$0` Nom de la procédure
- `$_` ??? [unix.stackexchange.com /question /understand-the-meaning-of](https://unix.stackexchange.com/questions/280453/understand-the-meaning-of)

## Variables internes
- `$BASH_VERSION` Version du terminal Bash
- `$BASH` Le chemin vers le binaire Bash.
- `$BASH_ENV` Une variable d'environnement pointant vers un script Bash de démarrage lu lorsqu'un script est invoqué
- `$BASH_SUBSHELL` Une variable indiquant le niveau du sous-shell335. C'est un nouvel ajout de Bash, version 3455.
Voir l'Exemple 20.1, « Étendue des variables dans un sous-shell » pour son utilisation.
- `$BASH_VERSINFO[n]` Un tableau366 à six éléments contenant des informations sur la version installée de Bash. Ceci est similaire à `$BASH_VERSION`, ci-dessous, mais en un peu plus détaillé.
  - `BASH_VERSINFO[0]` = 3, No majeur de version.
  - `BASH_VERSINFO[1]` = 00, No mineur de version.
  - `BASH_VERSINFO[2]` = 14, Niveau de correctifs.
  - `BASH_VERSINFO[3]` = 1, Version construite.
  - `BASH_VERSINFO[4]` = release, État de la version.
  - `BASH_VERSINFO[5]` = i386-redhat-linux-gnu, Architecture (identique à `$MACHTYPE`).
- `$SHELL` Nom du Shell qui sera lancé chaque fois qu'on demandera l'ouverture d'un Shell dans une application interactive (« vi », « ftp »…)
- `$HOME` Répertoire personnel de l'utilisateur
- `$PWD` Répertoire courant (uniquement en « Korn Shell » ou « Bourne Again Shell » et shells descendants)
- `$OLDPWD` Répertoire dans lequel on était avant notre dernier changement de répertoire (uniquement en « Korn Shell » ou « Bourne Again Shell » et shells descendants)
- `$LOGNAME` Nom de login
- `$PATH` Chemins de recherche des commandes
- `$CDPATH` Chemins de recherche du répertoire demandé par la commande « cd »
- `$PS1` Prompt principal (invite à taper une commande)
- `$PS2` Prompt secondaire (indique que la commande n'est pas terminée)
- `$PS3` Prompt utilisé par la commande « select » (uniquement en « Korn Shell » et « Bourne Again Shell » et shells descendants)
- `$PS4` Prompt affiché lors de l'utilisation du mode débogueur « set -x »
- `$TERM` Type de terminal utilisé
- `$REPLY` Chaîne saisie par l'utilisateur si la commande « read » a été employée sans argument (uniquement en « Korn Shell » et « Bourne Again Shell » et shells descendants).
Numéro choisi par l'utilisateur dans la commande « select » (uniquement en « Korn Shell » et « Bourne Again Shell » et shells descendants)
- `$IFS` Séparateur de champs internes
- `$RANDOM` Nombre aléatoire entre 0 et 32 767 (uniquement en « Korn Shell » et « Bourne Again Shell » et shells descendants)
