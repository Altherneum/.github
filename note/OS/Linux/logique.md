
# Test
- La commande `test` permet de vérifier un fichier, valeurs numériques, caractères
- `test` équivaut à `if [ CMD ]`

## Test comparatif
- `( EXPRESSION )` EXPRESSION est vraie
- `! EXPRESSION` EXPRESSION est fausse

- `EXPRESSION1 -a EXPRESSION2` EXPRESSION1 et EXPRESSION2 sont vraies
  - `EXPRESSION1 && EXPRESSION2`
- `EXPRESSION1 -o EXPRESSION2` EXPRESSION1 ou EXPRESSION2 sont vraies
  - `EXPRESSION1 || EXPRESSION2`

- `CHAÎNE1 = CHAÎNE2` les deux chaînes sont égales
- `CHAÎNE1 != CHAÎNE2` les deux chaînes sont différentes

- `-n CHAÎNE` la longueur de CHAÎNE est non nulle
  - `CHAÎNE` équivalent à `-n CHAÎNE`
- `-z CHAÎNE` la longueur de la CHAÎNE est nulle

## Comparateur numérique
- `[NOMBRE] -eq [NOMBRE 2]` NOMBRE et NOMBRE 2 sont égaux
- `[NOMBRE] -ne [NOMBRE 2]` NOMBRE et NOMBRE 2 sont différents

- `[NOMBRE] -ge [NOMBRE 2]` NOMBRE est supérieur ou égal à NOMBRE 2
- `[NOMBRE] -gt [NOMBRE 2]` NOMBRE est strictement supérieur à NOMBRE 2
- `[NOMBRE] -le [NOMBRE 2]` NOMBRE est inférieur ou égal à NOMBRE 2
- `[NOMBRE] -lt [NOMBRE 2]` NOMBRE est strictement inférieur à NOMBRE 2

- `FICHER1 -ef FICHIER2` FICHIER1  et  FICHIER2  ont les mêmes numéros de périphérique et d’inode
- `FICHIER1 -nt FICHIER2` la date de modification de FICHIER1 est plus récente  que  celle de FICHIER2
- `FICHIER1 -ot FICHIER2 `FICHIER1 est plus vieux que FICHIER2

## Test booléen
- `-b [FILE]` Si le fichier existe, c’est un fichier spécial en mode bloc
- `-c [FILE]` Si le fichier existe, c’est un fichier spécial en mode caractère
- `-d [FILE]` Si le fichier existe et est un répertoire
- `-e [FILE]` Si le fichier existe
- `-f [FILE]` Si le fichier existe et est un fichier ordinaire
- `-g [FILE]` Si le fichier existe et a son bit set-GID positionné
- `-G [FILE]` Si le fichier existe et appartient au GID effectif de l’appelant
- `-h [FILE]` Si le fichier existe et est un lien symbolique (identique à -L)
- `-k [FILE]` Si le fichier existe, son bit collant (« sticky ») est positionné
- `-L [FILE]` Si le fichier existe et est un lien symbolique (identique à -h)
- `-O [FILE]` Si le fichier existe et appartient à l’UID effectif de l’appelant
- `-p [FILE]` Si le fichier existe et est un tube nommé
- `-r [FILE]` Si le fichier existe et est lisible
- `-s [FILE]` Si le fichier existe et a une taille non nulle
- `-S [FILE]` Si le fichier existe et est une socket
- `-t FD` Le descripteur de fichier FD est ouvert sur un terminal
- `-u [FILE]` Si le fichier existe et son bit setuid est positionné
- `-w [FILE]` Si le fichier existe et est accessible en écriture
- `-x [FILE]` Si le fichier existe et est exécutable (ou peut être parcouru dans le cas d’un répertoire)

# if
Tabulation / identation non obligatoire
```
if test = "$nom" = abc
  then echo "abc"
fi
```

Les espaces autour du crochet sont obligatoires
```
if [ "$nom" = "abc" ]
  then eco "abc"
fi
```

```
if [ "$nom" = "abc" ] ; then
  echo "abc"
fi
```

# if else
```
if test = "$nom" = abc
  
  then echo "abc"

  else echp "not abc"

fi
```

# elif
`./script.sh [STRING]`
```
if [ $1 = "start" ]
  then echo "Démarrage"

elif [ $1 = "stop" ]
  then echo "Arrêt du serveur"

elif [ $1 = "enable" ]
  then echo "Activation du serveur"

elif [ $1 = "disable" ]
  then echo "Désactivation du serveur"

else echo "erreur"

fi
```

# Single-line version
`if [ foo ]; then a && b; elif [ bar ]; c && d; else e && f; fi`
à tester et valider

# Using the OR operator
`( foo && a && b ) || ( bar && c && d ) || e && f;`
à tester et valider

# While
```
a=0

while [ $a -ne 10 ]

do

  echo $a
  ((a+=1))

done
```

# Until
```
until [ $a -eq 10 ]
do
  [CMD]
done
```

# for
## for increment
```
for ((i=1; i<=2; i++)); 
do
  [CMD]
done
```

## for each
`./script.sh a b c`
```
for letter
do
  echo $letter
done
```
Par défaut letter (si vide) sera la liste des paramètres !

## for each paramètres
`./script.sh a b c`
```
letter=$@
for letter
do
  echo $letter
done
```

## for in
```
for variable in var1 var2 var3
do
  [CMD]
done
```

# Arrêter une boucle
## Break
`break` Stop une boucle de force et continue le script

## Continue
La commande `continue` permet de reprendre l'exécution à l'itération suivante d'une boucle `for` / `while` ou `until` sans exécuter toutes les commande de la boucle après le `continue`

# Case in esac
Forme de Switch
```
read reponse

case "$reponse" in

    a) echo "vous avez tappez A";;
    b) echo "vous avez tappez B";;
    c | d) echo "vous avez tappez C ou D";;
    stop) echo "Arrêt du script ..." ; exit 0;;

esac
```

## Case in esac avec wildcard
```
read entry

case "$entry" in

    [aA] ) echo "A a été tappé";;
    [bB-yY] ) echo "de B à Y";;
    *) echo "Erreur";;

esac
```
`*` Wildcard pour tout autre caractère / mot
- `[Regex]`
  - `[Aa]` Majuscule ou minuscule
  - `[a-b]` de a à b minuscule
  - `[A-B]` de A à B majuscule
  - `[Aa-Bb]` De A à B majuscule ou minuscule

# Select
Permet de créer des menus et de tapper le n° du menu à lancer :
```
select cmd in a b c autre

do

    echo "Vous avez fait le choix : $cmd"

done
```

Exemple : 

```
select cmd in date pwd break "Lancer pipes.sh"

do

    case "$cmd" in

        date) echo -n "Date du jour : " ; date;;
        pwd) echo -n "Vous êtes ici : " ; pwd;;
        break) echo "Fin ..." ; break;;
        "Lancer pipes.sh") ./pipes.sh;;
        *) echo "Tapper un nombre entre 1 et 4;;

    esac

done
```

# Function
```
function ABC
{
    echo "Test"
}
```

```
function ABC()
{
    echo "Test"
}
```

```
ABC () { 
    echo "Test"
}
```
Lancer la fonction via `ABC`

## Function paramètres
```
ABC () {
   echo "Test $@"
}
```
Lancer la fonction via `ABC Paramètre "Autre paramètre"`

## Function return
```
ABC () {
    nombre_param=$#
    return $nombre_param
}

ABC test0 test1 test2 test3

ret=$?
echo "Return = $ret"
```

## Function loading
Une fonction une fois lus peut être exécuté hors du script par le shell
```
ABC()
{
    echo "Test"
}
```
- Lancer le script .sh de la manière suivante :
  - `. [SCRIPT].sh`
  - `source [SCRIPT].sh`
- Dans le shell, écrire : `ABC`
- Cela aura pour effet de lancer la fonction ABC

- Pour supprimer la fonction de la mémoire du shell :
  - Relancer le shell
  - `unset -f [FUNCTION]`

# Exit
Quitte le script avec un code de retour
- `exit 0`
- `exit 404`