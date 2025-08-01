Sur ce guide on va vous expliquer le binaire  

Pensez le binaire comme un tableau,
- 8 colonnes (pour créer un octet (il est utile de compte à plus de 1...))
- 2 lignes
- de la droite vers la gauche écrivez les puissance de 2

# Origine du binaire
Le binaire est le mode de comptage non plus en base 5 ([Système quinaire](https://fr.wikipedia.org/wiki/Système_quinaire))

base 9 ( En Chine et au Japon, on peut compter jusqu'à neuf sur chaque main [dactylonomie](https://fr.wikipedia.org/wiki/Dactylonomie)) 

base __**10 (celle que nous connaissont en Europe)**__

base 12 ([Système duodécimal](https://fr.wikipedia.org/wiki/Système_duodécimal) forme de dactylonomie mais en utilisant phalanges) 

__**mais en base 2 lié à sa propriété physique**__ !  
- Le binaire devant être stocké, il est gravé soit sur un support physique (disques en métal, en verre ou en céramique empilés) (exemple un [disque dur HDD](https://fr.wikipedia.org/wiki/Disque_dur) via magnétisme sur un disque mécanique en rotation)  
- Ou alors gravé de manière "électrique" [mémoire flash](https://fr.wikipedia.org/wiki/Mémoire_flash) (NVME & SSD / Clef USB / RAM) en stockant dans un [transistor](https://fr.wikipedia.org/wiki/Transistor) / [MOS](https://fr.wikipedia.org/wiki/Transistor_à_effet_de_champ_à_grille_métal-oxyde) possédant une grille flottante enfouie dans la puce. L'information est stockée grâce au piégeage d'électrons dans cette grille flottante ([Mémoire EEPROM "Electrically-erasable programmable read-only memory"](https://fr.wikipedia.org/wiki/Electrically-erasable_programmable_read-only_memory))

# Octets vs Bits vs Bytes
- Bit = 1 ou 0
- Byte est la quantité de donnée
- 1 byte = 8 bits

- Exemple 8 bits font un octet composés de 1 byte

- Les bits ne sont pas utilisés pour représenter les capacités de stockage
- Un Byte, quant à lui, est la plus petite quantité de données et désigne une unité de mémoire
- Un octet s'écrit avec 8 bits
- Une image d'un octet pèse donc 1 byte, soit 8 bits

# Comment écrire un chiffre en binaire

Dans ces mémoires, on y stock nos donnés de manière logique, sans quoi, impossible de retrouver quoi que ce soit ...

- 8 colonnes et 2 lignes
- de la droite vers la gauche écrivez les puissance de 2

```
| 128 | 64 | 32 | 16 | 8 | 4 | 2 | 1 | 
|     |    |    |    |   |   |   |   |
```
(Vous pouvez écrire dans les tableaux sur [doc.Altherneum.fr/cours/binaire](https://doc.Altherneum.fr/cours/binaire))

- Une case vide ne vaut rien, elle n'ajoute rien au résultat
- Une case avec un bit stocké rajoute la valeur assigné au résultat

Reprennons notre tableau
```
| 128 | 64 | 32 | 16 | 8 | 4 | 2 | 1 | 
|     |    |    |    |   |   |   |   |  
vaut 0, car rien n'est stocké
```
```
| 128 | 64 | 32 | 16 | 8 | 4 | 2 | 1 | 
|     |    |    |    |   |   |   | X |
Celui-ci contient un bit, positionné sur "1", le résultat est donc 1 😱
```

```
| 128 | 64 | 32 | 16 | 8 | 4 | 2 | 1 | 
|     |    |    |    | X |   |   | X |
Ici il y a 8 + 1 = 9
```

Comment écrire 25 ?  
- Prennez les plus gros chiffres en premier (de gauche à droite)
- Cocher des bits / cases tant que le résultat total ne vaut pas 25
```
| 128 | 64 | 32 | 16 | 8 | 4 | 2 | 1 | 
|     |    |    | X  | X |   |   | X |
16 + 8 + 1 = 25 ! 🤯
```

Vous pouvez aussi le voir comme une rangé que vous remplissez petit à petit ([lehollandaisvolant.net](https://lehollandaisvolant.net/tuto/bin/))
```
1	1	simple !
2	10	Le premier rang a atteint le maximum autorisé ! Qu'à cela ne tienne, on passe au rang suivant. On met le second à 1 et on remet le premier à 0.
3	11	On re-remplit le rang 1.
4	100	Le rang 1 est plein, mais le 2 aussi ! On passe donc au troisième et on remet les précédents à 0 (comme on le fait lorsque l'on passe de 0999 à 1000, par exemple).
5	101	On procède de même.
6	110
7	111
8	1000	On entame le quatrième rang.
9	1001	On recommence au premier…
10	1010	On rempli les rangs.
```

Ou encore en décomponsant le calcul en puissance de 2 (Et oui), des divisons, des bouliers "mécanique", ...

- [sebastienguillon.com /test/javascript /convertisseur](https://sebastienguillon.com/test/javascript/convertisseur.html) (Convertisseur binaire)

## Additionner, soustraire, ... en binaire
### Additionner
- L'addition en base 2 fonctionne comme l'addition en décimal, mais attention car en binaire, `1 + 1 = 10`
- il faut donc placer 0 et mettre une retenue de 1 sur le bit suivant. Il faut que les nombres à additionner soient de même taille

```
1 + 1 = 10 (On ajoute une retenue)
1 + 0 = 1
0 + 1 = 1
0 + 0 = 0
```

```
  0 0 0¹ 1¹ 1 0¹ 0¹ 1
+ 0 0 0  1  1 0  1  1
= 0 0 1  1  0 1  0  0
```

![addition binaire](https://github.com/Altherneum/.github/blob/main/note/assets/images/Binaire.png?raw=true)

- [maxicours.com /se/cours/ effectuer-des-operations-en-binaire](https://www.maxicours.com/se/cours/effectuer-des-operations-en-binaire)

## Soustraire
### Convertir en binaire pour soustraire
Convertir les nombres en binaire, exemple `25 - 9` = `16`
```
| 128 | 64 | 32 | 16 | 8 | 4 | 2 | 1 |
|     |    |    | X  | X |   |   | X |    25
|     |    |    |    | X |   |   | X |    -9
```

### Appliquer la porte logique pour soustraire
- Commencez par le bit en haut à droite
- et comparez-le au chiffre du nombre qu'il faut soustraire en dessous
- En partant du haut de la colonne vers le bas jusqu'à ce que tous les bits soient traités, ou que vous obtenez un résultat négatif.

- Si le bit est supérieur au chiffre à retirer (1 > 0)
  - ajoutez un 1
  - sinon, ajoutez un 0.
```
| 128 | 64 | 32 | 16 | 8 | 4 | 2 | 1 |
|     |    |    | X  | X |   |   | X |
|     |    |    |    | X |   |   | X |
|     |    |    | X  |   |   |   |   | ce qui donne 16
```

## Multiplier
...

## Diviser
...

# Créer du text

# Héxadécimale
