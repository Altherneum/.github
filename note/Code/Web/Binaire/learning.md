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
- Une case avec un bite stocké rajoute la valeur assigné au résultat

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

Vous pouvez aussi le voire comme une rangé que vous remplissez petit à petit ([lehollandaisvolant.net](https://lehollandaisvolant.net/tuto/bin/))
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

![addition binaire](https://www.maxicours.com/se/media/img/5/7/9/2/579261.png)

- [maxicours.com /se/cours/ effectuer-des-operations-en-binaire](https://www.maxicours.com/se/cours/effectuer-des-operations-en-binaire)

## Soustraire
## Multiplier
## Diviser

# IP & masque réseau
- Voire [cours IP](https://doc.altherneum.fr/cours/ip)
- [Cours réseau](https://doc.altherneum.fr/cours/network)

## Transformer en binaire
Pour calculer une adresse IP avec son masque on transforme les deux valeurs en binaire
```
192       . 168       . 1         . 116
1100 0000 . 1010 1000 . 0000 0001 . 0111 0100

255       . 255       . 255       . 0
1111 1111 . 1111 1111 . 1111 1111 . 0000 0000
```

### Lecture des adresses réseau et client
On peut déjà déterminer l'adresse réseau et l'adresse des postes de ce réseau
```
  1100 0000 . 1010 1000 . 0000 0001 . 0111 0100
+ 1111 1111 . 1111 1111 . 1111 1111 . 0000 0000
= { Adresse . réseau    .         } . { PC     }
```

### Porte logique ET
Par la suite on applique un ET logique  
(Attention on ne fait pas une addition mais une porte logique ET)
```
1 + 1 = 1
1 + 0 = 0
0 + 1 = 0
0 + 0 = 0
```

Ce qui donne
```
  1100 0000 . 1010 1000 . 0000 0001 . 0111 0100
+ 1111 1111 . 1111 1111 . 1111 1111 . 0000 0000
= 1100 0000 . 1010 1000 . 0000 0001 . 0000 0000
```

```
1100 0000 . 1010 1000 . 0000 0001 . 0000 0000
192       . 168       . 1         . 0

192.168.1.0 est l'adresse réseau
L'adresse IP et masque : 192.168.1.116/24
```

## Calculer les sous réseaux et nombre d'hôtes
### Déterminer le nombre de sous réseau
- Déterminer la classe de l'adresse IP par défaut  
(Voire [cours IP # Masque](https://doc.altherneum.fr/cours/ip.html#Masque) et [cours IP # IPv4](https://doc.altherneum.fr/cours/ip.html#IPv4))
- Soustraire le masque donné
- Ce qui donne `2 ^ [Résultat]` sous réseaux possibles

#### Exemple
```
192       . 168       . 1         . 116
1100 0000 . 1010 1000 . 0000 0001 . 0111 0100

255       . 255       . 255       . 240
1111 1111 . 1111 1111 . 1111 1111 . 1111 0000
```

- Ici la classe par défaut d'une adresse en 192.xxx. .... est une classe C (`/24`)
- Et le masque donné est (`/28`)
- `28 - 24 = 4`, le nombre de sous réseau maximum possible est donc `2 ^ 4`

#### Exemple 2
```
192       . 168       . 1         . 116
1100 0000 . 1010 1000 . 0000 0001 . 0111 0100

255       . 255       . 255       . 0
1111 1111 . 1111 1111 . 1111 1111 . 0000 0000
```
- Classe C (`/24`)
- Mois le masque (`/24`)
- `24 - 24 = 0` Il n'y a qu'un seul sous réseau possible

### Déterminer le nombre d'hôtes
- Déterminer le nombre de bits à 0 du masque
- Le nombre d'hôte est donc `2 ^ [Valeur] - 2`

#### Exemple 3
```
192       . 168       . 1         . 116
1100 0000 . 1010 1000 . 0000 0001 . 0111 0100

255       . 255       . 255       . 240
1111 1111 . 1111 1111 . 1111 1111 . 1111 0000
```

- Ici le masque est composé de 4 bits avec une valeur de 0 à sa fin
- Ce qui donne `2 ^ 4 - 2` = 14 hôtes maximum possible

#### Exemple 4
```
192       . 168       . 1         . 116
1100 0000 . 1010 1000 . 0000 0001 . 0111 0100

255       . 255       . 255       . 0
1111 1111 . 1111 1111 . 1111 1111 . 0000 0000
```
- Ici il y a 8 bits à 0 sur le masque
- `2 ^ 8 - 2` = 254 adresses disponibles pour connecter des hôtes

### Piège de l'adresse broadcast

Pour savoir si une adresse est disponible ou une adresse de broadcast : 
- Adresse à vérifier : `172.16.3.255`(`/23`)
- Adresse réseau : `172.16.2.0`(`/23`)
```
1010 1100 . 0001 0000 . 0000 0010 . 1111 1111    IP
1111 1111 . 1111 1111 . 1111 1110 . 0000 0000    Masque
1010 1100 . 0001 0000 . 0000 0010 . 0000 0000    Résultat condition ET
```

Cela donne donc
- `172 . 16 . 2 . 0` en adresse réseau
- `2 ^ 9 - 2` = 510 adresses disponibles
- `172 . 16 . 2 . 255` est toujours dans le même réseau et laisse encore `510-255` = 255 adresses libres
- La dernière adresse libre pour un hôte est donc `172 . 16 . 3 . 254`
- Le broadcast est donc sur `172 . 16 . 3 . 255`

### Créer un réseau de taille fixe
#### Exemple 5
```
| 2^9 | 2^8 | 2^7 |2^6 |2^5 |2^4 |2^3|2^2|2^1|2^0| Nombres d'hôtes possibles
| 512 | 256 | 128 | 64 | 32 | 16 | 8 | 4 | 2 | 1 |
|  x  |     |     |    |    |    |   |   |   |   |
```

`2 ^ 9 - 2` = 510
Le masque va permettre de stocker 510 hôtes

#### Exemple 6
```
|2^11|2^10| 2^9 | 2^8 | 2^7 |2^6 |2^5 |2^4 |2^3|2^2|2^1|2^0|
|2048|1024| 512 | 256 | 128 | 64 | 32 | 16 | 8 | 4 | 2 | 1 |
|    | X  |     |     |     | x  |    |    | X | X | X |   |
```
`010001001110 = 1102`, donc `1102 - 2` = 1100 adresses possibles 
- Cela va permettre de créer un réseau de 1100 postes

# Octets vs Bits vs Bytes
- Bit = 1 ou 0
- Byte est la quantité de donnée

- Exemple 8 bytes font un octet composés de bits

- Les bits ne sont pas utilisés pour représenter les capacités de stockage
- Un Byte, quant à lui, est la plus petite quantité de données et désigne une unité de mémoire
- Un octet s'écrit avec 8 bits
- Une image d'un octet pèse donc 8 bytes 

# Créer du text

# Héxadécimale
