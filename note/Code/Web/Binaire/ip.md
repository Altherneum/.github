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
255       . 255       . 255       . 240
1111 1111 . 1111 1111 . 1111 1111 . 1111 0000
```

- Ici le masque est composé de 4 bits avec une valeur de 0 à sa fin
- Ce qui donne `2 ^ 4 - 2` = 14 hôtes maximum possible

#### Exemple 4
```
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
- Créer un réseau de 520 hôtes :
```
| 2^9 | 2^8 | 2^7 |2^6 |2^5 |2^4 |2^3|2^2|2^1|2^0| Nombres d'hôtes possibles
| 512 | 256 | 128 | 64 | 32 | 16 | 8 | 4 | 2 | 1 |
|  x  |     |     |    |    |    |   |   |   |   |
```

`2 ^ 9 - 2` = 510
Le masque va permettre de stocker 510 hôtes
Il aura besoin de 9 bits sur 0 à sa fin : 
- `xxxx xxxx.xxxx xxxx.xxxx xxx0.0000 0000`
- Soit xxx.xxx.xxx.xxx ou /x

#### Exemple 6
Créer un réseau de 1500 hôtes
```
|2^11|2^10| 2^9 | 2^8 | 2^7 |2^6 |2^5 |2^4 |2^3|2^2|2^1|2^0|
|2048|1024| 512 | 256 | 128 | 64 | 32 | 16 | 8 | 4 | 2 | 1 |
|    |    |      |    |     |    |    |    |   |   |   |   |
```
`2 ^ x - 2` = x
Il aura besoin de x bits sur 0 à sa fin : 
- `xxxx xxxx.xxxx xxxx.xxxx xxxx.xxxx xxxx`
- Soit xxx.xxx.xxx.xxx ou /x