# IP & masque réseau
- voir [cours IP](https://doc.altherneum.fr/cours/ip)
- [Cours réseau](https://doc.altherneum.fr/cours/network)
- [Cours Binaire](https://doc.altherneum.fr/cours/binaire)

# CIDR vs Masque
## CIDR
Classless Inter-Domain Routing

- S'écrit après une adresse IP tel que `wwww.xxxx.yyyy.zzzz` `/CIDR`
  - Exemple : `192.168.1.1/24`
- `/24` indique que le masque est composé de 24 bits de poids fort à 1
```
1111 1111 . 1111 1111 . 1111 1111 . 0000 0000
```
On peut remarquer ici les 24 bits à 1, puis les bits restant (Jusqu'à 32 au total) à 0

## Masque
Le masque peut être écrit en notation CIDR, mais aussi directement au format décimal
```
1111 1111 . 1111 1111 . 1111 1111 . 0000 0000
255       . 255       . 255       . 0
```
Le maque écrit `255.255.255.0` vaut toujours le CIDR `/24`

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
#### Poids fort
Ici le poids fort décrit la partie de l'adresse réseau (à gauche)

#### Poids faible
Le poids faible est la partie hôte / PC (à droite)

# Porte logique AND
Par la suite on applique un AND logique  
(Attention on ne fait pas une addition mais une porte logique AND)
```
1 + 1 = 1
1 + 0 = 0
0 + 1 = 0
0 + 0 = 0
```

## Calculer l'adresse réseau
Ce qui donne avec l'adresse `192.168.1.116` et le masque `255.255.255.0` :
```
  1100 0000 . 1010 1000 . 0000 0001 . 0111 0100
+ 1111 1111 . 1111 1111 . 1111 1111 . 0000 0000
= 1100 0000 . 1010 1000 . 0000 0001 . 0000 0000
```

Et une fois le résulat reconvertit en décimale
```
1100 0000 . 1010 1000 . 0000 0001 . 0000 0000
192       . 168       . 1         . 0
```
192.168.1.0 est donc l'adresse réseau de l'adresse IP et masque : 192.168.1.116/24

## Calculer le broadcast
En prennant pour exmple l'adresse : `192.168.1.0` `/24`
- Une fois convertit en binaire :
```
1100 0000 . 1010 1000 . 0000 0001 . 0000 0000
192       . 168       . 1         . 0

1111 1111 . 1111 1111 . 1111 1111 . 0000 0000
255       . 255       . 255       . 0
```

Puis en alignant l'IP et le masque
```
1100 0000 . 1010 1000 . 0000 0001 . 0000 0000    IP
1111 1111 . 1111 1111 . 1111 1111 . 0000 0000    Masque
{ Adresse réseau                } . { Hôtes }
```

Toute la partie hôte / poids faible de l'adresse IP doit être passé à 1 afin de trouver l'adresse de broadcast
```
1111 1111 . 1111 1111 . 1111 1111 . 0000 0000    Masque
1100 0000 . 1010 1000 . 0000 0001 . 0000 0000    IP
1100 0000 . 1010 1000 . 0000 0001 . 1111 1111    IP Broadcast
```
Ce qui donne l'adresse de broadcast : `192.168.1.255` `/24`

# Calculer les sous réseaux et nombre d'hôtes
## Déterminer le nombre de sous réseau
Pour chaque bits ajoutés en plus sur le masque cela augmente le nombre de sous réseau :
```
192       . 168       . 1         . 0
1100 0000 . 1010 1000 . 0000 0001 . 0000 0000

255       . 255       . 255       . 0
1111 1111 . 1111 1111 . 1111 1111 . 0000 0000

255       . 255       . 255       . 224
1111 1111 . 1111 1111 . 1111 1111 . 1110 0000    Nouveau masque
```
- En utilisant `n` comme le nombre de bits ajoutés au masque
- Et la formule `2 ^ n`

Le nouveau masque ayant 3 bits ajoutés, cela donne : `2 ^ 3` = `8` sous réseaux

## Autre méthode
- Déterminer la classe de l'adresse IP par défaut  
(voir [cours IP # Masque](https://doc.altherneum.fr/cours/ip.html#Masque) et [cours IP # IPv4](https://doc.altherneum.fr/cours/ip.html#IPv4))
- Soustraire le masque donné
- Ce qui donne `2 ^ [Résultat]` sous réseaux possibles

### Exemple
```
192       . 168       . 1         . 116
1100 0000 . 1010 1000 . 0000 0001 . 0111 0100

255       . 255       . 255       . 240
1111 1111 . 1111 1111 . 1111 1111 . 1111 0000
```

- Ici la classe par défaut d'une adresse en 192.xxx. .... est une classe C (`/24`)
- Et le masque donné est (`/28`)
- `28 - 24 = 4`, le nombre de sous réseau maximum possible est donc `2 ^ 4`

### Exemple 2
```
192       . 168       . 1         . 116
1100 0000 . 1010 1000 . 0000 0001 . 0111 0100

255       . 255       . 255       . 0
1111 1111 . 1111 1111 . 1111 1111 . 0000 0000
```
- Classe C (`/24`)
- Mois le masque (`/24`)
- `24 - 24 = 0` Il n'y a qu'un seul sous réseau possible

## Déterminer le nombre d'hôtes
- Déterminer le nombre de bits à 0 du masque
- Le nombre d'hôte est donc `2 ^ [Valeur] - 2`

- L'inverse est possible ou `n` est le nombre de bits à 1 du masque via la formule : `2 ^ (32 - n) - 2`

### Exemple 3
```
255       . 255       . 255       . 240
1111 1111 . 1111 1111 . 1111 1111 . 1111 0000
```

- Ici le masque est composé de 4 bits avec une valeur de 0 à sa fin
- Ce qui donne `2 ^ 4 - 2` = 14 hôtes maximum possible

### Exemple 4
```
255       . 255       . 255       . 0
1111 1111 . 1111 1111 . 1111 1111 . 0000 0000
```
- Ici il y a 8 bits à 0 sur le masque
- `2 ^ 8 - 2` = 254 adresses disponibles pour connecter des hôtes

## Piège de l'adresse broadcast
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
(`172.16.3.0` reste donc une adresse libre pour un hôte)
- La dernière adresse libre pour un hôte est donc `172 . 16 . 3 . 254`
- Le broadcast est donc sur `172 . 16 . 3 . 255`

## Créer un réseau de taille fixe
### Exemple 5
- Créer un réseau de 20 hôtes :
```
| 2^10 | 2^9 | 2^8 | 2^7 |2^6 |2^5 |2^4 |2^3|2^2|2^1|2^0|
| 1024 | 512 | 256 | 128 | 64 | 32 | 16 | 8 | 4 | 2 | 1 | Nombres d'hôtes possibles
|      |     |     |     |    | X  |    |   |   |   |   |
```

- `2 ^ 4 - 2` = 14, ce qui est trop petit
- Il faut donc `2 ^ 5 - 2` = 30 hôtes possibles

Le masque va permettre de stocker 20 hôtes
Il aura besoin de 5 bits sur 0 à sa fin : 
- `wwww wwww.xxxx xxxx.yyyy yyyy.zzz0 0000`

### Exemple 6
Créer un réseau de 1500 hôtes
```
|2^11|2^10| 2^9 | 2^8 | 2^7 |2^6 |2^5 |2^4 |2^3|2^2|2^1|2^0|
|2048|1024| 512 | 256 | 128 | 64 | 32 | 16 | 8 | 4 | 2 | 1 |
| x  |    |      |    |     |    |    |    |   |   |   |   |
```
`2 ^ 11 - 2` = 2046
Il aura besoin de x bits sur 11 à sa fin : 
- `wwww wwww.xxxx xxxx.yyyy y000.0000 0000`

## Calculer une plage d'adresse de sous réseau
- On nous donne le réseau : `10.100.0.0` `/16`
- Ce qui donne en binaire
```
10         .100       .0         .0
0000.1010  0110.0100 0000.0000 0000.0000    IP

1111.1111  1111.1111 0000.0000 0000.0000    Masque
255        .255       .0         .0
```

- On souhaite créer 60 sous réseau
- On reprend le masque et ajoute 6 bits au masque (`2^6` = `64`)
```
1111.1111  1111.1111 0000.0000 0000.0000    Masque
255        .255       .0         .0

1111.1111  1111.1111 1111.1100 0000.0000    Nouveau masque
255        .255      .248         .0
```
- Avec le masque `255.255.248.0` on obtient donc `64 sous réseaux` supplémentaires

- Pour calculer le début et la fin de chaque sous réseau on reprend le nouveau masque
- `1111.1111  1111.1111 1111.1100 0000.0000` et on utilise le nombre de bits à `0` dans le masque afin de calculer le nombre d'adresses possibles (Adresses adressables et réservés)
- Ce qui donne `2^10` = `1024`
- Toute les `1024` adresses on change donc de sous réseau
- `1024 / 255` = `4`, donc soit tout les `0.0.4.0` adresses au le format IPv4

- Le début du réseau était `10.100.0.0`
- Ce qui donne comme prochain sous réseau l'adresse `10.100.4.0`, puis `10.100.8.0`, `10.100.12.0`, ...